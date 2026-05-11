<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Wisata;
use Illuminate\Support\Facades\Session;

class WisataController extends Controller
{
    /**
     * Display listing wisata
     */
    public function index(Request $request)
    {
        // =========================
        // QUERY
        // =========================

        $query = Wisata::query();

        // =========================
        // SEARCH
        // =========================

        if($request->search){

            $query->where('nama', 'like', '%' . $request->search . '%')
                ->orWhere('kategori', 'like', '%' . $request->search . '%');

        }

        // =========================
        // PAGINATION
        // =========================

        $wisatas = $query->latest()
                    ->paginate(8);

        // =========================
        // RETURN VIEW
        // =========================

        return view(
            'admin.wisata.index',
            compact('wisatas')
        );
    }


    public function __construct()
    {
        if (!Session::get('admin_login')) {

            abort(403);

        }
    }



    /**
     * CREATE PAGE
     */
    public function create()
    {
        return view('admin.wisata.create');
    }

    /**
     * STORE
     */
    public function store(Request $request)
    {
        // =========================
        // VALIDATION
        // =========================

        $request->validate([

            'nama' => 'required',
            'deskripsi' => 'required',
            'kategori' => 'required',
            'rating' => 'required',
            'harga_weekday' => 'required',
            'gambar' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',

        ]);

        // =========================
        // UPLOAD IMAGE
        // =========================

        $gambarName = null;

        if($request->hasFile('gambar')){

            $gambar = $request->file('gambar');

            $gambarName = time() . '.' . $gambar->extension();

            $gambar->move(
                public_path('assets/images/wisata'),
                $gambarName
            );
        }

        // =========================
        // STORE DATABASE
        // =========================

        Wisata::create([

            'nama' => $request->nama,
            'deskripsi' => $request->deskripsi,
            'kategori' => $request->kategori,
            'rating' => $request->rating,
            'harga_weekday' => $request->harga_weekday,
            'gambar' => $gambarName,

        ]);

        // =========================
        // REDIRECT
        // =========================

        return redirect('/admin/wisata')
                ->with(
                    'success',
                    'Wisata berhasil ditambahkan'
                );
    }

    /**
     * EDIT PAGE
     */
    public function edit($id)
    {
        // =========================
        // FIND DATA
        // =========================

        $wisata = Wisata::findOrFail($id);

        // =========================
        // RETURN VIEW
        // =========================

        return view(
            'admin.wisata.edit',
            compact('wisata')
        );
    }

    /**
     * UPDATE
     */
    public function update(Request $request, $id)
    {
        // =========================
        // FIND DATA
        // =========================

        $wisata = Wisata::findOrFail($id);

        // =========================
        // VALIDATION
        // =========================

        $request->validate([

            'nama' => 'required',
            'deskripsi' => 'required',
            'kategori' => 'required',
            'rating' => 'required',
            'harga_weekday' => 'required',

        ]);

        // =========================
        // IMAGE UPDATE
        // =========================

        if($request->hasFile('gambar')){

            // Delete old image
            if(
                $wisata->gambar &&
                file_exists(
                    public_path(
                        'assets/images/wisata/' .
                        $wisata->gambar
                    )
                )
            ){

                unlink(
                    public_path(
                        'assets/images/wisata/' .
                        $wisata->gambar
                    )
                );

            }

            // Upload new image
            $gambar = $request->file('gambar');

            $gambarName = time() . '.' . $gambar->extension();

            $gambar->move(
                public_path('assets/images/wisata'),
                $gambarName
            );

            $wisata->gambar = $gambarName;
        }

        // =========================
        // UPDATE DATABASE
        // =========================

        $wisata->update([

            'nama' => $request->nama,
            'deskripsi' => $request->deskripsi,
            'kategori' => $request->kategori,
            'rating' => $request->rating,
            'harga_weekday' => $request->harga_weekday,
            'gambar' => $wisata->gambar,

        ]);

        // =========================
        // REDIRECT
        // =========================

        return redirect('/admin/wisata')
                ->with(
                    'success',
                    'Wisata berhasil diupdate'
                );
    }

    /**
     * DELETE
     */
    public function destroy($id)
    {
        // =========================
        // FIND DATA
        // =========================

        $wisata = Wisata::findOrFail($id);

        // =========================
        // DELETE IMAGE
        // =========================

        if(
            $wisata->gambar &&
            file_exists(
                public_path(
                    'assets/images/wisata/' .
                    $wisata->gambar
                )
            )
        ){

            unlink(
                public_path(
                    'assets/images/wisata/' .
                    $wisata->gambar
                )
            );

        }

        // =========================
        // DELETE DATABASE
        // =========================

        $wisata->delete();

        // =========================
        // REDIRECT
        // =========================

        return redirect('/admin/wisata')
                ->with(
                    'success',
                    'Wisata berhasil dihapus'
                );
    }
}
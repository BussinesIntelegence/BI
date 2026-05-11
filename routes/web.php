<?php
use App\Models\Wisata;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\RecommendationController;
use App\Http\Controllers\Admin\WisataController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {

    // Ambil 6 wisata rating tertinggi
    $wisatas = Wisata::select(
                'id',
                'nama',
                'kategori',
                'rating',
                'deskripsi',
                'gambar'
            )
            ->orderBy('rating', 'desc')
            ->take(6)
            ->get();

    return view('home.index', compact('wisatas'));
});

Route::get('/explore', function (Request $request) {

    // =========================
    // QUERY DASAR
    // =========================

    $query = Wisata::query();

    // =========================
    // SEARCH FILTER
    // =========================

    if ($request->search) {

        $query->where('nama', 'like', '%' . $request->search . '%');

    }

    // =========================
    // CATEGORY FILTER
    // =========================

    if ($request->kategori) {

    $query->where(
        'kategori',
        'like',
        '%' . $request->kategori . '%'
    );

}

    // =========================
    // DATA WISATA
    // =========================

    $wisatas = $query
                ->select(
                    'id',
                    'nama',
                    'kategori',
                    'rating',
                    'deskripsi',
                    'gambar',
                    'harga_weekday'
                )
                ->latest()
                ->paginate(9)
                ->withQueryString();

    /*
|--------------------------------------------------------------------------
| AJAX REQUEST
|--------------------------------------------------------------------------
*/

    if ($request->ajax()) {

        return view('explore._cards', compact('wisatas'))->render();

    }

    // =========================
    // AMBIL KATEGORI UNIK
    // =========================
    return view('explore.index', compact(
    'wisatas'
));

});

Route::get('/wisata/{id}', function ($id) {

    // Ambil detail wisata
    $wisata = Wisata::findOrFail($id);

    // Rekomendasi wisata lain
    $rekomendasi = Wisata::where('id', '!=', $id)
                    ->inRandomOrder()
                    ->take(3)
                    ->get();

    return view('wisata.detail', compact(
        'wisata',
        'rekomendasi'
    ));

});

/*
|--------------------------------------------------------------------------
| SAVE FAVORITE
|--------------------------------------------------------------------------
*/

Route::post('/favorite/{id}', function ($id) {

    // Ambil favorite lama
    $favorites = Session::get('favorites', []);

    // Jika belum ada -> tambah
    if (!in_array($id, $favorites)) {

        $favorites[] = $id;

    }

    // Simpan session
    Session::put('favorites', $favorites);

    return back();

});

/*
|--------------------------------------------------------------------------
| AJAX FAVORITE
|--------------------------------------------------------------------------
*/

Route::post('/favorite/toggle/{id}', function ($id) {

    $favorites = Session::get('favorites', []);

    // Remove
    if(in_array($id, $favorites)){

        $favorites = array_diff($favorites, [$id]);

        Session::put('favorites', $favorites);

        return response()->json([

            'status' => 'removed'

        ]);

    }

    // Add
    $favorites[] = $id;

    Session::put('favorites', $favorites);

    return response()->json([

        'status' => 'added'

    ]);

});


/*
|--------------------------------------------------------------------------
| REMOVE FAVORITE
|--------------------------------------------------------------------------
*/

Route::post('/favorite/remove/{id}', function ($id) {

    $favorites = Session::get('favorites', []);

    // Hapus id dari array
    $favorites = array_diff($favorites, [$id]);

    Session::put('favorites', $favorites);

    return back();

});


/*
|--------------------------------------------------------------------------
| SAVED PAGE
|--------------------------------------------------------------------------
*/

Route::get('/saved', function () {

    $favorites = Session::get('favorites', []);

    // Ambil wisata favorite
    $wisatas = Wisata::whereIn('id', $favorites)->get();

    return view('saved.index', compact('wisatas'));

});

/*
|--------------------------------------------------------------------------
| RECOMMENDATION PAGE
|--------------------------------------------------------------------------
*/

Route::get(
    '/recommendation',
    [RecommendationController::class, 'index']
);

/*
|--------------------------------------------------------------------------
| LOGIN ADMIN
|--------------------------------------------------------------------------
*/

// Login page
Route::get('/login', function () {

    return view('auth.login');

});

// Login process
Route::post('/login', function (Request $request) {

    $email = $request->email;
    $password = $request->password;

    // Dummy admin
    if (
        $email === 'admin@gmail.com' &&
        $password === 'admin123'
    ) {

        Session::put('admin_login', true);

        return redirect('/admin/dashboard');

    }

    return back()->with('error', 'Email atau password salah');

});

// Logout
Route::post('/logout', function () {

    Session::forget('admin_login');

    return redirect('/login');

});


/*
|--------------------------------------------------------------------------
| ADMIN DASHBOARD
|--------------------------------------------------------------------------
*/

Route::get('/admin/dashboard', function () {


    if (!Session::get('admin_login')) {

        return redirect('/login');

    }



    // =========================
    // TOTAL DATA
    // =========================

    $totalWisata = Wisata::count();

    $avgRating = round(
        Wisata::avg('rating'),
        2
    );

    $topWisata = Wisata::orderByDesc('rating')
                    ->take(5)
                    ->get();

// =========================
// NORMALIZED CATEGORY
// =========================

$kategoriData = collect([

    [
        'kategori' => 'Alam',
        'total' => Wisata::where(
            'kategori',
            'like',
            '%alam%'
        )->count()
    ],

    [
        'kategori' => 'Budaya',
        'total' => Wisata::where(
            'kategori',
            'like',
            '%budaya%'
        )->orWhere(
            'kategori',
            'like',
            '%museum%'
        )->count()
    ],

    [
        'kategori' => 'Pantai',
        'total' => Wisata::where(
            'kategori',
            'like',
            '%pantai%'
        )->count()
    ],

    [
        'kategori' => 'Kuliner',
        'total' => Wisata::where(
            'kategori',
            'like',
            '%kuliner%'
        )->count()
    ],

]);

    // =========================
    // RATING ANALYTICS
    // =========================

    $ratingData = Wisata::select(
                        'nama',
                        'rating'
                    )
                    ->orderByDesc('rating')
                    ->take(6)
                    ->get();

    return view(
        'admin.dashboard',
        compact(
            'totalWisata',
            'avgRating',
            'topWisata',
            'kategoriData',
            'ratingData'
        )
    );

});

/*
|--------------------------------------------------------------------------
| ADMIN CRUD WISATA
|--------------------------------------------------------------------------
*/

Route::resource(
    '/admin/wisata',
    WisataController::class
);

/*
|--------------------------------------------------------------------------
| ABOUT
|--------------------------------------------------------------------------
*/

Route::get('/about', function () {

    return view('about.index');

});


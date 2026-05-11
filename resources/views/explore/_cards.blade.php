<div class="row g-4">

    @forelse($wisatas as $wisata)

    <div class="col-lg-4 col-md-6">

        <div class="card wisata-card h-100">

            <!-- Image -->
            <div class="position-relative">

                <img
                    loading="lazy"
                    src="{{ $wisata->gambar
                        ? asset('assets/images/wisata/' . $wisata->gambar)
                        : 'https://via.placeholder.com/600x400?text=Wisata+Jogja' }}"

                    class="card-img-top wisata-image"
                    alt="{{ $wisata->nama }}"
                >

                <!-- =========================
                FAVORITE BUTTON
                ========================= -->

                <button
                    class="favorite-btn
                    {{ in_array($wisata->id, session('favorites', []))
                        ? 'active-favorite'
                        : '' }}"

                    data-id="{{ $wisata->id }}"
                >

                    <i class="bi bi-heart-fill"></i>

                </button>

                <!-- Rating -->
                <div class="rating-box">

                    ⭐ {{ number_format($wisata->rating,1) }}

                </div>

            </div>

            <!-- Body -->
            <div class="card-body d-flex flex-column">

                <!-- Category -->
                <p class="category-text mb-2">

                    {{ $wisata->kategori }}

                </p>

                <!-- Title -->
                <h3 class="wisata-title mb-3">

                    {{ $wisata->nama }}

                </h3>

                <!-- Description -->
                <p class="text-secondary mb-4">

                    {{ \Illuminate\Support\Str::limit($wisata->deskripsi, 90) }}

                </p>

                <!-- Price -->
                <div class="mb-4">

                    <span class="price-tag">

                        Rp {{ number_format($wisata->harga_weekday,0,',','.') }}

                    </span>

                </div>

                <!-- Button -->
                <a href="/wisata/{{ $wisata->id }}"
                    class="btn btn-outline-dark rounded-4 mt-auto">

                    View Details

                </a>

            </div>

        </div>

    </div>


    @empty

    <div class="col-12">

        <div class="empty-state">

            <div class="empty-icon">

                <i class="bi bi-map"></i>

            </div>

            <h2 class="empty-title">

                Wisata Tidak Ditemukan

            </h2>

            <p class="empty-text">

                Tidak ada destinasi wisata yang cocok
                dengan pencarian atau filter Anda.
                Coba gunakan kata kunci lain.

            </p>

            <a href="/explore"
                class="btn-empty">

                <i class="bi bi-arrow-repeat"></i>

                Reset Explore

            </a>

        </div>

    </div>



    @endforelse

</div>
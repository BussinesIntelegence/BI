<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>JogjaExplore</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">

</head>
<body>

<!-- =========================
LOADING SCREEN
========================= -->

<div id="loading-screen">

    <div class="loader-content">

        <!-- Logo Circle -->
        <div class="loader-circle">

            <i class="bi bi-building"></i>

        </div>

        <!-- Logo -->
        <h1 class="loader-logo">

            JogjaExplore

        </h1>

        <!-- Subtitle -->
        <p class="loader-subtitle">

            THE CULTURAL HEART OF JAVA

        </p>

        <!-- Loading Bar -->
        <div class="loader-bar">

            <div class="loader-progress"></div>

        </div>

        <!-- Text -->
        <p class="loader-text">

            Memuat Keajaiban Yogyakarta...

        </p>

    </div>

</div>

    <!-- Navbar -->
    @if(!request()->is('login'))

    @include('partials.navbar')

    @endif

    <!-- Main Content -->
    <main>
        @yield('content')
    </main>

    <!-- Footer -->
    @if(!request()->is('login'))

    @include('partials.footer')

    @endif

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="{{ asset('assets/js/script.js') }}"></script>

    <script>

    // =========================
    // FAVORITE AJAX
    // =========================

    document.addEventListener('click', async function(e){

        // Favorite button
        if(e.target.closest('.favorite-btn')){

            const button = e.target.closest('.favorite-btn');

            const wisataId = button.dataset.id;

            try{

                const response = await fetch(

                    `/favorite/toggle/${wisataId}`,

                    {
                        method: 'POST',

                        headers: {

                            'X-CSRF-TOKEN':
                            '{{ csrf_token() }}',

                            'Accept':
                            'application/json'

                        }
                    }
                );

                const data = await response.json();

                // Toggle class
                button.classList.toggle(
                    'active-favorite'
                );

                // Animation
                button.classList.add('animate');

                setTimeout(() => {

                    button.classList.remove('animate');

                }, 300);

            }catch(error){

                console.log(error);

            }

        }

    });

</script>
    
</body>
</html>

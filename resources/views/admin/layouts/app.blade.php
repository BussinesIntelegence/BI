<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>
        Admin Panel - JogjaExplore
    </title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

    <!-- Bootstrap Icon -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    >

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@400;500;600;700&display=swap"
        rel="stylesheet"
    >

    <!-- Admin CSS -->
    <link
        rel="stylesheet"
        href="{{ asset('assets/css/admin.css') }}"
    >

</head>

<body>

    <div class="admin-wrapper">

        <!-- Sidebar -->
        @include('admin.partials.sidebar')

        <!-- Main -->
        <div class="admin-main">

            <!-- Topbar -->
            @include('admin.partials.topbar')

            <!-- Content -->
            <div class="admin-content">

    <!-- =========================
    TOAST NOTIFICATION
    ========================== -->

        @if(session('success'))

        <div class="custom-toast">

            <div class="toast-icon">

                <i class="bi bi-check-circle-fill"></i>

            </div>

            <div>

                <strong>
                    Success
                </strong>

                <p class="mb-0">

                    {{ session('success') }}

                </p>

            </div>

        </div>

        @endif

        @yield('content')

    </div>

        </div>

    </div>


    <script>

    // =========================
    // AUTO HIDE TOAST
    // =========================

    setTimeout(() => {

        const toast = document.querySelector('.custom-toast');

        if(toast){

            toast.style.opacity = '0';

            toast.style.transform = 'translateX(100px)';

            toast.style.transition = '.5s';

            setTimeout(() => {

                toast.remove();

            }, 500);

        }

    }, 3000);

    </script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>
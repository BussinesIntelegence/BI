<div class="admin-topbar">

    <!-- ========================================
    LEFT
    ========================================= -->

    <div>

        <h3 class="admin-page-title">

            @if(request()->is('admin/dashboard'))

                Dashboard Overview

            @elseif(request()->is('admin/wisata*'))

                Destination Management

            @elseif(request()->is('admin/analysis'))

                DSS Analytics

            @elseif(request()->is('admin/reviews*'))

                Visitor Reviews

            @else

                Admin Panel

            @endif

        </h3>

        <p class="admin-page-subtitle">

            Monitor tourism insights &
            manage Yogyakarta destinations.

        </p>

    </div>

    <!-- ========================================
    RIGHT
    ========================================= -->

    <div class="topbar-right">

        <!-- Date -->

        <div class="topbar-date">

            <i class="bi bi-calendar3"></i>

            {{ now()->format('d M Y') }}

        </div>


        <!-- Admin Profile -->

        <div class="admin-profile">

            <div class="admin-avatar">

                A

            </div>

            <div>

                <strong>

                    Admin User

                </strong>

                <p>

                    System Administrator

                </p>

            </div>

        </div>

    </div>

</div>
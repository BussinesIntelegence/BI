<div class="admin-sidebar">

    <!-- ========================================
    LOGO
    ========================================= -->

    <div class="sidebar-logo">

        <h2>

            Admin Panel

        </h2>

        <p>

            Heritage Tourism

        </p>

    </div>

    <!-- ========================================
    MAIN MENU
    ========================================= -->

    <ul class="sidebar-menu">

        <!-- Dashboard -->
        <li>

            <a
                href="/admin/dashboard"
                class="{{ request()->is('admin/dashboard') ? 'active-sidebar' : '' }}"
            >

                <i class="bi bi-grid"></i>

                Dashboard

            </a>

        </li>

        <!-- Destinations -->
        <li>

            <a
                href="/admin/wisata"
                class="{{ request()->is('admin/wisata*') ? 'active-sidebar' : '' }}"
            >

                <i class="bi bi-map"></i>

                Destinations

            </a>

        </li>

        <!-- Analytics -->
        <li>

            <a
                href="/admin/analysis"
                class="{{ request()->is('admin/analysis') ? 'active-sidebar' : '' }}"
            >

                <i class="bi bi-bar-chart"></i>

                Analytics

            </a>

        </li>

        <!-- Reviews -->
        <li>

            <a
                href="/admin/reviews"
                class="{{ request()->is('admin/reviews*') ? 'active-sidebar' : '' }}"
            >

                <i class="bi bi-chat-dots"></i>

                Reviews

            </a>

        </li>

    </ul>

    <!-- ========================================
    SYSTEM MENU
    ========================================= -->

    <div class="sidebar-system">

        <p class="sidebar-system-title">

            SYSTEM

        </p>

        <!-- Back Website -->

        <a
            href="/"
            class="sidebar-system-link"
        >

            <i class="bi bi-house-door"></i>

            Back to Website

        </a>

        <!-- Logout -->

        <form
            action="/logout"
            method="POST"
        >

            @csrf

            <button
                type="submit"
                class="sidebar-system-link logout-link logout-btn"
            >

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </button>

        </form>

    </div>

</div>
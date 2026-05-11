<div class="admin-sidebar">

    <!-- Logo -->
    <div class="sidebar-logo">

        <h2>

            Admin Panel

        </h2>

        <p>
            Heritage Tourism
        </p>

    </div>

    <!-- Menu -->
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

        <!-- Wisata -->
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

            <a href="#">

                <i class="bi bi-bar-chart"></i>

                Analytics

            </a>

        </li>

        <!-- Reviews -->
        <li>

            <a href="#">

                <i class="bi bi-chat-left-text"></i>

                Reviews

            </a>

        </li>

        <!-- Settings -->
        <li>

            <a href="#">

                <i class="bi bi-gear"></i>

                Settings

            </a>

        </li>

    </ul>

</div>
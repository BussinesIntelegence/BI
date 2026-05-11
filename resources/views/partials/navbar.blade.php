<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom py-3 sticky-top custom-navbar">

    <div class="container">

        <!-- =========================
        LOGO
        ========================== -->

        <a class="navbar-brand logo-text" href="/">

            JogjaExplore

        </a>

        <!-- =========================
        MOBILE TOGGLE
        ========================== -->

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- =========================
        NAVBAR MENU
        ========================== -->

        <div class="collapse navbar-collapse" id="navbarNav">

            <!-- CENTER MENU -->
            <ul class="navbar-nav mx-auto gap-lg-4 mt-4 mt-lg-0">

                <!-- HOME -->
                <li class="nav-item">

                    <a
                        class="nav-link nav-custom {{ request()->is('/') ? 'active-nav' : '' }}"
                        href="/">

                        Home

                    </a>

                </li>

                <!-- EXPLORE -->
                <li class="nav-item">

                    <a
                        class="nav-link nav-custom {{ request()->is('explore') ? 'active-nav' : '' }}"
                        href="/explore">

                        Explore

                    </a>

                </li>

                <!-- RECOMMENDATION -->
                <li class="nav-item">

                    <a
                        class="nav-link nav-custom {{ request()->is('recommendation') ? 'active-nav' : '' }}"
                        href="/recommendation">

                        Recommendation

                    </a>

                </li>

                <!-- SAVED -->
                <li class="nav-item">

                    <a
                        class="nav-link nav-custom {{ request()->is('saved') ? 'active-nav' : '' }}"
                        href="/saved">

                        Saved

                    </a>

                </li>

                <!-- ABOUT -->
                <li class="nav-item">

                    <a class="nav-link nav-custom {{ request()->is('about') ? 'active-nav' : '' }}" 
                        href="/about">

                        About

                    </a>

                </li>
            </ul>

            <!-- =========================
            RIGHT ICON
            ========================== -->

            <div class="d-flex align-items-center gap-3 mt-4 mt-lg-0">

                <!-- Admin Login -->
                <a href="/login"
                    class="icon-button d-flex align-items-center justify-content-center text-dark text-decoration-none">

                    <i class="bi bi-person-circle"></i>

                </a>





            </div>

        </div>

    </div>

</nav>
@extends('layouts.app')

@section('content')

<div class="admin-login-wrapper">

    <!-- ========================================
    LEFT SIDE
    ========================================= -->

    <div class="login-left">

        <div class="login-overlay"></div>

        <div class="login-brand-content">

            <p class="login-badge">

                Heritage Tourism Dashboard

            </p>

            <h1>

                Manage Yogyakarta
                Tourism Smarter

            </h1>

            <p class="login-description">

                Sistem DSS wisata berbasis SAW
                untuk analisis destinasi,
                moderasi review,
                dan pengelolaan wisata modern.

            </p>

        </div>

    </div>

    <!-- ========================================
    RIGHT SIDE
    ========================================= -->

    <div class="login-right">

        <div class="login-card">

            <!-- Logo -->
            <div class="login-logo">

                <h2>

                    JogjaExplore

                </h2>

                <p>

                    Admin Dashboard Access

                </p>

            </div>

            <!-- Title -->
            <div class="login-title-box">

                <h1>

                    Welcome Back

                </h1>

                <p>

                    Login untuk mengakses panel admin.

                </p>

            </div>

            <!-- FORM -->
            <form
                action="/login"
                method="POST"
            >

                @csrf

                <!-- EMAIL -->

                <div class="mb-4">

                    <label class="form-label">

                        Email Address

                    </label>

                    <input
                        type="email"
                        name="email"
                        class="form-control login-input"
                        placeholder="Enter your email"
                        required
                    >

                </div>

                <!-- PASSWORD -->

                <div class="mb-4">

                    <label class="form-label">

                        Password

                    </label>

                    <input
                        type="password"
                        name="password"
                        class="form-control login-input"
                        placeholder="Enter your password"
                        required
                    >

                </div>

                <!-- BUTTON -->

                <button class="btn btn-maroon login-btn w-100">

                    <i class="bi bi-box-arrow-in-right"></i>

                    Login Dashboard

                </button>

            </form>

            <!-- FOOTER -->

            <div class="login-footer">

                © 2026 JogjaExplore —
                Heritage Tourism Platform

            </div>

        </div>

    </div>

</div>

@endsection
@extends('layouts.app')

@section('content')

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-5">

            <div class="card border-0 shadow-lg rounded-5 p-4">

                <h1 class="fw-bold mb-4 text-center">

                    Admin Login

                </h1>

                @if(session('error'))

                <div class="alert alert-danger">

                    {{ session('error') }}

                </div>

                @endif

                <form method="POST" action="/login">

                    @csrf

                    <div class="mb-3">

                        <label>Email</label>

                        <input
                            type="email"
                            name="email"
                            class="form-control"
                            required
                        >

                    </div>

                    <div class="mb-4">

                        <label>Password</label>

                        <input
                            type="password"
                            name="password"
                            class="form-control"
                            required
                        >

                    </div>

                    <button
                        class="btn btn-maroon w-100">

                        Login

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

@endsection


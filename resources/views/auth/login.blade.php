@extends('login.indexlogin')

@section('content')
    <form method="POST" action="{{ route('login') }}" class="login100-form validate-form">

        @csrf
        <div class="logo-login100">
            <img src="<?= URL::to('/layout/assets/img/logo.png') ?>" style="width:160px;height:160px;" class="center">
        </div>
        {{-- <span class="login100-form-title">
            Aplikasi Monitoring Hafalan
        </span> --}}

        <div class="wrap-input100" data-validate = "Valid email is required: ex@abc.xyz">
            <input class="input100" type="text" name="username" placeholder="Username" id="username">
            <span class="focus-input100"></span>
            <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
            </span>
        </div>

        <div class="wrap-input100 validate-input" data-validate = "Password is required">
            <input class="input100" type="password" name="password" placeholder="Password" id="password">
            <span class="focus-input100"></span>
            <span class="symbol-input100">
                <i class="fa fa-lock" aria-hidden="true"></i>
            </span>
        </div>

        <div class="container-login100-form-btn">
            <button type="submit" class="login100-form-btn">
                Login
            </button>
        </div>

        <!-- <div class="text-center p-t-12">
                                                                            <span class="txt1">
                                                                                Lupa
                                                                            </span>
                                                                            <a class="txt2" href="{{ route('show-reset') }}">
                                                                                Username / Password ?
                                                                            </a>
                                                                        </div> -->

        <div class="text-center p-t-12">
            @if ($errors->any())
                <p style="color: red">{{ $errors->first() }}</p>
            @endif
        </div>

    </form>
@endsection

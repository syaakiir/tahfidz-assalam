@extends('master')

@section('title', '')

@section('alert')

@endsection

@section('content')

    @if (Auth::user()->account_type != User::ACCOUNT_TYPE_PARENT)
        <fieldset>
            <legend>Overview</legend>
            <div class="col-md-4">
                <div class="card">
                    <div class="header">
                        <p style="text-align: center; font-weight: bold;"> Siswa Yang Diampu </p>
                    </div>
                    <div class="content">
                        <h3 style="text-align: center;"> {{ $siswa }} </h3>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="header">
                        <p style="text-align: center; font-weight: bold;"> Kelas Yang Diampu </p>
                    </div>
                    <div class="content">
                        <h3 style="text-align: center;"> {{ $class }} </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="header">
                        <p style="text-align: center; font-weight: bold;"> Hafalan {{ date('d M Y') }} </p>
                    </div>
                    <div class="content">
                        <h3 style="text-align: center;"> {{ $hafalan }} </h3>
                    </div>
                </div>
            </div>
        </fieldset>
    @endif
    <hr>

    <fieldset>
        <legend>Informasi User</legend>

        <div class="form-group">
            <label>Tipe User</label>
            <input disabled="true" type="text" class="form-control"
                value="{{ User::getAccountMeaning(Auth::user()->account_type) }}" name="user_type">
        </div>

        <div class="form-group">
            <label>Terakhir Login</label>
            <input disabled="true" type="text" class="form-control" value="{{ $last_login }}" name="last_login">
        </div>

    </fieldset>

@endsection

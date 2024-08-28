@extends('master')

@section('title', '')

@section('content')

    <form method="post" action="{{ route('store-Monitoring') }}">

        @csrf

        <div class="form-group">
            <label>Feedback</label>
            <input type="text" class="form-control" value="" name="feedback">
            @if ($errors->has('feedback'))
                <div class="error">
                    <p style="color: red"><span>&#42;</span> {{ $errors->first('feedback') }}</p>
                </div>
            @endif
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-info"> TAMBAH </button>
        </div>

    </form>

@endsection

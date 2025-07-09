@extends('master')

@section('title', '')

@section('content')

    <form method="post" action="{{ route('store-class-name') }}">
        @csrf

      <div class="form-group">
    <label>Nama Kelas</label>
    <input type="text" class="form-control" name="class_name" value="{{ old('class_name') }}">
    @if ($errors->has('class_name'))
        <div class="error">
            <p style="color: red"><span>&#42;</span> {{ $errors->first('class_name') }}</p>
        </div>
    @endif
</div>


        <div class="form-group">
            <button type="submit" class="btn btn-info"> TAMBAH </button>
        </div>
    </form>

@endsection

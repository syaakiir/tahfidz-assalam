@extends('master')

@section('title', '')

@section('alert')

@if (Session::has('alert_success'))
    @component('components.alert')
        @slot('class') success @endslot
        @slot('title') Terimakasih @endslot
        @slot('message') {{ session('alert_success') }} @endslot
    @endcomponent
@elseif(Session::has('alert_error'))
    @component('components.alert')
        @slot('class') error @endslot
        @slot('title') Cek Kembali @endslot
        @slot('message') {{ session('alert_error') }} @endslot
    @endcomponent
@endif

@endsection

@section('content')

    {{-- Filter Button --}}
    <div class="mb-3">
        <button class="btn btn-warning btn-sm" onclick="filterByType(10)">Murajaah</button>
        <button class="btn btn-success btn-sm" onclick="filterByType(20)">Hafalan</button>
        <button class="btn btn-secondary btn-sm" onclick="filterByType('')">Semua</button>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered data-table display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th>Nama Siswa</th>
                    <th>Jenis Setoran</th>
                    <th>Kelas</th>
                    <th width="100px">Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

@endsection

@section('modal')
@endsection

@push('scripts')
<script type="text/javascript">
    var table;

    $(function () {
        table = $('.data-table').DataTable({
            processing: true,
            serverSide: true,
            rowReorder: {
                selector: 'td:nth-child(2)'
            },
            responsive: true,
            ajax: "{{ route('assessment') }}",
            columns: [
                { data: 'siswa_name', name: 'siswa_name' },
                { data: 'memorization_type_button', name: 'memorization_type_button', orderable: false, searchable: false },
                { data: 'class_id', name: 'class_id' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
                { data: 'memorization_type_raw', name: 'memorization_type_raw', visible: false } // hidden for filtering
            ]
        });
    });

    function btnAss(id) {
        var url = '{{ route('create-assessment', ':id') }}';
        url = url.replace(':id', id);
        window.location.replace(url);
    }

    function filterByType(type) {
        table.column(4).search(type).draw();
    }
</script>
@endpush

@extends('master')

@section('title', '')

@section('content')

    @if (Session::has('alert_success'))
        @component('components.alert')
            @slot('class')
                success
            @endslot
            @slot('title')
                Terimakasih
            @endslot
            @slot('message')
                {{ session('alert_success') }}
            @endslot
        @endcomponent
    @elseif(Session::has('alert_error'))
        @component('components.alert')
            @slot('class')
                error
            @endslot
            @slot('title')
                Cek Kembali
            @endslot
            @slot('message')
                {{ session('alert_error') }}
            @endslot
        @endcomponent
    @endif



    <hr>

    <div class="table-responsive">
        <table class="table table-bordered data-table display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th width="30%">Surat </th>
                    <th width="20%">Ayat </th>
                    <th width="20%">Catatan / Nilai </th>
                    <th width="50%">Tanggal </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

@endsection

@push('scripts')
    <script type="text/javascript">
        var id_ayat;
        var total_ayat;
        var id_siswa = '{{ $data_siswa->id }}';
        var table;

        $(function() {

            var url = '{{ route('create-monitoring', ':id') }}';
            url = url.replace(':id', id_siswa);

            table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                bFilter: false,
                bInfo: false,
                rowReorder: {
                    selector: 'td:nth-child(2)'
                },
                responsive: true,
                "aaSorting": [
                    [3, "desc"]
                ],
                ajax: url,
                columns: [{
                        data: 'assessment',
                        name: 'monitoring'
                    },
                    {
                        data: 'range',
                        name: 'range'
                    },
                    {
                        data: 'note',
                        name: 'note'
                    },
                    {
                        data: 'date',
                        name: 'date'
                    },
                ]
            });
        });

        $(document).ready(function() {

            $('#surah_id').select2({
                allowClear: true,
                ajax: {
                    url: base_url + '/monitoring/get-surah',
                    dataType: 'json',
                    data: function(params) {
                        return {
                            search: params.term
                        }
                    },
                    processResults: function(data, page) {
                        return {
                            results: data
                        };
                    }
                }
            });

            $("#surah_id").change(function() {
                id_ayat = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: base_url + '/monitoring/get-total-ayat',
                    data: {
                        id_ayat: id_ayat,
                        "_token": "{{ csrf_token() }}",
                    },
                    success: function(data) {
                        total_ayat = data;
                    },
                    error: function(error) {
                        swal('Terjadi kegagalan sistem', {
                            button: false,
                            icon: "error",
                            timer: 1000
                        });
                    }
                });
            });



        });
    </script>
@endpush

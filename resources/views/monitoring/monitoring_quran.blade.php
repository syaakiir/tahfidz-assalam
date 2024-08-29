@extends('master')

@section('title', 'Data Assessment')

@section('alert')
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
@endsection

@section('content')
    <div class="table-responsive">
        <table class="table table-bordered data-table display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th width="20%">Surat</th>
                    <th width="10%">Ayat</th>
                    <th width="20%">Catatan / Nilai</th>
                    <th width="20%">Tanggal</th>
                    <th width="20%">Feedback</th>
                    <th width="10%">Action</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
@endsection

@section('modal')
    <div class="modal fade" id="detailModal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Feedback</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Feedback</label>
                        <input type="text" class="form-control" name="feedback" id="feedback">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="update_data">Update</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script type="text/javascript">
        var idassessment;
        var table;

        function btnUbah(id) {
            idassessment = id;
            $.ajax({
                type: 'POST',
                url: base_url + '/monitoring/get-detail',
                data: {
                    idassessment: idassessment,
                    "_token": "{{ csrf_token() }}"
                },
                success: function(data) {
                    $('#feedback').val(data.data.feedback);
                    $('#detailModal').modal('show');
                },
                error: function() {
                    swal('Failed to fetch details', {
                        button: false,
                        icon: "error",
                        timer: 1000
                    });
                }
            });
        }

        $(document).ready(function() {
            var url = '{{ route('create-monitoring', ':id') }}';
            url = url.replace(':id', '{{ $data_siswa->id }}');

            table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                responsive: true,
                ajax: url,
                columns: [{
                        data: 'assessment',
                        name: 'assessment'
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
                    {
                        data: 'feedback',
                        name: 'feedback'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, row) {
                            return '<button class="btn btn-info" onclick="btnUbah(' + row
                                .id +
                                ')">  <span class="glyphicon glyphicon-edit"></span> Beri Feedback</button>';
                        }
                    }
                ]
            });

            $('#update_data').click(function() {
                var feedback = $('#feedback').val();
                $.ajax({
                    type: 'POST',
                    url: base_url + '/monitoring/update',
                    data: {
                        idassessment: idassessment, // Ensure this ID is correct
                        "_token": "{{ csrf_token() }}",
                        feedback: feedback
                    },
                    success: function(data) {
                        if (data.status) {
                            swal(data.message, {
                                button: false,
                                icon: "success",
                                timer: 1000
                            });
                            $('#detailModal').modal('hide');
                            table.ajax.reload();
                        } else {
                            swal(data.message, {
                                button: false,
                                icon: "error",
                                timer: 1000
                            });
                        }
                    },
                    error: function() {
                        swal('Failed to update feedback', {
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

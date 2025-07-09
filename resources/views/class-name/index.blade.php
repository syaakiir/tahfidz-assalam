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
    <div style="padding-bottom: 20px">
        <a href="{{ route('create-class-name') }}" type="button" class="btn btn-info"> TAMBAH </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered data-table display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th>Nama Kelas</th>
                    <th width="100px">Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
@endsection

@section('modal')
    <div class="modal fade" id="detailModal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <p class="modal-title">Detail Nama Kelas</p>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nama Kelas</label>
                        <input type="text" class="form-control" name="class_name" id="class_name">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-right" id="hapus_action">Hapus</button>
                    <button type="button" id="update_data" class="btn btn-default pull-left">Update</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script type="text/javascript">
    var idclass;
    var table;

    $(function() {
        table = $('.data-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route('index-class-name') }}",
            columns: [
                { data: 'class_name', name: 'class_name' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ]
        });
    });

    function hapus(idclass) {
        swal({
                title: "Menghapus",
                text: 'Nama kelas yang dihapus akan hilang dari sistem',
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete) {
                    $.ajax({
                        type: 'POST',
                        url: base_url + '/class-name/delete',
                        data: {
                            id: idclass,
                            "_token": "{{ csrf_token() }}",
                        },
                        success: function(data) {
                            if (data.status != false) {
                                swal(data.message, {
                                    button: false,
                                    icon: "success",
                                    timer: 1000
                                });
                            } else {
                                swal(data.message, {
                                    button: false,
                                    icon: "error",
                                    timer: 1000
                                });
                            }
                            table.ajax.reload();
                        },
                        error: function(error) {
                            swal('Terjadi kegagalan sistem', {
                                button: false,
                                icon: "error",
                                timer: 1000
                            });
                        }
                    });
                }
            });
    }

    function btnDel(id) {
        idclass = id;
        hapus(idclass);
    }

    function clearAll() {
        $('#class_name').val('');
    }

    function btnUbah(id) {
        clearAll();

        idclass = id;
        $.ajax({
            type: 'POST',
            url: base_url + '/class-name/get-detail',
            data: {
                id: idclass,
                "_token": "{{ csrf_token() }}",
            },
            success: function(data) {
                $('#detailModal').modal('toggle');
                $('#class_name').val(data.data.name);
            }
        });

        $('#hapus_action').click(function() {
            hapus(idclass);
            $("#detailModal .close").click();
        });

        $('#update_data').click(function() {
            var class_name = $('#class_name').val();

            $.ajax({
                type: 'POST',
                url: base_url + '/class-name/update',
                data: {
                    id: idclass,
                    name: class_name,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    if (data.status != false) {
                        swal(data.message, {
                            button: false,
                            icon: "success",
                            timer: 1000
                        });
                        $("#detailModal .close").click();
                    } else {
                        swal(data.message, {
                            button: false,
                            icon: "error",
                            timer: 1000
                        });
                    }
                    table.ajax.reload();
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
    }
</script>
@endpush

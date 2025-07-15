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

    <a href="{{ request()->fullUrlWithQuery(['continue' => 'true']) }}" class="btn btn-success mb-3" id="btnLanjutkan">Lanjutkan</a>

    <div class="table-responsive">
        <table class="table table-bordered data-table display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th width="30%">Surat </th>
                    <th width="20%">Ayat </th>
                    <th width="20%">Nilai </th>
                    <th width="50%">Tanggal </th>
                    <th width="50%">Feedback </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <form method="post" action="{{ route('do-assessment') }}" id="formAssessment">
        @csrf

        <div class="form-group">
            <label>Nama Santri / Siswa</label>
            <input type="text" class="form-control" value="{{ $data_siswa->siswa_name }}" disabled>
        </div>

        <div class="form-group">
            <label>Surat </label>
            <select class="js-example-basic-single form-control" name="surah_id" id="surah_id" style="width: 100%;">
                <option></option>
            </select>
            @if ($errors->has('surah_id'))
                <div class="error">
                    <p style="color: red"><span>&#42;</span> {{ $errors->first('surah_id') }}</p>
                </div>
            @endif
        </div>

        <div class="form-group col-md-6" style="padding-left: 0px">
            <label>Mulai Ayat</label>
            <select class="form-control" id="begin" name="begin" style="width: 100%;"></select>
            @if ($errors->has('begin'))
                <div class="error">
                    <p style="color: red"><span>&#42;</span> {{ $errors->first('begin') }}</p>
                </div>
            @endif
        </div>

        <div class="form-group col-md-6" style="padding-left: 0px">
            <label>Sampai Ayat</label>
            <select class="form-control" id="end" name="end" style="width: 100%;"></select>
            @if ($errors->has('end'))
                <div class="error">
                    <p style="color: red"><span>&#42;</span> {{ $errors->first('end') }}</p>
                </div>
            @endif
        </div>

        <div class="form-group">
            <label>Nilai </label>
            <input type="text" class="form-control" name="note">
            @if ($errors->has('note'))
                <div class="error">
                    <p style="color: red"><span>&#42;</span> {{ $errors->first('note') }}</p>
                </div>
            @endif
        </div>

        <div class="form-group" id="submit_yes" style="padding-top: 20px; padding-bottom: 20px">
            <button type="submit" class="btn btn-info" value="text 1"> VALIDASI SELESAI </button>
        </div>

        <div class="form-group">
            <input type="hidden" class="form-control" name="id_siswa" value="{{ $data_siswa->id }}">
        </div>

    </form>

    <hr>

@endsection

@push('scripts')
<script type="text/javascript">
    var id_siswa = '{{ $data_siswa->id }}';
    var total_ayat;
    var table;

    function populateAyatDropdown(totalAyat) {
        let options = '<option></option>';
        for (let i = 1; i <= totalAyat; i++) {
            options += `<option value="${i}">${i}</option>`;
        }
        $('#begin').html(options);
        $('#end').html(options);

        $('#begin').select2({ placeholder: 'Pilih ayat mulai', allowClear: true });
        $('#end').select2({ placeholder: 'Pilih ayat sampai', allowClear: true });
    }

    $(function() {
        var url = '{{ route('create-assessment', ':id') }}';
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
            aaSorting: [[3, "desc"]],
            ajax: url,
            columns: [
                { data: 'assessment', name: 'assessment' },
                { data: 'range', name: 'range' },
                { data: 'note', name: 'note' },
                { data: 'date', name: 'date' },
                { data: 'feedback', name: 'feedback' },
            ]
        });

        $('#surah_id').select2({
            allowClear: true,
            ajax: {
                url: base_url + '/assessment/get-surah',
                dataType: 'json',
                data: function(params) {
                    return {
                        search: params.term
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                }
            }
        });

        $('#surah_id').change(function() {
            let id_ayat = $(this).val();
            $.ajax({
                type: 'GET',
                url: base_url + '/assessment/get-total-ayat',
                data: {
                    id_ayat: id_ayat,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    total_ayat = data;
                    populateAyatDropdown(total_ayat);
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

        $('#end').on('change', function () {
            const beginVal = parseInt($('#begin').val());
            const endVal = parseInt($(this).val());

            if (beginVal && endVal && endVal < beginVal) {
                swal('Sampai ayat tidak boleh lebih kecil dari mulai ayat!', {
                    icon: "warning",
                    button: "OK"
                });
                $('#end').val(null).trigger('change');
            }
        });
    });

    @if(request()->get('continue') == 'true')
    setTimeout(() => {
        $('html, body').animate({
            scrollTop: $("#formAssessment").offset().top
        }, 500);

        table.on('xhr', function () {
            let data = table.rows().data();
            if (data.length > 0) {
                let latest = data[0];
                if (latest.range && latest.range.includes('-')) {
                    let parts = latest.range.split('-');
                    let ayat_end = parseInt(parts[1]);
                    let nextAyat = ayat_end + 1;
                    $('#begin').val(nextAyat).trigger('change');
                    $('#end').val(nextAyat).trigger('change');
                    $('#begin').attr('placeholder', 'Lanjutan dari ayat ' + ayat_end);
                    $('#end').attr('placeholder', 'Lanjutan dari ayat ' + ayat_end);
                }

                $('input[name="note"]').val('');

                $.ajax({
                    url: base_url + '/assessment/get-surah',
                    dataType: 'json',
                    success: function(surahList) {
                        let match = surahList.find(s => s.text === latest.assessment);
                        if (match) {
                            let newOption = new Option(match.text, match.id, true, true);
                            $('#surah_id').append(newOption).trigger('change');
                        }
                    }
                });
            }
        });
    }, 500);
    @endif
</script>
@endpush

@extends('master')

@section('title', 'Beranda')

@section('alert')
@endsection

@section('content')

<!-- TABEL DAFTAR HAFALAN -->
<fieldset>
    <legend>Daftar Hafalan Terkini Santri</legend>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>No</th>
                    <th>Nama Santri</th>
                    <th>Total Ayat</th>
                    <th>Terakhir Hafalan</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($santri_hafalan as $index => $santri)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $santri->siswa_name }}</td>
                        <td>{{ $santri->total_hafalan }}</td>
                        <td>{{ $santri->terakhir_hafalan ? \Carbon\Carbon::parse($santri->terakhir_hafalan)->format('d M Y') : '-' }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4" class="text-center">Tidak ada data hafalan ditemukan</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <!-- Grafik Bar -->
    <div class="my-4">
        <canvas id="hafalanChart"></canvas>
    </div>
</fieldset>

<!-- OVERVIEW -->
@if (Auth::user()->account_type != User::ACCOUNT_TYPE_PARENT)
    <fieldset>
        <legend>Overview</legend>
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <p class="mb-1 font-weight-bold">Siswa Yang Diampu</p>
                    <h3>{{ $siswa }}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <p class="mb-1 font-weight-bold">Kelas Yang Diampu</p>
                    <h3>{{ $class }}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <p class="mb-1 font-weight-bold">Hafalan {{ date('d M Y') }}</p>
                    <h3>{{ $hafalan }}</h3>
                </div>
            </div>
        </div>

        <!-- Grafik Donat -->
<div class="row mt-4">
    <div class="col-12 text-center">
        <div style="width: 250px; height: 250px; display: inline-block;">
            <canvas id="overviewDonutChart" width="250" height="250"></canvas>
        </div>
    </div>
</div>

    </fieldset>
@endif

<hr>

<!-- INFORMASI USER -->
<fieldset>
    <legend>Informasi User</legend>

    <div class="form-group">
        <label>Tipe User</label>
        <input type="text" class="form-control" disabled
            value="{{ User::getAccountMeaning(Auth::user()->account_type) }}">
    </div>

    <div class="form-group">
        <label>Terakhir Login</label>
        <input type="text" class="form-control" disabled value="{{ $last_login }}">
    </div>
</fieldset>

<!-- CHART.JS SCRIPT -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // Chart: Hafalan per Santri
    const hafalanChart = new Chart(document.getElementById('hafalanChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: {!! json_encode($santri_hafalan->pluck('siswa_name')) !!},
            datasets: [{
                label: 'Total Hafalan (ayat)',
                data: {!! json_encode($santri_hafalan->pluck('total_hafalan')) !!},
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Jumlah Ayat'
                    }
                }
            }
        }
    });

    // Chart: Donut Overview
    const overviewDonutChart = new Chart(document.getElementById('overviewDonutChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ['Siswa', 'Kelas'],
            datasets: [{
                label: 'Komposisi',
                data: [{{ $siswa }}, {{ $class }}],
                backgroundColor: ['#36A2EB', '#FFCE56'],
                borderColor: ['#fff', '#fff'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>

@endsection

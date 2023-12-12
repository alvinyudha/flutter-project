@extends ('user.partials.main')
@section('content')
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Riwayat Cuti</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Tables</li>
                    <li class="breadcrumb-item active">Data</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Riwayat Cuti</h5>


                            <!-- Table with stripped rows -->
                            <table class="table datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Nama</th>
                                        <th scope="col">Tanggal Mulai</th>
                                        <th scope="col">Tanggal Selesai</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Detail</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($cutis as $cuti)
                                        <tr>
                                            <th scope="row">{{ $loop->iteration }}</th>
                                            <td>{{ $cuti->nama }}</td>
                                            <td>{{ $cuti->tanggal_mulai }}</td>
                                            <td>{{ $cuti->tanggal_selesai }}</td>
                                            <td>{{ $cuti->status }}</td>
                                            <td> <a href="{{ route('cuti.detailRiwayat', $cuti->id) }}">Detail</a></td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->

                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->
@endsection

@extends ('partials.main')
@section('content')
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Detail Cuti</h1>
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
                            <h5 class="card-title">Detai Cuti</h5>


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
                                        <th scope="col">Aksi</th>
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
                                            <td> <a href="{{ route('cuti.show', $cuti->id) }}">Detail</a></td>
                                            <td>
                                                @if ($cuti->status == 'pending')
                                                    <form action="{{ route('cuti.approve', $cuti->id) }}" method="POST"
                                                        style="display: inline-block;"> @csrf @method('put') <button
                                                            type="submit" class="btn btn-success">Setujui</button> </form>
                                                    <form action="{{ route('cuti.reject', $cuti->id) }}" method="POST"
                                                        style="display: inline-block;">
                                                        @csrf @method('put') <button type="submit"
                                                            class="btn btn-danger">Tolak</button>
                                                    </form>
                                                @endif
                                            </td>
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

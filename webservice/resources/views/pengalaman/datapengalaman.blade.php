@extends ('partials.main')
@section('content')
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Pengalaman Kerja</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item active">Pengalaman Kerja</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <div class="col-12">
                                <a href="{{ route('create') }}" class="btn btn-primary mt-3 mb-3"><i
                                        class="fas bi-person-plus-fill"></i> Tambah Data</a>
                            </div>
                            <div>
                                <!-- Table with stripped rows -->
                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Nama</th>
                                            <th scope="col">Jabatan</th>
                                            <th scope="col">Tahun Masuk</th>
                                            <th scope="col">Tahun Keluar</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($data as $d)
                                            <tr>
                                                <th scope="row"> {{ $loop->iteration }} </th>
                                                <td>{{ $d->nama }} </td>
                                                <td>{{ $d->jabatan }} </td>
                                                <td>{{ $d->tahun_masuk }} </td>
                                                <td>{{ $d->tahun_keluar }} </td>
                                                <td>
                                                    <a href="{{ route('update', ['id' => $d->id]) }}"
                                                        class="btn btn-success"><i class="fas bi-pencil-square">
                                                            Edit</i></a>
                                                    <a data-bs-toggle="modal"
                                                        data-bs-target="#modal-hapus{{ $d->id }}"
                                                        class="btn btn-danger"><i class="fas bi-trash-fill"> Hapus</i></a>
                                                </td>

                                            </tr>

                                            {{-- MODAL --}}
                                            <div class="modal fade" id="modal-hapus{{ $d->id }}" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Hapus?</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Yakin untuk menghapus??
                                                        </div>
                                                        <div class="modal-footer">
                                                            <form action="{{ route('delete', ['id' => $d->id]) }}"
                                                                method="POST">
                                                                @csrf
                                                                @method('DELETE')
                                                                <button type="button" class="btn btn-primary"
                                                                    data-bs-dismiss="modal">Tidak</button>
                                                                <button type="submit" class="btn btn-danger">Ya</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </tbody>
                                </table>
                                <!-- End Table with stripped rows -->

                            </div>
                        </div>
                    </div>
                </div>
        </section>

    </main>

@extends ('partials.main')
@section('content')
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Edit Data</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('pengalaman') }}">Pengalaman Kerja</a></li>
                    <li class="breadcrumb-item active">Edit Data</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <form action="{{ route('save', ['id' => $data->id]) }}" method="POST">
                @csrf
                @method('PUT')
                <div class="row">
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-body mt-5">
                                <!-- General Form Elements -->
                                <form>
                                    <div class="row mb-3">
                                        <label for="inputNama" class="col-sm-2 col-form-label">Nama</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="nama" value="{{ $data->nama }}"
                                                class="form-control">
                                            @error('nama')
                                                <small>{{ $message }} </small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputJabatan" class="col-sm-2 col-form-label">Jabatan</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="jabatan"value="{{ $data->jabatan }}"
                                                class="form-control">
                                            @error('jabatan')
                                                <small>{{ $message }} </small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputTahunMasuk" class="col-sm-2 col-form-label">Tahun Masuk</label>
                                        <div class="col-sm-10">
                                            <input type="number" name="tahun_masuk"value="{{ $data->tahun_masuk }}"
                                                class="form-control">
                                            @error('tahun_masuk')
                                                <small>{{ $message }} </small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputTahunKeluar" class="col-sm-2 col-form-label">Tahun Keluar</label>
                                        <div class="col-sm-10">
                                            <input type="number" name="tahun_keluar"
                                                value="{{ $data->tahun_keluar }}"class="form-control">
                                            @error('tahun_keluar')
                                                <small>{{ $message }} </small>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row mb-3">
                                        <label class="col-sm-2 col-form-label">Submit Button</label>
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary">Submit Form</button>
                                        </div>
                                    </div>

                                </form><!-- End General Form Elements -->

                            </div>
                        </div>

                    </div>
                </div>
            </form>
        </section>


    </main>
@endsection

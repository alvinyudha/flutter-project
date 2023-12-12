@extends ('user.partials.main')
@section('content')
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Ajukan Cuti</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home.user') }}">Home</a></li>
                    <li class="breadcrumb-item active">Cuti</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->
        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"></h5>

                            <!-- General Form Elements -->
                            <form method="POST" action="{{ route('cuti.store') }}">
                                @csrf

                                <div class="row mb-3">
                                    <label for="nama" class="col-sm-2 col-form-label">Nama:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="nama" id="nama" required>
                                    </div>

                                </div>
                                <div class="row mb-3">
                                    <label for="tanggal_mulai" class="col-sm-2 col-form-label">Tanggal Mulai:</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" name="tanggal_mulai" id="tanggal_mulai"
                                            required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="tanggal_selesai" class="col-sm-2 col-form-label">Tanggal Selesai:</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" name="tanggal_selesai"
                                            id="tanggal_selesai" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="alasan" class="col-sm-2 col-form-label">Alasan:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" style="height: 100px" name="alasan" id="alasan" required></textarea>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">Ajukan Cuti</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
        </section>
    @endsection

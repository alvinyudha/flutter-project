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
            <div class="row ">
                <div class="col-lg-12">
                    <!-- Default Card -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Detail Cuti</h5>
                            <p><strong>Nama:</strong> {{ $cuti->nama }}</p>
                            <p><strong>Tanggal Mulai:</strong> {{ $cuti->tanggal_mulai }}</p>
                            <p><strong>Tanggal Selesai:</strong> {{ $cuti->tanggal_selesai }}</p>
                            <p><strong>Alasan:</strong> {{ $cuti->alasan }}</p>
                            <p><strong>Durasi:</strong> {{ $cuti->durasi }} hari</p>
                            <p><strong>Status:</strong> {{ $cuti->status }}</p>
                        </div>
                    </div><!-- End Default Card -->
                </div>
            </div>
        </section>
    </main>
@endsection

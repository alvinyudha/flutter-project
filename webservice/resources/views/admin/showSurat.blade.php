@extends ('partials.main')
@section('content')
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Detail Surat Izin</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home.admin') }}">Home</a></li>
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
                            <h5 class="card-title">Detail Surat Izin</h5>
                            <p><strong>Nama:</strong> {{ $surat->nama }}</p>
                            <p><strong>Jenis Surat:</strong> {{ $surat->jenis_surat }}</p>
                            <p><strong>Tanggal Mulai:</strong> {{ $surat->tanggal_mulai }}</p>
                            <p><strong>Tanggal Selesai:</strong> {{ $surat->tanggal_selesai }}</p>
                            <p><strong>Alasan:</strong> {{ $surat->alasan }}</p>
                            <p><strong>Durasi:</strong> {{ $surat->durasi }} hari</p>
                            <p><strong>Status:</strong> {{ $surat->status }}</p>
                        </div>
                    </div><!-- End Default Card -->
                </div>
            </div>
        </section>
    </main>
@endsection

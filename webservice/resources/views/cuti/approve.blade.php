@extends('layouts.admin')
@section('title')
@section('content')

<main class="app-content">
      <div class="app-title">
        <div class="div">
          <h1><i class="fa fa-laptop"></i> Approval</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Cuti</li>
          <li class="breadcrumb-item"><a href="#">Approval</a></li>
        </ul>
      </div>
      <div class="tile mb-4">
        <div class="page-header">
          <div class="row">
            <div class="col-lg-12">
                <form action="" class="form-inline" method="get">
                  <input type="text" name="nama" class="form-control mb-2 mr-2" value="{{ request()->nama }}" placeholder="Cari Nama Pegawai">
                  <select name="limit" class="form-control mb-2 mr-2">
                    <option @if(request()->limit == 10) selected @endif>10</option>
                    <option @if(request()->limit == 20) selected @endif>20</option>
                    <option @if(request()->limit == 50) selected @endif>50</option>
                    <option @if(request()->limit == 100) selected @endif>100</option>
                    <option @if(request()->limit == 500) selected @endif>500</option>
                  </select>
                  <button type="submit" class="btn btn-info mb-2"><i class="fa fa-search"></i></button>
                </form>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>NIP</th>
                      <th>Nama</th>
                      <th>Alasan</th>
                      <th>Opsi</th>
                    </tr>
                  </thead>
                  
                </table>
                
            </div>            
          </div>
        </div>
      </div>
    </main>
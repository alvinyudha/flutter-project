 <!-- ======= Sidebar ======= -->
 <aside id="sidebar" class="sidebar">

     <ul class="sidebar-nav" id="sidebar-nav">

         <li class="nav-item">
             <a class="nav-link " href="{{ route('home.admin') }}">
                 <i class="bi bi-grid"></i>
                 <span>Dashboard</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('cuti.detail') }}">
                 <i class="bi bi-grid"></i>
                 <span>Konfirmasi Cuti</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('surat.detail') }}">
                 <i class="bi bi-grid"></i>
                 <span>Konfirmasi Surat Izin</span>
             </a>
         </li>

         {{-- <li class="nav-item">
             <a class="nav-link collapsed" data-bs-target="#data-nav" data-bs-toggle="collapse" href="#">
                 <i class="bi bi-menu-button-wide"></i><span>Data</span><i class="bi bi-chevron-down ms-auto"></i>
             </a>
             <ul id="data-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                 <li>
                     <a class="nav-link" href="{{ route('pengalaman') }}">
                         <i class="bi bi-circle-fill"></i>
                         <span>Pengalaman Kerja</span>
                     </a>
                 </li>
             </ul>
             <ul id="data-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                 <li>
                     <a class="nav-link" href="{{ route('pendidikan') }}">
                         <i class="bi bi-circle-fill"></i>
                         <span>Pendidikan</span>
                     </a>
                 </li>
             </ul>
         </li> --}}




         <li class="nav-item">
             <a class="nav-link " href="{{ route('logout') }}">
                 <i class="bi bi-box-arrow-in-right"></i>
                 <span>Logout</span>
             </a>
         </li>
         <!-- End Dashboard Nav -->
     </ul>

 </aside><!-- End Sidebar-->

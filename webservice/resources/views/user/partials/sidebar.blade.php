 <!-- ======= Sidebar ======= -->
 <aside id="sidebar" class="sidebar">

     <ul class="sidebar-nav" id="sidebar-nav">

         <li class="nav-item">
             <a class="nav-link " href="{{ route('home.user') }}">
                 <i class="bi bi-grid-fill"></i>
                 <span>Dashboard</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('cuti.create') }}">
                 <i class="bi bi-calendar2-event-fill"></i>
                 <span>Cuti</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('surat.create') }}">
                 <i class="bi bi-envelope-fill"></i>
                 <span>Surat</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('cuti.riwayat') }}">
                 <i class="bi bi-calendar2-event-fill"></i>
                 <span>Riwayat Cuti</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('surat.riwayat') }}">
                 <i class="bi bi-envelope-fill"></i>
                 <span>Riwayat Surat Izin</span>
             </a>
         </li>
         <li class="nav-item">
             <a class="nav-link " href="{{ route('logout') }}">
                 <i class="bi bi-box-arrow-in-right"></i>
                 <span>Logout</span>
             </a>
         </li>
         <!-- End Dashboard Nav -->
     </ul>

 </aside><!-- End Sidebar-->

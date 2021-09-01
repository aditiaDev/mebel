<!-- Sidebar Menu -->
<nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item">
            <a href="<?php echo base_url("home")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="HOME" OR $this->uri->segment(1)==""){echo 'active';}?>">
              <i class="nav-icon fas fa-home"></i>
              <p>
                Home
              </p>
            </a>
          </li>
          <?php
            if($this->session->userdata('level') == "admin"){
          ?>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Master
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php echo base_url("user/")?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Users</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("barang/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="BARANG"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Barang</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("pelanggan/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PELANGGAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Pelanggan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("supplier/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="SUPPLIER"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Supplier</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Transaksi
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="<?php echo base_url("pembelian/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PEMBELIAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pembelian</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("penjualan/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PENJUALAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Penjualan</p>
                </a>
              </li>
              
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Keuangan
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="<?php echo base_url("pemasukan/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PEMASUKAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pemasukan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("pengeluaran/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PENGELUARAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pengeluaran</p>
                </a>
              </li>
              
            </ul>
          </li>
          <?php
            }else{
          ?>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Transaksi
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="<?php echo base_url("pembelian/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PEMBELIAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pembelian</p>
                </a>
              </li>
              
            </ul>
          </li>

          <?php
            }
            if($this->session->userdata('level') == "pemilik"){
          ?>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-print"></i>
              <p>
                Laporan
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?php echo base_url("laporan/penjualan")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PEMBELIAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Penjualan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("laporan/pembelian")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PENJUALAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Pembelian</p>
                </a>
              </li>
              <li class="nav-item">
              <a href="<?php echo base_url("laporan/pengeluaran")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PEMBELIAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Pengeluaran</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("laporan/pemasukan")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PENJUALAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Pemasukan</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("laporan/keuangan")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="KEUANGAN"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Keuangan</p>
                </a>
              </li>
              
            </ul>
          </li>
          <?php
            }
          ?>
          <li class="nav-item">
            <a href="<?php echo base_url("login/logout")?>" class="nav-link">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>
                Sign Out
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
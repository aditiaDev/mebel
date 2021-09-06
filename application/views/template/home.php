<!-- DataTables -->
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css'); ?>">
<div class="content-wrapper">  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card" style="margin-top: 1rem">
            <div class="card-header">
              <h3 class="card-title">Welcome</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <h3>Selamat datang pada Sistem Pengelolaan Usaha Mebel Buk Dhe Jepara</h3>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <div class="row">
        <div class="col-6">
          <div class="card" style="margin-top: 1rem">
            <div class="card-header">
              <h3 class="card-title">Bahan Baku (Stok dibawah stok minimal)</h3>
            </div>
            <div class="card-body">
              <table id="tb_bahan_baku" class="table table-bordered table-hover" style="font-size: 10px;">
                <thead>
                <tr>
                  <th>Kode</th>
                  <th>Barang</th>
                  <th>Stok</th>
                  <th>Min. Stok</th>
                </tr>
                </thead>
                <tbody>
                
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card" style="margin-top: 1rem">
            <div class="card-header">
              <h3 class="card-title">Barang Jadi (Stok dibawah stok minimal)</h3>
            </div>
            <div class="card-body">
              <table id="tb_barang_jadi" class="table table-bordered table-hover" style="font-size: 10px;">
                <thead>
                <tr>
                  <th>Kode</th>
                  <th>Barang</th>
                  <th>Stok</th>
                  <th>Min. Stok</th>
                </tr>
                </thead>
                <tbody>
                
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- jQuery -->
<script src="<?php echo base_url('/assets/adminlte/plugins/jquery/jquery.min.js'); ?>"></script>
<script>
  $(function () {
    
    var tb_bahan_baku = $("#tb_bahan_baku").DataTable({
      "order": [[ 0, "desc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('barang/getByMinStok') ?>",
          "type": "POST",
          "data": {
            "jenis" : "BAHAN BAKU"
          }
      },
      "columns": [
          { "data": "id_barang" },
          { "data": "nm_barang"},
          { "data": "stok", },
          { "data": "minimum_stok"},
      ]
    })

    var tb_barang_jadi = $("#tb_barang_jadi").DataTable({
      "order": [[ 0, "desc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('barang/getByMinStok') ?>",
          "type": "POST",
          "data": {
            "jenis" : "BARANG JADI"
          }
      },
      "columns": [
          { "data": "id_barang" },
          { "data": "nm_barang"},
          { "data": "stok", },
          { "data": "minimum_stok"},
      ]
    })
  
  })
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Laporan Pengeluaran</title>
</head>
<body>
 
<div id="container">
	<h3>Laporan Pengeluaran</h3>
    <table border="1" style="width:100%;font-size:12px;border: 1px solid #ddd;border-collapse: collapse;">
	  	<thead>
	  		<tr>
	  			<th class="short">#</th>
	  			<th class="normal">ID Pengeluaran</th>
	  			<th class="normal">Tanggal</th>
                <th class="normal">Tipe Pengeluaran</th>
                <th class="normal">ID Pembelian</th>
                <th class="normal">Keperluan</th>
                <th class="normal">Nominal</th>
	  		</tr>
	  	</thead>
	  	<tbody>
		  	<?php $no=1; ?>
				<?php foreach($data as $row): ?>
				<tr>
					<td><?php echo $no; ?></td>
					<td><?php echo $row['id_pengeluaran']; ?></td>
					<td><?php echo $row['tgl_input']; ?></td>
					<td><?php echo $row['tipe_pengeluaran']; ?></td>
					<td><?php echo $row['id_relasi']; ?></td>
					<td><?php echo $row['keperluan']; ?></td>
					<td><?php echo number_format($row['nominal_keluar'],0,',','.'); ?></td>
				</tr>
				<?php $no++; ?>
	  		<?php endforeach; ?>
	  	</tbody>
	  </table>
 
</div>
 
</body>
</html>

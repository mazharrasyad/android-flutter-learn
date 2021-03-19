<?php
	include '../koneksi.php';

	$hasil = $connect->query("select * from category_ecommerce");

	$result = array();
	while ($dapatData = $hasil->fetch_assoc()){
		$result[] = $dapatData;
	}

	echo json_encode($result);
?>
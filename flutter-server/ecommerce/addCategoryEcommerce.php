<?php
	include '../koneksi.php';

	$nama = $_POST['namaKategoriProduk'];

	$connect->query("insert into category_ecommerce (nama) values('".$nama."')");
?>
<?php
	include '../koneksi.php';

	$nama = $_POST['namaProduk'];
	$kategori = $_POST['kategoriProduk'];
	$deskripsi = $_POST['deskripsiProduk'];

	$connect->query("insert into ecommerce (nama, kategori, gambar, deskripsi) values('".$nama."', '".$kategori."', 'notavailable.jpg', '".$deskripsi."')");
?>
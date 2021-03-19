<?php
	include '../koneksi.php';

	$id = $_POST['id'];
	$nama = $_POST['namaProduk'];
	$kategori = $_POST['kategoriProduk'];
	$deskripsi = $_POST['deskripsiProduk'];

	$connect->query("update ecommerce set nama='$nama', kategori='$kategori', deskripsi='$deskripsi' where id = '$id'");
?>
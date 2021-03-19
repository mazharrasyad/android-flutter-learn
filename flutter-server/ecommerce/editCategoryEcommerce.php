<?php
	include '../koneksi.php';

	$id = $_POST['id'];
	$nama = $_POST['namaCategoryEcommerce'];

	$connect->query("update category_ecommerce set nama='$nama' where id = '$id'");
?>
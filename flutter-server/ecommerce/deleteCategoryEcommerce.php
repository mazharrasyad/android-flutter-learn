<?php
	include '../koneksi.php';

	$id = $_POST['id'];

	$connect->query("delete from category_ecommerce where id='$id'");
?>
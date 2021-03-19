<?php
	include '../koneksi.php';

	$id = $_POST['id'];

	$connect->query("delete from ecommerce where id='$id'");
?>
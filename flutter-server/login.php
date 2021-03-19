<?php
	require "koneksi.php";
	if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		$response = array();
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		// langkah 2
		$cek = "SELECT * FROM user WHERE username='$username' and password='$password'";
		$result = mysqli_fetch_array(mysqli_query($connect, $cek));
		
		if (isset($result)) {
			$response['value'] = 1;
			$response['message'] = "Login berhasil";
			$response['name'] = $result['name'];
			$response['email'] = $result['email'];
			echo json_encode($response);
		} else {
			$response['value'] = 0;
			$response['message'] = "Login gagal";
			echo json_encode($response);
		}
	}
?>

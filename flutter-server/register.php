<?php
	require "koneksi.php";

	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		$response = array();
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$name= $_POST['name'];
		$email = $_POST['email'];
		// langkah 2
		$cek = "SELECT * FROM user WHERE username='$username'";
		$result = mysqli_fetch_array(mysqli_query($connect, $cek));

		if (isset($result)) {
			$response['value'] = 2;
			$response['message'] = "Username telah digunakan";
			echo json_encode($response);
		} else {
			$insert = "INSERT INTO user VALUE(NULL, '$name', '$email', '$username','$password')";
			if (mysqli_query($connect, $insert)) {
				$response['value'] = 1;
				$response['message'] = "Berhasil didaftarkan";
				echo json_encode($response);
			} else {
				$response['value'] = 0;
				$response['message'] = "Gagal didaftarkan";
				echo json_encode($response);
			}
		}
	}
?>
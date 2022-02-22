<?php
if (defined("BASEPATH") === false) {
	die('Anda Tidak Memiliki Akses Ke Halaman Ini');
}
require_once 'libraries/koneksi.php';

if (isset($_POST['submit'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];

	$password = md5($password);
	$query = $connection->query("SELECT * FROM tb_pelanggan WHERE username ='$username' AND password ='$password'");
	$result = $query->num_rows;
	if ($result == 1) {
		session_start();
		$_SESSION['login'] = $query->fetch_assoc();
		echo "<script>alert('Berhasil Login');</script>";
		header("Location: pelanggan/index.php");
	} else {
		echo "<script>alert('Gagal Login');</script>";
		header("Location: index.php");
	}
}

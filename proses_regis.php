<?php
require_once 'libraries/koneksi.php';

if (isset($_POST['submit'])) {
	$nama =  $_POST['nama'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$email =  $_POST['email'];

	$password = md5($password);

	$sql = "INSERT INTO tb_pelanggan(nama,username,password,email) VALUES ('$nama','$username','$password','$email')";

	//cek username sudah ada atau tidak
	$sql_usrnm = "SELECT username FROM tb_pelanggan WHERE username='$username'";
	$result = mysqli_query($connection, $sql_usrnm);
	if (mysqli_fetch_assoc($result)) {
		echo "<script>alert('Username Sudah Tersedia, mohon diganti..');window.location=('register.php');</script>";
	} elseif (mysqli_query($connection, $sql)) {
		echo "<script>alert('Data berhasil di Tambah'); window.location=('index.php');</script>"; //gk nggo fungsi, ben cepet wkwk, ora include soale beda file ambi page
	}
}

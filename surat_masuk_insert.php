<?php 

/**
 * File surat_masuk_insert.php
 * UJK
 */

 // Menyisipkan file login_status.php dan koneksi.php 
include "login_status.php";
//login sttus untuk mengambil session login dari variable $_SESSION['id'] yang didefinisikan dari verifikasi login ini bisa berupa id_user
include "koneksi.php";
// menyisipkan file koneksi.php yang berisi database connect mysql_connect terdiri dari user password database dan port mysql

$no_agenda 		= $_POST['no_agenda'];
// variabel no_agenda didefinisikan ketika user sudah menginpiutkan/ mempostkan no_agenda
$id  			= $_SESSION['id'];  
// session id diambil dari login_status.php berisi id session dari user yang telah melakukan login (session ini biasanya disimoan dalam cookie / lokal browser )
$jenis_surat	= $_POST['jenis_surat'];
$tanggal_kirim	= $_POST['tanggal_kirim'];
$tanggal_terima	= $_POST['tanggal_terima'];
$no_surat		= $_POST['no_surat'];
$pengirim		= $_POST['pengirim'];
$perihal		= $_POST['perihal'];
 
//query simpan
// $perintah adlaah variabel yang berisi query / perintah mysql untuk memasukan data ke dalam tabel surat_masuk teridir dr no_agenda id dll
$perintah="insert into surat_masuk values('$no_agenda','$id','$jenis_surat','$tanggal_kirim','$tanggal_terima','$no_surat','$pengirim','$perihal') ";
$eksekusi 	= mysqli_query($koneksi,$perintah);
// mysql_query adalah function / fungsi dari php untuk mengeksekusi perintah MYSQL 

// if statment / percabangan dari eksekusi jika benar (TRUE) maka akan ada alert didalam ui / javascript Berhasil simpan jika salah maka gagal disimpan
// alert adalah fungsi javascript untuk menampilkan pesan peringatan 
// window.location adalah redirect lokasi yg dituju
if ($eksekusi) {
exit("
<script> 
	alert('Berhasil Simpan!')
	window.location='surat_masuk.php';
</script>
	");
	} else {
	exit("
<script> 
	alert('Gagal Simpan!')
	window.location='surat_masuk.php';
</script>
	");
	}
?>

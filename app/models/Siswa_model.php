<?php

class Siswa_model {
	private $table = 'tb_siswa';
	private $db;

	public function __construct() {
		$this->db = new Model;
	}

	public function get() {
		$this->db->query('SELECT * FROM ' . $this->table);
		return $this->db->result();
	}

	public function get_all($by, $single = FALSE) {
		$this->db->query(
			'SELECT * FROM ' 
			. $this->table . 
			' INNER JOIN tb_jenjang ON jenjang_id = siswa_jenjang ' .
			' INNER JOIN tb_kelas ON kelas_id = siswa_kelas ' .
			' INNER JOIN tb_tingkat ON tingkat_id = kelas_tingkat ' .
			(!is_null($by) ? ' WHERE ' . $by[0] . '=:' . $by[0] : '')
		);
		if (!is_null($by)) {
			$this->db->bind($by[0], $by[1]);
		}

		if ($single) {
			$method = $this->db->row();
		} else {
			$method = $this->db->result();
		}

		return $method;
	}

	public function get_by($by) {
		$this->db->query('SELECT * FROM ' . $this->table . ' WHERE '.$by[0].'=:'.$by[0]);
		$this->db->bind($by[0], $by[1]);
		return $this->db->row();
	}

	public function add($data) {
		$query = "
			INSERT INTO ".$this->table." 
			(siswa_nis, 
			siswa_nama,
			siswa_nama_panggilan,
			siswa_tmp_lahir, 
			siswa_tgl_lahir, 
			siswa_jenis_kelamin, 
			siswa_agama, 
			siswa_anak_ke,
			siswa_alamat,
			siswa_nohp,
			siswa_jenjang_terakhir,
			siswa_gol_darah,
			siswa_hobi,
			siswa_nama_ayah,
			siswa_nama_ibu,
			siswa_alamat_ortu,
			siswa_pekerjaan_ayah,
			siswa_pekerjaan_ibu,
			siswa_pend_terakhir_ayah,
			siswa_pend_terakhir_ibu,
			siswa_nohp_ayah,
			siswa_nohp_ibu,
			siswa_email_ayah,
			siswa_email_ibu,
			siswa_penghasilan_ayah,
			siswa_penghasilan_ibu,
			siswa_nama_wali,
			siswa_nohp_wali,
			siswa_alamat_wali,
			siswa_pekerjaan_wali,
			siswa_jenjang,
			siswa_kelas,
			siswa_semester,
			siswa_foto,
			siswa_uid)
			VALUES 
			(:siswa_nis, 
			:siswa_nama,
			:siswa_nama_panggilan,
			:siswa_tmp_lahir, 
			:siswa_tgl_lahir, 
			:siswa_jenis_kelamin, 
			:siswa_agama, 
			:siswa_anak_ke,
			:siswa_alamat,
			:siswa_nohp,
			:siswa_jenjang_terakhir,
			:siswa_gol_darah,
			:siswa_hobi,
			:siswa_nama_ayah,
			:siswa_nama_ibu,
			:siswa_alamat_ortu,
			:siswa_pekerjaan_ayah,
			:siswa_pekerjaan_ibu,
			:siswa_pend_terakhir_ayah,
			:siswa_pend_terakhir_ibu,
			:siswa_nohp_ayah,
			:siswa_nohp_ibu,
			:siswa_email_ayah,
			:siswa_email_ibu,
			:siswa_penghasilan_ayah,
			:siswa_penghasilan_ibu,
			:siswa_nama_wali,
			:siswa_nohp_wali,
			:siswa_alamat_wali,
			:siswa_pekerjaan_wali,
			:siswa_jenjang,
			:siswa_kelas,
			:siswa_semester,
			:siswa_foto,
			:siswa_uid)
		";
		$this->db->query($query);
		$this->db->bind('siswa_nis', $data['siswa_nis']);
		$this->db->bind('siswa_nama', $data['siswa_nama']);
		$this->db->bind('siswa_nama_panggilan', $data['siswa_nama_panggilan']);
		$this->db->bind('siswa_tmp_lahir', $data['siswa_tmp_lahir']);
		$this->db->bind('siswa_tgl_lahir', $data['siswa_tgl_lahir']);
		$this->db->bind('siswa_jenis_kelamin', $data['siswa_jenis_kelamin']);
		$this->db->bind('siswa_agama', $data['siswa_agama']);
		$this->db->bind('siswa_anak_ke', $data['siswa_anak_ke']);
		$this->db->bind('siswa_alamat', $data['siswa_alamat']);
		$this->db->bind('siswa_nohp', $data['siswa_nohp']);
		$this->db->bind('siswa_jenjang_terakhir', $data['siswa_jenjang_terakhir']);
		$this->db->bind('siswa_gol_darah', $data['siswa_gol_darah']);
		$this->db->bind('siswa_hobi', $data['siswa_hobi']);
		$this->db->bind('siswa_nama_ayah', $data['siswa_nama_ayah']);
		$this->db->bind('siswa_nama_ibu', $data['siswa_nama_ibu']);
		$this->db->bind('siswa_alamat_ortu', $data['siswa_alamat_ortu']);
		$this->db->bind('siswa_pekerjaan_ayah', $data['siswa_pekerjaan_ayah']);
		$this->db->bind('siswa_pekerjaan_ibu', $data['siswa_pekerjaan_ibu']);
		$this->db->bind('siswa_pend_terakhir_ayah', $data['siswa_pend_terakhir_ayah']);
		$this->db->bind('siswa_pend_terakhir_ibu', $data['siswa_pend_terakhir_ibu']);
		$this->db->bind('siswa_nohp_ayah', $data['siswa_nohp_ayah']);
		$this->db->bind('siswa_nohp_ibu', $data['siswa_nohp_ibu']);
		$this->db->bind('siswa_email_ayah', $data['siswa_email_ayah']);
		$this->db->bind('siswa_email_ibu', $data['siswa_email_ibu']);
		$this->db->bind('siswa_penghasilan_ayah', $data['siswa_penghasilan_ayah']);
		$this->db->bind('siswa_penghasilan_ibu', $data['siswa_penghasilan_ibu']);
		$this->db->bind('siswa_nama_wali', $data['siswa_nama_wali']);
		$this->db->bind('siswa_nohp_wali', $data['siswa_nohp_wali']);
		$this->db->bind('siswa_alamat_wali', $data['siswa_alamat_wali']);
		$this->db->bind('siswa_pekerjaan_wali', $data['siswa_pekerjaan_wali']);
		$this->db->bind('siswa_jenjang', $data['siswa_jenjang']);
		$this->db->bind('siswa_kelas', $data['siswa_kelas']);
		$this->db->bind('siswa_semester', $data['siswa_semester']);
		$this->db->bind('siswa_foto', $data['siswa_foto']);
		$this->db->bind('siswa_uid', $data['siswa_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}
	public function add_without_data($data) {
		$query = "
			INSERT INTO ".$this->table." 
			(
			siswa_jenjang,
			siswa_kelas,
			siswa_uid)
			VALUES 
			(
			:siswa_jenjang,
			:siswa_kelas,
			:siswa_uid)
		";
		$this->db->query($query);
		$this->db->bind('siswa_jenjang', $data['siswa_jenjang']);
		$this->db->bind('siswa_kelas', $data['siswa_kelas']);
		$this->db->bind('siswa_uid', $data['siswa_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}

	public function update($data) {
		$query = "
			UPDATE ".$this->table." SET
			siswa_nis=:siswa_nis, 
			siswa_nama=:siswa_nama,
			siswa_nama_panggilan=:siswa_nama_panggilan,
			siswa_tmp_lahir=:siswa_tmp_lahir, 
			siswa_tgl_lahir=:siswa_tgl_lahir, 
			siswa_jenis_kelamin=:siswa_jenis_kelamin, 
			siswa_agama=:siswa_agama, 
			siswa_anak_ke=:siswa_anak_ke,
			siswa_alamat=:siswa_alamat,
			siswa_nohp=:siswa_nohp,
			siswa_jenjang_terakhir=:siswa_jenjang_terakhir,
			siswa_gol_darah=:siswa_gol_darah,
			siswa_hobi=:siswa_hobi,
			siswa_nama_ayah=:siswa_nama_ayah,
			siswa_nama_ibu=:siswa_nama_ibu,
			siswa_alamat_ortu=:siswa_alamat_ortu,
			siswa_pekerjaan_ayah=:siswa_pekerjaan_ayah,
			siswa_pekerjaan_ibu=:siswa_pekerjaan_ibu,
			siswa_pend_terakhir_ayah=:siswa_pend_terakhir_ayah,
			siswa_pend_terakhir_ibu=:siswa_pend_terakhir_ibu,
			siswa_nohp_ayah=:siswa_nohp_ayah,
			siswa_nohp_ibu=:siswa_nohp_ibu,
			siswa_email_ayah=:siswa_email_ayah,
			siswa_email_ibu=:siswa_email_ibu,
			siswa_penghasilan_ayah=:siswa_penghasilan_ayah,
			siswa_penghasilan_ibu=:siswa_penghasilan_ibu,
			siswa_nama_wali=:siswa_nama_wali,
			siswa_nohp_wali=:siswa_nohp_wali,
			siswa_alamat_wali=:siswa_alamat_wali,
			siswa_pekerjaan_wali=:siswa_pekerjaan_wali,
			siswa_jenjang=:siswa_jenjang,
			siswa_kelas=:siswa_kelas,
			siswa_semester=:siswa_semester,
			siswa_foto=:siswa_foto,
			siswa_uid=:siswa_uid
			WHERE siswa_id=:siswa_id
		";
		$this->db->query($query);
		$this->db->bind('siswa_nis', $data['siswa_nis']);
		$this->db->bind('siswa_nama', $data['siswa_nama']);
		$this->db->bind('siswa_nama_panggilan', $data['siswa_nama_panggilan']);
		$this->db->bind('siswa_tmp_lahir', $data['siswa_tmp_lahir']);
		$this->db->bind('siswa_tgl_lahir', $data['siswa_tgl_lahir']);
		$this->db->bind('siswa_jenis_kelamin', $data['siswa_jenis_kelamin']);
		$this->db->bind('siswa_agama', $data['siswa_agama']);
		$this->db->bind('siswa_anak_ke', $data['siswa_anak_ke']);
		$this->db->bind('siswa_alamat', $data['siswa_alamat']);
		$this->db->bind('siswa_nohp', $data['siswa_nohp']);
		$this->db->bind('siswa_jenjang_terakhir', $data['siswa_jenjang_terakhir']);
		$this->db->bind('siswa_gol_darah', $data['siswa_gol_darah']);
		$this->db->bind('siswa_hobi', $data['siswa_hobi']);
		$this->db->bind('siswa_nama_ayah', $data['siswa_nama_ayah']);
		$this->db->bind('siswa_nama_ibu', $data['siswa_nama_ibu']);
		$this->db->bind('siswa_alamat_ortu', $data['siswa_alamat_ortu']);
		$this->db->bind('siswa_pekerjaan_ayah', $data['siswa_pekerjaan_ayah']);
		$this->db->bind('siswa_pekerjaan_ibu', $data['siswa_pekerjaan_ibu']);
		$this->db->bind('siswa_pend_terakhir_ayah', $data['siswa_pend_terakhir_ayah']);
		$this->db->bind('siswa_pend_terakhir_ibu', $data['siswa_pend_terakhir_ibu']);
		$this->db->bind('siswa_nohp_ayah', $data['siswa_nohp_ayah']);
		$this->db->bind('siswa_nohp_ibu', $data['siswa_nohp_ibu']);
		$this->db->bind('siswa_email_ayah', $data['siswa_email_ayah']);
		$this->db->bind('siswa_email_ibu', $data['siswa_email_ibu']);
		$this->db->bind('siswa_penghasilan_ayah', $data['siswa_penghasilan_ayah']);
		$this->db->bind('siswa_penghasilan_ibu', $data['siswa_penghasilan_ibu']);
		$this->db->bind('siswa_nama_wali', $data['siswa_nama_wali']);
		$this->db->bind('siswa_nohp_wali', $data['siswa_nohp_wali']);
		$this->db->bind('siswa_alamat_wali', $data['siswa_alamat_wali']);
		$this->db->bind('siswa_pekerjaan_wali', $data['siswa_pekerjaan_wali']);
		$this->db->bind('siswa_jenjang', $data['siswa_jenjang']);
		$this->db->bind('siswa_kelas', $data['siswa_kelas']);
		$this->db->bind('siswa_semester', $data['siswa_semester']);
		$this->db->bind('siswa_foto', $data['siswa_foto']);
		$this->db->bind('siswa_uid', $data['siswa_uid']);
		$this->db->bind('siswa_id', $data['siswa_id']);

		$this->db->execute();

		return $this->db->rowCount();
	}
	public function update_without_data($data) {
		$query = "
			UPDATE ".$this->table." SET
			siswa_jenjang=:siswa_jenjang,
			siswa_kelas=:siswa_kelas
			WHERE siswa_uid=:siswa_uid
		";
		$this->db->query($query);
		$this->db->bind('siswa_jenjang', $data['siswa_jenjang']);
		$this->db->bind('siswa_kelas', $data['siswa_kelas']);
		$this->db->bind('siswa_uid', $data['siswa_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}

	public function check_profile($uid) {
		$this->db->query('SELECT * FROM ' . $this->table . ' WHERE siswa_uid=:siswa_uid');
		$this->db->bind('siswa_uid', $uid);

		return $this->db->row();
	}

	public function delete($id) {
		$query = "DELETE FROM " . $this->table . " WHERE siswa_id=:siswa_id";
		$this->db->query($query);
		$this->db->bind('siswa_id', $id);
		$this->db->execute();

		return $this->db->rowCount();
	}
}
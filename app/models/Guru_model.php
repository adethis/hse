<?php

class Guru_model {
	private $table = 'tb_guru';
	private $db;

	public function __construct() {
		$this->db = new Model;
	}

	public function get() {
		$this->db->query('SELECT * FROM ' . $this->table . ' ORDER BY guru_id DESC');
		return $this->db->result();
	}

	public function get_all($by = NULL, $single = FALSE) {
		$this->db->query(
			'SELECT * FROM ' 
			. $this->table . 
			' INNER JOIN tb_jenjang ON jenjang_id = guru_jenjang ' .
			' INNER JOIN tb_user ON id = guru_uid ' .
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
			INSERT INTO ".$this->table." (
			guru_nip, 
			guru_nama, 
			guru_tmp_lahir, 
			guru_tgl_lahir, 
			guru_jenis_kelamin, 
			guru_agama, 
			guru_alamat, 
			guru_nohp, 
			guru_foto, 
			guru_jenjang, 
			guru_jenjang_pendidikan,
			guru_tgl_bergabung,
			guru_status_peg,
			guru_tgs_mengajar,
			guru_tgs_tambahan,
			guru_riwayat_pend_sd,
			guru_riwayat_pend_smp,
			guru_riwayat_pend_sma,
			guru_riwayat_pend_pt,
			guru_uid) 
			VALUES (
			:guru_nip, 
			:guru_nama, 
			:guru_tmp_lahir, 
			:guru_tgl_lahir, 
			:guru_jenis_kelamin, 
			:guru_agama, 
			:guru_alamat, 
			:guru_nohp, 
			:guru_foto, 
			:guru_jenjang, 
			:guru_jenjang_pendidikan,
			:guru_tgl_bergabung,
			:guru_status_peg,
			:guru_tgs_mengajar,
			:guru_tgs_tambahan,
			:guru_riwayat_pend_sd,
			:guru_riwayat_pend_smp,
			:guru_riwayat_pend_sma,
			:guru_riwayat_pend_pt,
			:guru_uid)
		";
		$this->db->query($query);
		$this->db->bind('guru_nip', $data['guru_nip']);
		$this->db->bind('guru_nama', $data['guru_nama']);
		$this->db->bind('guru_tmp_lahir', $data['guru_tmp_lahir']);
		$this->db->bind('guru_tgl_lahir', $data['guru_tgl_lahir']);
		$this->db->bind('guru_jenis_kelamin', $data['guru_jenis_kelamin']);
		$this->db->bind('guru_agama', $data['guru_agama']);
		$this->db->bind('guru_alamat', $data['guru_alamat']);
		$this->db->bind('guru_nohp', $data['guru_nohp']);
		$this->db->bind('guru_foto', ($data['guru_foto'] != '' ? $data['guru_foto'] : NULL));
		$this->db->bind('guru_jenjang', $data['guru_jenjang']);
		$this->db->bind('guru_jenjang_pendidikan', $data['guru_jenjang_pendidikan']);
		$this->db->bind('guru_tgl_bergabung', $data['guru_tgl_bergabung']);
		$this->db->bind('guru_status_peg', $data['guru_status_peg']);
		$this->db->bind('guru_tgs_mengajar', $data['guru_tgs_mengajar']);
		$this->db->bind('guru_tgs_tambahan', $data['guru_tgs_tambahan']);
		$this->db->bind('guru_riwayat_pend_sd', $data['guru_riwayat_pend_sd']);
		$this->db->bind('guru_riwayat_pend_smp', $data['guru_riwayat_pend_smp']);
		$this->db->bind('guru_riwayat_pend_sma', $data['guru_riwayat_pend_sma']);
		$this->db->bind('guru_riwayat_pend_pt', $data['guru_riwayat_pend_pt']);
		$this->db->bind('guru_uid', $data['guru_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}
	public function add_without_data($data) {
		$query = "
			INSERT INTO ".$this->table." (
			guru_jenjang, 
			guru_uid) 
			VALUES (
			:guru_jenjang, 
			:guru_uid)
		";
		$this->db->query($query);
		$this->db->bind('guru_jenjang', $data['guru_jenjang']);
		$this->db->bind('guru_uid', $data['guru_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}

	public function update($data) {
		$query = "
			UPDATE ".$this->table." SET
			guru_nip=:guru_nip, 
			guru_nama=:guru_nama, 
			guru_tmp_lahir=:guru_tmp_lahir, 
			guru_tgl_lahir=:guru_tgl_lahir, 
			guru_jenis_kelamin=:guru_jenis_kelamin, 
			guru_agama=:guru_agama, 
			guru_alamat=:guru_alamat, 
			guru_nohp=:guru_nohp, 
			guru_foto=:guru_foto, 
			guru_jenjang=:guru_jenjang, 
			guru_jenjang_pendidikan=:guru_jenjang_pendidikan, 
			guru_tgl_bergabung=:guru_tgl_bergabung,
			guru_status_peg=:guru_status_peg,
			guru_tgs_mengajar=:guru_tgs_mengajar,
			guru_tgs_tambahan=:guru_tgs_tambahan,
			guru_riwayat_pend_sd=:guru_riwayat_pend_sd,
			guru_riwayat_pend_smp=:guru_riwayat_pend_smp,
			guru_riwayat_pend_sma=:guru_riwayat_pend_sma,
			guru_riwayat_pend_pt=:guru_riwayat_pend_pt,
			guru_uid=:guru_uid
			WHERE guru_id=:guru_id
		";
		$this->db->query($query);
		$this->db->bind('guru_nip', $data['guru_nip']);
		$this->db->bind('guru_nama', $data['guru_nama']);
		$this->db->bind('guru_tmp_lahir', $data['guru_tmp_lahir']);
		$this->db->bind('guru_tgl_lahir', $data['guru_tgl_lahir']);
		$this->db->bind('guru_jenis_kelamin', $data['guru_jenis_kelamin']);
		$this->db->bind('guru_agama', $data['guru_agama']);
		$this->db->bind('guru_alamat', $data['guru_alamat']);
		$this->db->bind('guru_nohp', $data['guru_nohp']);
		$this->db->bind('guru_foto', $data['guru_foto']);
		$this->db->bind('guru_jenjang', $data['guru_jenjang']);
		$this->db->bind('guru_jenjang_pendidikan', $data['guru_jenjang_pendidikan']);
		$this->db->bind('guru_tgl_bergabung', $data['guru_tgl_bergabung']);
		$this->db->bind('guru_status_peg', $data['guru_status_peg']);
		$this->db->bind('guru_tgs_mengajar', $data['guru_tgs_mengajar']);
		$this->db->bind('guru_tgs_tambahan', $data['guru_tgs_tambahan']);
		$this->db->bind('guru_riwayat_pend_sd', $data['guru_riwayat_pend_sd']);
		$this->db->bind('guru_riwayat_pend_smp', $data['guru_riwayat_pend_smp']);
		$this->db->bind('guru_riwayat_pend_sma', $data['guru_riwayat_pend_sma']);
		$this->db->bind('guru_riwayat_pend_pt', $data['guru_riwayat_pend_pt']);
		$this->db->bind('guru_uid', $data['guru_uid']);
		$this->db->bind('guru_id', $data['guru_id']);

		$this->db->execute();

		return $this->db->rowCount();
	}
	public function update_without_data($data) {
		$query = "
			INSERT INTO ".$this->table." (
			guru_jenjang, 
			guru_uid) 
			VALUES (
			:guru_jenjang, 
			:guru_uid)
		";
		$this->db->query($query);
		$this->db->bind('guru_jenjang', $data['guru_jenjang']);
		$this->db->bind('guru_uid', $data['guru_uid']);

		$this->db->execute();

		return $this->db->rowCount();
	}

	public function check_profile($uid) {
		$this->db->query('SELECT * FROM ' . $this->table . ' WHERE guru_uid=:guru_uid');
		$this->db->bind('guru_uid', $uid);

		return $this->db->row();
	}

	public function delete($id) {
		$query = "DELETE FROM " . $this->table . " WHERE guru_id=:guru_id";
		$this->db->query($query);
		$this->db->bind('guru_id', $id);
		$this->db->execute();

		return $this->db->rowCount();
	}
}
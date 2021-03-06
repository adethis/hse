<?php

class User_model {
	private $table = 'tb_user';
	private $db;

	public function __construct() {
		$this->db = new Model;
	}

	public function get() {
		$this->db->query('SELECT 
			guru_nama, 
			guru_jenjang, 
			siswa_nama, 
			siswa_kelas, 
			id, 
			username, 
			email, 
			role, 
			guru_jenjang, 
			siswa_kelas 
			FROM ' . $this->table . ' 
			LEFT JOIN tb_guru ON guru_uid = id 
			LEFT JOIN tb_siswa ON siswa_uid = id 
			ORDER BY id DESC');
		return $this->db->result();
	}

	public function get_all() {
		$this->db->query('SELECT 
			guru_nama, 
			guru_jenjang, 
			siswa_nama, 
			siswa_kelas, 
			id, 
			username, 
			email, 
			role, 
			guru_jenjang, 
			siswa_kelas 
			FROM ' . $this->table . ' 
			LEFT JOIN tb_guru ON guru_uid = id 
			LEFT JOIN tb_siswa ON siswa_uid = id 
			ORDER BY id DESC');
		$query = $this->db->result();
		foreach ($query as $key => $value) {
			if ($query[$key]['role'] == 1) {
				$query[$key]['nama'] = $query[$key]['username'];
				$query[$key]['level'] = 'Admin';
				$query[$key]['kelas'] = 'Semua';
			} else if ($query[$key]['role'] == 2) {
				$query[$key]['nama'] = $query[$key]['guru_nama'];
				$query[$key]['level'] = 'Guru';
				$query[$key]['kelas'] = $this->get_jenjang($query[$key]['guru_jenjang'])->jenjang_nama;
			} else if ($query[$key]['role'] == 3) {
				$query[$key]['nama'] = $query[$key]['siswa_nama'];
				$query[$key]['level'] = 'Siswa';
				$query[$key]['kelas'] = $this->get_kelas($query[$key]['siswa_kelas'])->kelas_nama;
			}

			unset($query[$key]['guru_nama']);
			unset($query[$key]['siswa_nama']);
		}
		return $query;
	}

	public function get_by($by) {
		$this->db->query('SELECT * FROM ' . $this->table . ' WHERE '.$by[0].'=:'.$by[0]);
		$this->db->bind($by[0], $by[1]);
		return $this->db->row();
	}

	public function get_single($id) {
		$this->db->query('SELECT 
			guru_nama, 
			guru_jenjang, 
			siswa_nama, 
			siswa_kelas, 
			siswa_jenjang,
			id, 
			username, 
			email, 
			role, 
			guru_jenjang, 
			siswa_kelas 
			FROM ' . $this->table . ' 
			LEFT JOIN tb_guru ON guru_uid = id 
			LEFT JOIN tb_siswa ON siswa_uid = id 
			WHERE id=:id 
			ORDER BY id DESC');
		$this->db->bind('id', $id);
		$query = $this->db->result();
		foreach ($query as $key => $value) {
			if ($query[$key]['role'] == 1) {
				$query[$key]['nama'] = $query[$key]['username'];
				$query[$key]['level'] = 'Admin';
				$query[$key]['kelas'] = 'Semua';
			} else if ($query[$key]['role'] == 2) {
				$query[$key]['nama'] = $query[$key]['guru_nama'];
				$query[$key]['level'] = 'Guru';
				$query[$key]['kelas'] = $this->get_jenjang($query[$key]['guru_jenjang'])->jenjang_nama;
			} else if ($query[$key]['role'] == 3) {
				$query[$key]['nama'] = $query[$key]['siswa_nama'];
				$query[$key]['level'] = 'Siswa';
				$query[$key]['kelas'] = $this->get_kelas($query[$key]['siswa_kelas'])->tingkat_nama . ' ' . $this->get_kelas($query[$key]['siswa_kelas'])->jenjang_nama;
			}

			unset($query[$key]['guru_nama']);
			unset($query[$key]['siswa_nama']);
		}
		return $query;
	}

	public function add($data) {
		$query = "INSERT INTO ".$this->table." (username, email, password, role) VALUES (:username, :email, :password, :role)";
		$this->db->query($query);
		$this->db->bind('username', $data['username']);
		$this->db->bind('email', $data['email']);
		$this->db->bind('role', (isset($data['role']) ? $data['role'] : 0));
		$this->db->bind('password', password_hash($data['password'], PASSWORD_DEFAULT));

		$this->db->execute();

		return $this->db->rowCount();
	}

	public function create($data) {
		$query = "INSERT INTO ".$this->table." (username, email, password, role) VALUES (:username, :email, :password, :role)";
		$this->db->query($query);
		$this->db->bind('username', $data['username']);
		$this->db->bind('email', $data['email']);
		$this->db->bind('role', (isset($data['role']) ? $data['role'] : 0));
		$this->db->bind('password', password_hash($data['password'], PASSWORD_DEFAULT));

		$this->db->execute();

		return $this->db->insert_id();
	}

	public function update($data) {
		$query = "UPDATE ".$this->table." SET username=:username, email=:email WHERE id=:id";
		$this->db->query($query);
		$this->db->bind('username', $data['username']);
		$this->db->bind('email', $data['email']);
		$this->db->bind('id', $data['id']);
		$this->db->execute();

		return $this->db->rowCount();
	}

	public function check_login($data) {
		$query = $this->get_by(['username', $data['username']]);
		if ($this->db->rowCount() > 0) {
			if (password_verify($data['password'], $query->password)) {
				$result['message'] = 'Login berhasil';
				$result['status'] = 1;
				$result['data'] = array(
					'id' => $query->id,
					'username' => $query->username,
					'email' => $query->email,
					'role' => $query->role,
					'password' => $query->password,
					'login' => true
				);
			} else {
				$result['status'] = 'Password tidak cocok';
				$result['status'] = 0;
			}
		} else {
			$result['message'] = 'User tidak ditemukan';
			$result['status'] = 0;
		}

		return $result;
	}

	public function change_password($id, $password) {
		$query = "UPDATE ".$this->table." SET password=:password WHERE id=:id";
		$this->db->query($query);
		$this->db->bind('password', password_hash($password, PASSWORD_DEFAULT));
		$this->db->bind('id', $id);
		$this->db->execute();

		return $this->db->rowCount();
	}

	public function delete($id) {
		$query = "DELETE FROM " . $this->table . " WHERE id=:id";
		$this->db->query($query);
		$this->db->bind('id', $id);
		$this->db->execute();

		return $this->db->rowCount();
	}

	private function get_jenjang($jenjang_id) {
		$this->db->query("SELECT jenjang_nama FROM tb_jenjang WHERE jenjang_id=:jenjang_id");
		$this->db->bind('jenjang_id', $jenjang_id);
		return $this->db->row();
	}

	private function get_kelas($kelas_id) {
		$this->db->query("SELECT jenjang_nama, tingkat_nama, kelas_nama FROM tb_kelas LEFT JOIN tb_jenjang ON kelas_jenjang = jenjang_id LEFT JOIN tb_tingkat ON tingkat_id = kelas_tingkat WHERE kelas_id=:kelas_id");
		$this->db->bind('kelas_id', $kelas_id);
		return $this->db->row();
	}
}
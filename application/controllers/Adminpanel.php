<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Adminpanel extends CI_Controller {

	public function index(){
		$this->load->view('admin/login');
	}

	public function login(){
		$this->load->model('Madmin');
		$u= $this->input->post('username');
		$p= $this->input->post('password');
		
		$cek = $this->Madmin->cek_login($u, $p)->row_array();
		if($cek){
			if ($cek['password'] == $p) {
				$data_session = array(
					'userName' => $u,
					'status' => 'login'
				);
				$this->session->set_userdata($data_session);
				redirect('cottage');
			} else 
				echo "<script>alert('Password yang Anda Inputkan Salah. Silahkan Coba Lagi!');</script>";
		} else
			echo "<script>alert('Username yang Anda Inputkan Salah. Silahkan Coba Lagi!');</script>";
			$this->load->view('adminpanel');
	}  

	public function logout(){
		$this->session->sess_destroy();
		redirect('adminpanel');
	}
}
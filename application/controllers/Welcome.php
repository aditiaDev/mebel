<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('pagination');
		$this->load->database();
	 }
	
	public function index()
	{
		$this->load->view('home');
	}

	public function loadRecord($rowno=0){
 
        $rowperpage = 5;
 
        if($rowno != 0){
          $rowno = ($rowno-1) * $rowperpage;
        }
  
        $allcount = $this->db->count_all('tb_lowongan_kerja');
 
        $this->db->limit($rowperpage, $rowno);
        $users_record = $this->db->get('tb_lowongan_kerja')->result_array();
  
        $config['base_url'] = base_url().'welcome/loadRecord';
        $config['use_page_numbers'] = TRUE;
        $config['total_rows'] = $allcount;
        $config['per_page'] = $rowperpage;
 
        $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination">';
        $config['full_tag_close']   = '</ul></nav></div>';
        $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
        $config['num_tag_close']    = '</span></li>';
        $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link">';
        $config['cur_tag_close']    = '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['next_tag_close']  = '<span aria-hidden="true"></span></span></li>';
        $config['prev_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['prev_tag_close']  = '</span></li>';
        $config['first_tag_open']   = '<li class="page-item"><span class="page-link">';
        $config['first_tag_close'] = '</span></li>';
        $config['last_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['last_tag_close']  = '</span></li>';
 
        $this->pagination->initialize($config);
 
        $data['pagination'] = $this->pagination->create_links();
        $data['result'] = $users_record;
        $data['row'] = $rowno;
 
        echo json_encode($data);
  	}

    public function getById(){
        $this->db->from('tb_lowongan_kerja');
        $this->db->where('id_lowongan_kerja', $this->input->post('id_lowongan_kerja'));
        $data = $this->db->get()->row();

        echo json_encode($data);
    }
}

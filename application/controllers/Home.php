<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

  public function __construct(){
    parent::__construct();
    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');

      $this->load->helper('url');
      $this->load->library('pagination');
  }

  public function index(){
    if($this->session->userdata('level') == "pelanggan"){
      $this->load->view('template_pelanggan/header');
      $this->load->view('pages/pelanggan/home');
      $this->load->view('template_pelanggan/footer');
    }else{
      $this->load->view('template/header');
      $this->load->view('template/sidebar');
      $this->load->view('template/home');
      $this->load->view('template/footer');
    }
  }

  public function loadRecord($rowno=0){
 
    $rowperpage = 16;

    if($rowno != 0){
      $rowno = ($rowno-1) * $rowperpage;
    }

    $allcount = $this->db->count_all('tb_barang');

    $this->db->limit($rowperpage, $rowno);
    // $users_record = $this->db->get('tb_barang')->result_array();

    $dataList = $this->db->get('tb_barang')->result();
    $no = 0;
    $users_record['data'] = [];
    foreach ($dataList as $list) {
      $row = array();
      $users_record['data'][$no]['id_barang'] = $list->id_barang;
      $users_record['data'][$no]['kategori_barang'] = $list->kategori_barang;
      $users_record['data'][$no]['nm_barang'] = $list->nm_barang;
      $users_record['data'][$no]['ket_barang'] = $list->ket_barang;
      $users_record['data'][$no]['harga_beli'] = number_format($list->harga_beli,0,',','.');
      $users_record['data'][$no]['harga_jual'] = number_format($list->harga_jual,0,',','.');
      $users_record['data'][$no]['stok'] = number_format($list->stok,0,',','.');
      $users_record['data'][$no]['foto'] = $list->foto;
      $no++;
    }

    $config['base_url'] = base_url().'welcome/loadRecord';
    $config['use_page_numbers'] = TRUE;
    $config['total_rows'] = $allcount;
    $config['per_page'] = $rowperpage;

    $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination">';
    $config['full_tag_close']   = '</ul></nav></div>';
    $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
    $config['num_tag_close']    = '</span></li>';
    $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link"  style="z-index:0">';
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
    $data['result'] = $users_record['data'];
    $data['row'] = $rowno;

    echo json_encode($data);
  }

  public function addCart(){
  
    $id_user = $this->session->userdata('id_user');

    $this->load->library('form_validation');
    $this->form_validation->set_rules('id_barang', 'Item', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }
    

    $CEK_KERANJANG = $this->db->query("SELECT COUNT(id_barang) CEK_KERANJANG FROM tb_tmp_penjualan 
            WHERE id='".$id_user."' 
            AND id_barang='".$this->input->post('id_barang')."'")->row()->CEK_KERANJANG;

    if($CEK_KERANJANG > 0){

      $this->db->query("update tb_tmp_penjualan SET jumlah=jumlah+1, 
                      tanggal='".date('Y-m-d H:i:s')."'
                      WHERE id='".$id_user."' AND id_barang='".$this->input->post('id_barang')."'");
    }else{
      $data = array(
        "id" => $id_user,
        "id_barang" => $this->input->post('id_barang'),
        "tanggal" => date("Y-m-d H:i:s"),
        "jumlah" => 1,
      );

      $this->db->insert('tb_tmp_penjualan', $data);
    }

    $output = array("status" => "success", "message" => "Pesanan dimasukkan keranjang");
    echo json_encode($output);
  
    
  }

  function listKeranjang(){

      $id_user = $this->session->userdata('id_user');

      $this->db->select('*');
      $this->db->from('tb_tmp_penjualan a'); 
      $this->db->join('tb_barang b', 'a.id_barang=b.id_barang');
      $this->db->where('a.id', $id_user);
      $this->db->order_by('a.tanggal','desc');         
      $data = $this->db->get()->result(); 
  
      echo json_encode($data);
    
  }

}
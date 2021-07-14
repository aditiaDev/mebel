<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penjualan extends CI_Controller {

  public function __construct(){
    parent::__construct();

    // if(!$this->session->userdata('id_user'))
    //   redirect('login', 'refresh');
  }

  public function index(){
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
    $this->load->view('pages/penjualan');
    $this->load->view('template/footer');
  }

  public function getAllData(){
    $this->db->select('a.*, b.nm_supplier');
    $this->db->from('tb_pembelian a'); 
    $this->db->join('tb_supplier b', 'a.id_supplier=b.id_supplier');
    $this->db->order_by('a.tgl_pembelian','desc');         
    $dataList = $this->db->get()->result(); 

    $no = 0;
    $data['data'] = [];
    foreach ($dataList as $list) {
      $row = array();
      $data['data'][$no]['id_pembelian'] = $list->id_pembelian;
      $data['data'][$no]['id_supplier'] = $list->id_supplier;
      $data['data'][$no]['nm_supplier'] = $list->nm_supplier;
      $data['data'][$no]['status_pembelian'] = $list->status_pembelian;
      $data['data'][$no]['tot_pembelian'] = number_format($list->tot_pembelian,0,',','.');
      $data['data'][$no]['tgl_pembelian'] = date('d-M-Y', strtotime($list->tgl_pembelian));
      $no++;
    }

  	echo json_encode($data);
  }

  public function addData(){
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
    $this->load->view('pages/tambah_pembelian');
    $this->load->view('template/footer'); 
  }

}
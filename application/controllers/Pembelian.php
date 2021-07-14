<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pembelian extends CI_Controller {

  public function __construct(){
    parent::__construct();

    // if(!$this->session->userdata('id_user'))
    //   redirect('login', 'refresh');
  }

  public function index(){
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
    $this->load->view('pages/pembelian');
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
  
  public function saveData(){
    
    
    $this->load->library('form_validation');
    $this->form_validation->set_rules('tgl_pembelian', 'Tgl Pembelian', 'required');
    $this->form_validation->set_rules('id_supplier', 'Supplier', 'required');
    $this->form_validation->set_rules('tot_pembelian', 'Total Pembelian', 'required|numeric');
    $this->form_validation->set_rules('id_barang[]', 'Barang', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }

    $unik = date('dmY', strtotime($this->input->post('tgl_pembelian')));
    $kode = $this->db->query("select MAX(id_pembelian) LAST_NO from tb_pembelian WHERE id_pembelian LIKE '".$unik."%'")->row()->LAST_NO;
    
    $urutan = (int) substr($kode, 8, 4);
    $urutan++;
    $huruf = $unik;
    $kode = $huruf . sprintf("%04s", $urutan);
    // echo $kode;
    
    $dataHeader = array(
              "id_pembelian" => $kode,
              "tgl_pembelian" => date("Y-m-d", strtotime($this->input->post('tgl_pembelian'))),
              "id_supplier" => $this->input->post('id_supplier'),
              "status_pembelian" => "pengajuan",
              "tot_pembelian" => $this->input->post('tot_pembelian'),
            );
    $this->db->insert('tb_pembelian', $dataHeader);


    foreach($this->input->post('id_barang') as $key => $each){
      $dataDtl[] = array(
        "id_pembelian" => $kode,
        "id_barang" => $this->input->post('id_barang')[$key],
        "qty_beli" => $this->input->post('qty_beli')[$key],
      );
    }

    $this->db->insert_batch('tb_det_pembelian', $dataDtl);

    if(!empty($this->input->post('penjelasan'))){
      foreach($this->input->post('penjelasan') as $key => $each){
        $dataKet[] = array(
          "id_pembelian" => $kode,
          "tgl_input" => date("Y-m-d"),
          "penjelasan" => $this->input->post('penjelasan')[$key],
        );
      }

      $this->db->insert_batch('tb_keterangan_pembelian', $dataKet);
    }

    $output = array("status" => "success", "message" => "Data Berhasil Disimpan", "DOC_NO" => $kode);
    echo json_encode($output);

  }

}
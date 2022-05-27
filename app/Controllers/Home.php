<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use TCPDF;

class Home extends BaseController{
    public function index(){
        // helper(['form']);
        // $validasi=['keyword'=>'requred'];
        // if($this->validate($validasi)){
        //     $data['hasil_cari']=$this->cari();
        // }

        return view ('hotel');
    }

    public function cari(){
        $keyword = $this->request->getVar('keyword');
        $datatamu = $this->reservasi->cari($keyword);
        $data = [
            'title'=> 'Berikut ini daftar Tamu yang sudah terdaftar dalam database.',
            'tamu' => $datatamu
            ] ;
        return view ('cari', $data);
    }

    public function kamar(){
        $this->kamar->join('tbl_fasilitas_kamar', 'tbl_fasilitas_kamar.id_fasilitas=tbl_kamar.id_fasilitas' );
        $data['ListKamar'] = $this->kamar->findAll();
        // var_dump($data);
        // die;
        return view ('kamar', $data);
    }

    public function fasilitas(){
        $data['ListFasilitas'] = $this->fasilitas->findAll();
        return view ('fasilitas', $data);
    }

    public function reservasi($id_kamar = null){
        helper(['form']);
        $aturanForm=[
            'txtInputTipeKamar'=>'required',
            'nama'=>'required',
            'nohp'=>'required',
            'email'=>'required',
            'tamu'=>'required',
            'checkin'=>'required',
            'checkout'=>'required',
            'jml_kmr'=>'required'
        ];
        
        $syarat=[
            'id_kamar'=>$id_kamar
        ];

        if($this->validate($aturanForm)){
            $id_kamar_pesan=[
                'id_kamar'=>$_POST['txtInputTipeKamar']
            ];
            $kamar_pesan = $this->kamar->where($id_kamar_pesan)->find()[0];
           
            if ($kamar_pesan['jumlah_kamar'] > $_POST['jml_kmr']) {
                $data=[
                    'id_kamar'=>$this->request->getPost('txtInputTipeKamar'),
                    'nama_pemesan'=>$this->request->getPost('nama'),
                    'email_pemesan'=>$this->request->getPost('email'),
                    'nama_tamu'=>$this->request->getPost('tamu'),
                    'no_telp'=>$this->request->getPost('nohp'),
                    'tgl_cek_in'=>$this->request->getPost('checkin'),
                    'tgl_cek_out'=>$this->request->getPost('checkout'),
                    'jumlah_kamar_dipensan'=>$this->request->getPost('jml_kmr'),
                    'status' => 'pesan',
                ];
                $this->reservasi->save($data);
                return redirect()->to(site_url('/inv/'.$this->reservasi->getInsertID()))->with('berhasil', 'Berasil pesan Kamar');
            }else{
                return redirect()->to(site_url('/reservasi'));
            }
        }
        // $this->kamar->join('tbl_fasilitas_kamar', 'tbl_fasilitas_kamar.id_fasilitas=tbl_kamar.id_fasilitas' );
        // $data['ListKamar'] = $this->kamar->findAll();

        if($id_kamar != null){
            $this->kamar->join('tbl_fasilitas_kamar', 'tbl_fasilitas_kamar.id_fasilitas=tbl_kamar.id_fasilitas' );
            $data['kamar']= $this->kamar->where($syarat)->find()[0];
        }else{
           $this->kamar->join('tbl_fasilitas_kamar', 'tbl_fasilitas_kamar.id_fasilitas=tbl_kamar.id_fasilitas' );
            $data['ListKamar'] = $this->kamar->findAll();
        }
    //  var_dump($data);
    //  die;
        return view ('reservasi', $data);
    }

    public function invoice($idreservasi){
        $this->reservasi->select('tbl_reservasi.id_reservasi, tbl_reservasi.nama_pemesan, tbl_reservasi.email_pemesan, 
                                tbl_reservasi.tgl_cek_in, tbl_reservasi.tgl_cek_out, tbl_fasilitas_kamar.tipe_kamar, 
                                tbl_kamar.tarif, tbl_reservasi.jumlah_kamar_dipensan,
                                (datediff(tbl_reservasi.tgl_cek_out, tbl_reservasi.tgl_cek_in))as jml_hari, 
                                (datediff(tbl_reservasi.tgl_cek_out, tbl_reservasi.tgl_cek_in)*tbl_reservasi.jumlah_kamar_dipensan* tbl_kamar.tarif)as total_bayar');
        $this->reservasi->join('tbl_kamar', 'tbl_kamar.id_kamar=tbl_reservasi.id_kamar');
        $this->reservasi->join('tbl_fasilitas_kamar','tbl_fasilitas_kamar.id_fasilitas=tbl_kamar.id_fasilitas');
		$data['transaksi'] = $this->reservasi->find($idreservasi);
		$html = view('invoice',$data);
		$pdf = new TCPDF('L', PDF_UNIT, 'A5', true, 'UTF-8', false);

		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('Hotel SCADA');
		$pdf->SetTitle('Invoice');
		$pdf->SetSubject('Invoice');

		$pdf->setPrintHeader(false);
		$pdf->setPrintFooter(false);

		$pdf->addPage();

		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');
		//line ini penting
		$this->response->setContentType('application/pdf');
		//Close and output PDF document
		$pdf->Output('invoice.pdf', 'I');
		
	}    
}

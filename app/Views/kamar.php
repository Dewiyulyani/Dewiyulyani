<?= $this->extend('layouts/index') ?>
<?= $this->section('content') ?>
<section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Kamar Dewi Hotel</h2>
          </div>
        <div class="row">
        <?php
        foreach($ListKamar as $row){
        ?>
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-blue">
              <div class="icon">
              <img class="img-top" src="<?=base_url("/gambar/".$row['foto']);?>" width="200" height="150" alt="No image"> 
              </div>
        </br>
              <h4><a href="">Tipe Kamar : <?=$row['tipe_kamar'];?></a></h4>
              <h4><a href="">RP.<?=$row['tarif'];?> / per malam</a></h4>
              <p>Fasilitas Kamar : <?=$row['fasilitas'];?></p>
              <a href="<?=site_url('/reservasi/'.$row['id_kamar']);?>" class="btn btn-sm btn-block btn-outline-danger <?=$row['jumlah_kamar'] == 0 ? 'disabled' : null;?>">Pesan Sekarang</a>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
    </section><!-- End Services Section -->
<?= $this->endSection() ?>
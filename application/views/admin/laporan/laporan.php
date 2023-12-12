<!-- page content -->
 <div class="right_col" role="main">

<div class="">
    <div class="title_right">
      <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
      </div>
    </div>
  </div>

  <div class="clearfix"></div>

    <div class="col-md-12 col-sm-12 ">
      <div class="x_panel">
        <div class="x_title">
          <h2>Laporan Detail Transaksi</h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
          </ul>
          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
            <thead>
              <tr>
                <th>No Reservasi</th>
                <th>Nama Penyewa</th>
                <th>Metode Pembayaran</th>
                <th>bukti Pembayaran</th>
                <th>Tanggal Checkin</th>
                <th>Tanggal Checkin</th>
                <th>ID Cottage</th>
                <th>Nama Cottage</th>
              </tr>
            </thead>
            <tbody>
            <?php
             foreach ($lap as $val){ ?>
             <?php if($val->status == 2) { ?>

          <tr>
            <td><?php echo $val->id_penyewa;?></td>
            <td><?php echo $val->namaPenyewa; ?></td>
            <td><?php echo $val->metode; ?></td>
            <td>
              <div style="width:9rem">
                <img src="<?= base_url('assets/bukti_pembayaran/'.$val->bukti_pembayaran) ?>" class="w-100"  alt="">
              </div>
            </td>
            <td><?php echo $val->tglCheckin; ?></td>
            <td><?php echo $val->tglCheckout; ?></td>
            <td><?php echo $val->idCottage; ?></td>
            <td><?php echo $val->namaCottage; ?></td>
      </tr>
             <?php } ?>

<?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
      </div>
    </div>
        </div>
      </div>
    </div>
  </div>
      </div>
    </div>
  </div>
</div>
</div>
<!-- /page content -->

<?php
// This is just for very basic implementation reference, in production, you should validate the incoming requests and implement your backend more securely.
// Please refer to this docs for snap popup:
// https://docs.midtrans.com/en/snap/integration-guide?id=integration-steps-overview

namespace Midtrans;

require_once dirname(__FILE__) . '/midtrans-php-master/Midtrans.php';
// Set Your server key
// can find in Merchant Portal -> Settings -> Access keys
Config::$serverKey = 'SB-Mid-server-KwwcxJYuuNcoSM4saA5Wg2O7';
Config::$clientKey = 'SB-Mid-client-kLZPnUkO-QcmkA2r';


// Uncomment for production environment
// Config::$isProduction = true;
Config::$isSanitized = Config::$is3ds = true;

// ambil data penyewa
$model =& get_instance();
$model = $this->load->model('Madmin');
$customer = $model->Madmin->get_last_penyewa();

// penjumlahan 


// Required
				use DateTime;

// ...

$checkin_date = new DateTime($customer->tglCheckin);
$checkout_date = new DateTime($customer->tglCheckout);

$interval = $checkin_date->diff($checkout_date);
$total_days = $interval->days;

$harga_per_hari = $customer->harga;
$total_biaya = $total_days * $harga_per_hari;


$transaction_details = array(
    'order_id' => rand(),
    'gross_amount' => $total_biaya, // no decimal allowed for creditcard
);


// ambil data barang 

// Optional
$item_details = array (
    array(
        'id' => $customer->id_penyewa,
        'price' => $total_biaya,
        'quantity' => 1,
        'name' => $customer->namaCottage
    ),
  );
// Optional
$customer_details = array(
    'first_name'    => $customer->namaPenyewa,
    'email'         => $customer->email,
    'phone'         => $customer->no_telp,
);
// Fill transaction details
$transaction = array(
    'transaction_details' => $transaction_details,
    'customer_details' => $customer_details,
    'item_details' => $item_details,
);

$snap_token = '';
try {
	
    $snap_token = Snap::getSnapToken($transaction);
}
catch (\Exception $e) {
    echo $e->getMessage();
}

//  configurasi email
			$config = array(
				'protocol' => 'smtp',
				'smtp_host' => 'smtp.googlemail.com',
				'smtp_user' => 'vantagevilla0@gmail.com',
				'smtp_port' => 465,
				'smtp_pass' => 'myeajlcnjqggvjho',
				'mailtype'  => 'text',
				'charset'   => 'utf-8',
				'smtp_crypto' => 'ssl', // Add this line
    			'newline' => "\r\n" // Add this line
			);

			// email
			// Create the email message content with the form data
			// email
$message = "Nama: Vantage Village\n";
$message .= "ID Penyewa: $customer->id_penyewa\n";
$message .= "Tanggal CheckIn: $customer->tglCheckin\n";
$message .= "Tanggal CheckOut: $customer->tglCheckout\n";
$message .= "Jumlah Pembayaran: Rp $total_biaya\n";
$message .= "Harap tunjukkan data ini sebagai bukti pembayaran dan akan di validasi oleh tim kami nantinya.";

$subject = "Konfirmasi Pembayaran - Nama: Vantage Village\n\n"
    . "ID Penyewa: $customer->id_penyewa\n"
    . "Tanggal Check-in: $customer->tglCheckin\n"
    . "Tanggal Check-out: $customer->tglCheckout\n\n"
    . "Harap tunjukkan data ini sebagai bukti pembayaran untuk validasi oleh tim kami nantinya.";

			// $this->load->library('email');
			
			$this->email->initialize($config);
			$this->email->from($customer->email, $customer->namaPenyewa);
			$this->email->to($customer->email);
			$this->email->subject('Confirmation Payment');
			$this->email->message($message);

			 $this->email->send();

			 $model->Madmin->update_payment_status($customer->id_penyewa, 1);

echo "snapToken = ".$snap_token;


?>



<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Rincian Transaksi</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
	
    <link rel="stylesheet" href="<?php echo base_url('assets1/css/open-iconic-bootstrap.min.css');?>">
    <link rel="stylesheet" href="<?php echo base_url('assets1/css/style.css');?>">
</head>
<body>
	
		<div class="pt-5">
			<div class="card mx-auto" style="width: 30rem;">
				<div class="card-body">
					<h5 class="card-title text-center">Vantage Villa</h5>
				<hr>
				<?php foreach($get_penyewa as $value) { ?>
				<div class="row mb-2">
					<div class="col-6">Checkin Date</div>
					<div class="col-6 pe-5">
						<input type="text"   value="<?= $value->tglCheckin ?>" disabled>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">Checkout Date</div>
					<div class="col-6 pe-5">
						<input type="text"  value="<?= $value->tglCheckout ?>" disabled>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">Price </div>
					<div class="col-6 pe-5">
						<input type="text"  value="Rp <?= number_format($value->harga,2) ?>" disabled>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">Name </div>
					<div class="col-6 pe-5">
						<input type="text"  value="<?= $value->namaPenyewa ?>" disabled>
					</div>
				</div>
				
				<div class="row mb-2">
					<div class="col-6">Phone</div>
					<div class="col-6 pe-5">
						<input type="text"  value="<?= $value->no_telp ?>" disabled>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">Email</div>
					<div class="col-6 pe-5">
						<input type="text"  value="<?= $value->email ?>" disabled>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">Address</div>
					<div class="col-6 pe-5">
						<input type="text"  value="<?= $value->alamat ?>" disabled>
					</div>
				</div>

				<hr>

				<div class="row mb-2">
					<div class="col-6 fw-bolder text-dark">Cottage</div>
					<div class="col-6 pe-5 text-dark fw-bolder">Sub Total</div>
				</div>

				<?php
				$checkin_date = new DateTime($value->tglCheckin);
				$checkout_date = new DateTime($value->tglCheckout);

				$interval = $checkin_date->diff($checkout_date);
				$total_days = $interval->days;
				
				$harga_per_hari = $value->harga;
				$total_biaya = $total_days * $harga_per_hari;
				?>

				<div class="row">
					<div class="col-6 fw-bolder text-dark">
						<input type="text"  value="<?= $value->namaCottage ?>" disabled>
					</div>
					<div class="col-6 pe-5 text-dark fw-bolder">
						<input type="text"  value="Rp <?= number_format($total_biaya,2) ?>" disabled>
					</div>
				</div>

				<br>
				<button id="pay-button"class="btn btn-primary">Bayar</button>
        <!-- TODO: Remove ".sandbox" from script src URL for production environment. Also input your client key in "data-client-key" -->
        <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="<?php echo Config::$clientKey;?>"></script>
        <script type="text/javascript">
            document.getElementById('pay-button').onclick = function(){
                // SnapToken acquired from previous step
                snap.pay('<?php echo $snap_token?>');
            };
        </script>
				<?php } ?>

				
			</div>
		</div>
	</div>
		

</body>
</html>

<?php include 'includes/header.php'; ?>
<div class="container mb-sm-5">
	<h1 class="text-center mt-5">Contact US</h1>
	<hr>
	<div class="row">
		<div class="col-md-6">
			<form action="includes/actions.php" class="mb-4"  method="POST">
				<div class="form-group">
					<label for="">Full Name</label>
					<input type="text" name="fname" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="">E-mail Address</label>
					<input type="text" name="email" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="">Phone Number</label>
					<input type="text" name="phone" class="form-control">
				</div>
				<div class="form-group">
					<label for="">Message</label>
					<textarea name="msg" required class="form-control"></textarea>
				</div>
				<button class="btn btn-primary btn-block" name="send-msg">Send Message</button>
			</form>
		</div>
		<div class="col-md-6 pl-sm-5">
			<h2 class="mt-sm-4">Mpemba Book Shop</h2>
			<p>Head Office Chwaka Zanzibar</p>
			<hr>
			<h4>Other Contact Informations</h4>
			<p><i class="fa fa-phone"></i> Phone: +255 778 787 878</p>
			<p><i class="fa fa-fax"></i> Fax: +255 778 787 878</p>
			<p><i class="fa fa-envelope"></i> Email: mpembainc@gmail.com</p>
			<p><i class="fa fa-envelope"></i> Email: mpbooks@pemba.com</p>
		</div>
	</div>
</div>
<?php include 'includes/footer.php'; ?>
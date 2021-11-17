<?php include 'includes/header.php'; ?>
<div class="container mb-sm-5">
	<h1 class="text-center mt-5">My Orders</h1>
	<hr>
	<div class="row">
		<?php 
		$cust_id = $_SESSION['cust_id']; 

		$sql = mysqli_query($conn, "SELECT id, order_date, status FROM orders WHERE cust_id = '$cust_id'");
		$orders = mysqli_fetch_all($sql, MYSQLI_BOTH);
		?>
		<table class="table table-bordered table-sm">
			<thead>
				<tr>
					<th>Order Number</th>
					<th class="text-center">Order Date</th>
					<th class="text-center">Status</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<?php if ($orders): ?>
					<?php foreach ($orders as $row): ?>
						<?php $id = $row['id']; ?>
						<tr>
							<td><?= sprintf("%05d",$row['id']) ?></td>
							<td class="text-center"><?= split_time($row['order_date']); ?></td>
							<td class="text-center"><?= $row['status'] ?></td>
							<td class="text-center">
								<?php if ($row['status'] == 'Pending'): ?>
									<a href="includes/actions.php?act=ca&id=<?=$id?>" class="btn btn-primary btn-sm" onclick="return confirm('Are you sure you want to delete?')">cancel</a>
								<?php endif ?>
							</td>
						</tr>
					<?php endforeach ?>
				<?php endif ?>
			</tbody>
		</table>
	</div>
</div>
<?php include 'includes/footer.php'; ?>
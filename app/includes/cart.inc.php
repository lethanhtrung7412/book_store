<?php
include 'dbh.php';
$ids = array();

// Check if add to cart button has been clicked
if (isset($_POST['addtoCart'])) {
	
	$book_id = $_POST['id'];
	$price= $_POST['price'];
	$qty = $_POST['qty'];

	foreach (get_cart() as $row) {	
		$ids[] = $row['book_id'];
	}

	if (in_array($book_id, $ids)) {
		$book = get_cart(false, $book_id);

		$nqty = $book['qty'] + $qty;
		$nprc = $book['price'] + $price;

		$sql = mysqli_query($conn, "UPDATE cart SET qty = '$nqty', price = '$nprc' WHERE book_id = '$book_id'");

		if ($sql) {
			header("Location: ../index.php?r=added");
		}
	}else{

		$sql = mysqli_query($conn, "INSERT INTO cart VALUES ('', '$book_id', '$price','$qty')");

		if ($sql) {
			header("Location: ../index.php?r=added");
		}
	}
}

// Get cart items
function get_cart($nr = FALSE, $id = FALSE){
	global $conn;

	if ($id) {
		$sql = mysqli_query($conn, "SELECT * FROM cart WHERE book_id = '$id'");
		return mysqli_fetch_assoc($sql);
	}
	
	$sql = mysqli_query($conn, "SELECT * FROM cart");

	if ($nr) return mysqli_num_rows($sql);
	
	return mysqli_fetch_all($sql, MYSQLI_BOTH);
}

// Get Products related to cart ids
function cart_prod($id){
	global $conn;
	$sql = mysqli_query($conn, "SELECT * FROM products WHERE id = '$id'");
	return mysqli_fetch_assoc($sql);
}

// Add or remove items in cart
if (isset($_POST['change_cart_items'])) {
	// Select data
	$sql = mysqli_query($conn, "SELECT * FROM cart WHERE id = '".$_POST['id']."' LIMIT 1");
	$item = mysqli_fetch_assoc($sql);

	$qty = $item['qty'] + $_POST['qty'];

	// Update data
	$sql = mysqli_query($conn, "UPDATE cart SET qty = '$qty' WHERE id = '".$_POST['id']."'");

	if ($sql) {
		echo true;
	}
}

// Submit order
if (isset($_POST['submit_order'])) {
	$error = FALSE;
	$name = $_POST['cust_id'];
	$phone = $_POST['c-phone'];
	$address = $_POST['c-address'];

	$sql = mysqli_query($conn, "INSERT INTO orders (cust_id, phone_number, shipping_address) VALUES ('$name', '$phone', '$address')");
	$last_id = $conn->insert_id;

	foreach (get_cart() as $item) {

		$book_id = $item['book_id'];
		$qty = $item['qty'];
		$price = $item['price'];

		$order_details = mysqli_query($conn, "INSERT INTO order_details (order_id, book_id, qty, price) VALUES ('$last_id', '$book_id', '$qty', '$price')");

		if (! $order_details) {
			$error = true;
		}
	}

	if (! $error) {
		$delete = mysqli_query($conn, "DELETE FROM cart");
		header("Location: ../success.php");
	}
}
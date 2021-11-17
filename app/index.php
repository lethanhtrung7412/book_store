<!-- <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	
</body>
</html> -->
<?php include 'includes/header.php'; ?>
<div class="container">
	<!-- Page Banner -->
	<div class="jumbotron mt-4 mb-sm-4" style="margin-bottom: 0">
	  <h1 class="display-4">Cửa hàng sách VTP!</h1>
	  <p class="lead">Một cuốn sách thực sự hay nên đọc trong tuổi trẻ, rồi đọc lại khi đã trưởng thành, và một nửa lúc tuổi già, giống như một tòa nhà đẹp nên được chiêm ngưỡng trong ánh bình minh, nắng trưa và ánh trăng.</p>
	</div>

	<!-- Book Cards -->
	<?php  
		if (isset($_GET['item'])) {
			$sql = mysqli_query($conn, "SELECT * FROM products WHERE title LIKE '%".$_GET['item']."%'");
		}else{
			$sql = mysqli_query($conn, "SELECT * FROM products");
		}

		$books = mysqli_fetch_all($sql, MYSQLI_BOTH);
	?>
	
	<div class="book-card row">
		<?php if ($books): ?>
			<?php foreach ($books as $book): ?>
				<div class="col-md-4 mb-sm-4 mt-c-sm-3">
					<div class="card">
					  <img class="card-img-top" src="<?php echo $book['img'] ?>" alt="Card image cap">
					  <div class="card-body">
					    <h4 class="card-title"><?php echo $book['title'] ?></h4>
					    <p class="card-text"><?php echo $book['pdesc'] ?></p>
					    <form action="includes/cart.inc.php" method="POST">
					    	<input type="hidden" name="id" value="<?php echo $book['id'] ?>">
					    	<input type="hidden" name="name" value="<?php echo $book['title'] ?>">
					    	<input type="hidden" name="price" value="<?php echo $book['price'] ?>">
					    	<input type="hidden" name="qty" value="1">
					    	<button type="submit" name="addtoCart" class="btn btn-primary">
					    		<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
					    	</button>
					    </form>
					  </div>
					</div>
				</div>
			<?php endforeach ?>
			<?php else: ?>
				<div class="p-5">
					<p class="text-center">Không có sản phẩm nào!</p>
				</div>
		<?php endif ?>
	</div>
</div>

<?php include 'includes/footer.php'; ?>
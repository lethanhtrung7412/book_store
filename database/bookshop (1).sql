-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 11:13 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_users`
--

CREATE TABLE `auth_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_users`
--

INSERT INTO `auth_users` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `status`, `img`, `last_login`, `date_created`) VALUES
(1, 'tan', 'vy', 'tanvywa@gmail.com', 'tanvypro', '$2y$10$SLZ02Lq7fTEg1LXhvL44T.X12IJS1a81NGrU9xBTwfJnb4H62YTe.', 'admin', '', '2021-11-10 16:43:31', '2021-11-10 16:11:05'),
(15, 'Le', 'Trung', 'lethanhtrung7412@gmail.com', 'admin', '$2y$10$SLZ02Lq7fTEg1LXhvL44T.X12IJS1a81NGrU9xBTwfJnb4H62YTe.', 'admin', '../uploads/logo1.jpg', '2021-11-17 17:04:45', '2021-11-09 17:42:40'),
(16, 'Le', 'Trung', '1951120157@sv.ut.edu.vn', 'lethanhtrung7412', '$2y$10$8c7WoVPPSry2mVk2oFsxguq/sFQMsYntW2JOVf6rFT7cr2BAgs17C', 'staff', '', '2021-11-17 13:27:45', '2021-11-11 09:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fname`, `lname`, `email`, `phone`, `address`, `password`, `reg_date`) VALUES
(1, 'L??', 'Trung', 'lethanhtrung7412@gmail.com', '+10945968870', 'LMAO', '12345', '2021-11-10 17:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `fname`, `email`, `phone`, `message`) VALUES
(1, 'L?? Th??nh Trung', 'lethanhtrung7412@gmail.com', '+10945968870', 'Xin ch??o b?? con');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `phone_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cust_id`, `phone_number`, `shipping_address`, `order_date`, `status`) VALUES
(1, 1, '', '', '2021-11-12 14:26:55', 'accepted'),
(2, 1, '+84945968870', '47/T??? 1/Th??n L???c L??m L??ng', '2021-11-17 16:55:59', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(1, 1, 2, 1, 300000),
(2, 2, 5, 1, 200000),
(3, 2, 6, 1, 250000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `pdesc` text COLLATE utf8_unicode_ci NOT NULL,
  `img` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `pdesc`, `img`, `created_at`, `created_by`) VALUES
(1, 'Python Data Analytics', 200000, 'Hello', 'uploads/618c8009d5c58.jpg', '2021-11-11 09:29:29', 'Mpemba'),
(2, 'JavaScript&Jquery', 300000, 'M???t cu???n s??ch b???n n??n ?????c khi b???t ?????u v???i Javascript', 'uploads/618dfdfa105e2.jpg', '2021-11-12 12:39:06', 'Mpemba'),
(3, '?????ng L??m Vi???c Ch??m Ch??? H??y L??m Vi???c Th??ng Minh', 200000, 'Th??nh c??ng l?? h???c c??ch l??m vi???c TH??NG MINH h??n ch??? kh??ng ph???i CH??M CH??? h??n! Nh???ng ng?????i th??nh c??ng th?????ng ch??? t???p trung th???i gian c???a h??? v??o m???t v??i ??u ti??n v?? lu??n ngh?? l??m th??? n??o ????? m???i vi???c di???n ra su??n s???.', 'uploads/6194cace84f90.jpg', '2021-11-17 16:26:38', 'Mpemba'),
(4, 'How Psychology Works - Hi???u H???t V??? T??m L?? H???c', 200000, 'M???T TRONG NH???NG CU???N S??CH M??? KH??A H???U ??CH NH???T V??? T?? DUY, K?? ???C V?? C???M X??C C???A CON NG?????I!', 'uploads/6194cb16867c9.jpg', '2021-11-17 16:27:50', 'Mpemba'),
(5, 'Nh???ng Ng?????i Kh???n Kh??? (Boxet 2 T???p)', 200000, 'Nh???ng ng?????i kh???n kh??? l?? m???t t??c ph???m ch???a chan tinh th???n l??ng m???n c??ch m???ng.', 'uploads/6194cb6be52a3.jpg', '2021-11-17 16:29:16', 'Mpemba'),
(6, 'Hai S??? Ph???n', 250000, 'Hai ?????a Kane v?? Abel sinh ra c??ng m???t ng??y, m???t gi???, ??? hai x??? s??? ho??n to??n xa l???. Ng?????i gi??u sang, k??? kh???n kh?? nh??ng h??? gi???ng nhau ?????n k??? l???, ?????u c?? tham v???ng v?? ngh??? l???c phi th?????ng. D?? ??? khu ??? chu???t hay c??n ph??ng hoa l???, d?? h???c nh??? hay c?? gia s?? ri??ng, h??? lu??n ch???ng t??? ???????c s??? th??ng minh v?? ??c quan s??t nh???y b??n c???a m??nh.', 'uploads/6194cbc3d7921.jpg', '2021-11-17 16:30:43', 'Mpemba'),
(7, 'Spy X Family T???p 6', 400000, 'Nh???n nhi???m v??? l???y tr???m v??n ki???n m???t v??? cu???c chi???n, Twilight v?? Nightfall ph???i tham chi???n trong ?????i h???i ng???m d?????i l??ng ?????t!! Nh??ng Nightfall, m???t ng?????i ??m th???m ng?????ng m??? Loid v?? lu??n cho r???ng m??nh ph?? h???p v???i vai tr?? ng?????i v??? h??n ai h???t, ???? khi???n v??? ch???ng nh?? Forger r??i v??o t??nh c???nh nguy hi???m???!?', 'uploads/6194cd55aeea9.jpg', '2021-11-17 16:37:25', 'Mpemba'),
(8, 'Digital Marketing - T??? Chi???n L?????c ?????n Th???c Thi ', 150000, 'Cu???n s??ch ?????u ti??n t???i Vi???t Nam cung c???p h??? th???ng ki???n th???c b??i b???n nh???t, c???t l??i nh???t v??? Digital Marketing, b???ng vi???c ??i t??? chi???n l?????c t???i tri???n khai, t??? bao qu??t ?????n chi ti???t, gi??p qu?? tr??nh l???p v?? th???c thi c??c chi???n d???ch Marketing c???a b???n hi???u qu??? h??n.\r\n', 'uploads/6194ce4e14e56.jpg', '2021-11-17 16:41:34', 'Mpemba'),
(9, 'The Basic of User Experience Design', 300000, 'M???t cu???n s??ch hay cho nh???ng ng?????i m???i b???t ?????u v???i con ???????ng UX', 'uploads/6194cf08b861c.jpg', '2021-11-17 16:44:40', 'Mpemba'),
(10, '???a? Genz???', 200000, 'Cu???n s??ch n??y d??nh cho th??? h??? GenZ\r\n- V??? ra ch??n dung ch??n th???c nh???t v??? c?? t??nh GenZ trong th???i ?????i c??ng ngh??? s???\r\n- Gi???i m?? ng??n ng??? GenZ, kh??m ph?? nh???ng hot trend h??ng ?????u v?? k???t n???i nh???ng con ng?????i ti??n phong t???o n??n xu h?????ng', 'uploads/6194d090e9ac0.jpg', '2021-11-17 16:51:13', 'Mpemba'),
(11, 'S??ch Truy???n Ki???u (T??i b???n 2021)', 200000, 'TRUY???N KI???U\r\n-\r\nKIM V??N KI???U T??N TRUY???N\r\n-\r\n(T??i b???n 2021)', 'uploads/6194d12bb31ee.jpg', '2021-11-17 16:53:47', 'Mpemba'),
(12, 'B??i H???c Cu???c S???ng', 150000, '??? Cu???n s??ch ???? b??n ???????c h??ng tri???u b???n tr??n th??? gi???i\r\n??? Cu???n s??ch ???? ???????c d???ch v?? b??n b???n quy???n cho h??n 40 qu???c gia', 'uploads/6194d435bad8d.jpg', '2021-11-17 17:06:45', 'Mpemba');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `s_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `book_id`, `qty`, `price`, `s_date`) VALUES
(1, 1, 2, 1, 300000, '2021-11-17 13:09:39'),
(2, 2, 5, 1, 200000, '2021-11-17 16:56:41'),
(3, 2, 6, 1, 250000, '2021-11-17 16:56:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

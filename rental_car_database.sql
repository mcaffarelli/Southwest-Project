

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `billing` (
  `Order_ID` varchar(25) NOT NULL,
  `Reservation_Number` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `cart` (
  `Vehicle_ID` varchar(25) NOT NULL,
  `Total_Cost` varchar(25) NOT NULL,
  `Order_ID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `cart` (`Vehicle_ID`, `Total_Cost`, `Order_ID`) VALUES
('6', '$13.00', '118');



CREATE TABLE `customer` (
  `DL_Number` varchar(25) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `DOB` varchar(25) NOT NULL,
  `Cust_ID_Num` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `customer` (`DL_Number`, `FName`, `LName`, `DOB`, `Cust_ID_Num`) VALUES
('DL888855516', 'Michael', 'Caffarelli', '7/29/1996', 49),
('DL1234567', 'Allison', 'LiFoy', '12/18/2021', 50),
('DL12345688', 'Mark', 'Jones', '1/1/1994', 51),
('DL345345', 'Allen', 'Johns', '3/15/2022', 52);


CREATE TABLE `product` (
  `Car_Class` varchar(25) NOT NULL,
  `Daily_Rate` varchar(25) NOT NULL,
  `Vehicle_ID` int(25) NOT NULL,
  `Num_Available` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `product` (`Car_Class`, `Daily_Rate`, `Vehicle_ID`, `Num_Available`) VALUES
('Compact', '$13.00', 5, 1),
('Economy', '$13.00', 6, 1),
('Mid-Size', '$13.00', 7, 1);


CREATE TABLE `reservation` (
  `Reservation_Number` int(25) NOT NULL,
  `Pickup_Location` varchar(25) NOT NULL,
  `Return_Location` varchar(25) NOT NULL,
  `Pickup_Time` varchar(25) NOT NULL,
  `Return_Time` varchar(25) NOT NULL,
  `Pickup_Date` varchar(25) NOT NULL,
  `Return_Date` varchar(25) NOT NULL,
  `Cust_ID_Num` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `reservation` (`Reservation_Number`, `Pickup_Location`, `Return_Location`, `Pickup_Time`, `Return_Time`, `Pickup_Date`, `Return_Date`, `Cust_ID_Num`) VALUES
(22, 'San Diego', 'San Diego', '12:00PM', '12:00PM', '1/1/2021', '1/4/2021', 49),
(23, 'Chicago', 'Chicago', '1:00PM', '1:00PM', '1/1/2022', '1/4/2022', 49),
(24, 'Hawaii', 'Hawaii', '12:00pm', '12:00pm', '1/1/2021', '1/4/2021', 49),
(25, 'Texas', 'Texas', '11:00AM', '11:00AM', '12/13', '12/16', 49);


CREATE TABLE `vehicle` (
  `Vehicle_ID` int(25) NOT NULL,
  `Car_Company` varchar(25) NOT NULL,
  `Vehicle_Year` varchar(25) NOT NULL,
  `Car_Class` varchar(25) NOT NULL,
  `Reservation_Number` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `vehicle` (`Vehicle_ID`, `Car_Company`, `Vehicle_Year`, `Car_Class`, `Reservation_Number`) VALUES
(5, 'Payless', '2022', 'Compact', 22),
(6, 'Payless', '2022', 'Economy', 23),
(7, 'Payless', '2020', 'Mid-Size', 24);


ALTER TABLE `billing`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Reservation_Number` (`Reservation_Number`);

ALTER TABLE `cart`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD KEY `Order_ID` (`Order_ID`);


ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust_ID_Num`);


ALTER TABLE `product`
  ADD PRIMARY KEY (`Car_Class`),
  ADD KEY `Vehicle_ID` (`Vehicle_ID`);

ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_Number`),
  ADD KEY `reservation_ibfk_1` (`Cust_ID_Num`);


ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD KEY `Car_Class` (`Car_Class`),
  ADD KEY `Reservation_Number` (`Reservation_Number`);


ALTER TABLE `customer`
  MODIFY `Cust_ID_Num` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

ALTER TABLE `reservation`
  MODIFY `Reservation_Number` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

 AUTO_INCREMENT for table `vehicle`

ALTER TABLE `vehicle`
  MODIFY `Vehicle_ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`Reservation_Number`) REFERENCES `reservation` (`Reservation_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `billing` (`Order_ID`);

ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Cust_ID_Num`) REFERENCES `customer` (`Cust_ID_Num`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`Car_Class`) REFERENCES `product` (`Car_Class`),
  ADD CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`Reservation_Number`) REFERENCES `reservation` (`Reservation_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

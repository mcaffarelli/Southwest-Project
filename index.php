<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fourth Art Board – 1</title>
<link rel="stylesheet" type="text/css" id="applicationStylesheet" href="Fourth_Art_Board___1.css"/>
</head>
<body>
     
         
            
            
    
    
<div id="Fourth_Art_Board__1">
	<svg class="HEADER_RECTANGLE_2">
		<rect id="HEADER_RECTANGLE_2" rx="0" ry="0" x="0" y="0" width="1903" height="71">
		</rect>
	</svg>
	<svg class="HEADER_RECTANGLE">
		<rect id="HEADER_RECTANGLE" rx="0" ry="0" x="0" y="0" width="1903" height="35">
		</rect>
	</svg>
	<div id="MAIN_RECTANGLE">
		<svg class="Main_Rectangle">
			<rect id="Main_Rectangle" rx="0" ry="0" x="0" y="0" width="938" height="846">
			</rect>
		</svg>
		<div id="Registration">
			<span>REGISTRATION</span>
		</div>
	</div>
	<div id="BLUE_BOX_BOTTOM">
		<svg class="BLUE">
			<rect id="BLUE" rx="0" ry="0" x="0" y="0" width="938" height="62">
			</rect>
		</svg>
	</div>
	<div id="First_Name">
		<span>First Name</span>
	</div>
	<div id="Last_Name">
		<span>Last Name</span>
	</div>
	<div id="Date_of_Birth">
		<span>Date of Birth</span>
	</div>
	<div id="Drivers_License_Number">
		<span>Driver's License Number</span>
	</div>
	<svg class="Rectangle_29">
		<rect id="Rectangle_29" rx="0" ry="0" x="0" y="0" width="376" height="38">
		</rect>
	</svg>
	<svg class="Rectangle_30">
		<rect id="Rectangle_30" rx="0" ry="0" x="0" y="0" width="376" height="38">
		</rect>
	</svg>
	<svg class="Rectangle_31">
		<rect id="Rectangle_31" rx="0" ry="0" x="0" y="0" width="376" height="38">
		</rect>
	</svg>
	<svg class="Rectangle_32">
		<rect id="Rectangle_32" rx="0" ry="0" x="0" y="0" width="376" height="38">
		</rect>
	</svg>
	<div >
            <form method = "GET"> 
		 <input id="Michael" name ="f_name" type="text" placeholder = "Michael"> 
	
		 <input id="Caffarelli" name ="l_name" type="text" placeholder = "Caffarelli"> 
	
		 <input id="n_152022" name ="Date" type="text" placeholder = "3/15/2022"> 
	
		 <input id="DL1234567" name ="DL_Num" type="text" placeholder = "DL1234567">
                 <span onclick=window.open("First_Art_Board.php")>
                 <input type="submit"  id="SEARCH_BUTTON" name="submit" value="Continue"></span>
                    </form>    
                        
	</div>
	
</div>
    
            <?php
         
            $server_name = "localhost";
            $db_name = "rental car database";
            $user_name = "root";
            $password = "";
            
            $mysqli = new mysqli($server_name, $user_name, $password, $db_name);

            $First_Name = $_GET['f_name'];
            $Last_Name = $_GET['l_name'];
            $DOB = $_GET['Date'];
            $DL_Num = $_GET['DL_Num'];
            $ID = NULL;
            
            
            
            
              if(isset($First_Name)&& isset($Last_Name )&& isset($DOB )&&isset($DL_Num )){
              
              
             $new_post_query= "INSERT INTO `customer` (`DL_Number`, `FName`, `LName`, `DOB`, `Cust_ID_Num`) VALUES ('".$DL_Num."', '".$First_Name."', '".$Last_Name."', '".$DOB."', '".$ID."')";
            //  $new_post_query = "INSERT INTO `video` (`Video_Id`, `Video_Title`, `Video_Description`, `Video_Link`) VALUES ( '".$rand_id."', '".$new_post_title."', '".$New_Video_Description."', '".$New_Video_Link."')";
              
              $mysqli->query($new_post_query);}
              
            ?>
    
</body>
</html>
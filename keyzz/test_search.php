<?php 
    session_start();
    include('connect.php'); 
    include('box_slot_function.php'); 
    if (!isset($_SESSION['username'])) {
        //header('location: frm_login.php');
        echo "no username";
   }
   if (isset($_POST['box_id'])) {
    $box_id = $_POST['box_id'];
} else {
   // echo "ไม่พบข้อมูลกล่อง";
    exit; // จบการทำงานหลังจากแสดงข้อความ
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body class="bg-cover bg-center h-screen bg-opacity-25" style="background-image:url(img/bg1.png);">
<div class="flex justify-end">
<a href="frm_room.php" class="mr-10 mt-10" style="font-size: 24px;"><i class="fa-solid fa-xmark"></i></a>
</div>
<div class="flex justify-center mt-3">
<img src="img/logo.png" class="h-24 " alt="" />
</div>
<h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-3xl dark:text-black text-center  ">รายการค้นหาทั้งหมด</h1>
<div class="flex justify-center  flex-wrap mx-3 mt-5 ">
       <h1 class=" text-xl font-semibold mr-5" style="text-shadow: 2px 2px 4px rgba(0, 0, 0.3, 0.3);"> 
       <?php 
            echo "อพาร์ตเมนท์ ".$_SESSION['apartment_name']; 
           $apartment = find_boxname($_SESSION['apartment_name']);
           echo $apartment;

       ?>
    </h1> 
       
     </div>
       <div class="flex justify-center  flex-wrap mx-3 mt-5 ">
       <h1 class=" text-xl font-semibold mr-5" style="text-shadow: 2px 2px 4px rgba(0, 0, 0.3, 0.3);"> <?php echo "วันเข้า ".$_SESSION['check_in']; ?></h1> 
       <h1 class=" text-xl font-semibold ml-3" style="text-shadow: 2px 2px 4px rgba(0, 0, 0.3, 0.3);"> <?php echo "วันออก ".$_SESSION['check_out']; ?></h1>
     </div>


<div class="flex justify-center mt-10 mr-4">
<?php

if (isset($_POST['apartment_name'])) {    
   $_SESSION["apartment_name"] = $_POST['apartment_name'];
} 
    $Apartmentname = $_SESSION["apartment_name"];

if (isset($_POST['check_in'])) {
    $_SESSION["check_in"] = $_POST['check_in'];
}
    $checkInDatetime = $_SESSION["check_in"];

if (isset($_POST['check_out'])) {
    $_SESSION["check_out"] = $_POST['check_out'];
}
    $checkOutDatetime = $_SESSION["check_out"];

    $sql = "SELECT slot_id FROM reserve WHERE (box_id = $box_id) AND ((check_in = '".$checkInDatetime."') OR";
    $sql=$sql." (check_in BETWEEN '".$checkInDatetime."' AND '".$checkOutDatetime."') OR ";
    $sql=$sql."( '".$checkInDatetime."' BETWEEN check_in AND check_out))";

    $reservations = array(); 
    $result = $conn->query($sql);
    // $row1 = mysqli_fetch_array($result);
    while ($row1 = mysqli_fetch_array($result)) {
        array_push($reservations , $row1["slot_id"]);
        
}

    $sql = "SELECT box_id,room_number,slot_id FROM slot WHERE box_id = '$box_id'";
    $result2 = $conn->query($sql);

if (mysqli_num_rows($result2) > 0) {
    while($row = mysqli_fetch_assoc($result2)) {
        $boxid = $row["box_id"];
        $slot_id = $row["slot_id"];

        $key = "";
        
        $key = array_search($slot_id, $reservations);
      //  echo "คีย์ = ".$key."บ้อกไอดี = ".$boxid."สลอตไอดี = ". $slot_id; 
      if (!empty($row["room_number"])) {
        
        
        if($key > -1){
            
           // echo "ไอแดง"."<br>";
           echo "<div class='bg-[#dd191d] text-black py-11 px-4 rounded transition'>ห้อง " . $row["room_number"] . "</div>";
        } else {
           // echo "ไอเขียว"."<br>";
             echo "<form action='frmReserveinfo.php' method='post'>";
             echo "<input type='hidden' name='room_number' value='".$row['room_number']."'>";
             echo "<input type='hidden' name='check_in' value='".$checkInDatetime."'>";
             echo "<input type='hidden' name='check_out' value='".$checkOutDatetime."'>";
             echo "<input type='hidden' name='box_id' value='".$boxid."'>";
             echo "<input type='hidden' name='slot_id' value='".$slot_id."'>";
             echo "<button class='bg-[#259b24] w-full hover:bg-[#a3e9a4] text-black py-11 px-4 rounded transition'>ห้อง  ".$row["room_number"]."</button>";
             echo "</form>";
        }  
    }   else { 
            echo "<div class='bg-[#EFEFEF] w-full  text-black py-11 px-4 rounded transition'>ห้อง  ".$row["room_number"]."</div>";
        }
            
        

        // ตรวจสอบห้องที่มีอยู่ในตู้
        // $sql_rooms = "SELECT room_number FROM `slot` WHERE box_id = '$boxid';";
        // $result_rooms = $conn->query($sql_rooms);
        // if ($result_rooms->num_rows > 0) {
        //     $rooms = array();
        //     while($row2 = $result_rooms->fetch_assoc()) {
        //         $rooms[] = $row2;
        //     }

        //     if (count($rooms) > 0) {
                
        //         echo "<div class='grid grid-cols-5 gap-4 mb-5 text-2xl w-full ml-5 text-center'>";
                
        //         foreach ($rooms as $room) {

        //             // ดึงข้อมูล status จากฐานข้อมูล
        //             $sql_status = "SELECT box_id FROM reserve WHERE room_number = '" . $room["room_number"] . "'";
        //             $result_status = $conn->query($sql_status);
                
        //             // ตรวจสอบผลลัพธ์
                    
                
        //             if (!empty($room["room_number"])) {
        //                 // มีหมายเลขห้อง (room_number) อยู่
        //                 if (in_array($room["room_number"], array_column($reservations, 'room_number'))) {
        //                     echo "<div class='bg-[#dd191d] text-black py-11 px-4 rounded transition'>ห้อง " . $room["room_number"] . "</div>";
        //                 } else {
        //                     echo "<form action='frmReserveinfo.php' method='post'>";
        //                     echo "<input type='hidden' name='room_number' value='".$room['room_number']."'>";
        //                     echo "<input type='hidden' name='box_id' value='" . $row['box_id'] . "'>";
        //                     echo "<input type='hidden' name='check_in' value='".$checkInDatetime."'>";
        //                     echo "<input type='hidden' name='check_out' value='".$checkOutDatetime."'>";
        //                     echo "<button class='bg-[#259b24] w-full hover:bg-[#a3e9a4] text-black py-11 px-4 rounded transition'>ห้อง  ".$room["room_number"]."</button>";
        //                     echo "</form>";
        //                 }
        //             } else {
        //                 // ไม่มีหมายเลขห้อง (room_number) 
        //                 echo "<div class='bg-[#EFEFEF]  text-black py-11 px-4 rounded transition'>ห้องไม่มีหมายเลข</div>";
        //             }
        //         }
        //         echo "</div>"; // ปิดเส้นราบ grid
        //     } else {
        //         echo "ไม่มีรายการห้องในฐานข้อมูล";
        //     }
        // }
     }
        
}
  else {
     echo "ไม่พบรายการห้อง";
 }

// ปิดการเชื่อมต่อฐานข้อมูล
$conn->close();
echo"</div>";

?>

<br>




</body>
</html>

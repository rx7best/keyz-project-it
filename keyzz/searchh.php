<?php

session_start();
include('connect.php'); 

if (!isset($_SESSION['username'])) {
    header('location: frm_login.php');
    //echo "no username";
}

if (isset($_POST['box_id'])) {
    $box_id = $_POST['box_id'];
} else {
    exit; 
}

if (isset($_POST['check_in'])) {
    $_SESSION["check_in"] = $_POST['check_in'];
}
$checkInDatetime = $_SESSION["check_in"];

if (isset($_POST['check_out'])) {
    $_SESSION["check_out"] = $_POST['check_out'];
}
$checkOutDatetime = $_SESSION["check_out"];

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
            //cho $box_id ;
            //echo "<option value='" . $row['box_id'] . "'>" . $row['apartment_name'] . "</option>";
            // echo "อพาร์ตเมนท์ ".$_SESSION['apartment_name']; 
            // $apartment = find_boxname($_SESSION['apartment_name']);
            // echo $apartment;
            $sql = "SELECT apartment_name FROM box WHERE box_id = '$box_id'";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "อพาร์ตเมนท์ ".$row['apartment_name'];
        }
    }
       ?>
    </h1> 
       
     </div>
       <div class="flex justify-center  flex-wrap mx-3 mt-5 ">
       <h1 class=" text-xl font-semibold mr-5" style="text-shadow: 2px 2px 4px rgba(0, 0, 0.3, 0.3);"> <?php echo "วันเข้า ".$_SESSION['check_in']; ?></h1> 
       <h1 class=" text-xl font-semibold ml-3" style="text-shadow: 2px 2px 4px rgba(0, 0, 0.3, 0.3);"> <?php echo "วันออก ".$_SESSION['check_out']; ?></h1>
     </div>


<div class="flex justify-center mt-10 mr-4">
<?php

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
    echo "<div class='grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4 mb-5 text-2xl text-center w-full ml-5'>";
    if (mysqli_num_rows($result2) > 0) {
        while($row = mysqli_fetch_assoc($result2)) {
            $boxid = $row["box_id"];
            $slot_id = $row["slot_id"];
            $key = array_search($slot_id, $reservations);
          
            if (!empty($row["room_number"])) {
                if ($key !== false) {
                    echo "<div class='bg-[#dd191d] text-black py-11 px-4 rounded transition'>ห้อง " . $row["room_number"] . "</div>";
                } else {
                    echo "<form action='frmReserveinfo.php' method='post'>";
                    echo "<input type='hidden' name='room_number' value='" . $row['room_number'] . "'>";
                    echo "<input type='hidden' name='check_in' value='" . $checkInDatetime . "'>";
                    echo "<input type='hidden' name='check_out' value='" . $checkOutDatetime . "'>";
                    echo "<input type='hidden' name='box_id' value='" . $boxid . "'>";
                    echo "<input type='hidden' name='slot_id' value='" . $slot_id . "'>";
                    echo "<button class='bg-[#259b24] w-full hover:bg-[#a3e9a4] text-black py-11 px-4 rounded transition'>ห้อง  " . $row["room_number"] . "</button>";
                    echo "</form>";
                }
            } else {
                echo "<div class='bg-[#EFEFEF] w-full text-black py-11 px-4 rounded transition'>ห้องไม่ระบุ</div>";
            }
        }
        echo "</div>";
    } else {
        echo "ไม่พบรายการห้อง";
    }
    
$conn->close();


?>

<br>




</body>
</html>

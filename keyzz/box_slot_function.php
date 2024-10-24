<?php

function find_boxname($boxs){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "keyz";
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    /** ตรวจสอบข้อผิดพลาดต่างๆ */
    if (mysqli_connect_errno()) {
        echo "ไม่สามารถเชื่อมต่อฐานข้อมูล MySQL ได้: " . mysqli_connect_error();
        exit();
    }

    $boxname = "";
    if ($boxs !== null) {
        $sql_box = "SELECT apartment_name FROM box WHERE box_id = $boxs";
        $result = $conn->query($sql_box);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $boxname = $row["apartment_name"];
            } //end while
        } //end if
        else {
            $boxname = "no box name";
        } // end else
    } else {
        $boxname = "no box ID provided";
    }

    $conn->close();
    return $boxname;
  
} //end function

?>

<?php

function find_boxname($boxs) {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "keyz";
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("ไม่สามารถเชื่อมต่อฐานข้อมูล MySQL ได้: " . $conn->connect_error);
    }

    $boxname = "";
    $sql_box = $conn->prepare("SELECT apartment_name FROM box WHERE box_id = ?");
    $sql_box->bind_param("i", $boxs); // 'i' หมายถึง integer, ใช้ 's' หาก $boxs เป็น string
    $sql_box->execute();
    $result = $sql_box->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $boxname = $row["apartment_name"];
        }
    } else {
       // $boxname = "no box name";
    }

    $conn->close();
    return $boxname;
}


?>

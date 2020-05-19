<?php

function sanitise($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars(strip_tags($data));
    $data = htmlentities($data);
    return $data;
}

// header('Content-Type: application/json');

// if($this->email == 'lshumpert@wirelog.com.au') {
//     echo json_encode(array('message' => 'email already exists'));
//     die();
// }

//     if ($_GET['email'] == 'lshumpert@wirelog.com.au') {
//         echo json_encode(Array("exists"=>"true"));
//     } else {
//         echo json_encode(Array("exists"=>"false"));
//     }
// } else {
//     echo json_encode(Array("invalid"=>"true"));
// }

?>
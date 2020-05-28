<?php
    
    // link to database file
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

   

    require('db.php');
    require('se.php');
    
    require('sanitise.php');
    

    session_start();
    // session_regenerate_id();

    // Instantiate DB create the database connection
    $db = new databaseConnection();
    
    // echo '<pre>';
    // print_r($_SERVER);
    // echo '<pre>';

    

    $rm = $_SERVER['REQUEST_METHOD'];

    if(!isset($_SESSION['session_object'])) {
        $_SESSION['session_object'] = new sessionManager();
    }
    // if ($_SESSION['session_object']->session_ok() == true &&
    //     $_SESSION['session_object']->rate_limit() == true &&
    //     $_SESSION['session_object']->request_limit() == true) {
    //     $db->addUserLog();
    //     http_response_code(200);
    // }

    // if ($_SESSION['session_object']->session_ok() == true) {$db->addUserLog(); http_response_code(200);}
    if ($_SESSION['session_object']->session_ok() == true) {http_response_code(200);}

    // if($_SERVER['REQUEST_METHOD'] === 'POST' && $_SERVER['HTTP_REFERER'] === 'http://localhost/PROJ2/' || 'http://127.0.0.1/PROJ2/') {
    if($_SERVER['SERVER_ADDR'] == '::1' || $_SERVER['SERVER_ADDR'] == '127.0.0.1') {

        if($_SERVER['REQUEST_METHOD'] !== 'GET' && $_SERVER['REQUEST_METHOD'] !== 'POST') {
            echo json_encode(array('message' => 'Method Not Allowed'));
            http_response_code(405);
            die();
        }

//     if (isset($_GET['REQ_GET'])) {
//         if ($_GET['REQ_GET'] == 'addcomment') {
//             $technicianID = 1;
//             $db->addComment($technicianID, $_POST["jobID"], $_POST["comment"]);
//             // echo json_encode($json_array);
//             http_response_code(200);

//         } else if ($_GET['REQ_GET'] == 'addjob') {   
//             $db->addJob($_POST["contractor"], $_POST["location"]);
//             http_response_code(200);

//         } else if ($_GET['REQ_GET'] == 'addlogin') {
//             $technicianID = 1;
//             $db->addLogin($technicianID, $_POST["username"], $_POST["password"]);
//             http_response_code(200);

//         } else if ($_GET['REQ_GET'] == 'addimage') {
//             $db->addImage($_POST["jobID"], $_POST["img"]);
//             http_response_code(200);

//         } else if ($_GET['REQ_GET'] == 'addtechnician') {
//             $db->addTech($_POST["name"], $_POST["surname"], $_POST["email"], $_POST["phone"], $_POST["position"]);
//             http_response_code(200);

//         // } else if ($_GET['request_type'] == 'getalljob') {
//         //     $db->getAllJob($_GET['jobID'], $_GET['contractor'], $_GET['location']);
//         //     http_response_code(200);

//         } else {
//             http_response_code(404);
//         }
//     }
//  else {
//     http_response_code(403);
// }

if (isset($_GET['REQ_GET'])) {
////////////////////////////////////////JOB////////////////////////////////////////
    if ($_GET['REQ_GET'] == 'readjob') {
        $json_array = $db->readJob();

        echo json_encode($json_array);
        http_response_code(200);
    }
    else if ($_GET['REQ_GET'] == 'readjobid') {
        // $jobID = $_GET['jobID'];
        // $json_array = $db->readJobID($jobID);
        // echo json_encode($json_array);
        // http_response_code(200);
        // Instantiate post object
        $post = $db; //from public function __contruct($db)
        // get ID
        $post->id = isset($_GET['jobID']) ? $_GET['jobID'] : die();   
        // get post
        $post->readJobID();   
        // create array
        $post_arr = array(
            'jobID' => $post->id,
            'contractor' => $post->contractor,
            'location' => $post->location,
        );    
        // convert to JSON
        // print_r(json_encode($post_arr));
        echo json_encode($post_arr);
        http_response_code(200);
    }
    else if ($_GET['REQ_GET'] == 'createjob') {
        // Instantiate post object
        $post = $db; //from public function __contruct($db)    
        // get raw posted data
        $data = json_decode(file_get_contents("php://input")); 
        $post->contractor = $data->contractor;
        $post->location = $data->location;
        // create post
        if($post->createJob()) {
            echo json_encode(array('message' => 'Post Created'));
            http_response_code(200);
        } else {
            echo json_encode(array('message' => 'Post Not Created'));
            http_response_code(405);
        }
    }
////////////////////////////////////////JOBLOG////////////////////////////////////////
if ($_GET['REQ_GET'] == 'readjoblog') {
    $json_array = $db->readJobLog();

    echo json_encode($json_array);
    http_response_code(200);
}
else if ($_GET['REQ_GET'] == 'readjoblogid') {
    // $jobID = $_GET['jobID'];
    // $json_array = $db->readJobID($jobID);
    // echo json_encode($json_array);
    // http_response_code(200);
    // Instantiate post object
    $post = $db; //from public function __contruct($db)
    // get ID
    $post->id = isset($_GET['job_logID']) ? $_GET['job_logID'] : die();   
    // get post
    $post->readJobLogID();   
    // create array
    $post_arr = array(
        'job_logID' => $post->id,
        'comment' => $post->comment,
        'timestamp' => $post->timestamp,
        'jobID' => $post->jobID,
        'technicianID' => $post->technicianID
    );    
    // convert to JSON
    // print_r(json_encode($post_arr));
    echo json_encode($post_arr);
    http_response_code(200);
}


else if ($_GET['REQ_GET'] == 'getjobcomment') {
    // $jobID = $_GET['jobID'];
    // $json_array = $db->readJobID($jobID);
    // echo json_encode($json_array);
    // http_response_code(200);
    // Instantiate post object
    // $post = $db; //from public function __contruct($db)
    // // get ID
    // $post->id = isset($_GET['jobID']) ? $_GET['jobID'] : die();   
    // // get post
    // $post->getJobComment($jobID);
    // // create array
    // $post_arr = array(
    //     'job_logID' => $post->id,
    //     'comment' => $post->comment,
    //     'timestamp' => $post->timestamp,
    //     'jobID' => $post->jobID,
    //     'technicianID' => $post->technicianID,
    //     'name' => $post->name,
    //     'surname' => $post->surname,
    //     'phone' => $post->phone,
    //     'email' => $post->email,
    //     'position' => $post->position
    // );    
    // // convert to JSON
    // // print_r(json_encode($post_arr));
    // echo json_encode($post_arr);
    // http_response_code(200);
    if(isset($_GET['jobID'])) {
        $jobID = $_GET['jobID'];
        $array = $db->getJobComment($jobID);            
        echo json_encode($array);
        http_response_code(200);  
    } else {
        echo json_encode(array('message' => 'Not result found'));
        http_response_code(405);
    }
    
}


else if ($_GET['REQ_GET'] == 'createjoblog') {
    // Instantiate blog post object
    $post = $db; //from public function __contruct($db)    
    // get raw posted data
    $data = json_decode(file_get_contents("php://input"));    
    $post->comment = $data->comment;
    // $post->timestamp = $data->timestamp;
    $post->jobID = $data->jobID;
    $post->technicianID = $data->technicianID;
    // create post
    if($post->createJobLog()) {
        echo json_encode(array('message' => 'Post Created'));
        http_response_code(200);
    } else {
        echo json_encode(array('message' => 'Post Not Created'));
        http_response_code(405);
    }
}
////////////////////////////////////////LOGIN////////////////////////////////////////
if ($_GET['REQ_GET'] == 'readlogin') {
    $json_array = $db->readLogin();

    echo json_encode($json_array);
    http_response_code(200);
}
else if ($_GET['REQ_GET'] == 'readloginid') {
    // $jobID = $_GET['jobID'];
    // $json_array = $db->readJobID($jobID);
    // echo json_encode($json_array);
    // http_response_code(200);
    $post = $db; //from public function __contruct($db)
    // get ID
    $post->id = isset($_GET['loginID']) ? $_GET['loginID'] : die();   
    // get post
    $post->readLoginID();   
    // create array
    $post_arr = array(
        'loginID' => $post->id,
        'username' => $post->username,
        'password' => $post->password,
        'technicianID' => $post->technicianID
    );    
    // convert to JSON
    // print_r(json_encode($post_arr));
    echo json_encode($post_arr);
    http_response_code(200);
}
else if ($_GET['REQ_GET'] == 'createlogin') {
    // Instantiate blog post object
    $post = $db; //from public function __contruct($db)    
    // get raw posted data
    $data = json_decode(file_get_contents("php://input"));    
    $post->username = $data->username;
    $post->password = $data->password;
    $post->technicianID= $data->technicianID;
    // create post
    if($post->createLogin()) {
        echo json_encode(array('message' => 'Post Created'));
        http_response_code(200);
    } else {
        echo json_encode(array('message' => 'Post Not Created'));
        http_response_code(405);
    }
}

////////////////////////////////////////QR////////////////////////////////////////
if ($_GET['REQ_GET'] == 'readqr') {
    $json_array = $db->readQR();

    echo json_encode($json_array);
    http_response_code(200);
}
else if ($_GET['REQ_GET'] == 'readqrid') {
    // $jobID = $_GET['jobID'];
    // $json_array = $db->readJobID($jobID);
    // echo json_encode($json_array);
    // http_response_code(200);
    // Instantiate post object
    $post = $db; //from public function __contruct($db)
    // get ID
    $post->id = isset($_GET['qrID']) ? $_GET['qrID'] : die();   
    // get post
    $post->readQRID();   
    // create array
    $post_arr = array(
        'qrID' => $post->id,
        'img' => $post->img,
        'jobID' => $post->jobID
    );    
    // convert to JSON
    // print_r(json_encode($post_arr));
    echo json_encode($post_arr);
    http_response_code(200);
}
else if ($_GET['REQ_GET'] == 'createqr') {
    // Instantiate blog post object
    $post = $db; //from public function __contruct($db)    
    // get raw posted data
    $data = json_decode(file_get_contents("php://input"));    
    // $post->qrID = $data->qrID;
    // $post->timestamp = $data->timestamp;
    $post->img = $data->img;
    $post->jobID= $data->jobID;
    // create post
    if($post->createQR()) {
        echo json_encode(array('message' => 'Post Created'));
        http_response_code(200);
    } else {
        echo json_encode(array('message' => 'Post Not Created'));
        http_response_code(405);
    }
}
////////////////////////////////////////TECH////////////////////////////////////////
    if ($_GET['REQ_GET'] == 'readtechnician') {
        $json_array = $db->readTechnician();

        echo json_encode($json_array);
        http_response_code(200);
    }
    else if ($_GET['REQ_GET'] == 'readtechnicianid') {
        // $jobID = $_GET['jobID'];
        // $json_array = $db->readJobID($jobID);
        // echo json_encode($json_array);
        // http_response_code(200);
        // Instantiate post object
        $post = $db; //from public function __contruct($db)
        // get ID
        $post->id = isset($_GET['technicianID']) ? $_GET['technicianID'] : die();   
        // get post
        $post->readTechnicianID();   
        // create array
        $post_arr = array(
            'technicianID' => $post->id,
            'name' => $post->name,
            'surname' => $post->surname,
            'email' => $post->email,
            'phone' => $post->phone,
            'position' => $post->position
        );    
        // convert to JSON
        // print_r(json_encode($post_arr));
        echo json_encode($post_arr);
        http_response_code(200);
    }
    else if ($_GET['REQ_GET'] == 'createtechnician') {
        // Instantiate blog post object
        $post = $db; //from public function __contruct($db)    
        // get raw posted data
        $data = json_decode(file_get_contents("php://input"));    
        $post->name = $data->name;
        $post->surname = $data->surname;
        $post->email = $data->email;
        $post->phone= $data->phone;
        $post->position = $data->position;
        // create post
        if($post->createTechnician()) {
            echo json_encode(array('message' => 'Post Created'));
            http_response_code(200);
        } else {
            echo json_encode(array('message' => 'Post Not Created'));
            http_response_code(405);
        }
    }

////////////////////////////////////////USER LOG////////////////////////////////////////
if ($_GET['REQ_GET'] == 'readuserlog') {
    $json_array = $db->readUserLog();

    echo json_encode($json_array);
    http_response_code(200);
}

}
} else {
    echo json_encode(array('message' => '403 Forbidden'));
    http_response_code(403);
}


?>


<?php
    // time could also use $_SERVER['REQUEST_TIME']
    // unix time needs to be converted to datetime
    // $user_log = array('time' => time(), 'ip' => $_SERVER['REMOTE_ADDR'], 'url' => $_SERVER['REQUEST_URI'], 'browser' => $_SERVER['HTTP_USER_AGENT']);

    // print_r($user_log);

    // $timestamp = time();
    // print_r(gmdate("Y-m-d\TH:i:s\Z", $timestamp));


    // $_SERVER['REQUEST_TIME'] = gmdate("Y-m-d\TH:i:s\Z");

    // $user_log = array('time' => $_SERVER['REQUEST_TIME'], 'ip' => $_SERVER['REMOTE_ADDR'], 'url' => $_SERVER['REQUEST_URI'], 'browser' => $_SERVER['HTTP_USER_AGENT']);

    // print_r($user_log);


    // $timeConvert = gmdate("Y-m-d\TH:i:s\Z");
    // $user_log = array('time' => $timeConvert, 'ip' => $_SERVER['REMOTE_ADDR'], 'url' => $_SERVER['REQUEST_URI'], 'browser' => $_SERVER['HTTP_USER_AGENT'], 'method' => $_SERVER['REQUEST_METHOD']);

    // print_r($user_log);


?>
<?php

################ CLASS OBJECT ################
// will have properties which are database pareameters to connect
// DB params
// private can only be accessed in this class
class databaseConnection {
    private $conn;

    public function __construct() {
        $this->conn = new PDO('mysql:host=localhost;dbname=wirelog', 'root', '');
        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

// WORKING VIA FRONT END FORMS

// ################ ADD COMMENT ################
//     public function addComment($technicianID, $jobID, $comment) {

//         $sql = 'INSERT INTO job_log (comment, jobID, technicianID)
//         VALUES (:comment, :jobID, :technicianID)';
//         $stmt = $this->conn->prepare($sql);

//         // $stmt->bindValue(':time', $time);
//         // $stmt->bindValue(':date', $date);

//         // order here does not seem to effect insert
//         $stmt->bindValue(':technicianID', $technicianID);
//         $stmt->bindValue(':jobID', $jobID);
//         $stmt->bindValue(':comment', $comment);
//         $res = $stmt->execute();
//     }

// ################ ADD JOB ################
//     public function addJob($contractor, $location) {

//         $sql = 'INSERT INTO job (contractor, location)
//         VALUES (:contractor, :location)';
//         $stmt = $this->conn->prepare($sql);
//         $stmt->bindValue(':contractor', $contractor);
//         $stmt->bindValue(':location', $location);
//         // $stmt->bindValue(':jobid', $jobid);
//         $res = $stmt->execute();
//     }

// ################ ADD LOGIN ################
//     public function addLogin($technicianID, $username, $password) {

//         $sql = 'INSERT INTO login (username, password, technicianID)
//         VALUES (:username, :password, :technicianID)';
//         $stmt = $this->conn->prepare($sql);
//         $stmt->bindValue(':technicianID', $technicianID);
//         $stmt->bindValue(':username', $username);
//         $stmt->bindValue(':password', $password);
//         $res = $stmt->execute();
//     }

// ################ ADD IMAGE ################
//     public function addImage($jobID, $img) {

//         $sql = 'INSERT INTO qr (img, jobID)
//         VALUES (:img, :jobID)';
//         $stmt = $this->conn->prepare($sql);
//         $stmt->bindValue(':jobID', $jobID);
//         $stmt->bindValue(':img', $img);
//         $res = $stmt->execute();
//     }

// ################ ADD TECHNICIAN ################
//     public function addTech($name, $surname, $email, $phone, $position) {

//         $sql = 'INSERT INTO technician (name, surname, email, phone, position)
//         VALUES (:name, :surname, :email, :phone, :position)';

//         $stmt = $this->conn->prepare($sql);
//         $stmt->bindValue(':name', $name);
//         $stmt->bindValue(':surname', $surname);
//         $stmt->bindValue(':email', $email);
//         $stmt->bindValue(':phone', $phone);
//         $stmt->bindValue(':position', $position);
//         $res = $stmt->execute();
//     }











########################################USERLOG########################################
// public function addUserLog() {
    
//     $userIP = $_SERVER['REMOTE_ADDR'];
//     // to add request time in unix $userTime = $_SERVER['REQUEST_TIME'];
//     $userBrowser = $_SERVER['HTTP_USER_AGENT'];
//     // to add request url $userURL = $_SERVER['REQUEST_URI'];
//     $userMethod = $_SERVER['REQUEST_METHOD'];

//     $sql = 'INSERT INTO user_log (IP, browser, userMethod)
//     VALUES (:userip, :userbrowser, :usermethod)';

//     $stmt = $this->conn->prepare($sql);
//     $stmt->bindValue(':userip', $userIP);
//     // $stmt->bindValue(':usertimestamp', $userTime);
//     $stmt->bindValue(':userbrowser', $userBrowser);
//     // $stmt->bindValue(':userurl', $userURL);
//     $stmt->bindValue(':usermethod', $userMethod);
//     $res = $stmt->execute();
// }

// WORKING VIA POSTMAN

########################################JOB########################################

public function readJob() {

    //create query
    $query = 'SELECT * from job ORDER BY jobID DESC';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no job(s) exist'));
        die();
    }

    return $res;
}

public function readJobID() {
    $query = 'SELECT * from job WHERE jobID = ? LIMIT 0,1';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // bind id
    $stmt->bindParam(1, $this->id);

    // execure query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // validation
    if(empty($row)) {
        echo json_encode(array('message' => 'no ID found'));
        die();
    }

    // set properties
    $this->contractor = $row['contractor'];
    $this->location = $row['location'];
}

    // public function readJobID($jobID) {
    // $query = 'SELECT * from job WHERE jobID = :jobID';

    // // prepare statement
    // $stmt = $this->conn->prepare($query);

    // // bind id
    // $stmt->bindParam(':jobID', $jobID);

    // // execure query
    // $stmt->execute();

    // $res = $stmt->fetch(PDO::FETCH_ASSOC);

    // return $res;

    // // set properties
    // // $this->contractor = $row['contractor'];
    // // $this->location = $row['location'];
    // }

public function createJob() {

    $query = 'INSERT INTO job
    SET
        contractor = :contractor,
        location = :location';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // clean data
    // $this->contractor = htmlspecialchars(strip_tags($this->contractor));
    // $this->location = htmlspecialchars(strip_tags($this->location));
    $this->contractor = sanitise($this->contractor);
    $this->location = sanitise($this->location);

    // bind data
    $stmt->bindParam(':contractor', $this->contractor);
    $stmt->bindParam(':location', $this->location);

    if(strlen($this->contractor) <3 ) {
        echo json_encode(array('message' => 'contractor must contain at least three characters'));
        die();
    }

    if(strlen($this->location) <3 ) {
        echo json_encode(array('message' => 'location must contain at least three characters'));
        die();
    }

    // execure query
    if($stmt->execute()) {
        return true;
    }

    // print error if something goes wrong
    printf("Error: %s. \n", $stmt->error);

    return false;
}

########################################JOBLOG########################################

public function readJobLog() {

    //create query
    $query = 'SELECT * from job_log';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no job log exists'));
        die();
    }

    return $res;
    }


public function readJobLogID() {
    $query = 'SELECT * from job_log WHERE job_logID = ? LIMIT 0,1';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // bind id
    $stmt->bindParam(1, $this->id);

    // execure query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // validation
    if(empty($row)) {
        echo json_encode(array('message' => 'no ID exists'));
        die();
    }

    // set properties
    $this->comment = $row['comment'];
    $this->timestamp = $row['c_at'];
    $this->jobID = $row['jobID'];
    $this->id = $row['id'];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public function getJobComment($jobID) {
    // $query = 'SELECT * from job_log WHERE jobID = ? LIMIT 0,1';
    // $query = 'SELECT * from job_log WHERE jobID = :res ORDER BY timestamp ASC';
    $sql = 'SELECT job_log.comment, job_log.c_at, job_log.jobID, technician.name, technician.surname, technician.phone, technician.email, technician.position
                FROM job_log
                JOIN technician
                ON job_log.id = technician.id 
                WHERE jobID = :res ORDER BY job_log.c_at DESC';

    // prepare statement
    $stmt = $this->conn->prepare($sql);

    // bind id
    $stmt->bindParam(':res', $jobID);

    // execure query
    $stmt->execute();

    $array = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if(is_array($array) > 0) {
        return $array;
    } else {
        http_response_code(404);
        echo json_encode(Array("Message"=>"No result found"));
    }

    // validation
    // if(empty($row)) {
    //     echo json_encode(array('message' => 'no data exists'));
    //     die();
    // }

    // set properties
    // $this->comment = $row['comment'];
    // $this->timestamp = $row['timestamp'];
    // $this->jobID = $row['jobID'];
    // $this->technicianID = $row['technicianID'];
    // $this->name = $row['name'];
    // $this->surname = $row['surname'];
    // $this->phone = $row['phone'];
    // $this->email = $row['email'];
    // $this->position = $row['position'];
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public function createJobLog() {

    $query = 'INSERT INTO job_log
    SET
        comment = :comment,
        jobID = :jobID,
        technicianID = :technicianID';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // clean data
    // $this->comment = htmlspecialchars(strip_tags($this->comment));
    $this->comment = sanitise($this->comment);

    // bind data
    $stmt->bindParam(':comment', $this->comment);
    $stmt->bindParam(':jobID', $this->jobID);
    $stmt->bindParam(':technicianID', $this->technicianID);

    // validation
    if(strlen($this->comment) <3 ) {
        echo json_encode(array('message' => 'comment must contain at least three characters'));
        die();
    }

    // execure query
    if($stmt->execute()) {
        return true;
    }

    // print error if something goes wrong
    printf("Error: %s. \n", $stmt->error);

    return false;
}

########################################LOGIN########################################

public function readLogin() {

    //create query
    $query = 'SELECT * from login';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no login data'));
        die();
    }

    return $res;
    }


public function readLoginID() {
    $query = 'SELECT * from login WHERE loginID = ? LIMIT 0,1';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // bind id
    $stmt->bindParam(1, $this->id);

    // execure query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // validation
    if(empty($row)) {
        echo json_encode(array('message' => 'no ID exists'));
        die();
    }

    // set properties
    $this->username = $row['username'];
    $this->password = $row['password'];
    $this->technicianID = $row['technicianID'];
}


public function createLogin() {

    $query = 'INSERT INTO login
    SET
        username = :username,
        password = :password,
        technicianID = :technicianID';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // clean data
    // $this->title = htmlspecialchars(strip_tags($this->username));
    $this->username = sanitise($this->username);

    // bind data
    $stmt->bindParam(':username', $this->username);
    $stmt->bindParam(':password', $this->password);
    $stmt->bindParam(':technicianID', $this->technicianID);

    // validation
    if(strlen($this->username) <3 ) {
        echo json_encode(array('message' => 'username must contain at least three characters'));
        die();
    }

    if(strlen($this->password) <8 ) {
        echo json_encode(array('message' => 'password must contain at least eight characters'));
        die();
    }

    // execure query
    if($stmt->execute()) {
        return true;
    }

    // print error if something goes wrong
    printf("Error: %s. \n", $stmt->error);

    return false;
}

########################################QR########################################

public function readQR() {

    //create query
    $query = 'SELECT * from qr';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no QR exists'));
        die();
    }

    return $res;
    }


public function readQRID() {
    $query = 'SELECT * from qr WHERE qrID = ? LIMIT 0,1';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // bind id
    $stmt->bindParam(1, $this->id);

    // execure query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // validation
    if(empty($row)) {
        echo json_encode(array('message' => 'no ID exists'));
        die();
    }

    // set properties
    $this->qrID = $row['qrID'];
    $this->img = $row['img'];
    $this->jobID = $row['jobID'];
}


public function createQR() {

    $query = 'INSERT INTO qr
    SET
        qrID = :qrID,
        img = :img,
        jobID = :jobID';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // clean data
    // $this->img = htmlspecialchars(strip_tags($this->img));

    // bind data
    $stmt->bindParam(':qrID', $this->qrID);
    $stmt->bindParam(':img', $this->img);
    $stmt->bindParam(':jobID', $this->jobID);

    // validation
    if(strlen($this->img) <3 ) {
        echo json_encode(array('message' => 'image unacceptable'));
        die();
    }

    // execure query
    if($stmt->execute()) {
        return true;
    }

    // print error if something goes wrong
    printf("Error: %s. \n", $stmt->error);

    return false;
}


########################################TECH########################################

public function readTechnician() {

    //create query
    $query = 'SELECT * from technician ORDER BY technicianID DESC';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no technician found'));
        die();
    }

    return $res;
    }


public function readTechnicianID() {
    $query = 'SELECT * from technician WHERE technicianID = ? LIMIT 0,1';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // bind id
    $stmt->bindParam(1, $this->id);

    // execure query
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // validation
    if(empty($row)) {
        echo json_encode(array('message' => 'no ID exists'));
        die();
    }

    // set properties
    $this->name = $row['name'];
    $this->surname = $row['surname'];
    $this->email = $row['email'];
    $this->phone = $row['phone'];
    $this->position = $row['position'];
}


public function createTechnician() {

    $query = 'INSERT INTO technician
    SET
        name = :name,
        surname = :surname,
        email = :email,
        phone = :phone,
        position = :position';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // clean data
    // $this->name = htmlspecialchars(strip_tags($this->name));
    // $this->surname = htmlspecialchars(strip_tags($this->surname));
    $this->name = sanitise($this->name);
    $this->surname = sanitise($this->surname);
    $this->email = sanitise($this->email);
    $this->phone = sanitise($this->phone);
    $this->position = sanitise($this->position);

    // bind data
    $stmt->bindParam(':name', $this->name);
    $stmt->bindParam(':surname', $this->surname);
    $stmt->bindParam(':email', $this->email);
    $stmt->bindParam(':phone', $this->phone);
    $stmt->bindParam(':position', $this->position);

    // validation
    if(strlen($this->name) <3 || ctype_alpha($this->name) == false) {
        echo json_encode(array('message' => 'name must contain greater than 3 letters'));
        die();
    }

    if(strlen($this->surname) <3 || ctype_alpha($this->surname) == false) {
        echo json_encode(array('message' => 'surname must contain greater than 3 letters'));
        die();
    }

    if(!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(array('message' => 'email address invalid'));
        die();
    }

    if($this->email == 'lshumpert@wirelog.com.au') {
        echo json_encode(array('message' => 'email already exists'));
        die();
    }

    if(strlen($this->phone) <10 OR strlen($this->phone) >12 ) {
        echo json_encode(array('message' => 'mobile number must be 10 or 12 characters'));
        die();
    }

    if(strlen($this->position) <1 ) {
        echo json_encode(array('message' => 'position title must contain greater than 1 character'));
        die();
    }


    // execure query
    if($stmt->execute()) {
        return true;
    }

    // print error if something goes wrong
    printf("Error: %s. \n", $stmt->error);

    return false;
}

########################################USER LOG########################################

public function readUserLog() {

    //create query
    $query = 'SELECT * from user_log';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    // return $stmt;

    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // validation
    if(empty($res)) {
        echo json_encode(array('message' => 'no user log(s) found'));
        die();
    }

    return $res;
    }

}

?>
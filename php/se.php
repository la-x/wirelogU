<?php

################ CLASS OBJECT ################
class sessionManager {

    public function session_ok() {
        // echo 'session ID =' . ' ' . session_id(); {
            return true;
        // }
    }

################ RATE LIMIT ################ (web service 1 request 1 sec per user session)
    public function rate_limit() {

        if(isset($_SESSION['rate_limit'])){
            if(time() - $_SESSION['rate_limit'] > 1){
                $_SESSION['rate_limit'] = time();
                // echo '<br>' . 'rate limit > 1 second';
            } else {
                // echo '<br>' . 'rate limit < 1 second (429)';
                http_response_code(429);
                die();
            }
        } else {
            $_SESSION['rate_limit'] = time();
        }
        return true;
    }

################ REQUEST LIMIT ################ (per session request to 1,000/24hrs)
    public function request_limit() {

        if(isset($_SESSION['request_limit']) && isset($_SESSION['request_amount'])){
            if(round(time()/(60*60*24)) == round($_SESSION['request_limit'])) {
                $_SESSION['request_amount']++;
                if($_SESSION['request_amount'] > 500){
                    // echo '<br>' . 'request amount in 24hrs > 1';
                    http_response_code(501);
                    die();
                }
            } else {
                $_SESSION['request_limit'] = round(time()/(60*60*24));
                $_SESSION['request_amount'] = 0;
            }
        }  else {
            $_SESSION['request_limit'] = (time()/(60*60*24));
            $_SESSION['request_amount'] = 0;
        }
        return true;
    }

// time() retrieves amount of seconds elapsed since midnight UTC/GMT 01/01/1970 also known as UNIX Timestamp.
// At the time of writing,  a 10 digit numerical value is retried as a result of the amount of seconds.
// The UNIX timestamp is divided by (60*60*24) due to 60 seconds in a day, 60 minutes in an hour, and 24 hours in a day.
// As a result, the value is then retrieved to the nearest 5 decimals which is then rounded via the round() function to round to the nearest whole number.

################ TEST ################
    // echo '<br>' . gmdate("Y-m-d\TH:i:s\Z") . '<br>'; // date and time UTC
    // echo '<br>' . $_SERVER['REQUEST_TIME'] . '<br>'; // same as time() function
    // echo '<br>' . time()/(60/60) . '<br>'; // same as server time
    // echo '<br>' . time()/(60/60) . '<br>'; // same as server time, current time in UNIX
    // echo '<br>' . time()/(60*60*24) . '<br>';
    // time() retrieves amount of seconds since 01/01/1970 also known as UNIX Timestamp.
}

?>
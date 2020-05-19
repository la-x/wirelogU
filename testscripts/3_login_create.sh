curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"username": "TEST username", "password": "TEST password", "technicianID": "1"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createlogin

$SHELL
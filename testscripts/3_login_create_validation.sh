curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"username": "TEST username", "password": "1234567", "technicianID": "1"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createlogin

$SHELL
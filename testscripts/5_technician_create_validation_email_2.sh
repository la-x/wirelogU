curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"name": "TEST", "surname": "TEST", "email": "lshumpert@wirelog.com.au", "phone": "12345678901", "position": "TEST"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createtechnician

$SHELL
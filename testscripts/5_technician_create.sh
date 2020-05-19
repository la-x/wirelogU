curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"name": "TESTname", "surname": "TESTsurname", "email": "test@wirelog.com.au", "phone": "12345678901", "position": "TESTposition"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createtechnician

$SHELL
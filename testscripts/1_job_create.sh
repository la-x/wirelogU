curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"contractor": "TEST contractor", "location": "TEST location"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createjob

$SHELL
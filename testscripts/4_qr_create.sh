curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"img": "png", "jobID": "1"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createqr

$SHELL
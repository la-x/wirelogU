curl \
  --header "Content-type: application/json" \
  --request POST \
  --data '{"comment": "ok", "jobID": "1", "technicianID": "1"}' \
  http://localhost/wirelog/php/ws.php?REQ_GET=createjoblog

$SHELL
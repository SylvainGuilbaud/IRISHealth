export filename="response_send_$1.json"
echo "deleting " $filename
rm -f $filename
curl -v -d "@$1.json" \
-H "accept: application/json" -H "Content-Type: application/fhir+json; charset=UTF-8" \
-X POST http://localhost:28000/crud/sendfile \
-o $filename


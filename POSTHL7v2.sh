export filename="response-POSTHL7v2.json"
echo "deleting " $filename
rm -f $filename
curl -v -d "@./data/HL7v2.json" \
-H "Content-Type: application/json" \
-X POST http://localhost:28000/crud/sendfile \
-o $filename \
--user "_SYSTEM:SYS"


# curl -X POST "http://localhost:28000/crud/sendfile" -H "accept: application/json" -H "Content-Type: application/json" -d "{\"content\":\"MSH|^~\\\\&|REGADT|MCM|IFENG||199601061253||ADT^A01|000001|P|2.5.1|1||\EVN|A01|199601061000|199601101400|1\PID|||999473857^^^GENHOSP|253763|MASSIE^James^A||19560129|F|||87 MAIN ST^^CAMBRIDGE^MA^02142^||(900)485-5344|(900)485-5344|ENGLISH|S|C|10199925|371-66-9256\PD1|||||||||\NK1||||||\PV1||O|||||0148^ADDISON^JAMES|0148^ADDISON^JAMES|0148^ADDISON^JAMES|AMB|||||||0148^ADDISON^JAMES|S|1400|A|||||||||||||||||GENHOSP\PV2||||||||199601101400|199601101400\DB1|||||||||||\OBX||ST|1010.1^BODY WEIGHT||62|kg\OBX||ST|1010.1^HEIGHT||190|cm\AL1|||||||||||\DG1|||||||||||\DRG|||||||||||\PR1|||||||||||\ROL|||||||||||\GT1|||||||||||\IN1|||||||||||\IN2|||||||||||\IN3|||||||||||\ACC|||||||||||\UB1|||||||||||\UB2|||||||||||\",\"fileName\":\"1719353278358\"}"
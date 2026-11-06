# HL7 Sender

React (Vite) app that builds an HL7 v2.5.1 ADT message from a patient form
(modelled on `data/HL7/test/2.5.1_ADT_*.hl7`) and POSTs it over HTTP to an IRIS
HL7 HTTP service.

    npm install
    npm run dev      # http://localhost:5173
    npm test         # message-builder unit tests

The dev server proxies `/iris/*` to `IRIS_TARGET` (default `http://localhost:28000`),
avoiding CORS. Request: `POST {Base URL}/{Service}` with Basic auth, body = HL7 (segments separated by `\r`).
A pasted raw message overrides the form.

import { useMemo, useState } from 'react'
import { EVENTS, buildAdt, normalizeRaw, randomPatient, toDisplay } from './hl7.js'

const initialPatient = {
  patientId: '24445670',
  firstName: 'Anne',
  lastName: 'VERSAIRE',
  birthDate: '1985-01-24',
  gender: 'F',
  sodium: '140',
  address: '',
  city: '',
  zip: '',
  phone: '',
  event: 'A01',
}

const initialServer = {
  baseUrl: '/iris/csp/healthshare/dglab',
  service: 'Patient Information from IHE PAM - HTTP',
  username: 'testuser',
  password: 'test',
}

function Field({ label, children }) {
  return (
    <label className="field">
      <span>{label}</span>
      {children}
    </label>
  )
}

export default function App() {
  const [patient, setPatient] = useState(initialPatient)
  const [server, setServer] = useState(initialServer)
  const [raw, setRaw] = useState('')
  const [count, setCount] = useState(1)
  const [log, setLog] = useState([])
  const [busy, setBusy] = useState(false)

  const setP = (k) => (e) => setPatient((p) => ({ ...p, [k]: e.target.value }))
  const setS = (k) => (e) => setServer((s) => ({ ...s, [k]: e.target.value }))

  const preview = useMemo(
    () => (raw.trim() ? normalizeRaw(raw) : buildAdt(patient)),
    [raw, patient],
  )

  async function send() {
    setBusy(true)
    const url = `${server.baseUrl.replace(/\/$/, '')}/${encodeURIComponent(server.service)}`
    for (let i = 0; i < count; i++) {
      // Fresh patient per extra message so the batch is not N identical ADTs.
      const p = i === 0 ? patient : { ...patient, ...randomPatient(), event: patient.event }
      const body = raw.trim() ? normalizeRaw(raw) : buildAdt(p, new Date(), String(Date.now() % 1e9) + i)
      const entry = { time: new Date().toLocaleTimeString(), url, body }
      try {
        const res = await fetch(url, {
          method: 'POST',
          headers: {
            'Content-Type': 'text/plain; charset=utf-8',
            Authorization: 'Basic ' + btoa(`${server.username}:${server.password}`),
          },
          body,
        })
        entry.status = res.status
        entry.ok = res.ok
        entry.response = (await res.text()).slice(0, 2000)
      } catch (err) {
        entry.ok = false
        entry.status = 'network error'
        entry.response = String(err)
      }
      setLog((l) => [entry, ...l])
    }
    setBusy(false)
  }

  return (
    <div className="app">
      <header>IRIS HEALTH · HL7 SENDER</header>
      <main>
        <section className="panel">
          <h2>Patient</h2>
          <Field label="Patient ID">
            <div className="row">
              <input value={patient.patientId} onChange={setP('patientId')} />
              <button type="button" title="Random patient" onClick={() => setPatient((p) => ({ ...p, ...randomPatient() }))}>
                🎲
              </button>
            </div>
          </Field>
          <Field label="First name"><input value={patient.firstName} onChange={setP('firstName')} /></Field>
          <Field label="Last name"><input value={patient.lastName} onChange={setP('lastName')} /></Field>
          <Field label="Date of birth"><input type="date" value={patient.birthDate} onChange={setP('birthDate')} /></Field>
          <Field label="Gender">
            <select value={patient.gender} onChange={setP('gender')}>
              <option value="F">Female</option>
              <option value="M">Male</option>
              <option value="O">Other</option>
              <option value="U">Unknown</option>
            </select>
          </Field>
          <Field label="Address"><input value={patient.address} onChange={setP('address')} /></Field>
          <Field label="City"><input value={patient.city} onChange={setP('city')} /></Field>
          <Field label="Zip"><input value={patient.zip} onChange={setP('zip')} /></Field>
          <Field label="Phone"><input value={patient.phone} onChange={setP('phone')} /></Field>
          <Field label="Sodium (mmol/L)"><input type="number" value={patient.sodium} onChange={setP('sodium')} /></Field>
        </section>

        <section className="col">
          <div className="panel">
            <h2>Options</h2>
            <Field label="Event">
              <select value={patient.event} onChange={setP('event')}>
                {EVENTS.map((e) => <option key={e} value={e}>ADT^{e}</option>)}
              </select>
            </Field>
            <Field label="Nb messages">
              <select value={count} onChange={(e) => setCount(Number(e.target.value))}>
                {[1, 2, 5, 10, 50].map((n) => <option key={n}>{n}</option>)}
              </select>
            </Field>
          </div>
          <div className="panel">
            <h2>Raw message — paste to override the form</h2>
            <textarea rows={8} placeholder="MSH|^~\&|..." value={raw} onChange={(e) => setRaw(e.target.value)} />
            <button type="button" className="ghost" onClick={() => setRaw('')}>✕ Clear</button>
          </div>
          <div className="panel">
            <h2>Server configuration</h2>
            <Field label="Base URL"><input value={server.baseUrl} onChange={setS('baseUrl')} /></Field>
            <Field label="Service"><input value={server.service} onChange={setS('service')} /></Field>
            <Field label="Username"><input value={server.username} onChange={setS('username')} /></Field>
            <Field label="Password"><input type="password" value={server.password} onChange={setS('password')} /></Field>
          </div>
          <button type="button" className="send" disabled={busy} onClick={send}>
            {busy ? 'Sending…' : 'Send ADT HTTP'}
          </button>
        </section>
      </main>

      <section className="panel wide">
        <h2>HL7 message generated</h2>
        <pre>{toDisplay(preview)}</pre>
      </section>

      {log.length > 0 && (
        <section className="panel wide">
          <h2>Responses</h2>
          {log.map((l, i) => (
            <details key={i} open={i === 0}>
              <summary className={l.ok ? 'ok' : 'ko'}>
                {l.time} — POST {l.url} → {l.status}
              </summary>
              <pre>{toDisplay(l.body)}</pre>
              {l.response && <pre className="resp">{l.response}</pre>}
            </details>
          ))}
        </section>
      )}
    </div>
  )
}

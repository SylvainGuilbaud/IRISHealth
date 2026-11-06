// HL7 v2.5.1 message builder, modelled on data/HL7/test/2.5.1_ADT_*.hl7

export const pad = (n, l = 2) => String(n).padStart(l, '0')

/** Date -> YYYYMMDDHHMMSS */
export function hl7Timestamp(d = new Date()) {
  return `${d.getFullYear()}${pad(d.getMonth() + 1)}${pad(d.getDate())}${pad(d.getHours())}${pad(d.getMinutes())}${pad(d.getSeconds())}`
}

/** yyyy-mm-dd (input[type=date]) -> YYYYMMDD */
export const hl7Date = (iso) => (iso || '').replace(/-/g, '')

/** Escape HL7 delimiters in free text. */
export function esc(v) {
  return String(v ?? '')
    .replace(/\\/g, '\\E\\')
    .replace(/\|/g, '\\F\\')
    .replace(/\^/g, '\\S\\')
    .replace(/&/g, '\\T\\')
    .replace(/~/g, '\\R\\')
    .replace(/[\r\n]+/g, ' ')
}

export const EVENTS = ['A01', 'A04', 'A08']

/**
 * Build an ADT message. Returns segments joined with \r (HL7 standard).
 * `p`: { patientId, firstName, lastName, birthDate (iso), gender (M|F|O|U),
 *        address, city, zip, phone, event, sodium, sendingApp, sendingFacility, ... }
 */
export function buildAdt(p, now = new Date(), controlId = null) {
  const ts = hl7Timestamp(now)
  const event = p.event || 'A01'
  const ctrl = controlId ?? String(Math.floor(now.getTime() % 1e9)).padStart(6, '0')

  const segs = [
    `MSH|^~\\&|${esc(p.sendingApp || 'REGADT')}|${esc(p.sendingFacility || 'MCM')}|IFENG||${ts}||ADT^${event}|${ctrl}|P|2.5.1|1||`,
    `EVN|${event}|${ts}||1`,
    `PID|||${esc(p.patientId)}^^^HOPITAL^MRN||${esc(p.lastName).toUpperCase()}^${esc(p.firstName)}||${hl7Date(p.birthDate)}|${esc(p.gender)}|||${esc(p.address)}^^${esc(p.city)}^^${esc(p.zip)}^||${esc(p.phone)}`,
    `PV1|1|${esc(p.patientClass || 'I')}|${esc(p.location || 'CARDIO^CHAMBRE201^LIT1')}||||004777^MARTIN^SOPHIE^DR|||CARDIO|||||ADM|A0|`,
  ]
  if (p.sodium !== '' && p.sodium != null) {
    segs.push(`OBX|1|NM|2951-2^SODIUM||${esc(p.sodium)}|mmol/L|136-145||||F`)
  }
  return segs.join('\r')
}

/** Display form: \r -> newline */
export const toDisplay = (msg) => msg.replace(/\r/g, '\n')

/** Normalise a pasted raw message to \r separators. */
export const normalizeRaw = (raw) => raw.trim().replace(/\r\n|\n/g, '\r')

const FIRST = ['Anne', 'Camille', 'Jean', 'Marie', 'Louis', 'Claire', 'Paul', 'Aline', 'Hugo', 'Léa']
const LAST = ['VERSAIRE', 'CLAUDEL', 'PLEYEL', 'MARTIN', 'DUBOIS', 'LEROY', 'MOREAU', 'FOURNIER']
const pick = (a) => a[Math.floor(Math.random() * a.length)]

export function randomPatient() {
  const year = 1930 + Math.floor(Math.random() * 80)
  return {
    patientId: String(10000000 + Math.floor(Math.random() * 90000000)),
    firstName: pick(FIRST),
    lastName: pick(LAST),
    birthDate: `${year}-${pad(1 + Math.floor(Math.random() * 12))}-${pad(1 + Math.floor(Math.random() * 28))}`,
    gender: pick(['F', 'M']),
    sodium: String(135 + Math.floor(Math.random() * 11)),
  }
}

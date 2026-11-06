import test from 'node:test'
import assert from 'node:assert/strict'
import { buildAdt, hl7Timestamp, esc, normalizeRaw } from './hl7.js'

const p = { patientId: '24445670', firstName: 'Anne', lastName: 'Versaire', birthDate: '1985-01-24', gender: 'F', sodium: '140', event: 'A01' }
const now = new Date(2026, 10, 5, 18, 59, 14)

test('timestamp format', () => assert.equal(hl7Timestamp(now), '20261105185914'))
test('escape delimiters', () => assert.equal(esc('a|b^c&d~e'), 'a\\F\\b\\S\\c\\T\\d\\R\\e'))
test('ADT message structure', () => {
  const segs = buildAdt(p, now, '000001').split('\r')
  assert.equal(segs[0], 'MSH|^~\\&|REGADT|MCM|IFENG||20261105185914||ADT^A01|000001|P|2.5.1|1||')
  assert.match(segs[2], /^PID\|\|\|24445670\^\^\^HOPITAL\^MRN\|\|VERSAIRE\^Anne\|\|19850124\|F/)
  assert.match(segs[4], /^OBX\|1\|NM\|2951-2\^SODIUM\|\|140\|mmol\/L/)
})
test('no OBX without sodium', () => assert.equal(buildAdt({ ...p, sodium: '' }, now).includes('OBX'), false))
test('normalizeRaw', () => assert.equal(normalizeRaw('A\r\nB\nC\n'), 'A\rB\rC'))

#!/usr/bin/env python3
"""decode_dseg.py — decode a STAR.EXE dseg dump (DS:0x0000-0x7E80 raw).
IDA names encode LINEAR addresses for DS base 0x278E (linear 0x278E0);
true offset = IDA - 0x278E0, valid for ANY load segment (read DS live).
Usage: decode_dseg.py <dump.bin> [regs.json] [--scan]
  --scan: hunt planet-longitude words by matching decoded Real48 values
          against expected longitudes (discovers dseg offsets empirically).
"""
import json
import struct
import sys

IDA_DS_BASE = 0x278E0

def r48(bs):
    if bs[0] == 0:
        return 0.0
    m = bs[1] + (bs[2] << 8) + (bs[3] << 16) + (bs[4] << 24) + ((bs[5] & 0x7F) << 32)
    v = (1.0 + m / 2.0**39) * 2.0**(bs[0] - 129)
    return -v if (bs[5] & 0x80) else v

def get3(data, off):
    return r48(data[off:off + 6])

def geti(data, off):
    return struct.unpack('<h', data[off:off + 2])[0]

SUNRISE_WORDS = [
    (0x27DBA, 'sunrise'), (0x27DD2, 'sinhala'), (0x27BE0, 'JDfull'),
    (0x27BDA, 'JDnoon'), (0x27C40, 'sol-lon'), (0x27DA8, 'decl'),
    (0x27DD8, 'dd8'), (0x27DB4, 'EoT-h'), (0x27DAE, '12-X'),
    (0x27DCC, 'dayAng'), (0x27DC0, 'JDjan0'), (0x27C34, 'M'),
    (0x27C4C, 'T'), (0x27C2E, 'L0'), (0x27B8C, 'lagna'),
    (0x27C88, 'lagnaS'), (0x27C76, 'ayan'), (0x27C52, 'degfactor'),
    (0x27D84, 'tz'), (0x27C04, 'lon'), (0x27C0A, 'lat'),
    (0x27BFE, 'birthH'),
]
INT_WORDS = [(0x27E02, 'E02'), (0x27DEE, 'year'), (0x27DF0, 'month'),
             (0x27DF2, 'day'), (0x27E1C, 'hour'), (0x27E1E, 'minute')]

def main():
    path = sys.argv[1]
    regs = None
    for a in sys.argv[2:]:
        if not a.startswith('--'):
            regs = a
    scan = '--scan' in sys.argv
    data = open(path, 'rb').read()
    print('dump bytes: %d (expect 32384 = 0x7E80)' % len(data))
    if regs:
        r = json.load(open(regs))
        print('cpu ds=0x%X cs=0x%X ip=0x%X' % (
            r['registers']['ds'], r['registers']['cs'], r['registers']['eip']))
    print('true_off = IDA_linear - 0x278E0')
    for ida, lab in SUNRISE_WORDS:
        off = ida - IDA_DS_BASE
        v = get3(data, off)
        print('IDA %05X -> off %04X %-10s = %.8f  hex=%s' % (
            ida, off, lab, v, data[off:off + 6].hex()))
    for ida, lab in INT_WORDS:
        off = ida - IDA_DS_BASE
        print('IDA %05X -> off %04X %-10s = %d' % (ida, off, lab, geti(data, off)))
    if scan:
        print('--- (scan mode: use --expect NAME=deg pairs) ---')

if __name__ == '__main__':
    main()

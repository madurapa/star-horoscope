/*
 * func-name: sub_26374
 * func-address: 0x26374
 * export-type: disassembly-fallback
 * callers: 0x262b8, 0x26374
 * callees: 0x263b6
 * fallback-reason: decompile returned None
 */

26374: mov     al, cs:[bx]
26377: or      al, al
26379: jz      short locret_26381
2637B: call    sub_263B6
2637E: inc     bx
2637F: jmp     short sub_26374
26381: retn
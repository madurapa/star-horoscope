/*
 * func-name: sub_2638E
 * func-address: 0x2638e
 * export-type: disassembly-fallback
 * callers: 0x26382
 * callees: 0x263b6
 * fallback-reason: decompile returned None
 */

2638E: xor     ah, ah
26390: div     cl
26392: add     al, 30h ; '0'
26394: push    ax
26395: call    sub_263B6
26398: pop     ax
26399: mov     al, ah
2639B: retn
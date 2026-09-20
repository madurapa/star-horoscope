/*
 * func-name: sub_25FC7
 * func-address: 0x25fc7
 * export-type: disassembly-fallback
 * callers: 0x18760
 * callees: 0x26424, 0x26a12, 0x26a18
 * fallback-reason: decompile returned None
 */

25FC7: push    bp
25FC8: mov     bp, sp
25FCA: mov     ax, 6
25FCD: call    @__StackCheck$q4Word; Stack overflow check (AX)
25FD2: sub     sp, 6
25FD5: mov     ax, [bp+arg_0]
25FD8: mov     bx, [bp+arg_2]
25FDB: mov     dx, [bp+arg_4]
25FDE: mov     cx, 88h
25FE1: xor     si, si
25FE3: mov     di, 3400h
25FE6: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
25FEB: mov     cx, 2182h
25FEE: mov     si, 0DAA2h
25FF1: mov     di, 490Fh
25FF4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
25FF9: mov     [bp+var_6], ax
25FFC: mov     [bp+var_4], bx
25FFF: mov     [bp+var_2], dx
26002: mov     ax, [bp+var_6]
26005: mov     bx, [bp+var_4]
26008: mov     dx, [bp+var_2]
2600B: mov     sp, bp
2600D: pop     bp
2600E: retf    6
/*
 * func-name: sub_25F7D
 * func-address: 0x25f7d
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x18760
 * callees: 0x26424, 0x26a12, 0x26a18
 * fallback-reason: decompile returned None
 */

25F7D: push    bp
25F7E: mov     bp, sp
25F80: mov     ax, 6
25F83: call    @__StackCheck$q4Word; Stack overflow check (AX)
25F88: sub     sp, 6
25F8B: mov     ax, [bp+arg_0]
25F8E: mov     bx, [bp+arg_2]
25F91: mov     dx, [bp+arg_4]
25F94: mov     cx, 2182h
25F97: mov     si, 0DAA2h
25F9A: mov     di, 490Fh
25F9D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
25FA2: mov     cx, 88h
25FA5: xor     si, si
25FA7: mov     di, 3400h
25FAA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
25FAF: mov     [bp+var_6], ax
25FB2: mov     [bp+var_4], bx
25FB5: mov     [bp+var_2], dx
25FB8: mov     ax, [bp+var_6]
25FBB: mov     bx, [bp+var_4]
25FBE: mov     dx, [bp+var_2]
25FC1: mov     sp, bp
25FC3: pop     bp
25FC4: retf    6
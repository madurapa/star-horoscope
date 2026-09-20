/*
 * func-name: sub_25F30
 * func-address: 0x25f30
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x18760
 * callees: 0x26424, 0x26a18, 0x26b36, 0x26b49
 * fallback-reason: decompile returned None
 */

25F30: push    bp
25F31: mov     bp, sp
25F33: mov     ax, 6
25F36: call    @__StackCheck$q4Word; Stack overflow check (AX)
25F3B: sub     sp, 6
25F3E: mov     ax, [bp+arg_0]
25F41: mov     bx, [bp+arg_2]
25F44: mov     dx, [bp+arg_4]
25F47: call    far ptr @Sin$q4Real; Sin(x: Real): Real
25F4C: push    dx
25F4D: push    bx
25F4E: push    ax
25F4F: mov     ax, [bp+arg_0]
25F52: mov     bx, [bp+arg_2]
25F55: mov     dx, [bp+arg_4]
25F58: call    @Cos$q4Real; Cos(x: Real): Real
25F5D: pop     cx
25F5E: pop     si
25F5F: pop     di
25F60: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
25F65: mov     [bp+var_6], ax
25F68: mov     [bp+var_4], bx
25F6B: mov     [bp+var_2], dx
25F6E: mov     ax, [bp+var_6]
25F71: mov     bx, [bp+var_4]
25F74: mov     dx, [bp+var_2]
25F77: mov     sp, bp
25F79: pop     bp
25F7A: retf    6
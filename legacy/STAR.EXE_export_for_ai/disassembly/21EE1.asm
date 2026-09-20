/*
 * func-name: sub_21EE1
 * func-address: 0x21ee1
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x195d3, 0x220b3, 0x23a58
 * callees: 0x263ee, 0x26424, 0x26a00, 0x26a06, 0x26a12, 0x26a22, 0x26a26, 0x26a32, 0x26a74, 0x27681, 0x2772a, 0x27863
 * fallback-reason: decompile returned None
 */

21EE1: push    bp
21EE2: mov     bp, sp
21EE4: mov     ax, 12h
21EE7: call    @__StackCheck$q4Word; Stack overflow check (AX)
21EEC: sub     sp, 12h
21EEF: mov     ax, word_27B6E
21EF2: mov     bx, word_27B70
21EF6: mov     dx, word_27B72
21EFA: call    @Int$q4Real; Int(x: Real): Real
21EFF: mov     [bp+var_6], ax
21F02: mov     [bp+var_4], bx
21F05: mov     [bp+var_2], dx
21F08: mov     ax, word_27B6E
21F0B: mov     bx, word_27B70
21F0F: mov     dx, word_27B72
21F13: mov     cx, [bp+var_6]
21F16: mov     si, [bp+var_4]
21F19: mov     di, [bp+var_2]
21F1C: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
21F21: mov     cx, 86h
21F24: xor     si, si
21F26: mov     di, 7000h
21F29: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
21F2E: call    @Int$q4Real; Int(x: Real): Real
21F33: mov     [bp+var_C], ax
21F36: mov     [bp+var_A], bx
21F39: mov     [bp+var_8], dx
21F3C: mov     ax, word_27B6E
21F3F: mov     bx, word_27B70
21F43: mov     dx, word_27B72
21F47: mov     cx, [bp+var_6]
21F4A: mov     si, [bp+var_4]
21F4D: mov     di, [bp+var_2]
21F50: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
21F55: mov     cx, 86h
21F58: xor     si, si
21F5A: mov     di, 7000h
21F5D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
21F62: mov     [bp+var_12], ax
21F65: mov     [bp+var_10], bx
21F68: mov     [bp+var_E], dx
21F6B: mov     ax, [bp+var_12]
21F6E: mov     bx, [bp+var_10]
21F71: mov     dx, [bp+var_E]
21F74: mov     cx, [bp+var_C]
21F77: mov     si, [bp+var_A]
21F7A: mov     di, [bp+var_8]
21F7D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
21F82: mov     cx, 86h
21F85: xor     si, si
21F87: mov     di, 7000h
21F8A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
21F8F: mov     [bp+var_12], ax
21F92: mov     [bp+var_10], bx
21F95: mov     [bp+var_E], dx
21F98: mov     ax, [bp+var_12]
21F9B: mov     bx, [bp+var_10]
21F9E: mov     dx, [bp+var_E]
21FA1: mov     cx, 5C86h
21FA4: mov     si, 0C28Fh
21FA7: mov     di, 6FF5h
21FAA: call    @__Cmp$q4Realt1; Compare two reals
21FAF: jb      short loc_21FDE
21FB1: mov     ax, [bp+var_C]
21FB4: mov     bx, [bp+var_A]
21FB7: mov     dx, [bp+var_8]
21FBA: mov     cx, 81h
21FBD: xor     si, si
21FBF: xor     di, di
21FC1: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
21FC6: mov     [bp+var_C], ax
21FC9: mov     [bp+var_A], bx
21FCC: mov     [bp+var_8], dx
21FCF: mov     [bp+var_12], 0
21FD4: mov     [bp+var_10], 0
21FD9: mov     [bp+var_E], 0
21FDE: mov     ax, [bp+var_C]
21FE1: mov     bx, [bp+var_A]
21FE4: mov     dx, [bp+var_8]
21FE7: mov     cx, 5C86h
21FEA: mov     si, 0C28Fh
21FED: mov     di, 6FF5h
21FF0: call    @__Cmp$q4Realt1; Compare two reals
21FF5: jb      short loc_22024
21FF7: mov     ax, [bp+var_6]
21FFA: mov     bx, [bp+var_4]
21FFD: mov     dx, [bp+var_2]
22000: mov     cx, 81h
22003: xor     si, si
22005: xor     di, di
22007: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2200C: mov     [bp+var_6], ax
2200F: mov     [bp+var_4], bx
22012: mov     [bp+var_2], dx
22015: mov     [bp+var_C], 0
2201A: mov     [bp+var_A], 0
2201F: mov     [bp+var_8], 0
22024: mov     ax, [bp+var_12]
22027: mov     bx, [bp+var_10]
2202A: mov     dx, [bp+var_E]
2202D: call    @Round$q4Real; Round(x: Real): Longint
22032: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
22037: mov     [bp+var_12], ax
2203A: mov     [bp+var_10], bx
2203D: mov     [bp+var_E], dx
22040: mov     di, offset unk_2F60A
22043: push    ds
22044: push    di
22045: push    [bp+var_2]
22048: push    [bp+var_4]
2204B: push    [bp+var_6]
2204E: mov     ax, 5
22051: push    ax
22052: xor     ax, ax
22054: push    ax
22055: call    @Write$qm4Text4Real4Wordt3; Write(var f; v: Real; width, decimals: Word)
2205A: push    [bp+var_8]
2205D: push    [bp+var_A]
22060: push    [bp+var_C]
22063: mov     ax, 5
22066: push    ax
22067: xor     ax, ax
22069: push    ax
2206A: call    @Write$qm4Text4Real4Wordt3; Write(var f; v: Real; width, decimals: Word)
2206F: push    [bp+var_E]
22072: push    [bp+var_10]
22075: push    [bp+var_12]
22078: mov     ax, 7
2207B: push    ax
2207C: xor     ax, ax
2207E: push    ax
2207F: call    @Write$qm4Text4Real4Wordt3; Write(var f; v: Real; width, decimals: Word)
22084: call    @Write$qm4Text; Write(var f: Text)
22089: call    @__IOCheck$qv; Exit if error
2208E: mov     di, offset unk_2F60A
22091: push    ds
22092: push    di
22093: mov     di, offset byte_21EE0
22096: push    cs
22097: push    di
22098: xor     ax, ax
2209A: push    ax
2209B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
220A0: call    @Write$qm4Text; Write(var f: Text)
220A5: call    @__IOCheck$qv; Exit if error
220AA: mov     sp, bp
220AC: pop     bp
220AD: retf
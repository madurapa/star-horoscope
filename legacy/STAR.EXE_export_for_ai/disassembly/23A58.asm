/*
 * func-name: sub_23A58
 * func-address: 0x23a58
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x195d3
 * callees: 0x21ee1, 0x263ee, 0x263fc, 0x26424, 0x2650b, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a26, 0x26a2a, 0x26a74, 0x27662, 0x27681, 0x276c5, 0x2772a, 0x277c0
 * fallback-reason: decompile returned None
 */

23A58: push    bp
23A59: mov     bp, sp
23A5B: mov     ax, 32h ; '2'
23A5E: call    @__StackCheck$q4Word; Stack overflow check (AX)
23A63: sub     sp, 32h
23A66: mov     word_27D8A, 5584h
23A6C: mov     word_27D8C, 5555h
23A72: mov     word_27D8E, 5555h
23A78: mov     [bp+var_6], 5582h
23A7D: mov     [bp+var_4], 5555h
23A82: mov     [bp+var_2], 5555h
23A87: mov     [bp+var_22], 1
23A8C: xor     ax, ax
23A8E: mov     [bp+var_26], ax
23A91: jmp     short loc_23A96
23A93: inc     [bp+var_26]
23A96: mov     ax, [bp+var_26]
23A99: inc     ax
23A9A: cwd
23A9B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
23AA0: mov     cx, word_27D8A
23AA4: mov     si, word_27D8C
23AA8: mov     di, word_27D8E
23AAC: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23AB1: mov     cx, word_27B6E
23AB5: mov     si, word_27B70
23AB9: mov     di, word_27B72
23ABD: call    @__Cmp$q4Realt1; Compare two reals
23AC2: jnb     short loc_23AC8
23AC4: mov     al, 0
23AC6: jmp     short loc_23ACA
23AC8: mov     al, 1
23ACA: push    ax
23ACB: mov     ax, [bp+var_26]
23ACE: cwd
23ACF: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
23AD4: mov     cx, word_27D8A
23AD8: mov     si, word_27D8C
23ADC: mov     di, word_27D8E
23AE0: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23AE5: mov     cx, word_27B6E
23AE9: mov     si, word_27B70
23AED: mov     di, word_27B72
23AF1: call    @__Cmp$q4Realt1; Compare two reals
23AF6: jbe     short loc_23AFC
23AF8: mov     al, 0
23AFA: jmp     short loc_23AFE
23AFC: mov     al, 1
23AFE: pop     dx
23AFF: and     al, dl
23B01: or      al, al
23B03: jnz     short loc_23B08
23B05: jmp     loc_23CC6
23B08: mov     ax, [bp+var_26]
23B0B: inc     ax
23B0C: cwd
23B0D: mov     di, 1A0Eh
23B10: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23B15: mov     word_27DF4, ax
23B18: mov     ax, [bp+var_26]
23B1B: cwd
23B1C: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
23B21: mov     cx, word_27D8A
23B25: mov     si, word_27D8C
23B29: mov     di, word_27D8E
23B2D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23B32: push    dx
23B33: push    bx
23B34: push    ax
23B35: mov     ax, word_27B6E
23B38: mov     bx, word_27B70
23B3C: mov     dx, word_27B72
23B40: pop     cx
23B41: pop     si
23B42: pop     di
23B43: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23B48: mov     cx, [bp+var_6]
23B4B: mov     si, [bp+var_4]
23B4E: mov     di, [bp+var_2]
23B51: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23B56: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
23B5B: add     ax, 1
23B5E: adc     dx, 0
23B61: mov     di, 1A0Eh
23B64: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23B69: mov     word_27E22, ax
23B6C: mov     di, offset unk_2F60A
23B6F: push    ds
23B70: push    di
23B71: mov     ax, [bp+var_26]
23B74: inc     ax
23B75: cwd
23B76: mov     di, 1A16h
23B79: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23B7E: mov     dx, 0Dh
23B81: mul     dx
23B83: mov     di, ax
23B85: add     di, 742Dh
23B89: push    ds
23B8A: push    di
23B8B: xor     ax, ax
23B8D: push    ax
23B8E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
23B93: call    @Write$qm4Text; Write(var f: Text)
23B98: call    @__IOCheck$qv; Exit if error
23B9D: mov     di, offset unk_2F60A
23BA0: push    ds
23BA1: push    di
23BA2: mov     al, 20h ; ' '
23BA4: push    ax
23BA5: xor     ax, ax
23BA7: push    ax
23BA8: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
23BAD: mov     ax, word_27E22
23BB0: cwd
23BB1: mov     di, 1A1Eh
23BB4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23BB9: push    dx
23BBA: push    ax
23BBB: xor     ax, ax
23BBD: push    ax
23BBE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
23BC3: call    @Write$qm4Text; Write(var f: Text)
23BC8: call    @__IOCheck$qv; Exit if error
23BCD: mov     ax, [bp+var_26]
23BD0: inc     ax
23BD1: cwd
23BD2: mov     di, 1A16h
23BD5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23BDA: mov     dx, 0Dh
23BDD: mul     dx
23BDF: mov     di, ax
23BE1: add     di, 742Dh
23BE5: push    ds
23BE6: push    di
23BE7: mov     di, offset unk_29C18
23BEA: push    ds
23BEB: push    di
23BEC: mov     ax, 0FFh
23BEF: push    ax
23BF0: call    @$basg$qm6Stringt14Byte; Store string
23BF5: mov     ax, [bp+var_26]
23BF8: inc     ax
23BF9: cwd
23BFA: mov     di, 1A0Eh
23BFD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23C02: mov     word_27E0E, ax
23C05: mov     ax, word_27E22
23C08: cmp     ax, 1
23C0B: jnz     short loc_23C37
23C0D: mov     ax, [bp+var_22]
23C10: cwd
23C11: mov     di, 1A26h
23C14: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23C19: mov     dx, 0Bh
23C1C: mul     dx
23C1E: mov     di, ax
23C20: add     di, 758Fh
23C24: push    ds
23C25: push    di
23C26: mov     di, offset unk_28018
23C29: push    ds
23C2A: push    di
23C2B: mov     ax, 0FFh
23C2E: push    ax
23C2F: call    @$basg$qm6Stringt14Byte; Store string
23C34: jmp     loc_23CC6
23C37: cmp     ax, 2
23C3A: jnz     short loc_23C66
23C3C: mov     ax, [bp+var_22]
23C3F: inc     ax
23C40: cwd
23C41: mov     di, 1A26h
23C44: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23C49: mov     dx, 0Bh
23C4C: mul     dx
23C4E: mov     di, ax
23C50: add     di, 758Fh
23C54: push    ds
23C55: push    di
23C56: mov     di, offset unk_28018
23C59: push    ds
23C5A: push    di
23C5B: mov     ax, 0FFh
23C5E: push    ax
23C5F: call    @$basg$qm6Stringt14Byte; Store string
23C64: jmp     short loc_23CC6
23C66: cmp     ax, 3
23C69: jnz     short loc_23C97
23C6B: mov     ax, [bp+var_22]
23C6E: add     ax, 2
23C71: cwd
23C72: mov     di, 1A26h
23C75: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23C7A: mov     dx, 0Bh
23C7D: mul     dx
23C7F: mov     di, ax
23C81: add     di, 758Fh
23C85: push    ds
23C86: push    di
23C87: mov     di, offset unk_28018
23C8A: push    ds
23C8B: push    di
23C8C: mov     ax, 0FFh
23C8F: push    ax
23C90: call    @$basg$qm6Stringt14Byte; Store string
23C95: jmp     short loc_23CC6
23C97: cmp     ax, 4
23C9A: jnz     short loc_23CC6
23C9C: mov     ax, [bp+var_22]
23C9F: add     ax, 3
23CA2: cwd
23CA3: mov     di, 1A26h
23CA6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23CAB: mov     dx, 0Bh
23CAE: mul     dx
23CB0: mov     di, ax
23CB2: add     di, 758Fh
23CB6: push    ds
23CB7: push    di
23CB8: mov     di, offset unk_28018
23CBB: push    ds
23CBC: push    di
23CBD: mov     ax, 0FFh
23CC0: push    ax
23CC1: call    @$basg$qm6Stringt14Byte; Store string
23CC6: mov     ax, [bp+var_22]
23CC9: add     ax, 4
23CCC: cwd
23CCD: mov     di, 1A0Eh
23CD0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23CD5: mov     [bp+var_22], ax
23CD8: cmp     [bp+var_22], 0Ch
23CDC: jle     short loc_23CE3
23CDE: mov     [bp+var_22], 1
23CE3: cmp     [bp+var_26], 1Ah
23CE7: jz      short loc_23CEC
23CE9: jmp     loc_23A93
23CEC: mov     ax, word_27B6E
23CEF: mov     bx, word_27B70
23CF3: mov     dx, word_27B72
23CF7: mov     cx, 85h
23CFA: xor     si, si
23CFC: mov     di, 7000h
23CFF: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23D04: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
23D09: add     ax, 1
23D0C: adc     dx, 0
23D0F: mov     di, 1A0Eh
23D12: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
23D17: mov     [bp+var_2E], ax
23D1A: mov     ax, word_27B6E
23D1D: mov     bx, word_27B70
23D21: mov     dx, word_27B72
23D25: mov     cx, 85h
23D28: xor     si, si
23D2A: mov     di, 7000h
23D2D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23D32: call    @Int$q4Real; Int(x: Real): Real
23D37: push    dx
23D38: push    bx
23D39: push    ax
23D3A: mov     ax, word_27B6E
23D3D: mov     bx, word_27B70
23D41: mov     dx, word_27B72
23D45: mov     cx, 85h
23D48: xor     si, si
23D4A: mov     di, 7000h
23D4D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23D52: pop     cx
23D53: pop     si
23D54: pop     di
23D55: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23D5A: mov     cx, 85h
23D5D: xor     si, si
23D5F: mov     di, 7000h
23D62: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23D67: mov     cx, 84h
23D6A: xor     si, si
23D6C: mov     di, 7000h
23D6F: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23D74: mov     [bp+var_C], ax
23D77: mov     [bp+var_A], bx
23D7A: mov     [bp+var_8], dx
23D7D: mov     ax, [bp+var_C]
23D80: mov     bx, [bp+var_A]
23D83: mov     dx, [bp+var_8]
23D86: call    @Int$q4Real; Int(x: Real): Real
23D8B: mov     cx, 81h
23D8E: xor     si, si
23D90: xor     di, di
23D92: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
23D97: mov     [bp+var_12], ax
23D9A: mov     [bp+var_10], bx
23D9D: mov     [bp+var_E], dx
23DA0: mov     di, offset asc_2390E; "**     "
23DA3: push    cs
23DA4: push    di
23DA5: mov     di, offset unk_2C218
23DA8: push    ds
23DA9: push    di
23DAA: mov     ax, 0FFh
23DAD: push    ax
23DAE: call    @$basg$qm6Stringt14Byte; Store string
23DB3: mov     ax, [bp+var_12]
23DB6: mov     bx, [bp+var_10]
23DB9: mov     dx, [bp+var_E]
23DBC: mov     cx, 81h
23DBF: xor     si, si
23DC1: xor     di, di
23DC3: call    @__Cmp$q4Realt1; Compare two reals
23DC8: jz      short loc_23DCE
23DCA: mov     al, 0
23DCC: jmp     short loc_23DD0
23DCE: mov     al, 1
23DD0: mov     dl, al
23DD2: cmp     [bp+var_2E], 1
23DD6: jz      short loc_23DDC
23DD8: mov     al, 0
23DDA: jmp     short loc_23DDE
23DDC: mov     al, 1
23DDE: and     al, dl
23DE0: or      al, al
23DE2: jz      short loc_23DF7
23DE4: mov     di, offset unk_2EEA6
23DE7: push    ds
23DE8: push    di
23DE9: mov     di, offset unk_2C218
23DEC: push    ds
23DED: push    di
23DEE: mov     ax, 0FFh
23DF1: push    ax
23DF2: call    @$basg$qm6Stringt14Byte; Store string
23DF7: mov     ax, [bp+var_12]
23DFA: mov     bx, [bp+var_10]
23DFD: mov     dx, [bp+var_E]
23E00: mov     cx, 82h
23E03: xor     si, si
23E05: xor     di, di
23E07: call    @__Cmp$q4Realt1; Compare two reals
23E0C: jz      short loc_23E12
23E0E: mov     al, 0
23E10: jmp     short loc_23E14
23E12: mov     al, 1
23E14: mov     dl, al
23E16: cmp     [bp+var_2E], 1
23E1A: jz      short loc_23E20
23E1C: mov     al, 0
23E1E: jmp     short loc_23E22
23E20: mov     al, 1
23E22: and     al, dl
23E24: or      al, al
23E26: jz      short loc_23E3B
23E28: mov     di, offset unk_2EE9B
23E2B: push    ds
23E2C: push    di
23E2D: mov     di, offset unk_2C218
23E30: push    ds
23E31: push    di
23E32: mov     ax, 0FFh
23E35: push    ax
23E36: call    @$basg$qm6Stringt14Byte; Store string
23E3B: mov     ax, [bp+var_12]
23E3E: mov     bx, [bp+var_10]
23E41: mov     dx, [bp+var_E]
23E44: mov     cx, 81h
23E47: xor     si, si
23E49: xor     di, di
23E4B: call    @__Cmp$q4Realt1; Compare two reals
23E50: jz      short loc_23E56
23E52: mov     al, 0
23E54: jmp     short loc_23E58
23E56: mov     al, 1
23E58: mov     dl, al
23E5A: cmp     [bp+var_2E], 2
23E5E: jz      short loc_23E64
23E60: mov     al, 0
23E62: jmp     short loc_23E66
23E64: mov     al, 1
23E66: and     al, dl
23E68: or      al, al
23E6A: jz      short loc_23E7F
23E6C: mov     di, offset unk_2EE9B
23E6F: push    ds
23E70: push    di
23E71: mov     di, offset unk_2C218
23E74: push    ds
23E75: push    di
23E76: mov     ax, 0FFh
23E79: push    ax
23E7A: call    @$basg$qm6Stringt14Byte; Store string
23E7F: mov     ax, [bp+var_12]
23E82: mov     bx, [bp+var_10]
23E85: mov     dx, [bp+var_E]
23E88: mov     cx, 82h
23E8B: xor     si, si
23E8D: xor     di, di
23E8F: call    @__Cmp$q4Realt1; Compare two reals
23E94: jz      short loc_23E9A
23E96: mov     al, 0
23E98: jmp     short loc_23E9C
23E9A: mov     al, 1
23E9C: mov     dl, al
23E9E: cmp     [bp+var_2E], 2
23EA2: jz      short loc_23EA8
23EA4: mov     al, 0
23EA6: jmp     short loc_23EAA
23EA8: mov     al, 1
23EAA: and     al, dl
23EAC: or      al, al
23EAE: jz      short loc_23EC3
23EB0: mov     di, offset unk_2EEA6
23EB3: push    ds
23EB4: push    di
23EB5: mov     di, offset unk_2C218
23EB8: push    ds
23EB9: push    di
23EBA: mov     ax, 0FFh
23EBD: push    ax
23EBE: call    @$basg$qm6Stringt14Byte; Store string
23EC3: mov     ax, [bp+var_12]
23EC6: mov     bx, [bp+var_10]
23EC9: mov     dx, [bp+var_E]
23ECC: mov     cx, 81h
23ECF: xor     si, si
23ED1: xor     di, di
23ED3: call    @__Cmp$q4Realt1; Compare two reals
23ED8: jz      short loc_23EDE
23EDA: mov     al, 0
23EDC: jmp     short loc_23EE0
23EDE: mov     al, 1
23EE0: mov     dl, al
23EE2: cmp     [bp+var_2E], 3
23EE6: jz      short loc_23EEC
23EE8: mov     al, 0
23EEA: jmp     short loc_23EEE
23EEC: mov     al, 1
23EEE: and     al, dl
23EF0: or      al, al
23EF2: jz      short loc_23F07
23EF4: mov     di, offset unk_2EEA6
23EF7: push    ds
23EF8: push    di
23EF9: mov     di, offset unk_2C218
23EFC: push    ds
23EFD: push    di
23EFE: mov     ax, 0FFh
23F01: push    ax
23F02: call    @$basg$qm6Stringt14Byte; Store string
23F07: mov     ax, [bp+var_12]
23F0A: mov     bx, [bp+var_10]
23F0D: mov     dx, [bp+var_E]
23F10: mov     cx, 82h
23F13: xor     si, si
23F15: xor     di, di
23F17: call    @__Cmp$q4Realt1; Compare two reals
23F1C: jz      short loc_23F22
23F1E: mov     al, 0
23F20: jmp     short loc_23F24
23F22: mov     al, 1
23F24: mov     dl, al
23F26: cmp     [bp+var_2E], 3
23F2A: jz      short loc_23F30
23F2C: mov     al, 0
23F2E: jmp     short loc_23F32
23F30: mov     al, 1
23F32: and     al, dl
23F34: or      al, al
23F36: jz      short loc_23F4B
23F38: mov     di, offset unk_2EE9B
23F3B: push    ds
23F3C: push    di
23F3D: mov     di, offset unk_2C218
23F40: push    ds
23F41: push    di
23F42: mov     ax, 0FFh
23F45: push    ax
23F46: call    @$basg$qm6Stringt14Byte; Store string
23F4B: mov     ax, [bp+var_12]
23F4E: mov     bx, [bp+var_10]
23F51: mov     dx, [bp+var_E]
23F54: mov     cx, 81h
23F57: xor     si, si
23F59: xor     di, di
23F5B: call    @__Cmp$q4Realt1; Compare two reals
23F60: jz      short loc_23F66
23F62: mov     al, 0
23F64: jmp     short loc_23F68
23F66: mov     al, 1
23F68: mov     dl, al
23F6A: cmp     [bp+var_2E], 4
23F6E: jz      short loc_23F74
23F70: mov     al, 0
23F72: jmp     short loc_23F76
23F74: mov     al, 1
23F76: and     al, dl
23F78: or      al, al
23F7A: jz      short loc_23F8F
23F7C: mov     di, offset unk_2EE9B
23F7F: push    ds
23F80: push    di
23F81: mov     di, offset unk_2C218
23F84: push    ds
23F85: push    di
23F86: mov     ax, 0FFh
23F89: push    ax
23F8A: call    @$basg$qm6Stringt14Byte; Store string
23F8F: mov     ax, [bp+var_12]
23F92: mov     bx, [bp+var_10]
23F95: mov     dx, [bp+var_E]
23F98: mov     cx, 82h
23F9B: xor     si, si
23F9D: xor     di, di
23F9F: call    @__Cmp$q4Realt1; Compare two reals
23FA4: jz      short loc_23FAA
23FA6: mov     al, 0
23FA8: jmp     short loc_23FAC
23FAA: mov     al, 1
23FAC: mov     dl, al
23FAE: cmp     [bp+var_2E], 4
23FB2: jz      short loc_23FB8
23FB4: mov     al, 0
23FB6: jmp     short loc_23FBA
23FB8: mov     al, 1
23FBA: and     al, dl
23FBC: or      al, al
23FBE: jz      short loc_23FD3
23FC0: mov     di, offset unk_2EEA6
23FC3: push    ds
23FC4: push    di
23FC5: mov     di, offset unk_2C218
23FC8: push    ds
23FC9: push    di
23FCA: mov     ax, 0FFh
23FCD: push    ax
23FCE: call    @$basg$qm6Stringt14Byte; Store string
23FD3: mov     ax, [bp+var_12]
23FD6: mov     bx, [bp+var_10]
23FD9: mov     dx, [bp+var_E]
23FDC: mov     cx, 81h
23FDF: xor     si, si
23FE1: xor     di, di
23FE3: call    @__Cmp$q4Realt1; Compare two reals
23FE8: jz      short loc_23FEE
23FEA: mov     al, 0
23FEC: jmp     short loc_23FF0
23FEE: mov     al, 1
23FF0: mov     dl, al
23FF2: cmp     [bp+var_2E], 5
23FF6: jz      short loc_23FFC
23FF8: mov     al, 0
23FFA: jmp     short loc_23FFE
23FFC: mov     al, 1
23FFE: and     al, dl
24000: or      al, al
24002: jz      short loc_24017
24004: mov     di, offset unk_2EEA6
24007: push    ds
24008: push    di
24009: mov     di, offset unk_2C218
2400C: push    ds
2400D: push    di
2400E: mov     ax, 0FFh
24011: push    ax
24012: call    @$basg$qm6Stringt14Byte; Store string
24017: mov     ax, [bp+var_12]
2401A: mov     bx, [bp+var_10]
2401D: mov     dx, [bp+var_E]
24020: mov     cx, 82h
24023: xor     si, si
24025: xor     di, di
24027: call    @__Cmp$q4Realt1; Compare two reals
2402C: jz      short loc_24032
2402E: mov     al, 0
24030: jmp     short loc_24034
24032: mov     al, 1
24034: mov     dl, al
24036: cmp     [bp+var_2E], 5
2403A: jz      short loc_24040
2403C: mov     al, 0
2403E: jmp     short loc_24042
24040: mov     al, 1
24042: and     al, dl
24044: or      al, al
24046: jz      short loc_2405B
24048: mov     di, offset unk_2EE9B
2404B: push    ds
2404C: push    di
2404D: mov     di, offset unk_2C218
24050: push    ds
24051: push    di
24052: mov     ax, 0FFh
24055: push    ax
24056: call    @$basg$qm6Stringt14Byte; Store string
2405B: mov     ax, [bp+var_12]
2405E: mov     bx, [bp+var_10]
24061: mov     dx, [bp+var_E]
24064: mov     cx, 81h
24067: xor     si, si
24069: xor     di, di
2406B: call    @__Cmp$q4Realt1; Compare two reals
24070: jz      short loc_24076
24072: mov     al, 0
24074: jmp     short loc_24078
24076: mov     al, 1
24078: mov     dl, al
2407A: cmp     [bp+var_2E], 6
2407E: jz      short loc_24084
24080: mov     al, 0
24082: jmp     short loc_24086
24084: mov     al, 1
24086: and     al, dl
24088: or      al, al
2408A: jz      short loc_2409F
2408C: mov     di, offset unk_2EE9B
2408F: push    ds
24090: push    di
24091: mov     di, offset unk_2C218
24094: push    ds
24095: push    di
24096: mov     ax, 0FFh
24099: push    ax
2409A: call    @$basg$qm6Stringt14Byte; Store string
2409F: mov     ax, [bp+var_12]
240A2: mov     bx, [bp+var_10]
240A5: mov     dx, [bp+var_E]
240A8: mov     cx, 82h
240AB: xor     si, si
240AD: xor     di, di
240AF: call    @__Cmp$q4Realt1; Compare two reals
240B4: jz      short loc_240BA
240B6: mov     al, 0
240B8: jmp     short loc_240BC
240BA: mov     al, 1
240BC: mov     dl, al
240BE: cmp     [bp+var_2E], 6
240C2: jz      short loc_240C8
240C4: mov     al, 0
240C6: jmp     short loc_240CA
240C8: mov     al, 1
240CA: and     al, dl
240CC: or      al, al
240CE: jz      short loc_240E3
240D0: mov     di, offset unk_2EEA6
240D3: push    ds
240D4: push    di
240D5: mov     di, offset unk_2C218
240D8: push    ds
240D9: push    di
240DA: mov     ax, 0FFh
240DD: push    ax
240DE: call    @$basg$qm6Stringt14Byte; Store string
240E3: mov     ax, [bp+var_12]
240E6: mov     bx, [bp+var_10]
240E9: mov     dx, [bp+var_E]
240EC: mov     cx, 81h
240EF: xor     si, si
240F1: xor     di, di
240F3: call    @__Cmp$q4Realt1; Compare two reals
240F8: jz      short loc_240FE
240FA: mov     al, 0
240FC: jmp     short loc_24100
240FE: mov     al, 1
24100: mov     dl, al
24102: cmp     [bp+var_2E], 7
24106: jz      short loc_2410C
24108: mov     al, 0
2410A: jmp     short loc_2410E
2410C: mov     al, 1
2410E: and     al, dl
24110: or      al, al
24112: jz      short loc_24127
24114: mov     di, offset unk_2EEA6
24117: push    ds
24118: push    di
24119: mov     di, offset unk_2C218
2411C: push    ds
2411D: push    di
2411E: mov     ax, 0FFh
24121: push    ax
24122: call    @$basg$qm6Stringt14Byte; Store string
24127: mov     ax, [bp+var_12]
2412A: mov     bx, [bp+var_10]
2412D: mov     dx, [bp+var_E]
24130: mov     cx, 82h
24133: xor     si, si
24135: xor     di, di
24137: call    @__Cmp$q4Realt1; Compare two reals
2413C: jz      short loc_24142
2413E: mov     al, 0
24140: jmp     short loc_24144
24142: mov     al, 1
24144: mov     dl, al
24146: cmp     [bp+var_2E], 7
2414A: jz      short loc_24150
2414C: mov     al, 0
2414E: jmp     short loc_24152
24150: mov     al, 1
24152: and     al, dl
24154: or      al, al
24156: jz      short loc_2416B
24158: mov     di, offset unk_2EE9B
2415B: push    ds
2415C: push    di
2415D: mov     di, offset unk_2C218
24160: push    ds
24161: push    di
24162: mov     ax, 0FFh
24165: push    ax
24166: call    @$basg$qm6Stringt14Byte; Store string
2416B: mov     ax, [bp+var_12]
2416E: mov     bx, [bp+var_10]
24171: mov     dx, [bp+var_E]
24174: mov     cx, 81h
24177: xor     si, si
24179: xor     di, di
2417B: call    @__Cmp$q4Realt1; Compare two reals
24180: jz      short loc_24186
24182: mov     al, 0
24184: jmp     short loc_24188
24186: mov     al, 1
24188: mov     dl, al
2418A: cmp     [bp+var_2E], 8
2418E: jz      short loc_24194
24190: mov     al, 0
24192: jmp     short loc_24196
24194: mov     al, 1
24196: and     al, dl
24198: or      al, al
2419A: jz      short loc_241AF
2419C: mov     di, offset unk_2EE9B
2419F: push    ds
241A0: push    di
241A1: mov     di, offset unk_2C218
241A4: push    ds
241A5: push    di
241A6: mov     ax, 0FFh
241A9: push    ax
241AA: call    @$basg$qm6Stringt14Byte; Store string
241AF: mov     ax, [bp+var_12]
241B2: mov     bx, [bp+var_10]
241B5: mov     dx, [bp+var_E]
241B8: mov     cx, 82h
241BB: xor     si, si
241BD: xor     di, di
241BF: call    @__Cmp$q4Realt1; Compare two reals
241C4: jz      short loc_241CA
241C6: mov     al, 0
241C8: jmp     short loc_241CC
241CA: mov     al, 1
241CC: mov     dl, al
241CE: cmp     [bp+var_2E], 8
241D2: jz      short loc_241D8
241D4: mov     al, 0
241D6: jmp     short loc_241DA
241D8: mov     al, 1
241DA: and     al, dl
241DC: or      al, al
241DE: jz      short loc_241F3
241E0: mov     di, offset unk_2EEA6
241E3: push    ds
241E4: push    di
241E5: mov     di, offset unk_2C218
241E8: push    ds
241E9: push    di
241EA: mov     ax, 0FFh
241ED: push    ax
241EE: call    @$basg$qm6Stringt14Byte; Store string
241F3: mov     ax, [bp+var_12]
241F6: mov     bx, [bp+var_10]
241F9: mov     dx, [bp+var_E]
241FC: mov     cx, 81h
241FF: xor     si, si
24201: xor     di, di
24203: call    @__Cmp$q4Realt1; Compare two reals
24208: jz      short loc_2420E
2420A: mov     al, 0
2420C: jmp     short loc_24210
2420E: mov     al, 1
24210: mov     dl, al
24212: cmp     [bp+var_2E], 9
24216: jz      short loc_2421C
24218: mov     al, 0
2421A: jmp     short loc_2421E
2421C: mov     al, 1
2421E: and     al, dl
24220: or      al, al
24222: jz      short loc_24237
24224: mov     di, offset unk_2EEA6
24227: push    ds
24228: push    di
24229: mov     di, offset unk_2C218
2422C: push    ds
2422D: push    di
2422E: mov     ax, 0FFh
24231: push    ax
24232: call    @$basg$qm6Stringt14Byte; Store string
24237: mov     ax, [bp+var_12]
2423A: mov     bx, [bp+var_10]
2423D: mov     dx, [bp+var_E]
24240: mov     cx, 82h
24243: xor     si, si
24245: xor     di, di
24247: call    @__Cmp$q4Realt1; Compare two reals
2424C: jz      short loc_24252
2424E: mov     al, 0
24250: jmp     short loc_24254
24252: mov     al, 1
24254: mov     dl, al
24256: cmp     [bp+var_2E], 9
2425A: jz      short loc_24260
2425C: mov     al, 0
2425E: jmp     short loc_24262
24260: mov     al, 1
24262: and     al, dl
24264: or      al, al
24266: jz      short loc_2427B
24268: mov     di, offset unk_2EE9B
2426B: push    ds
2426C: push    di
2426D: mov     di, offset unk_2C218
24270: push    ds
24271: push    di
24272: mov     ax, 0FFh
24275: push    ax
24276: call    @$basg$qm6Stringt14Byte; Store string
2427B: mov     ax, [bp+var_12]
2427E: mov     bx, [bp+var_10]
24281: mov     dx, [bp+var_E]
24284: mov     cx, 81h
24287: xor     si, si
24289: xor     di, di
2428B: call    @__Cmp$q4Realt1; Compare two reals
24290: jz      short loc_24296
24292: mov     al, 0
24294: jmp     short loc_24298
24296: mov     al, 1
24298: mov     dl, al
2429A: cmp     [bp+var_2E], 0Ah
2429E: jz      short loc_242A4
242A0: mov     al, 0
242A2: jmp     short loc_242A6
242A4: mov     al, 1
242A6: and     al, dl
242A8: or      al, al
242AA: jz      short loc_242BF
242AC: mov     di, offset unk_2EE9B
242AF: push    ds
242B0: push    di
242B1: mov     di, offset unk_2C218
242B4: push    ds
242B5: push    di
242B6: mov     ax, 0FFh
242B9: push    ax
242BA: call    @$basg$qm6Stringt14Byte; Store string
242BF: mov     ax, [bp+var_12]
242C2: mov     bx, [bp+var_10]
242C5: mov     dx, [bp+var_E]
242C8: mov     cx, 82h
242CB: xor     si, si
242CD: xor     di, di
242CF: call    @__Cmp$q4Realt1; Compare two reals
242D4: jz      short loc_242DA
242D6: mov     al, 0
242D8: jmp     short loc_242DC
242DA: mov     al, 1
242DC: mov     dl, al
242DE: cmp     [bp+var_2E], 0Ah
242E2: jz      short loc_242E8
242E4: mov     al, 0
242E6: jmp     short loc_242EA
242E8: mov     al, 1
242EA: and     al, dl
242EC: or      al, al
242EE: jz      short loc_24303
242F0: mov     di, offset unk_2EEA6
242F3: push    ds
242F4: push    di
242F5: mov     di, offset unk_2C218
242F8: push    ds
242F9: push    di
242FA: mov     ax, 0FFh
242FD: push    ax
242FE: call    @$basg$qm6Stringt14Byte; Store string
24303: mov     ax, [bp+var_12]
24306: mov     bx, [bp+var_10]
24309: mov     dx, [bp+var_E]
2430C: mov     cx, 81h
2430F: xor     si, si
24311: xor     di, di
24313: call    @__Cmp$q4Realt1; Compare two reals
24318: jz      short loc_2431E
2431A: mov     al, 0
2431C: jmp     short loc_24320
2431E: mov     al, 1
24320: mov     dl, al
24322: cmp     [bp+var_2E], 0Bh
24326: jz      short loc_2432C
24328: mov     al, 0
2432A: jmp     short loc_2432E
2432C: mov     al, 1
2432E: and     al, dl
24330: or      al, al
24332: jz      short loc_24347
24334: mov     di, offset unk_2EEA6
24337: push    ds
24338: push    di
24339: mov     di, offset unk_2C218
2433C: push    ds
2433D: push    di
2433E: mov     ax, 0FFh
24341: push    ax
24342: call    @$basg$qm6Stringt14Byte; Store string
24347: mov     ax, [bp+var_12]
2434A: mov     bx, [bp+var_10]
2434D: mov     dx, [bp+var_E]
24350: mov     cx, 82h
24353: xor     si, si
24355: xor     di, di
24357: call    @__Cmp$q4Realt1; Compare two reals
2435C: jz      short loc_24362
2435E: mov     al, 0
24360: jmp     short loc_24364
24362: mov     al, 1
24364: mov     dl, al
24366: cmp     [bp+var_2E], 0Bh
2436A: jz      short loc_24370
2436C: mov     al, 0
2436E: jmp     short loc_24372
24370: mov     al, 1
24372: and     al, dl
24374: or      al, al
24376: jz      short loc_2438B
24378: mov     di, offset unk_2EE9B
2437B: push    ds
2437C: push    di
2437D: mov     di, offset unk_2C218
24380: push    ds
24381: push    di
24382: mov     ax, 0FFh
24385: push    ax
24386: call    @$basg$qm6Stringt14Byte; Store string
2438B: mov     ax, [bp+var_12]
2438E: mov     bx, [bp+var_10]
24391: mov     dx, [bp+var_E]
24394: mov     cx, 81h
24397: xor     si, si
24399: xor     di, di
2439B: call    @__Cmp$q4Realt1; Compare two reals
243A0: jz      short loc_243A6
243A2: mov     al, 0
243A4: jmp     short loc_243A8
243A6: mov     al, 1
243A8: mov     dl, al
243AA: cmp     [bp+var_2E], 0Ch
243AE: jz      short loc_243B4
243B0: mov     al, 0
243B2: jmp     short loc_243B6
243B4: mov     al, 1
243B6: and     al, dl
243B8: or      al, al
243BA: jz      short loc_243CF
243BC: mov     di, offset unk_2EE9B
243BF: push    ds
243C0: push    di
243C1: mov     di, offset unk_2C218
243C4: push    ds
243C5: push    di
243C6: mov     ax, 0FFh
243C9: push    ax
243CA: call    @$basg$qm6Stringt14Byte; Store string
243CF: mov     ax, [bp+var_12]
243D2: mov     bx, [bp+var_10]
243D5: mov     dx, [bp+var_E]
243D8: mov     cx, 82h
243DB: xor     si, si
243DD: xor     di, di
243DF: call    @__Cmp$q4Realt1; Compare two reals
243E4: jz      short loc_243EA
243E6: mov     al, 0
243E8: jmp     short loc_243EC
243EA: mov     al, 1
243EC: mov     dl, al
243EE: cmp     [bp+var_2E], 0Ch
243F2: jz      short loc_243F8
243F4: mov     al, 0
243F6: jmp     short loc_243FA
243F8: mov     al, 1
243FA: and     al, dl
243FC: or      al, al
243FE: jz      short loc_24413
24400: mov     di, offset unk_2EEA6
24403: push    ds
24404: push    di
24405: mov     di, offset unk_2C218
24408: push    ds
24409: push    di
2440A: mov     ax, 0FFh
2440D: push    ax
2440E: call    @$basg$qm6Stringt14Byte; Store string
24413: mov     ax, word_27B6E
24416: mov     bx, word_27B70
2441A: mov     dx, word_27B72
2441E: mov     cx, 85h
24421: xor     si, si
24423: mov     di, 7000h
24426: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2442B: call    @Int$q4Real; Int(x: Real): Real
24430: push    dx
24431: push    bx
24432: push    ax
24433: mov     ax, word_27B6E
24436: mov     bx, word_27B70
2443A: mov     dx, word_27B72
2443E: mov     cx, 85h
24441: xor     si, si
24443: mov     di, 7000h
24446: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2444B: pop     cx
2444C: pop     si
2444D: pop     di
2444E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24453: mov     cx, 85h
24456: xor     si, si
24458: mov     di, 7000h
2445B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
24460: mov     cx, 84h
24463: xor     si, si
24465: mov     di, 2000h
24468: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2446D: mov     [bp+var_18], ax
24470: mov     [bp+var_16], bx
24473: mov     [bp+var_14], dx
24476: mov     ax, [bp+var_18]
24479: mov     bx, [bp+var_16]
2447C: mov     dx, [bp+var_14]
2447F: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24484: add     ax, 1
24487: adc     dx, 0
2448A: mov     di, 1A0Eh
2448D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24492: mov     [bp+var_28], ax
24495: mov     di, offset asc_23916; "**    "
24498: push    cs
24499: push    di
2449A: mov     di, offset unk_2D018
2449D: push    ds
2449E: push    di
2449F: mov     ax, 0FFh
244A2: push    ax
244A3: call    @$basg$qm6Stringt14Byte; Store string
244A8: mov     [bp+var_26], 1
244AD: jmp     short loc_244B2
244AF: inc     [bp+var_26]
244B2: mov     ax, [bp+var_26]
244B5: cwd
244B6: mov     di, 1A0Eh
244B9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
244BE: mov     [bp+var_24], ax
244C1: mov     [bp+var_22], 1
244C6: jmp     short loc_244CB
244C8: inc     [bp+var_22]
244CB: mov     ax, [bp+var_28]
244CE: cmp     ax, [bp+var_22]
244D1: jz      short loc_244D7
244D3: mov     al, 0
244D5: jmp     short loc_244D9
244D7: mov     al, 1
244D9: mov     dl, al
244DB: mov     ax, [bp+var_2E]
244DE: cmp     ax, [bp+var_26]
244E1: jz      short loc_244E7
244E3: mov     al, 0
244E5: jmp     short loc_244E9
244E7: mov     al, 1
244E9: and     al, dl
244EB: or      al, al
244ED: jz      short loc_24516
244EF: mov     ax, [bp+var_24]
244F2: cwd
244F3: mov     di, 1A26h
244F6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
244FB: mov     dx, 0Bh
244FE: mul     dx
24500: mov     di, ax
24502: add     di, 758Fh
24506: push    ds
24507: push    di
24508: mov     di, offset unk_2D018
2450B: push    ds
2450C: push    di
2450D: mov     ax, 0FFh
24510: push    ax
24511: call    @$basg$qm6Stringt14Byte; Store string
24516: mov     ax, [bp+var_24]
24519: add     ax, 4
2451C: cwd
2451D: mov     di, 1A0Eh
24520: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24525: mov     [bp+var_24], ax
24528: cmp     [bp+var_24], 0Ch
2452C: jle     short loc_24540
2452E: mov     ax, [bp+var_24]
24531: sub     ax, 0Ch
24534: cwd
24535: mov     di, 1A0Eh
24538: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2453D: mov     [bp+var_24], ax
24540: cmp     [bp+var_22], 3
24544: jnz     short loc_244C8
24546: cmp     [bp+var_26], 0Ch
2454A: jz      short loc_2454F
2454C: jmp     loc_244AF
2454F: mov     ax, word_27B6E
24552: mov     bx, word_27B70
24556: mov     dx, word_27B72
2455A: mov     cx, 85h
2455D: xor     si, si
2455F: mov     di, 7000h
24562: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
24567: call    @Int$q4Real; Int(x: Real): Real
2456C: push    dx
2456D: push    bx
2456E: push    ax
2456F: mov     ax, word_27B6E
24572: mov     bx, word_27B70
24576: mov     dx, word_27B72
2457A: mov     cx, 85h
2457D: xor     si, si
2457F: mov     di, 7000h
24582: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
24587: pop     cx
24588: pop     si
24589: pop     di
2458A: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2458F: mov     cx, 85h
24592: xor     si, si
24594: mov     di, 7000h
24597: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2459C: mov     cx, 82h
2459F: xor     si, si
245A1: mov     di, 2000h
245A4: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
245A9: mov     [bp+var_1E], ax
245AC: mov     [bp+var_1C], bx
245AF: mov     [bp+var_1A], dx
245B2: mov     ax, [bp+var_1E]
245B5: mov     bx, [bp+var_1C]
245B8: mov     dx, [bp+var_1A]
245BB: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
245C0: add     ax, 1
245C3: adc     dx, 0
245C6: mov     di, 1A0Eh
245C9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
245CE: mov     [bp+var_2A], ax
245D1: mov     di, offset asc_2391D; "**         "
245D4: push    cs
245D5: push    di
245D6: mov     di, offset unk_2DE18
245D9: push    ds
245DA: push    di
245DB: mov     ax, 0FFh
245DE: push    ax
245DF: call    @$basg$qm6Stringt14Byte; Store string
245E4: mov     [bp+var_26], 1
245E9: jmp     short loc_245EE
245EB: inc     [bp+var_26]
245EE: mov     ax, [bp+var_26]
245F1: cwd
245F2: mov     di, 1A0Eh
245F5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
245FA: mov     [bp+var_24], ax
245FD: mov     [bp+var_22], 1
24602: jmp     short loc_24607
24604: inc     [bp+var_22]
24607: mov     ax, [bp+var_2A]
2460A: cmp     ax, [bp+var_22]
2460D: jz      short loc_24613
2460F: mov     al, 0
24611: jmp     short loc_24615
24613: mov     al, 1
24615: mov     dl, al
24617: mov     ax, [bp+var_2E]
2461A: cmp     ax, [bp+var_26]
2461D: jz      short loc_24623
2461F: mov     al, 0
24621: jmp     short loc_24625
24623: mov     al, 1
24625: and     al, dl
24627: or      al, al
24629: jz      short loc_24652
2462B: mov     ax, [bp+var_24]
2462E: cwd
2462F: mov     di, 1A26h
24632: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24637: mov     dx, 0Bh
2463A: mul     dx
2463C: mov     di, ax
2463E: add     di, 758Fh
24642: push    ds
24643: push    di
24644: mov     di, offset unk_2DE18
24647: push    ds
24648: push    di
24649: mov     ax, 0FFh
2464C: push    ax
2464D: call    @$basg$qm6Stringt14Byte; Store string
24652: mov     ax, [bp+var_24]
24655: inc     ax
24656: cwd
24657: mov     di, 1A0Eh
2465A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2465F: mov     [bp+var_24], ax
24662: cmp     [bp+var_24], 0Ch
24666: jle     short loc_2467A
24668: mov     ax, [bp+var_24]
2466B: sub     ax, 0Ch
2466E: cwd
2466F: mov     di, 1A0Eh
24672: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24677: mov     [bp+var_24], ax
2467A: cmp     [bp+var_22], 0Ch
2467E: jnz     short loc_24604
24680: cmp     [bp+var_26], 0Ch
24684: jz      short loc_24689
24686: jmp     loc_245EB
24689: mov     di, offset asc_23916; "**    "
2468C: push    cs
2468D: push    di
2468E: mov     di, offset unk_2EC18
24691: push    ds
24692: push    di
24693: mov     ax, 0FFh
24696: push    ax
24697: call    @$basg$qm6Stringt14Byte; Store string
2469C: mov     ax, word_27B6E
2469F: mov     bx, word_27B70
246A3: mov     dx, word_27B72
246A7: mov     cx, 85h
246AA: xor     si, si
246AC: mov     di, 7000h
246AF: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
246B4: call    @Int$q4Real; Int(x: Real): Real
246B9: push    dx
246BA: push    bx
246BB: push    ax
246BC: mov     ax, word_27B6E
246BF: mov     bx, word_27B70
246C3: mov     dx, word_27B72
246C7: mov     cx, 85h
246CA: xor     si, si
246CC: mov     di, 7000h
246CF: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
246D4: pop     cx
246D5: pop     si
246D6: pop     di
246D7: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
246DC: mov     cx, 85h
246DF: xor     si, si
246E1: mov     di, 7000h
246E4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
246E9: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
246EE: add     ax, 1
246F1: adc     dx, 0
246F4: mov     di, 1A0Eh
246F7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
246FC: mov     [bp+var_2C], ax
246FF: mov     ax, [bp+var_2E]
24702: cmp     ax, 1
24705: jz      short loc_24720
24707: cmp     ax, 3
2470A: jz      short loc_24720
2470C: cmp     ax, 5
2470F: jz      short loc_24720
24711: cmp     ax, 7
24714: jz      short loc_24720
24716: cmp     ax, 9
24719: jz      short loc_24720
2471B: cmp     ax, 0Bh
2471E: jnz     short loc_24727
24720: mov     [bp+var_30], 1
24725: jmp     short loc_2472C
24727: mov     [bp+var_30], 2
2472C: cmp     [bp+var_2C], 5
24730: jl      short loc_24736
24732: mov     al, 0
24734: jmp     short loc_24738
24736: mov     al, 1
24738: mov     cl, al
2473A: cmp     [bp+var_2C], 0
2473E: jge     short loc_24744
24740: mov     al, 0
24742: jmp     short loc_24746
24744: mov     al, 1
24746: mov     dl, al
24748: cmp     [bp+var_30], 1
2474C: jz      short loc_24752
2474E: mov     al, 0
24750: jmp     short loc_24754
24752: mov     al, 1
24754: and     al, dl
24756: and     al, cl
24758: or      al, al
2475A: jz      short loc_2476F
2475C: mov     di, offset unk_2EE7A
2475F: push    ds
24760: push    di
24761: mov     di, offset unk_2EC18
24764: push    ds
24765: push    di
24766: mov     ax, 0FFh
24769: push    ax
2476A: call    @$basg$qm6Stringt14Byte; Store string
2476F: cmp     [bp+var_2C], 0Ah
24773: jl      short loc_24779
24775: mov     al, 0
24777: jmp     short loc_2477B
24779: mov     al, 1
2477B: mov     cl, al
2477D: cmp     [bp+var_2C], 5
24781: jge     short loc_24787
24783: mov     al, 0
24785: jmp     short loc_24789
24787: mov     al, 1
24789: mov     dl, al
2478B: cmp     [bp+var_30], 1
2478F: jz      short loc_24795
24791: mov     al, 0
24793: jmp     short loc_24797
24795: mov     al, 1
24797: and     al, dl
24799: and     al, cl
2479B: or      al, al
2479D: jz      short loc_247B2
2479F: mov     di, offset unk_2EEE8
247A2: push    ds
247A3: push    di
247A4: mov     di, offset unk_2EC18
247A7: push    ds
247A8: push    di
247A9: mov     ax, 0FFh
247AC: push    ax
247AD: call    @$basg$qm6Stringt14Byte; Store string
247B2: cmp     [bp+var_2C], 12h
247B6: jl      short loc_247BC
247B8: mov     al, 0
247BA: jmp     short loc_247BE
247BC: mov     al, 1
247BE: mov     cl, al
247C0: cmp     [bp+var_2C], 0Ah
247C4: jge     short loc_247CA
247C6: mov     al, 0
247C8: jmp     short loc_247CC
247CA: mov     al, 1
247CC: mov     dl, al
247CE: cmp     [bp+var_30], 1
247D2: jz      short loc_247D8
247D4: mov     al, 0
247D6: jmp     short loc_247DA
247D8: mov     al, 1
247DA: and     al, dl
247DC: and     al, cl
247DE: or      al, al
247E0: jz      short loc_247F5
247E2: mov     di, offset unk_2EED2
247E5: push    ds
247E6: push    di
247E7: mov     di, offset unk_2EC18
247EA: push    ds
247EB: push    di
247EC: mov     ax, 0FFh
247EF: push    ax
247F0: call    @$basg$qm6Stringt14Byte; Store string
247F5: cmp     [bp+var_2C], 19h
247F9: jl      short loc_247FF
247FB: mov     al, 0
247FD: jmp     short loc_24801
247FF: mov     al, 1
24801: mov     cl, al
24803: cmp     [bp+var_2C], 12h
24807: jge     short loc_2480D
24809: mov     al, 0
2480B: jmp     short loc_2480F
2480D: mov     al, 1
2480F: mov     dl, al
24811: cmp     [bp+var_30], 1
24815: jz      short loc_2481B
24817: mov     al, 0
24819: jmp     short loc_2481D
2481B: mov     al, 1
2481D: and     al, dl
2481F: and     al, cl
24821: or      al, al
24823: jz      short loc_24838
24825: mov     di, offset unk_2EE90
24828: push    ds
24829: push    di
2482A: mov     di, offset unk_2EC18
2482D: push    ds
2482E: push    di
2482F: mov     ax, 0FFh
24832: push    ax
24833: call    @$basg$qm6Stringt14Byte; Store string
24838: cmp     [bp+var_2C], 1Eh
2483C: jle     short loc_24842
2483E: mov     al, 0
24840: jmp     short loc_24844
24842: mov     al, 1
24844: mov     cl, al
24846: cmp     [bp+var_2C], 19h
2484A: jge     short loc_24850
2484C: mov     al, 0
2484E: jmp     short loc_24852
24850: mov     al, 1
24852: mov     dl, al
24854: cmp     [bp+var_30], 1
24858: jz      short loc_2485E
2485A: mov     al, 0
2485C: jmp     short loc_24860
2485E: mov     al, 1
24860: and     al, dl
24862: and     al, cl
24864: or      al, al
24866: jz      short loc_2487B
24868: mov     di, offset unk_2EEBC
2486B: push    ds
2486C: push    di
2486D: mov     di, offset unk_2EC18
24870: push    ds
24871: push    di
24872: mov     ax, 0FFh
24875: push    ax
24876: call    @$basg$qm6Stringt14Byte; Store string
2487B: cmp     [bp+var_2C], 5
2487F: jl      short loc_24885
24881: mov     al, 0
24883: jmp     short loc_24887
24885: mov     al, 1
24887: mov     cl, al
24889: cmp     [bp+var_2C], 0
2488D: jge     short loc_24893
2488F: mov     al, 0
24891: jmp     short loc_24895
24893: mov     al, 1
24895: mov     dl, al
24897: cmp     [bp+var_30], 2
2489B: jz      short loc_248A1
2489D: mov     al, 0
2489F: jmp     short loc_248A3
248A1: mov     al, 1
248A3: and     al, dl
248A5: and     al, cl
248A7: or      al, al
248A9: jz      short loc_248BE
248AB: mov     di, offset unk_2EE85
248AE: push    ds
248AF: push    di
248B0: mov     di, offset unk_2EC18
248B3: push    ds
248B4: push    di
248B5: mov     ax, 0FFh
248B8: push    ax
248B9: call    @$basg$qm6Stringt14Byte; Store string
248BE: cmp     [bp+var_2C], 0Ch
248C2: jl      short loc_248C8
248C4: mov     al, 0
248C6: jmp     short loc_248CA
248C8: mov     al, 1
248CA: mov     cl, al
248CC: cmp     [bp+var_2C], 5
248D0: jge     short loc_248D6
248D2: mov     al, 0
248D4: jmp     short loc_248D8
248D6: mov     al, 1
248D8: mov     dl, al
248DA: cmp     [bp+var_30], 2
248DE: jz      short loc_248E4
248E0: mov     al, 0
248E2: jmp     short loc_248E6
248E4: mov     al, 1
248E6: and     al, dl
248E8: and     al, cl
248EA: or      al, al
248EC: jz      short loc_24901
248EE: mov     di, offset unk_2EEB1
248F1: push    ds
248F2: push    di
248F3: mov     di, offset unk_2EC18
248F6: push    ds
248F7: push    di
248F8: mov     ax, 0FFh
248FB: push    ax
248FC: call    @$basg$qm6Stringt14Byte; Store string
24901: cmp     [bp+var_2C], 14h
24905: jl      short loc_2490B
24907: mov     al, 0
24909: jmp     short loc_2490D
2490B: mov     al, 1
2490D: mov     cl, al
2490F: cmp     [bp+var_2C], 0Ch
24913: jge     short loc_24919
24915: mov     al, 0
24917: jmp     short loc_2491B
24919: mov     al, 1
2491B: mov     dl, al
2491D: cmp     [bp+var_30], 2
24921: jz      short loc_24927
24923: mov     al, 0
24925: jmp     short loc_24929
24927: mov     al, 1
24929: and     al, dl
2492B: and     al, cl
2492D: or      al, al
2492F: jz      short loc_24944
24931: mov     di, offset unk_2EEF3
24934: push    ds
24935: push    di
24936: mov     di, offset unk_2EC18
24939: push    ds
2493A: push    di
2493B: mov     ax, 0FFh
2493E: push    ax
2493F: call    @$basg$qm6Stringt14Byte; Store string
24944: cmp     [bp+var_2C], 19h
24948: jl      short loc_2494E
2494A: mov     al, 0
2494C: jmp     short loc_24950
2494E: mov     al, 1
24950: mov     cl, al
24952: cmp     [bp+var_2C], 14h
24956: jge     short loc_2495C
24958: mov     al, 0
2495A: jmp     short loc_2495E
2495C: mov     al, 1
2495E: mov     dl, al
24960: cmp     [bp+var_30], 2
24964: jz      short loc_2496A
24966: mov     al, 0
24968: jmp     short loc_2496C
2496A: mov     al, 1
2496C: and     al, dl
2496E: and     al, cl
24970: or      al, al
24972: jz      short loc_24987
24974: mov     di, offset unk_2EEDD
24977: push    ds
24978: push    di
24979: mov     di, offset unk_2EC18
2497C: push    ds
2497D: push    di
2497E: mov     ax, 0FFh
24981: push    ax
24982: call    @$basg$qm6Stringt14Byte; Store string
24987: cmp     [bp+var_2C], 1Eh
2498B: jle     short loc_24991
2498D: mov     al, 0
2498F: jmp     short loc_24993
24991: mov     al, 1
24993: mov     cl, al
24995: cmp     [bp+var_2C], 19h
24999: jge     short loc_2499F
2499B: mov     al, 0
2499D: jmp     short loc_249A1
2499F: mov     al, 1
249A1: mov     dl, al
249A3: cmp     [bp+var_30], 2
249A7: jz      short loc_249AD
249A9: mov     al, 0
249AB: jmp     short loc_249AF
249AD: mov     al, 1
249AF: and     al, dl
249B1: and     al, cl
249B3: or      al, al
249B5: jz      short loc_249CA
249B7: mov     di, offset unk_2EE85
249BA: push    ds
249BB: push    di
249BC: mov     di, offset unk_2EC18
249BF: push    ds
249C0: push    di
249C1: mov     ax, 0FFh
249C4: push    ax
249C5: call    @$basg$qm6Stringt14Byte; Store string
249CA: mov     ax, word_27B6E
249CD: mov     bx, word_27B70
249D1: mov     dx, word_27B72
249D5: mov     cx, 85h
249D8: xor     si, si
249DA: mov     di, 7000h
249DD: call    @__Cmp$q4Realt1; Compare two reals
249E2: jbe     short loc_249E8
249E4: mov     al, 0
249E6: jmp     short loc_249EA
249E8: mov     al, 1
249EA: push    ax
249EB: mov     ax, word_27B6E
249EE: mov     bx, word_27B70
249F2: mov     dx, word_27B72
249F6: xor     cx, cx
249F8: xor     si, si
249FA: xor     di, di
249FC: call    @__Cmp$q4Realt1; Compare two reals
24A01: jnb     short loc_24A07
24A03: mov     al, 0
24A05: jmp     short loc_24A09
24A07: mov     al, 1
24A09: pop     dx
24A0A: and     al, dl
24A0C: or      al, al
24A0E: jnz     short loc_24A13
24A10: jmp     loc_24A99
24A13: mov     word_27DFC, 1
24A19: mov     di, offset unk_2F60A
24A1C: push    ds
24A1D: push    di
24A1E: mov     di, offset aMesha_0; " Mesha   "
24A21: push    cs
24A22: push    di
24A23: xor     ax, ax
24A25: push    ax
24A26: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24A2B: call    @Write$qm4Text; Write(var f: Text)
24A30: call    @__IOCheck$qv; Exit if error
24A35: mov     ax, word_27B6E
24A38: mov     bx, word_27B70
24A3C: mov     dx, word_27B72
24A40: mov     word_27B6E, ax
24A43: mov     word_27B70, bx
24A47: mov     word_27B72, dx
24A4B: mov     ax, word_27B6E
24A4E: mov     bx, word_27B70
24A52: mov     dx, word_27B72
24A56: mov     word_27DE4, ax
24A59: mov     word_27DE6, bx
24A5D: mov     word_27DE8, dx
24A61: mov     ax, word_27B6E
24A64: mov     bx, word_27B70
24A68: mov     dx, word_27B72
24A6C: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24A71: add     ax, 1
24A74: adc     dx, 0
24A77: mov     di, 1A0Eh
24A7A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24A7F: mov     word_27E00, ax
24A82: push    cs
24A83: call    near ptr sub_21EE1
24A86: mov     di, offset unk_2EE7A
24A89: push    ds
24A8A: push    di
24A8B: mov     di, offset unk_28118
24A8E: push    ds
24A8F: push    di
24A90: mov     ax, 0FFh
24A93: push    ax
24A94: call    @$basg$qm6Stringt14Byte; Store string
24A99: mov     ax, word_27B6E
24A9C: mov     bx, word_27B70
24AA0: mov     dx, word_27B72
24AA4: mov     cx, 86h
24AA7: xor     si, si
24AA9: mov     di, 7000h
24AAC: call    @__Cmp$q4Realt1; Compare two reals
24AB1: jbe     short loc_24AB7
24AB3: mov     al, 0
24AB5: jmp     short loc_24AB9
24AB7: mov     al, 1
24AB9: push    ax
24ABA: mov     ax, word_27B6E
24ABD: mov     bx, word_27B70
24AC1: mov     dx, word_27B72
24AC5: mov     cx, 85h
24AC8: xor     si, si
24ACA: mov     di, 7000h
24ACD: call    @__Cmp$q4Realt1; Compare two reals
24AD2: ja      short loc_24AD8
24AD4: mov     al, 0
24AD6: jmp     short loc_24ADA
24AD8: mov     al, 1
24ADA: pop     dx
24ADB: and     al, dl
24ADD: or      al, al
24ADF: jnz     short loc_24AE4
24AE1: jmp     loc_24B77
24AE4: mov     word_27DFC, 2
24AEA: mov     di, offset unk_2F60A
24AED: push    ds
24AEE: push    di
24AEF: mov     di, offset aWrushaba_0; " Wrushaba"
24AF2: push    cs
24AF3: push    di
24AF4: xor     ax, ax
24AF6: push    ax
24AF7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24AFC: call    @Write$qm4Text; Write(var f: Text)
24B01: call    @__IOCheck$qv; Exit if error
24B06: mov     ax, word_27B6E
24B09: mov     bx, word_27B70
24B0D: mov     dx, word_27B72
24B11: mov     cx, 85h
24B14: xor     si, si
24B16: mov     di, 7000h
24B19: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24B1E: mov     word_27B6E, ax
24B21: mov     word_27B70, bx
24B25: mov     word_27B72, dx
24B29: mov     ax, word_27B6E
24B2C: mov     bx, word_27B70
24B30: mov     dx, word_27B72
24B34: mov     word_27DE4, ax
24B37: mov     word_27DE6, bx
24B3B: mov     word_27DE8, dx
24B3F: mov     ax, word_27B6E
24B42: mov     bx, word_27B70
24B46: mov     dx, word_27B72
24B4A: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24B4F: add     ax, 1
24B52: adc     dx, 0
24B55: mov     di, 1A0Eh
24B58: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24B5D: mov     word_27E00, ax
24B60: push    cs
24B61: call    near ptr sub_21EE1
24B64: mov     di, offset unk_2EE85
24B67: push    ds
24B68: push    di
24B69: mov     di, offset unk_28118
24B6C: push    ds
24B6D: push    di
24B6E: mov     ax, 0FFh
24B71: push    ax
24B72: call    @$basg$qm6Stringt14Byte; Store string
24B77: mov     ax, word_27B6E
24B7A: mov     bx, word_27B70
24B7E: mov     dx, word_27B72
24B82: mov     cx, 87h
24B85: xor     si, si
24B87: mov     di, 3400h
24B8A: call    @__Cmp$q4Realt1; Compare two reals
24B8F: jbe     short loc_24B95
24B91: mov     al, 0
24B93: jmp     short loc_24B97
24B95: mov     al, 1
24B97: push    ax
24B98: mov     ax, word_27B6E
24B9B: mov     bx, word_27B70
24B9F: mov     dx, word_27B72
24BA3: mov     cx, 86h
24BA6: xor     si, si
24BA8: mov     di, 7000h
24BAB: call    @__Cmp$q4Realt1; Compare two reals
24BB0: ja      short loc_24BB6
24BB2: mov     al, 0
24BB4: jmp     short loc_24BB8
24BB6: mov     al, 1
24BB8: pop     dx
24BB9: and     al, dl
24BBB: or      al, al
24BBD: jnz     short loc_24BC2
24BBF: jmp     loc_24C55
24BC2: mov     word_27DFC, 3
24BC8: mov     di, offset unk_2F60A
24BCB: push    ds
24BCC: push    di
24BCD: mov     di, offset aMithuna; " Mithuna "
24BD0: push    cs
24BD1: push    di
24BD2: xor     ax, ax
24BD4: push    ax
24BD5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24BDA: call    @Write$qm4Text; Write(var f: Text)
24BDF: call    @__IOCheck$qv; Exit if error
24BE4: mov     ax, word_27B6E
24BE7: mov     bx, word_27B70
24BEB: mov     dx, word_27B72
24BEF: mov     cx, 86h
24BF2: xor     si, si
24BF4: mov     di, 7000h
24BF7: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24BFC: mov     word_27B6E, ax
24BFF: mov     word_27B70, bx
24C03: mov     word_27B72, dx
24C07: mov     ax, word_27B6E
24C0A: mov     bx, word_27B70
24C0E: mov     dx, word_27B72
24C12: mov     word_27DE4, ax
24C15: mov     word_27DE6, bx
24C19: mov     word_27DE8, dx
24C1D: mov     ax, word_27B6E
24C20: mov     bx, word_27B70
24C24: mov     dx, word_27B72
24C28: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24C2D: add     ax, 1
24C30: adc     dx, 0
24C33: mov     di, 1A0Eh
24C36: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24C3B: mov     word_27E00, ax
24C3E: push    cs
24C3F: call    near ptr sub_21EE1
24C42: mov     di, offset unk_2EE90
24C45: push    ds
24C46: push    di
24C47: mov     di, offset unk_28118
24C4A: push    ds
24C4B: push    di
24C4C: mov     ax, 0FFh
24C4F: push    ax
24C50: call    @$basg$qm6Stringt14Byte; Store string
24C55: mov     ax, word_27B6E
24C58: mov     bx, word_27B70
24C5C: mov     dx, word_27B72
24C60: mov     cx, 87h
24C63: xor     si, si
24C65: mov     di, 7000h
24C68: call    @__Cmp$q4Realt1; Compare two reals
24C6D: jbe     short loc_24C73
24C6F: mov     al, 0
24C71: jmp     short loc_24C75
24C73: mov     al, 1
24C75: push    ax
24C76: mov     ax, word_27B6E
24C79: mov     bx, word_27B70
24C7D: mov     dx, word_27B72
24C81: mov     cx, 87h
24C84: xor     si, si
24C86: mov     di, 3400h
24C89: call    @__Cmp$q4Realt1; Compare two reals
24C8E: ja      short loc_24C94
24C90: mov     al, 0
24C92: jmp     short loc_24C96
24C94: mov     al, 1
24C96: pop     dx
24C97: and     al, dl
24C99: or      al, al
24C9B: jnz     short loc_24CA0
24C9D: jmp     loc_24D33
24CA0: mov     word_27DFC, 4
24CA6: mov     di, offset unk_2F60A
24CA9: push    ds
24CAA: push    di
24CAB: mov     di, offset aKataka_0; " Kataka  "
24CAE: push    cs
24CAF: push    di
24CB0: xor     ax, ax
24CB2: push    ax
24CB3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24CB8: call    @Write$qm4Text; Write(var f: Text)
24CBD: call    @__IOCheck$qv; Exit if error
24CC2: mov     ax, word_27B6E
24CC5: mov     bx, word_27B70
24CC9: mov     dx, word_27B72
24CCD: mov     cx, 87h
24CD0: xor     si, si
24CD2: mov     di, 3400h
24CD5: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24CDA: mov     word_27B6E, ax
24CDD: mov     word_27B70, bx
24CE1: mov     word_27B72, dx
24CE5: mov     ax, word_27B6E
24CE8: mov     bx, word_27B70
24CEC: mov     dx, word_27B72
24CF0: mov     word_27DE4, ax
24CF3: mov     word_27DE6, bx
24CF7: mov     word_27DE8, dx
24CFB: mov     ax, word_27B6E
24CFE: mov     bx, word_27B70
24D02: mov     dx, word_27B72
24D06: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24D0B: add     ax, 1
24D0E: adc     dx, 0
24D11: mov     di, 1A0Eh
24D14: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24D19: mov     word_27E00, ax
24D1C: push    cs
24D1D: call    near ptr sub_21EE1
24D20: mov     di, offset unk_2EE9B
24D23: push    ds
24D24: push    di
24D25: mov     di, offset unk_28118
24D28: push    ds
24D29: push    di
24D2A: mov     ax, 0FFh
24D2D: push    ax
24D2E: call    @$basg$qm6Stringt14Byte; Store string
24D33: mov     ax, word_27B6E
24D36: mov     bx, word_27B70
24D3A: mov     dx, word_27B72
24D3E: mov     cx, 88h
24D41: xor     si, si
24D43: mov     di, 1600h
24D46: call    @__Cmp$q4Realt1; Compare two reals
24D4B: jbe     short loc_24D51
24D4D: mov     al, 0
24D4F: jmp     short loc_24D53
24D51: mov     al, 1
24D53: push    ax
24D54: mov     ax, word_27B6E
24D57: mov     bx, word_27B70
24D5B: mov     dx, word_27B72
24D5F: mov     cx, 87h
24D62: xor     si, si
24D64: mov     di, 7000h
24D67: call    @__Cmp$q4Realt1; Compare two reals
24D6C: ja      short loc_24D72
24D6E: mov     al, 0
24D70: jmp     short loc_24D74
24D72: mov     al, 1
24D74: pop     dx
24D75: and     al, dl
24D77: or      al, al
24D79: jnz     short loc_24D7E
24D7B: jmp     loc_24E11
24D7E: mov     word_27DFC, 5
24D84: mov     di, offset unk_2F60A
24D87: push    ds
24D88: push    di
24D89: mov     di, offset aSinha_1; " Sinha   "
24D8C: push    cs
24D8D: push    di
24D8E: xor     ax, ax
24D90: push    ax
24D91: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24D96: call    @Write$qm4Text; Write(var f: Text)
24D9B: call    @__IOCheck$qv; Exit if error
24DA0: mov     ax, word_27B6E
24DA3: mov     bx, word_27B70
24DA7: mov     dx, word_27B72
24DAB: mov     cx, 87h
24DAE: xor     si, si
24DB0: mov     di, 7000h
24DB3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24DB8: mov     word_27B6E, ax
24DBB: mov     word_27B70, bx
24DBF: mov     word_27B72, dx
24DC3: mov     ax, word_27B6E
24DC6: mov     bx, word_27B70
24DCA: mov     dx, word_27B72
24DCE: mov     word_27DE4, ax
24DD1: mov     word_27DE6, bx
24DD5: mov     word_27DE8, dx
24DD9: mov     ax, word_27B6E
24DDC: mov     bx, word_27B70
24DE0: mov     dx, word_27B72
24DE4: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24DE9: add     ax, 1
24DEC: adc     dx, 0
24DEF: mov     di, 1A0Eh
24DF2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24DF7: mov     word_27E00, ax
24DFA: push    cs
24DFB: call    near ptr sub_21EE1
24DFE: mov     di, offset unk_2EEA6
24E01: push    ds
24E02: push    di
24E03: mov     di, offset unk_28118
24E06: push    ds
24E07: push    di
24E08: mov     ax, 0FFh
24E0B: push    ax
24E0C: call    @$basg$qm6Stringt14Byte; Store string
24E11: mov     ax, word_27B6E
24E14: mov     bx, word_27B70
24E18: mov     dx, word_27B72
24E1C: mov     cx, 88h
24E1F: xor     si, si
24E21: mov     di, 3400h
24E24: call    @__Cmp$q4Realt1; Compare two reals
24E29: jbe     short loc_24E2F
24E2B: mov     al, 0
24E2D: jmp     short loc_24E31
24E2F: mov     al, 1
24E31: push    ax
24E32: mov     ax, word_27B6E
24E35: mov     bx, word_27B70
24E39: mov     dx, word_27B72
24E3D: mov     cx, 88h
24E40: xor     si, si
24E42: mov     di, 1600h
24E45: call    @__Cmp$q4Realt1; Compare two reals
24E4A: ja      short loc_24E50
24E4C: mov     al, 0
24E4E: jmp     short loc_24E52
24E50: mov     al, 1
24E52: pop     dx
24E53: and     al, dl
24E55: or      al, al
24E57: jnz     short loc_24E5C
24E59: jmp     loc_24EEF
24E5C: mov     word_27DFC, 6
24E62: mov     di, offset unk_2F60A
24E65: push    ds
24E66: push    di
24E67: mov     di, offset aKanya_0; " Kanya   "
24E6A: push    cs
24E6B: push    di
24E6C: xor     ax, ax
24E6E: push    ax
24E6F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24E74: call    @Write$qm4Text; Write(var f: Text)
24E79: call    @__IOCheck$qv; Exit if error
24E7E: mov     ax, word_27B6E
24E81: mov     bx, word_27B70
24E85: mov     dx, word_27B72
24E89: mov     cx, 88h
24E8C: xor     si, si
24E8E: mov     di, 1600h
24E91: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24E96: mov     word_27B6E, ax
24E99: mov     word_27B70, bx
24E9D: mov     word_27B72, dx
24EA1: mov     ax, word_27B6E
24EA4: mov     bx, word_27B70
24EA8: mov     dx, word_27B72
24EAC: mov     word_27DE4, ax
24EAF: mov     word_27DE6, bx
24EB3: mov     word_27DE8, dx
24EB7: mov     ax, word_27B6E
24EBA: mov     bx, word_27B70
24EBE: mov     dx, word_27B72
24EC2: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24EC7: add     ax, 1
24ECA: adc     dx, 0
24ECD: mov     di, 1A0Eh
24ED0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24ED5: mov     word_27E00, ax
24ED8: push    cs
24ED9: call    near ptr sub_21EE1
24EDC: mov     di, offset unk_2EEB1
24EDF: push    ds
24EE0: push    di
24EE1: mov     di, offset unk_28118
24EE4: push    ds
24EE5: push    di
24EE6: mov     ax, 0FFh
24EE9: push    ax
24EEA: call    @$basg$qm6Stringt14Byte; Store string
24EEF: mov     ax, word_27B6E
24EF2: mov     bx, word_27B70
24EF6: mov     dx, word_27B72
24EFA: mov     cx, 88h
24EFD: xor     si, si
24EFF: mov     di, 5200h
24F02: call    @__Cmp$q4Realt1; Compare two reals
24F07: jbe     short loc_24F0D
24F09: mov     al, 0
24F0B: jmp     short loc_24F0F
24F0D: mov     al, 1
24F0F: push    ax
24F10: mov     ax, word_27B6E
24F13: mov     bx, word_27B70
24F17: mov     dx, word_27B72
24F1B: mov     cx, 88h
24F1E: xor     si, si
24F20: mov     di, 3400h
24F23: call    @__Cmp$q4Realt1; Compare two reals
24F28: ja      short loc_24F2E
24F2A: mov     al, 0
24F2C: jmp     short loc_24F30
24F2E: mov     al, 1
24F30: pop     dx
24F31: and     al, dl
24F33: or      al, al
24F35: jnz     short loc_24F3A
24F37: jmp     loc_24FCD
24F3A: mov     word_27DFC, 7
24F40: mov     di, offset unk_2F60A
24F43: push    ds
24F44: push    di
24F45: mov     di, offset aThula_0; " Thula   "
24F48: push    cs
24F49: push    di
24F4A: xor     ax, ax
24F4C: push    ax
24F4D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
24F52: call    @Write$qm4Text; Write(var f: Text)
24F57: call    @__IOCheck$qv; Exit if error
24F5C: mov     ax, word_27B6E
24F5F: mov     bx, word_27B70
24F63: mov     dx, word_27B72
24F67: mov     cx, 88h
24F6A: xor     si, si
24F6C: mov     di, 3400h
24F6F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
24F74: mov     word_27B6E, ax
24F77: mov     word_27B70, bx
24F7B: mov     word_27B72, dx
24F7F: mov     ax, word_27B6E
24F82: mov     bx, word_27B70
24F86: mov     dx, word_27B72
24F8A: mov     word_27DE4, ax
24F8D: mov     word_27DE6, bx
24F91: mov     word_27DE8, dx
24F95: mov     ax, word_27B6E
24F98: mov     bx, word_27B70
24F9C: mov     dx, word_27B72
24FA0: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
24FA5: add     ax, 1
24FA8: adc     dx, 0
24FAB: mov     di, 1A0Eh
24FAE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
24FB3: mov     word_27E00, ax
24FB6: push    cs
24FB7: call    near ptr sub_21EE1
24FBA: mov     di, offset unk_2EEBC
24FBD: push    ds
24FBE: push    di
24FBF: mov     di, offset unk_28118
24FC2: push    ds
24FC3: push    di
24FC4: mov     ax, 0FFh
24FC7: push    ax
24FC8: call    @$basg$qm6Stringt14Byte; Store string
24FCD: mov     ax, word_27B6E
24FD0: mov     bx, word_27B70
24FD4: mov     dx, word_27B72
24FD8: mov     cx, 88h
24FDB: xor     si, si
24FDD: mov     di, 7000h
24FE0: call    @__Cmp$q4Realt1; Compare two reals
24FE5: jbe     short loc_24FEB
24FE7: mov     al, 0
24FE9: jmp     short loc_24FED
24FEB: mov     al, 1
24FED: push    ax
24FEE: mov     ax, word_27B6E
24FF1: mov     bx, word_27B70
24FF5: mov     dx, word_27B72
24FF9: mov     cx, 88h
24FFC: xor     si, si
24FFE: mov     di, 5200h
25001: call    @__Cmp$q4Realt1; Compare two reals
25006: ja      short loc_2500C
25008: mov     al, 0
2500A: jmp     short loc_2500E
2500C: mov     al, 1
2500E: pop     dx
2500F: and     al, dl
25011: or      al, al
25013: jnz     short loc_25018
25015: jmp     loc_250AB
25018: mov     word_27DFC, 8
2501E: mov     di, offset unk_2F60A
25021: push    ds
25022: push    di
25023: mov     di, offset aWrschika_0; " Wrschika"
25026: push    cs
25027: push    di
25028: xor     ax, ax
2502A: push    ax
2502B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
25030: call    @Write$qm4Text; Write(var f: Text)
25035: call    @__IOCheck$qv; Exit if error
2503A: mov     ax, word_27B6E
2503D: mov     bx, word_27B70
25041: mov     dx, word_27B72
25045: mov     cx, 88h
25048: xor     si, si
2504A: mov     di, 5200h
2504D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
25052: mov     word_27B6E, ax
25055: mov     word_27B70, bx
25059: mov     word_27B72, dx
2505D: mov     ax, word_27B6E
25060: mov     bx, word_27B70
25064: mov     dx, word_27B72
25068: mov     word_27DE4, ax
2506B: mov     word_27DE6, bx
2506F: mov     word_27DE8, dx
25073: mov     ax, word_27B6E
25076: mov     bx, word_27B70
2507A: mov     dx, word_27B72
2507E: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
25083: add     ax, 1
25086: adc     dx, 0
25089: mov     di, 1A0Eh
2508C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
25091: mov     word_27E00, ax
25094: push    cs
25095: call    near ptr sub_21EE1
25098: mov     di, offset unk_2EEC7
2509B: push    ds
2509C: push    di
2509D: mov     di, offset unk_28118
250A0: push    ds
250A1: push    di
250A2: mov     ax, 0FFh
250A5: push    ax
250A6: call    @$basg$qm6Stringt14Byte; Store string
250AB: mov     ax, word_27B6E
250AE: mov     bx, word_27B70
250B2: mov     dx, word_27B72
250B6: mov     cx, 89h
250B9: xor     si, si
250BB: mov     di, 700h
250BE: call    @__Cmp$q4Realt1; Compare two reals
250C3: jbe     short loc_250C9
250C5: mov     al, 0
250C7: jmp     short loc_250CB
250C9: mov     al, 1
250CB: push    ax
250CC: mov     ax, word_27B6E
250CF: mov     bx, word_27B70
250D3: mov     dx, word_27B72
250D7: mov     cx, 88h
250DA: xor     si, si
250DC: mov     di, 7000h
250DF: call    @__Cmp$q4Realt1; Compare two reals
250E4: ja      short loc_250EA
250E6: mov     al, 0
250E8: jmp     short loc_250EC
250EA: mov     al, 1
250EC: pop     dx
250ED: and     al, dl
250EF: or      al, al
250F1: jnz     short loc_250F6
250F3: jmp     loc_25189
250F6: mov     word_27DFC, 9
250FC: mov     di, offset unk_2F60A
250FF: push    ds
25100: push    di
25101: mov     di, offset aDhanu_0; " Dhanu   "
25104: push    cs
25105: push    di
25106: xor     ax, ax
25108: push    ax
25109: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2510E: call    @Write$qm4Text; Write(var f: Text)
25113: call    @__IOCheck$qv; Exit if error
25118: mov     ax, word_27B6E
2511B: mov     bx, word_27B70
2511F: mov     dx, word_27B72
25123: mov     cx, 88h
25126: xor     si, si
25128: mov     di, 7000h
2512B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
25130: mov     word_27B6E, ax
25133: mov     word_27B70, bx
25137: mov     word_27B72, dx
2513B: mov     ax, word_27B6E
2513E: mov     bx, word_27B70
25142: mov     dx, word_27B72
25146: mov     word_27DE4, ax
25149: mov     word_27DE6, bx
2514D: mov     word_27DE8, dx
25151: mov     ax, word_27B6E
25154: mov     bx, word_27B70
25158: mov     dx, word_27B72
2515C: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
25161: add     ax, 1
25164: adc     dx, 0
25167: mov     di, 1A0Eh
2516A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2516F: mov     word_27E00, ax
25172: push    cs
25173: call    near ptr sub_21EE1
25176: mov     di, offset unk_2EED2
25179: push    ds
2517A: push    di
2517B: mov     di, offset unk_28118
2517E: push    ds
2517F: push    di
25180: mov     ax, 0FFh
25183: push    ax
25184: call    @$basg$qm6Stringt14Byte; Store string
25189: mov     ax, word_27B6E
2518C: mov     bx, word_27B70
25190: mov     dx, word_27B72
25194: mov     cx, 89h
25197: xor     si, si
25199: mov     di, 1600h
2519C: call    @__Cmp$q4Realt1; Compare two reals
251A1: jbe     short loc_251A7
251A3: mov     al, 0
251A5: jmp     short loc_251A9
251A7: mov     al, 1
251A9: push    ax
251AA: mov     ax, word_27B6E
251AD: mov     bx, word_27B70
251B1: mov     dx, word_27B72
251B5: mov     cx, 89h
251B8: xor     si, si
251BA: mov     di, 700h
251BD: call    @__Cmp$q4Realt1; Compare two reals
251C2: ja      short loc_251C8
251C4: mov     al, 0
251C6: jmp     short loc_251CA
251C8: mov     al, 1
251CA: pop     dx
251CB: and     al, dl
251CD: or      al, al
251CF: jnz     short loc_251D4
251D1: jmp     loc_25267
251D4: mov     word_27DFC, 0Ah
251DA: mov     di, offset unk_2F60A
251DD: push    ds
251DE: push    di
251DF: mov     di, offset aMakara_0; " Makara  "
251E2: push    cs
251E3: push    di
251E4: xor     ax, ax
251E6: push    ax
251E7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
251EC: call    @Write$qm4Text; Write(var f: Text)
251F1: call    @__IOCheck$qv; Exit if error
251F6: mov     ax, word_27B6E
251F9: mov     bx, word_27B70
251FD: mov     dx, word_27B72
25201: mov     cx, 89h
25204: xor     si, si
25206: mov     di, 700h
25209: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2520E: mov     word_27B6E, ax
25211: mov     word_27B70, bx
25215: mov     word_27B72, dx
25219: mov     ax, word_27B6E
2521C: mov     bx, word_27B70
25220: mov     dx, word_27B72
25224: mov     word_27DE4, ax
25227: mov     word_27DE6, bx
2522B: mov     word_27DE8, dx
2522F: mov     ax, word_27B6E
25232: mov     bx, word_27B70
25236: mov     dx, word_27B72
2523A: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
2523F: add     ax, 1
25242: adc     dx, 0
25245: mov     di, 1A0Eh
25248: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2524D: mov     word_27E00, ax
25250: push    cs
25251: call    near ptr sub_21EE1
25254: mov     di, offset unk_2EEDD
25257: push    ds
25258: push    di
25259: mov     di, offset unk_28118
2525C: push    ds
2525D: push    di
2525E: mov     ax, 0FFh
25261: push    ax
25262: call    @$basg$qm6Stringt14Byte; Store string
25267: mov     ax, word_27B6E
2526A: mov     bx, word_27B70
2526E: mov     dx, word_27B72
25272: mov     cx, 89h
25275: xor     si, si
25277: mov     di, 2500h
2527A: call    @__Cmp$q4Realt1; Compare two reals
2527F: jbe     short loc_25285
25281: mov     al, 0
25283: jmp     short loc_25287
25285: mov     al, 1
25287: push    ax
25288: mov     ax, word_27B6E
2528B: mov     bx, word_27B70
2528F: mov     dx, word_27B72
25293: mov     cx, 89h
25296: xor     si, si
25298: mov     di, 1600h
2529B: call    @__Cmp$q4Realt1; Compare two reals
252A0: ja      short loc_252A6
252A2: mov     al, 0
252A4: jmp     short loc_252A8
252A6: mov     al, 1
252A8: pop     dx
252A9: and     al, dl
252AB: or      al, al
252AD: jnz     short loc_252B2
252AF: jmp     loc_25345
252B2: mov     word_27DFC, 0Bh
252B8: mov     di, offset unk_2F60A
252BB: push    ds
252BC: push    di
252BD: mov     di, offset aKumba_0; " Kumba   "
252C0: push    cs
252C1: push    di
252C2: xor     ax, ax
252C4: push    ax
252C5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
252CA: call    @Write$qm4Text; Write(var f: Text)
252CF: call    @__IOCheck$qv; Exit if error
252D4: mov     ax, word_27B6E
252D7: mov     bx, word_27B70
252DB: mov     dx, word_27B72
252DF: mov     cx, 89h
252E2: xor     si, si
252E4: mov     di, 1600h
252E7: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
252EC: mov     word_27B6E, ax
252EF: mov     word_27B70, bx
252F3: mov     word_27B72, dx
252F7: mov     ax, word_27B6E
252FA: mov     bx, word_27B70
252FE: mov     dx, word_27B72
25302: mov     word_27DE4, ax
25305: mov     word_27DE6, bx
25309: mov     word_27DE8, dx
2530D: mov     ax, word_27B6E
25310: mov     bx, word_27B70
25314: mov     dx, word_27B72
25318: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
2531D: add     ax, 1
25320: adc     dx, 0
25323: mov     di, 1A0Eh
25326: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2532B: mov     word_27E00, ax
2532E: push    cs
2532F: call    near ptr sub_21EE1
25332: mov     di, offset unk_2EEE8
25335: push    ds
25336: push    di
25337: mov     di, offset unk_28118
2533A: push    ds
2533B: push    di
2533C: mov     ax, 0FFh
2533F: push    ax
25340: call    @$basg$qm6Stringt14Byte; Store string
25345: mov     ax, word_27B6E
25348: mov     bx, word_27B70
2534C: mov     dx, word_27B72
25350: mov     cx, 89h
25353: xor     si, si
25355: mov     di, 3400h
25358: call    @__Cmp$q4Realt1; Compare two reals
2535D: jbe     short loc_25363
2535F: mov     al, 0
25361: jmp     short loc_25365
25363: mov     al, 1
25365: push    ax
25366: mov     ax, word_27B6E
25369: mov     bx, word_27B70
2536D: mov     dx, word_27B72
25371: mov     cx, 89h
25374: xor     si, si
25376: mov     di, 2500h
25379: call    @__Cmp$q4Realt1; Compare two reals
2537E: ja      short loc_25384
25380: mov     al, 0
25382: jmp     short loc_25386
25384: mov     al, 1
25386: pop     dx
25387: and     al, dl
25389: or      al, al
2538B: jnz     short loc_25390
2538D: jmp     loc_25423
25390: mov     word_27DFC, 0Ch
25396: mov     di, offset unk_2F60A
25399: push    ds
2539A: push    di
2539B: mov     di, offset aMeena_0; " Meena   "
2539E: push    cs
2539F: push    di
253A0: xor     ax, ax
253A2: push    ax
253A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
253A8: call    @Write$qm4Text; Write(var f: Text)
253AD: call    @__IOCheck$qv; Exit if error
253B2: mov     ax, word_27B6E
253B5: mov     bx, word_27B70
253B9: mov     dx, word_27B72
253BD: mov     cx, 89h
253C0: xor     si, si
253C2: mov     di, 2500h
253C5: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
253CA: mov     word_27B6E, ax
253CD: mov     word_27B70, bx
253D1: mov     word_27B72, dx
253D5: mov     ax, word_27B6E
253D8: mov     bx, word_27B70
253DC: mov     dx, word_27B72
253E0: mov     word_27DE4, ax
253E3: mov     word_27DE6, bx
253E7: mov     word_27DE8, dx
253EB: mov     ax, word_27B6E
253EE: mov     bx, word_27B70
253F2: mov     dx, word_27B72
253F6: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
253FB: add     ax, 1
253FE: adc     dx, 0
25401: mov     di, 1A0Eh
25404: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
25409: mov     word_27E00, ax
2540C: push    cs
2540D: call    near ptr sub_21EE1
25410: mov     di, offset unk_2EEF3
25413: push    ds
25414: push    di
25415: mov     di, offset unk_28118
25418: push    ds
25419: push    di
2541A: mov     ax, 0FFh
2541D: push    ax
2541E: call    @$basg$qm6Stringt14Byte; Store string
25423: cmp     word_27E04, 1
25428: jnz     short loc_25449
2542A: mov     di, offset unk_2F60A
2542D: push    ds
2542E: push    di
2542F: mov     di, offset asc_239A1; "  "
25432: push    cs
25433: push    di
25434: xor     ax, ax
25436: push    ax
25437: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2543C: call    @Write$qm4Text; Write(var f: Text)
25441: call    @__IOCheck$qv; Exit if error
25446: jmp     loc_2563B
25449: cmp     byte_2ED18, 0
2544E: jz      short loc_25464
25450: mov     ax, word_27DF4
25453: cwd
25454: mov     di, 1A0Eh
25457: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2545C: mov     word_27DF8, ax
2545F: mov     byte_2ED18, 0
25464: mov     ax, word_27DF4
25467: imul    word_27DF6
2546B: imul    word_27E00
2546F: add     ax, word_27E02
25473: add     ax, word_27DF8
25477: add     ax, word_27DFA
2547B: cwd
2547C: mov     cx, 0Ch
2547F: idiv    cx
25481: xchg    ax, dx
25482: cwd
25483: mov     di, 1A0Eh
25486: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2548B: mov     [bp+var_20], ax
2548E: mov     ax, [bp+var_20]
25491: cmp     ax, 1
25494: jnz     short loc_254B5
25496: mov     di, offset unk_2F60A
25499: push    ds
2549A: push    di
2549B: mov     di, offset aShayana; "   Shayana    "
2549E: push    cs
2549F: push    di
254A0: xor     ax, ax
254A2: push    ax
254A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
254A8: call    @Write$qm4Text; Write(var f: Text)
254AD: call    @__IOCheck$qv; Exit if error
254B2: jmp     loc_2563B
254B5: cmp     ax, 2
254B8: jnz     short loc_254D9
254BA: mov     di, offset unk_2F60A
254BD: push    ds
254BE: push    di
254BF: mov     di, offset aUpeveshana; "   Upeveshana "
254C2: push    cs
254C3: push    di
254C4: xor     ax, ax
254C6: push    ax
254C7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
254CC: call    @Write$qm4Text; Write(var f: Text)
254D1: call    @__IOCheck$qv; Exit if error
254D6: jmp     loc_2563B
254D9: cmp     ax, 3
254DC: jnz     short loc_254FD
254DE: mov     di, offset unk_2F60A
254E1: push    ds
254E2: push    di
254E3: mov     di, offset aNethrapani; "   Nethrapani "
254E6: push    cs
254E7: push    di
254E8: xor     ax, ax
254EA: push    ax
254EB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
254F0: call    @Write$qm4Text; Write(var f: Text)
254F5: call    @__IOCheck$qv; Exit if error
254FA: jmp     loc_2563B
254FD: cmp     ax, 4
25500: jnz     short loc_25521
25502: mov     di, offset unk_2F60A
25505: push    ds
25506: push    di
25507: mov     di, offset aPrakasha; "   Prakasha   "
2550A: push    cs
2550B: push    di
2550C: xor     ax, ax
2550E: push    ax
2550F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
25514: call    @Write$qm4Text; Write(var f: Text)
25519: call    @__IOCheck$qv; Exit if error
2551E: jmp     loc_2563B
25521: cmp     ax, 5
25524: jnz     short loc_25545
25526: mov     di, offset unk_2F60A
25529: push    ds
2552A: push    di
2552B: mov     di, offset aGamana; "   Gamana     "
2552E: push    cs
2552F: push    di
25530: xor     ax, ax
25532: push    ax
25533: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
25538: call    @Write$qm4Text; Write(var f: Text)
2553D: call    @__IOCheck$qv; Exit if error
25542: jmp     loc_2563B
25545: cmp     ax, 6
25548: jnz     short loc_25569
2554A: mov     di, offset unk_2F60A
2554D: push    ds
2554E: push    di
2554F: mov     di, offset aAgamana; "   Agamana    "
25552: push    cs
25553: push    di
25554: xor     ax, ax
25556: push    ax
25557: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2555C: call    @Write$qm4Text; Write(var f: Text)
25561: call    @__IOCheck$qv; Exit if error
25566: jmp     loc_2563B
25569: cmp     ax, 7
2556C: jnz     short loc_2558D
2556E: mov     di, offset unk_2F60A
25571: push    ds
25572: push    di
25573: mov     di, offset aSaba; "   Saba       "
25576: push    cs
25577: push    di
25578: xor     ax, ax
2557A: push    ax
2557B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
25580: call    @Write$qm4Text; Write(var f: Text)
25585: call    @__IOCheck$qv; Exit if error
2558A: jmp     loc_2563B
2558D: cmp     ax, 8
25590: jnz     short loc_255B1
25592: mov     di, offset unk_2F60A
25595: push    ds
25596: push    di
25597: mov     di, offset aAagama; "   AAgama     "
2559A: push    cs
2559B: push    di
2559C: xor     ax, ax
2559E: push    ax
2559F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
255A4: call    @Write$qm4Text; Write(var f: Text)
255A9: call    @__IOCheck$qv; Exit if error
255AE: jmp     loc_2563B
255B1: cmp     ax, 9
255B4: jnz     short loc_255D4
255B6: mov     di, offset unk_2F60A
255B9: push    ds
255BA: push    di
255BB: mov     di, offset aBhojana; "   Bhojana    "
255BE: push    cs
255BF: push    di
255C0: xor     ax, ax
255C2: push    ax
255C3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
255C8: call    @Write$qm4Text; Write(var f: Text)
255CD: call    @__IOCheck$qv; Exit if error
255D2: jmp     short loc_2563B
255D4: cmp     ax, 0Ah
255D7: jnz     short loc_255F7
255D9: mov     di, offset unk_2F60A
255DC: push    ds
255DD: push    di
255DE: mov     di, offset aNuthyalipsa; "   Nuthyalipsa"
255E1: push    cs
255E2: push    di
255E3: xor     ax, ax
255E5: push    ax
255E6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
255EB: call    @Write$qm4Text; Write(var f: Text)
255F0: call    @__IOCheck$qv; Exit if error
255F5: jmp     short loc_2563B
255F7: cmp     ax, 0Bh
255FA: jnz     short loc_2561A
255FC: mov     di, offset unk_2F60A
255FF: push    ds
25600: push    di
25601: mov     di, offset aKavthuka; "   Kavthuka   "
25604: push    cs
25605: push    di
25606: xor     ax, ax
25608: push    ax
25609: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2560E: call    @Write$qm4Text; Write(var f: Text)
25613: call    @__IOCheck$qv; Exit if error
25618: jmp     short loc_2563B
2561A: cmp     ax, 0
2561D: jnz     short loc_2563B
2561F: mov     di, offset unk_2F60A
25622: push    ds
25623: push    di
25624: mov     di, offset aNidra; "   Nidra      "
25627: push    cs
25628: push    di
25629: xor     ax, ax
2562B: push    ax
2562C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
25631: call    @Write$qm4Text; Write(var f: Text)
25636: call    @__IOCheck$qv; Exit if error
2563B: mov     di, offset unk_2F60A
2563E: push    ds
2563F: push    di
25640: call    @WriteLn$qm4Text; WriteLn(var f: Text)
25645: call    @__IOCheck$qv; Exit if error
2564A: mov     sp, bp
2564C: pop     bp
2564D: retf
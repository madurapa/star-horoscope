/*
 * func-name: sub_1AE29
 * func-address: 0x1ae29
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x21576, 0x263ee, 0x263fc, 0x26424, 0x2650b, 0x265f6, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a26, 0x26a74, 0x27662, 0x2772a
 * fallback-reason: decompile returned None
 */

1AE29: push    bp
1AE2A: mov     bp, sp
1AE2C: mov     ax, 31Ah
1AE2F: call    @__StackCheck$q4Word; Stack overflow check (AX)
1AE34: sub     sp, 31Ah
1AE38: call    sub_21576
1AE3D: mov     di, offset unk_2A018
1AE40: push    ds
1AE41: push    di
1AE42: mov     di, offset unk_2F2B6
1AE45: push    ds
1AE46: push    di
1AE47: call    @$bsub$qm6Stringt1; Compare two strings
1AE4C: jnz     short loc_1AE53
1AE4E: mov     [bp+var_8], 4
1AE53: mov     di, offset unk_2A018
1AE56: push    ds
1AE57: push    di
1AE58: mov     di, offset unk_2F2C1
1AE5B: push    ds
1AE5C: push    di
1AE5D: call    @$bsub$qm6Stringt1; Compare two strings
1AE62: jnz     short loc_1AE69
1AE64: mov     [bp+var_8], 7
1AE69: mov     di, offset unk_2A018
1AE6C: push    ds
1AE6D: push    di
1AE6E: mov     di, offset unk_2F2CC
1AE71: push    ds
1AE72: push    di
1AE73: call    @$bsub$qm6Stringt1; Compare two strings
1AE78: jnz     short loc_1AE7F
1AE7A: mov     [bp+var_8], 3
1AE7F: mov     di, offset unk_2A018
1AE82: push    ds
1AE83: push    di
1AE84: mov     di, offset unk_2F2D7
1AE87: push    ds
1AE88: push    di
1AE89: call    @$bsub$qm6Stringt1; Compare two strings
1AE8E: jnz     short loc_1AE95
1AE90: mov     [bp+var_8], 6
1AE95: mov     di, offset unk_2A018
1AE98: push    ds
1AE99: push    di
1AE9A: mov     di, offset unk_2F2E2
1AE9D: push    ds
1AE9E: push    di
1AE9F: call    @$bsub$qm6Stringt1; Compare two strings
1AEA4: jnz     short loc_1AEAB
1AEA6: mov     [bp+var_8], 2
1AEAB: mov     di, offset unk_2A018
1AEAE: push    ds
1AEAF: push    di
1AEB0: mov     di, offset unk_2F2ED
1AEB3: push    ds
1AEB4: push    di
1AEB5: call    @$bsub$qm6Stringt1; Compare two strings
1AEBA: jnz     short loc_1AEC1
1AEBC: mov     [bp+var_8], 5
1AEC1: mov     di, offset unk_2A018
1AEC4: push    ds
1AEC5: push    di
1AEC6: mov     di, offset unk_2F2F8
1AEC9: push    ds
1AECA: push    di
1AECB: call    @$bsub$qm6Stringt1; Compare two strings
1AED0: jnz     short loc_1AED7
1AED2: mov     [bp+var_8], 1
1AED7: mov     [bp+var_E], 82h
1AEDC: mov     [bp+var_C], 0
1AEE1: mov     [bp+var_A], 2000h
1AEE6: mov     [bp+var_14], 82h
1AEEB: mov     [bp+var_12], 0
1AEF0: mov     [bp+var_10], 2000h
1AEF5: mov     [bp+var_2], 1
1AEFA: jmp     short loc_1AEFF
1AEFC: inc     [bp+var_2]
1AEFF: cmp     [bp+var_8], 7
1AF03: jle     short loc_1AF17
1AF05: mov     ax, [bp+var_8]
1AF08: sub     ax, 7
1AF0B: cwd
1AF0C: mov     di, 0
1AF0F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1AF14: mov     [bp+var_8], ax
1AF17: mov     ax, [bp+var_2]
1AF1A: cwd
1AF1B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1AF20: mov     cx, [bp+var_14]
1AF23: mov     si, [bp+var_12]
1AF26: mov     di, [bp+var_10]
1AF29: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1AF2E: mov     cx, word_27DD2
1AF32: mov     si, word_27DD4
1AF36: mov     di, word_27DD6
1AF3A: call    @__Cmp$q4Realt1; Compare two reals
1AF3F: jnb     short loc_1AF45
1AF41: mov     al, 0
1AF43: jmp     short loc_1AF47
1AF45: mov     al, 1
1AF47: push    ax
1AF48: mov     ax, [bp+var_2]
1AF4B: dec     ax
1AF4C: cwd
1AF4D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1AF52: mov     cx, [bp+var_E]
1AF55: mov     si, [bp+var_C]
1AF58: mov     di, [bp+var_A]
1AF5B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1AF60: mov     cx, word_27DD2
1AF64: mov     si, word_27DD4
1AF68: mov     di, word_27DD6
1AF6C: call    @__Cmp$q4Realt1; Compare two reals
1AF71: jb      short loc_1AF77
1AF73: mov     al, 0
1AF75: jmp     short loc_1AF79
1AF77: mov     al, 1
1AF79: pop     dx
1AF7A: and     al, dl
1AF7C: or      al, al
1AF7E: jz      short loc_1AF82
1AF80: jmp     short loc_1AF9B
1AF82: mov     ax, [bp+var_8]
1AF85: inc     ax
1AF86: cwd
1AF87: mov     di, 0
1AF8A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1AF8F: mov     [bp+var_8], ax
1AF92: cmp     [bp+var_2], 18h
1AF96: jz      short loc_1AF9B
1AF98: jmp     loc_1AEFC
1AF9B: mov     ax, [bp+var_8]
1AF9E: cwd
1AF9F: mov     di, 8
1AFA2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1AFA7: mov     dx, 0Bh
1AFAA: mul     dx
1AFAC: mov     di, ax
1AFAE: add     di, 7AF9h
1AFB2: push    ds
1AFB3: push    di
1AFB4: lea     di, [bp+var_21A]
1AFB8: push    ss
1AFB9: push    di
1AFBA: mov     ax, 0FFh
1AFBD: push    ax
1AFBE: call    @$basg$qm6Stringt14Byte; Store string
1AFC3: lea     di, [bp+var_21A]
1AFC7: push    ss
1AFC8: push    di
1AFC9: mov     di, offset unk_2F3E4
1AFCC: push    ds
1AFCD: push    di
1AFCE: call    @$bsub$qm6Stringt1; Compare two strings
1AFD3: jnz     short loc_1AFDA
1AFD5: mov     [bp+var_8], 1
1AFDA: lea     di, [bp+var_21A]
1AFDE: push    ss
1AFDF: push    di
1AFE0: mov     di, offset unk_2F3EF
1AFE3: push    ds
1AFE4: push    di
1AFE5: call    @$bsub$qm6Stringt1; Compare two strings
1AFEA: jnz     short loc_1AFF1
1AFEC: mov     [bp+var_8], 6
1AFF1: lea     di, [bp+var_21A]
1AFF5: push    ss
1AFF6: push    di
1AFF7: mov     di, offset unk_2F3FA
1AFFA: push    ds
1AFFB: push    di
1AFFC: call    @$bsub$qm6Stringt1; Compare two strings
1B001: jnz     short loc_1B008
1B003: mov     [bp+var_8], 4
1B008: lea     di, [bp+var_21A]
1B00C: push    ss
1B00D: push    di
1B00E: mov     di, offset unk_2F405
1B011: push    ds
1B012: push    di
1B013: call    @$bsub$qm6Stringt1; Compare two strings
1B018: jnz     short loc_1B01F
1B01A: mov     [bp+var_8], 2
1B01F: lea     di, [bp+var_21A]
1B023: push    ss
1B024: push    di
1B025: mov     di, offset unk_2F410
1B028: push    ds
1B029: push    di
1B02A: call    @$bsub$qm6Stringt1; Compare two strings
1B02F: jnz     short loc_1B036
1B031: mov     [bp+var_8], 7
1B036: lea     di, [bp+var_21A]
1B03A: push    ss
1B03B: push    di
1B03C: mov     di, offset unk_2F41B
1B03F: push    ds
1B040: push    di
1B041: call    @$bsub$qm6Stringt1; Compare two strings
1B046: jnz     short loc_1B04D
1B048: mov     [bp+var_8], 5
1B04D: lea     di, [bp+var_21A]
1B051: push    ss
1B052: push    di
1B053: mov     di, offset unk_2F426
1B056: push    ds
1B057: push    di
1B058: call    @$bsub$qm6Stringt1; Compare two strings
1B05D: jnz     short loc_1B064
1B05F: mov     [bp+var_8], 3
1B064: mov     ax, word_27DD2
1B067: mov     bx, word_27DD4
1B06B: mov     dx, word_27DD6
1B06F: mov     cx, 82h
1B072: xor     si, si
1B074: mov     di, 2000h
1B077: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1B07C: call    @Int$q4Real; Int(x: Real): Real
1B081: push    dx
1B082: push    bx
1B083: push    ax
1B084: mov     ax, word_27DD2
1B087: mov     bx, word_27DD4
1B08B: mov     dx, word_27DD6
1B08F: mov     cx, 82h
1B092: xor     si, si
1B094: mov     di, 2000h
1B097: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1B09C: pop     cx
1B09D: pop     si
1B09E: pop     di
1B09F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1B0A4: mov     cx, 86h
1B0A7: xor     si, si
1B0A9: mov     di, 7000h
1B0AC: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1B0B1: mov     [bp+var_1A], ax
1B0B4: mov     [bp+var_18], bx
1B0B7: mov     [bp+var_16], dx
1B0BA: mov     [bp+var_2], 1
1B0BF: jmp     short loc_1B0C4
1B0C1: inc     [bp+var_2]
1B0C4: cmp     [bp+var_8], 7
1B0C8: jle     short loc_1B0DC
1B0CA: mov     ax, [bp+var_8]
1B0CD: sub     ax, 7
1B0D0: cwd
1B0D1: mov     di, 0
1B0D4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B0D9: mov     [bp+var_8], ax
1B0DC: mov     ax, [bp+var_2]
1B0DF: mov     cx, 0Ch
1B0E2: imul    cx
1B0E4: cwd
1B0E5: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1B0EA: mov     cx, [bp+var_1A]
1B0ED: mov     si, [bp+var_18]
1B0F0: mov     di, [bp+var_16]
1B0F3: call    @__Cmp$q4Realt1; Compare two reals
1B0F8: jnb     short loc_1B0FE
1B0FA: mov     al, 0
1B0FC: jmp     short loc_1B100
1B0FE: mov     al, 1
1B100: push    ax
1B101: mov     ax, [bp+var_2]
1B104: dec     ax
1B105: mov     cx, 0Ch
1B108: imul    cx
1B10A: cwd
1B10B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1B110: mov     cx, [bp+var_1A]
1B113: mov     si, [bp+var_18]
1B116: mov     di, [bp+var_16]
1B119: call    @__Cmp$q4Realt1; Compare two reals
1B11E: jb      short loc_1B124
1B120: mov     al, 0
1B122: jmp     short loc_1B126
1B124: mov     al, 1
1B126: pop     dx
1B127: and     al, dl
1B129: or      al, al
1B12B: jz      short loc_1B12F
1B12D: jmp     short loc_1B148
1B12F: mov     ax, [bp+var_8]
1B132: inc     ax
1B133: cwd
1B134: mov     di, 0
1B137: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B13C: mov     [bp+var_8], ax
1B13F: cmp     [bp+var_2], 5
1B143: jz      short loc_1B148
1B145: jmp     loc_1B0C1
1B148: mov     ax, [bp+var_8]
1B14B: cwd
1B14C: mov     di, 8
1B14F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B154: mov     dx, 0Bh
1B157: mul     dx
1B159: mov     di, ax
1B15B: add     di, 7B47h
1B15F: push    ds
1B160: push    di
1B161: lea     di, [bp+var_11A]
1B165: push    ss
1B166: push    di
1B167: mov     ax, 0FFh
1B16A: push    ax
1B16B: call    @$basg$qm6Stringt14Byte; Store string
1B170: lea     di, [bp+var_11A]
1B174: push    ss
1B175: push    di
1B176: mov     di, offset unk_2F432
1B179: push    ds
1B17A: push    di
1B17B: call    @$bsub$qm6Stringt1; Compare two strings
1B180: jnz     short loc_1B187
1B182: mov     [bp+var_6], 1
1B187: lea     di, [bp+var_11A]
1B18B: push    ss
1B18C: push    di
1B18D: mov     di, offset unk_2F43D
1B190: push    ds
1B191: push    di
1B192: call    @$bsub$qm6Stringt1; Compare two strings
1B197: jnz     short loc_1B19E
1B199: mov     [bp+var_6], 4
1B19E: lea     di, [bp+var_11A]
1B1A2: push    ss
1B1A3: push    di
1B1A4: mov     di, offset unk_2F448
1B1A7: push    ds
1B1A8: push    di
1B1A9: call    @$bsub$qm6Stringt1; Compare two strings
1B1AE: jnz     short loc_1B1B5
1B1B0: mov     [bp+var_6], 7
1B1B5: lea     di, [bp+var_11A]
1B1B9: push    ss
1B1BA: push    di
1B1BB: mov     di, offset unk_2F453
1B1BE: push    ds
1B1BF: push    di
1B1C0: call    @$bsub$qm6Stringt1; Compare two strings
1B1C5: jnz     short loc_1B1CC
1B1C7: mov     [bp+var_6], 3
1B1CC: lea     di, [bp+var_11A]
1B1D0: push    ss
1B1D1: push    di
1B1D2: mov     di, offset unk_2F45E
1B1D5: push    ds
1B1D6: push    di
1B1D7: call    @$bsub$qm6Stringt1; Compare two strings
1B1DC: jnz     short loc_1B1E3
1B1DE: mov     [bp+var_6], 6
1B1E3: lea     di, [bp+var_11A]
1B1E7: push    ss
1B1E8: push    di
1B1E9: mov     di, offset unk_2F469
1B1EC: push    ds
1B1ED: push    di
1B1EE: call    @$bsub$qm6Stringt1; Compare two strings
1B1F3: jnz     short loc_1B1FA
1B1F5: mov     [bp+var_6], 2
1B1FA: lea     di, [bp+var_11A]
1B1FE: push    ss
1B1FF: push    di
1B200: mov     di, offset unk_2F474
1B203: push    ds
1B204: push    di
1B205: call    @$bsub$qm6Stringt1; Compare two strings
1B20A: jnz     short loc_1B211
1B20C: mov     [bp+var_6], 5
1B211: mov     ax, [bp+var_2]
1B214: dec     ax
1B215: mov     cx, 0Ch
1B218: imul    cx
1B21A: cwd
1B21B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1B220: push    dx
1B221: push    bx
1B222: push    ax
1B223: mov     ax, [bp+var_1A]
1B226: mov     bx, [bp+var_18]
1B229: mov     dx, [bp+var_16]
1B22C: pop     cx
1B22D: pop     si
1B22E: pop     di
1B22F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1B234: mov     [bp+var_1A], ax
1B237: mov     [bp+var_18], bx
1B23A: mov     [bp+var_16], dx
1B23D: mov     [bp+var_2], 1
1B242: jmp     short loc_1B247
1B244: inc     [bp+var_2]
1B247: cmp     [bp+var_6], 7
1B24B: jle     short loc_1B25F
1B24D: mov     ax, [bp+var_6]
1B250: sub     ax, 7
1B253: cwd
1B254: mov     di, 0
1B257: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B25C: mov     [bp+var_6], ax
1B25F: mov     ax, [bp+var_2]
1B262: mov     cx, 2
1B265: shl     ax, cl
1B267: cwd
1B268: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1B26D: mov     cx, [bp+var_1A]
1B270: mov     si, [bp+var_18]
1B273: mov     di, [bp+var_16]
1B276: call    @__Cmp$q4Realt1; Compare two reals
1B27B: jnb     short loc_1B281
1B27D: mov     al, 0
1B27F: jmp     short loc_1B283
1B281: mov     al, 1
1B283: push    ax
1B284: mov     ax, [bp+var_2]
1B287: dec     ax
1B288: mov     cx, 2
1B28B: shl     ax, cl
1B28D: cwd
1B28E: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1B293: mov     cx, [bp+var_1A]
1B296: mov     si, [bp+var_18]
1B299: mov     di, [bp+var_16]
1B29C: call    @__Cmp$q4Realt1; Compare two reals
1B2A1: jb      short loc_1B2A7
1B2A3: mov     al, 0
1B2A5: jmp     short loc_1B2A9
1B2A7: mov     al, 1
1B2A9: pop     dx
1B2AA: and     al, dl
1B2AC: or      al, al
1B2AE: jz      short loc_1B2B2
1B2B0: jmp     short loc_1B2CB
1B2B2: mov     ax, [bp+var_6]
1B2B5: inc     ax
1B2B6: cwd
1B2B7: mov     di, 0
1B2BA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B2BF: mov     [bp+var_6], ax
1B2C2: cmp     [bp+var_2], 3
1B2C6: jz      short loc_1B2CB
1B2C8: jmp     loc_1B244
1B2CB: mov     ax, [bp+var_6]
1B2CE: cwd
1B2CF: mov     di, 8
1B2D2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1B2D7: mov     dx, 0Bh
1B2DA: mul     dx
1B2DC: mov     di, ax
1B2DE: add     di, 7AF9h
1B2E2: push    ds
1B2E3: push    di
1B2E4: lea     di, [bp+var_31A]
1B2E8: push    ss
1B2E9: push    di
1B2EA: mov     ax, 0FFh
1B2ED: push    ax
1B2EE: call    @$basg$qm6Stringt14Byte; Store string
1B2F3: mov     di, offset unk_2F60A
1B2F6: push    ds
1B2F7: push    di
1B2F8: mov     di, offset aKalaHorava; "KALA HORAVA : "
1B2FB: push    cs
1B2FC: push    di
1B2FD: xor     ax, ax
1B2FF: push    ax
1B300: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B305: lea     di, [bp+var_21A]
1B309: push    ss
1B30A: push    di
1B30B: xor     ax, ax
1B30D: push    ax
1B30E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B313: mov     di, offset aPanchamaHorava; "  PANCHAMA HORAVA : "
1B316: push    cs
1B317: push    di
1B318: xor     ax, ax
1B31A: push    ax
1B31B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B320: lea     di, [bp+var_11A]
1B324: push    ss
1B325: push    di
1B326: xor     ax, ax
1B328: push    ax
1B329: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B32E: mov     di, offset aSukshamaHorava; "  SUKSHAMA HORAVA : "
1B331: push    cs
1B332: push    di
1B333: xor     ax, ax
1B335: push    ax
1B336: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B33B: lea     di, [bp+var_31A]
1B33F: push    ss
1B340: push    di
1B341: xor     ax, ax
1B343: push    ax
1B344: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1B349: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1B34E: call    @__IOCheck$qv; Exit if error
1B353: mov     sp, bp
1B355: pop     bp
1B356: retf
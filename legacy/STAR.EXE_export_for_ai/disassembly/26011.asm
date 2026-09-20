/*
 * func-name: sub_26011
 * func-address: 0x26011
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x26424, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26ad9, 0x26d20
 * fallback-reason: decompile returned None
 */

26011: push    bp
26012: mov     bp, sp
26014: mov     ax, 6
26017: call    @__StackCheck$q4Word; Stack overflow check (AX)
2601C: sub     sp, 6
2601F: mov     ax, [bp+arg_0]
26022: mov     bx, [bp+arg_2]
26025: mov     dx, [bp+arg_4]
26028: and     dh, 7Fh
2602B: xor     cx, cx
2602D: xor     si, si
2602F: xor     di, di
26031: call    @__Cmp$q4Realt1; Compare two reals
26036: ja      short loc_2603B
26038: jmp     loc_260CF
2603B: mov     ax, [bp+arg_0]
2603E: mov     bx, [bp+arg_2]
26041: mov     dx, [bp+arg_4]
26044: mov     cx, [bp+arg_0]
26047: mov     si, [bp+arg_2]
2604A: mov     di, [bp+arg_4]
2604D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
26052: push    dx
26053: push    bx
26054: push    ax
26055: mov     ax, 81h
26058: xor     bx, bx
2605A: xor     dx, dx
2605C: pop     cx
2605D: pop     si
2605E: pop     di
2605F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
26064: call    @Sqrt$q4Real; Sqrt(x: Real): Real
26069: mov     cx, [bp+arg_0]
2606C: mov     si, [bp+arg_2]
2606F: mov     di, [bp+arg_4]
26072: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
26077: call    @ArcTan$q4Real; ArcTan(x: Real): Real
2607C: mov     [bp+arg_0], ax
2607F: mov     [bp+arg_2], bx
26082: mov     [bp+arg_4], dx
26085: mov     ax, [bp+arg_0]
26088: mov     bx, [bp+arg_2]
2608B: mov     dx, [bp+arg_4]
2608E: xor     cx, cx
26090: xor     si, si
26092: xor     di, di
26094: call    @__Cmp$q4Realt1; Compare two reals
26099: jnb     short loc_260BB
2609B: mov     ax, 2182h
2609E: mov     bx, 0DAA2h
260A1: mov     dx, 490Fh
260A4: mov     cx, [bp+arg_0]
260A7: mov     si, [bp+arg_2]
260AA: mov     di, [bp+arg_4]
260AD: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
260B2: mov     [bp+arg_0], ax
260B5: mov     [bp+arg_2], bx
260B8: mov     [bp+arg_4], dx
260BB: mov     ax, [bp+arg_0]
260BE: mov     bx, [bp+arg_2]
260C1: mov     dx, [bp+arg_4]
260C4: mov     [bp+var_6], ax
260C7: mov     [bp+var_4], bx
260CA: mov     [bp+var_2], dx
260CD: jmp     short loc_260DE
260CF: mov     [bp+var_6], 2181h
260D4: mov     [bp+var_4], 0DAA2h
260D9: mov     [bp+var_2], 490Fh
260DE: mov     ax, [bp+var_6]
260E1: mov     bx, [bp+var_4]
260E4: mov     dx, [bp+var_2]
260E7: mov     sp, bp
260E9: pop     bp
260EA: retf    6
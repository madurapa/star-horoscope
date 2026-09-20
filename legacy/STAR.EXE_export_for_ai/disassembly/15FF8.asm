/*
 * func-name: sub_15FF8
 * func-address: 0x15ff8
 * export-type: disassembly-fallback
 * callers: 0x1633a
 * callees: 0x263fc, 0x26424, 0x26a06, 0x26a12, 0x26a26, 0x26a2a, 0x26a32
 * fallback-reason: decompile returned None
 */

15FF8: push    bp
15FF9: mov     bp, sp
15FFB: xor     ax, ax
15FFD: call    @__StackCheck$q4Word; Stack overflow check (AX)
16002: mov     di, [bp+arg_0]
16005: mov     ax, ss:[di-54h]
16009: mov     bx, ss:[di-52h]
1600D: mov     dx, ss:[di-50h]
16011: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
16016: mov     di, 0
16019: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1601E: mov     di, [bp+arg_0]
16021: mov     ss:[di-9Eh], ax
16026: mov     di, [bp+arg_0]
16029: mov     ax, ss:[di-9Eh]
1602E: cwd
1602F: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16034: push    dx
16035: push    bx
16036: push    ax
16037: mov     di, [bp+arg_0]
1603A: mov     ax, ss:[di-54h]
1603E: mov     bx, ss:[di-52h]
16042: mov     dx, ss:[di-50h]
16046: pop     cx
16047: pop     si
16048: pop     di
16049: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1604E: mov     cx, 84h
16051: xor     si, si
16053: mov     di, 4000h
16056: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1605B: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
16060: mov     di, 0
16063: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16068: mov     di, [bp+arg_0]
1606B: mov     ss:[di-0A0h], ax
16070: mov     di, [bp+arg_0]
16073: cmp     word ptr ss:[di-0A0h], 0
16079: jnz     short loc_1609F
1607B: mov     di, [bp+arg_0]
1607E: mov     ax, ss:[di-9Eh]
16083: dec     ax
16084: cwd
16085: mov     di, 0
16088: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1608D: mov     di, [bp+arg_0]
16090: mov     ss:[di-9Eh], ax
16095: mov     di, [bp+arg_0]
16098: mov     word ptr ss:[di-0A0h], 0Ch
1609F: mov     di, [bp+arg_0]
160A2: mov     ax, ss:[di-0A0h]
160A7: cwd
160A8: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
160AD: push    dx
160AE: push    bx
160AF: push    ax
160B0: mov     di, [bp+arg_0]
160B3: mov     ax, ss:[di-9Eh]
160B8: cwd
160B9: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
160BE: push    dx
160BF: push    bx
160C0: push    ax
160C1: mov     di, [bp+arg_0]
160C4: mov     ax, ss:[di-54h]
160C8: mov     bx, ss:[di-52h]
160CC: mov     dx, ss:[di-50h]
160D0: pop     cx
160D1: pop     si
160D2: pop     di
160D3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
160D8: mov     cx, 84h
160DB: xor     si, si
160DD: mov     di, 4000h
160E0: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
160E5: pop     cx
160E6: pop     si
160E7: pop     di
160E8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
160ED: mov     cx, 85h
160F0: xor     si, si
160F2: mov     di, 7000h
160F5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
160FA: call    @Round$q4Real; Round(x: Real): Longint
160FF: mov     di, 0
16102: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16107: mov     di, [bp+arg_0]
1610A: mov     ss:[di-9Ch], ax
1610F: mov     di, [bp+arg_0]
16112: cmp     byte ptr ss:[di-9Ah], 1
16118: jnz     short loc_16178
1611A: mov     di, [bp+arg_0]
1611D: cmp     word ptr ss:[di-9Ch], 1Eh
16123: jl      short loc_16149
16125: mov     di, [bp+arg_0]
16128: mov     ax, ss:[di-0A0h]
1612D: inc     ax
1612E: cwd
1612F: mov     di, 0
16132: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16137: mov     di, [bp+arg_0]
1613A: mov     ss:[di-0A0h], ax
1613F: mov     di, [bp+arg_0]
16142: xor     ax, ax
16144: mov     ss:[di-9Ch], ax
16149: mov     di, [bp+arg_0]
1614C: cmp     word ptr ss:[di-0A0h], 0Ch
16152: jl      short loc_16178
16154: mov     di, [bp+arg_0]
16157: mov     ax, ss:[di-9Eh]
1615C: inc     ax
1615D: cwd
1615E: mov     di, 0
16161: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16166: mov     di, [bp+arg_0]
16169: mov     ss:[di-9Eh], ax
1616E: mov     di, [bp+arg_0]
16171: xor     ax, ax
16173: mov     ss:[di-0A0h], ax
16178: mov     sp, bp
1617A: pop     bp
1617B: retn    2
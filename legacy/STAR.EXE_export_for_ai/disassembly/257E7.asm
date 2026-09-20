/*
 * func-name: sub_257E7
 * func-address: 0x257e7
 * export-type: disassembly-fallback
 * callers: 0x17ffe
 * callees: 0x2564e, 0x263fc, 0x26424, 0x2645c, 0x2650b, 0x26a00, 0x26a26, 0x26a2a
 * fallback-reason: decompile returned None
 */

257E7: push    bp
257E8: mov     bp, sp
257EA: mov     ax, 2
257ED: call    @__StackCheck$q4Word; Stack overflow check (AX)
257F2: sub     sp, 2
257F5: mov     ax, [bp+arg_4]
257F8: cwd
257F9: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
257FE: push    dx
257FF: push    bx
25800: push    ax
25801: mov     ax, [bp+arg_2]
25804: cwd
25805: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
2580A: push    dx
2580B: push    bx
2580C: push    ax
2580D: mov     ax, [bp+arg_0]
25810: cwd
25811: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
25816: push    dx
25817: push    bx
25818: push    ax
25819: push    cs
2581A: call    near ptr sub_2564E
2581D: mov     cx, 80h
25820: xor     si, si
25822: xor     di, di
25824: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
25829: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
2582E: mov     cx, 7
25831: xor     bx, bx
25833: call    @$brdiv$q7Longintt1; X1{DX:AX}/=X2{BX:CX}
25838: mov     ax, cx
2583A: mov     dx, bx
2583C: mov     di, 38FFh
2583F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
25844: mov     word_27E08, ax
25847: mov     ax, word_27E08
2584A: cmp     ax, 0
2584D: jnz     short loc_25865
2584F: mov     di, offset unk_2F2B6
25852: push    ds
25853: push    di
25854: mov     di, offset unk_2A018
25857: push    ds
25858: push    di
25859: mov     ax, 0FFh
2585C: push    ax
2585D: call    @$basg$qm6Stringt14Byte; Store string
25862: jmp     loc_25900
25865: cmp     ax, 1
25868: jnz     short loc_25880
2586A: mov     di, offset unk_2F2C1
2586D: push    ds
2586E: push    di
2586F: mov     di, offset unk_2A018
25872: push    ds
25873: push    di
25874: mov     ax, 0FFh
25877: push    ax
25878: call    @$basg$qm6Stringt14Byte; Store string
2587D: jmp     loc_25900
25880: cmp     ax, 2
25883: jnz     short loc_2589A
25885: mov     di, offset unk_2F2CC
25888: push    ds
25889: push    di
2588A: mov     di, offset unk_2A018
2588D: push    ds
2588E: push    di
2588F: mov     ax, 0FFh
25892: push    ax
25893: call    @$basg$qm6Stringt14Byte; Store string
25898: jmp     short loc_25900
2589A: cmp     ax, 3
2589D: jnz     short loc_258B4
2589F: mov     di, offset unk_2F2D7
258A2: push    ds
258A3: push    di
258A4: mov     di, offset unk_2A018
258A7: push    ds
258A8: push    di
258A9: mov     ax, 0FFh
258AC: push    ax
258AD: call    @$basg$qm6Stringt14Byte; Store string
258B2: jmp     short loc_25900
258B4: cmp     ax, 4
258B7: jnz     short loc_258CE
258B9: mov     di, offset unk_2F2E2
258BC: push    ds
258BD: push    di
258BE: mov     di, offset unk_2A018
258C1: push    ds
258C2: push    di
258C3: mov     ax, 0FFh
258C6: push    ax
258C7: call    @$basg$qm6Stringt14Byte; Store string
258CC: jmp     short loc_25900
258CE: cmp     ax, 5
258D1: jnz     short loc_258E8
258D3: mov     di, offset unk_2F2ED
258D6: push    ds
258D7: push    di
258D8: mov     di, offset unk_2A018
258DB: push    ds
258DC: push    di
258DD: mov     ax, 0FFh
258E0: push    ax
258E1: call    @$basg$qm6Stringt14Byte; Store string
258E6: jmp     short loc_25900
258E8: cmp     ax, 6
258EB: jnz     short loc_25900
258ED: mov     di, offset unk_2F2F8
258F0: push    ds
258F1: push    di
258F2: mov     di, offset unk_2A018
258F5: push    ds
258F6: push    di
258F7: mov     ax, 0FFh
258FA: push    ax
258FB: call    @$basg$qm6Stringt14Byte; Store string
25900: mov     ax, [bp+var_2]
25903: mov     sp, bp
25905: pop     bp
25906: retf    6
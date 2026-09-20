/*
 * func-name: sub_2564E
 * func-address: 0x2564e
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x257e7
 * callees: 0x26424, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a74
 * fallback-reason: decompile returned None
 */

2564E: push    bp
2564F: mov     bp, sp
25651: mov     ax, 24h ; '$'
25654: call    @__StackCheck$q4Word; Stack overflow check (AX)
25659: sub     sp, 24h
2565C: mov     ax, [bp+arg_6]
2565F: mov     bx, [bp+arg_8]
25662: mov     dx, [bp+arg_A]
25665: mov     cx, 82h
25668: xor     si, si
2566A: xor     di, di
2566C: call    @__Cmp$q4Realt1; Compare two reals
25671: jbe     short loc_25699
25673: mov     ax, [bp+arg_C]
25676: mov     bx, [bp+arg_E]
25679: mov     dx, [bp+arg_10]
2567C: mov     [bp+var_C], ax
2567F: mov     [bp+var_A], bx
25682: mov     [bp+var_8], dx
25685: mov     ax, [bp+arg_6]
25688: mov     bx, [bp+arg_8]
2568B: mov     dx, [bp+arg_A]
2568E: mov     [bp+var_12], ax
25691: mov     [bp+var_10], bx
25694: mov     [bp+var_E], dx
25697: jmp     short loc_256D6
25699: mov     ax, [bp+arg_C]
2569C: mov     bx, [bp+arg_E]
2569F: mov     dx, [bp+arg_10]
256A2: mov     cx, 81h
256A5: xor     si, si
256A7: xor     di, di
256A9: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
256AE: mov     [bp+var_C], ax
256B1: mov     [bp+var_A], bx
256B4: mov     [bp+var_8], dx
256B7: mov     ax, [bp+arg_6]
256BA: mov     bx, [bp+arg_8]
256BD: mov     dx, [bp+arg_A]
256C0: mov     cx, 84h
256C3: xor     si, si
256C5: mov     di, 4000h
256C8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
256CD: mov     [bp+var_12], ax
256D0: mov     [bp+var_10], bx
256D3: mov     [bp+var_E], dx
256D6: mov     ax, [bp+var_C]
256D9: mov     bx, [bp+var_A]
256DC: mov     dx, [bp+var_8]
256DF: mov     cx, 87h
256E2: xor     si, si
256E4: mov     di, 4800h
256E7: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
256EC: call    @Int$q4Real; Int(x: Real): Real
256F1: mov     [bp+var_1E], ax
256F4: mov     [bp+var_1C], bx
256F7: mov     [bp+var_1A], dx
256FA: mov     ax, [bp+var_1E]
256FD: mov     bx, [bp+var_1C]
25700: mov     dx, [bp+var_1A]
25703: mov     cx, 83h
25706: xor     si, si
25708: xor     di, di
2570A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2570F: call    @Int$q4Real; Int(x: Real): Real
25714: push    dx
25715: push    bx
25716: push    ax
25717: mov     ax, 82h
2571A: xor     bx, bx
2571C: xor     dx, dx
2571E: mov     cx, [bp+var_1E]
25721: mov     si, [bp+var_1C]
25724: mov     di, [bp+var_1A]
25727: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2572C: pop     cx
2572D: pop     si
2572E: pop     di
2572F: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
25734: mov     [bp+var_24], ax
25737: mov     [bp+var_22], bx
2573A: mov     [bp+var_20], dx
2573D: mov     ax, [bp+var_12]
25740: mov     bx, [bp+var_10]
25743: mov     dx, [bp+var_E]
25746: mov     cx, 81h
25749: xor     si, si
2574B: xor     di, di
2574D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
25752: mov     cx, 9385h
25755: mov     si, 13Ah
25758: mov     di, 74CDh
2575B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
25760: call    @Int$q4Real; Int(x: Real): Real
25765: push    dx
25766: push    bx
25767: push    ax
25768: mov     ax, 89h
2576B: xor     bx, bx
2576D: mov     dx, 36A0h
25770: mov     cx, [bp+var_C]
25773: mov     si, [bp+var_A]
25776: mov     di, [bp+var_8]
25779: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2577E: call    @Int$q4Real; Int(x: Real): Real
25783: pop     cx
25784: pop     si
25785: pop     di
25786: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2578B: mov     cx, [bp+arg_0]
2578E: mov     si, [bp+arg_2]
25791: mov     di, [bp+arg_4]
25794: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
25799: mov     cx, 95h
2579C: mov     si, 1400h
2579F: mov     di, 5215h
257A2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
257A7: mov     cx, [bp+var_24]
257AA: mov     si, [bp+var_22]
257AD: mov     di, [bp+var_20]
257B0: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
257B5: mov     [bp+var_18], ax
257B8: mov     [bp+var_16], bx
257BB: mov     [bp+var_14], dx
257BE: mov     ax, [bp+var_18]
257C1: mov     bx, [bp+var_16]
257C4: mov     dx, [bp+var_14]
257C7: mov     [bp+var_6], ax
257CA: mov     [bp+var_4], bx
257CD: mov     [bp+var_2], dx
257D0: mov     ax, [bp+var_6]
257D3: mov     bx, [bp+var_4]
257D6: mov     dx, [bp+var_2]
257D9: mov     sp, bp
257DB: pop     bp
257DC: retf    12h
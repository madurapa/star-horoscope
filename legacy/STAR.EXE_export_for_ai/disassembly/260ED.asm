/*
 * func-name: sub_260ED
 * func-address: 0x260ed
 * export-type: disassembly-fallback
 * callers: 0x10a46, 0x18760
 * callees: 0x26424, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26ad9, 0x26d20
 * fallback-reason: decompile returned None
 */

260ED: push    bp
260EE: mov     bp, sp
260F0: mov     ax, 6
260F3: call    @__StackCheck$q4Word; Stack overflow check (AX)
260F8: sub     sp, 6
260FB: mov     ax, [bp+arg_0]
260FE: mov     bx, [bp+arg_2]
26101: mov     dx, [bp+arg_4]
26104: mov     cx, 81h
26107: xor     si, si
26109: xor     di, di
2610B: call    @__Cmp$q4Realt1; Compare two reals
26110: jnz     short loc_26124
26112: mov     [bp+var_6], 2181h
26117: mov     [bp+var_4], 0DAA2h
2611C: mov     [bp+var_2], 490Fh
26121: jmp     loc_261BF
26124: mov     ax, [bp+arg_0]
26127: mov     bx, [bp+arg_2]
2612A: mov     dx, [bp+arg_4]
2612D: mov     cx, [bp+arg_0]
26130: mov     si, [bp+arg_2]
26133: mov     di, [bp+arg_4]
26136: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2613B: push    dx
2613C: push    bx
2613D: push    ax
2613E: mov     ax, 81h
26141: xor     bx, bx
26143: xor     dx, dx
26145: pop     cx
26146: pop     si
26147: pop     di
26148: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2614D: call    @Sqrt$q4Real; Sqrt(x: Real): Real
26152: push    dx
26153: push    bx
26154: push    ax
26155: mov     ax, [bp+arg_0]
26158: mov     bx, [bp+arg_2]
2615B: mov     dx, [bp+arg_4]
2615E: pop     cx
2615F: pop     si
26160: pop     di
26161: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
26166: call    @ArcTan$q4Real; ArcTan(x: Real): Real
2616B: mov     [bp+arg_0], ax
2616E: mov     [bp+arg_2], bx
26171: mov     [bp+arg_4], dx
26174: mov     ax, [bp+arg_0]
26177: mov     bx, [bp+arg_2]
2617A: mov     dx, [bp+arg_4]
2617D: mov     cx, 2181h
26180: mov     si, 0DAA2h
26183: mov     di, 490Fh
26186: call    @__Cmp$q4Realt1; Compare two reals
2618B: jbe     short loc_261AD
2618D: mov     ax, [bp+arg_0]
26190: mov     bx, [bp+arg_2]
26193: mov     dx, [bp+arg_4]
26196: mov     cx, 2182h
26199: mov     si, 0DAA2h
2619C: mov     di, 490Fh
2619F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
261A4: mov     [bp+arg_0], ax
261A7: mov     [bp+arg_2], bx
261AA: mov     [bp+arg_4], dx
261AD: mov     ax, [bp+arg_0]
261B0: mov     bx, [bp+arg_2]
261B3: mov     dx, [bp+arg_4]
261B6: mov     [bp+var_6], ax
261B9: mov     [bp+var_4], bx
261BC: mov     [bp+var_2], dx
261BF: mov     ax, [bp+var_6]
261C2: mov     bx, [bp+var_4]
261C5: mov     dx, [bp+var_2]
261C8: mov     sp, bp
261CA: pop     bp
261CB: retf    6
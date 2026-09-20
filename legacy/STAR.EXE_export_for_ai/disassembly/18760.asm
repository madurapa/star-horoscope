/*
 * func-name: sub_18760
 * func-address: 0x18760
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x25f30, 0x25f7d, 0x25fc7, 0x260ed, 0x26424, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a74, 0x26b36, 0x26b49, 0x26d20
 * fallback-reason: decompile returned None
 */

18760: push    bp
18761: mov     bp, sp
18763: xor     ax, ax
18765: call    @__StackCheck$q4Word; Stack overflow check (AX)
1876A: mov     ax, word_27BF8
1876D: mov     bx, word_27BFA
18771: mov     dx, word_27BFC
18775: mov     cx, 84h
18778: xor     si, si
1877A: mov     di, 7000h
1877D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18782: mov     word_27B50, ax
18785: mov     word_27B52, bx
18789: mov     word_27B54, dx
1878D: mov     ax, word_27B50
18790: mov     bx, word_27B52
18794: mov     dx, word_27B54
18798: mov     cx, 89h
1879B: xor     si, si
1879D: mov     di, 3400h
187A0: call    @__Cmp$q4Realt1; Compare two reals
187A5: jnz     short loc_187B9
187A7: mov     word_27B50, 0
187AD: mov     word_27B52, 0
187B3: mov     word_27B54, 0
187B9: mov     ax, word_27B50
187BC: mov     bx, word_27B52
187C0: mov     dx, word_27B54
187C4: mov     cx, 3767h
187C7: mov     si, 5F41h
187CA: mov     di, 970h
187CD: call    @__Cmp$q4Realt1; Compare two reals
187D2: ja      short loc_187E6
187D4: mov     word_27B50, 3767h
187DA: mov     word_27B52, 5F41h
187E0: mov     word_27B54, 970h
187E6: mov     ax, word_27B50
187E9: mov     bx, word_27B52
187ED: mov     dx, word_27B54
187F1: mov     cx, 88h
187F4: xor     si, si
187F6: mov     di, 3400h
187F9: call    @__Cmp$q4Realt1; Compare two reals
187FE: jbe     short loc_18804
18800: mov     al, 0
18802: jmp     short loc_18806
18804: mov     al, 1
18806: push    ax
18807: mov     ax, word_27B50
1880A: mov     bx, word_27B52
1880E: mov     dx, word_27B54
18812: mov     cx, 3988h
18815: mov     si, 0FFEFh
18818: mov     di, 33FFh
1881B: call    @__Cmp$q4Realt1; Compare two reals
18820: jnb     short loc_18826
18822: mov     al, 0
18824: jmp     short loc_18828
18826: mov     al, 1
18828: pop     dx
18829: and     al, dl
1882B: or      al, al
1882D: jz      short loc_18841
1882F: mov     word_27B50, 5388h
18835: mov     word_27B52, 0FFFEh
1883B: mov     word_27B54, 33FFh
18841: mov     ax, word_27B50
18844: mov     bx, word_27B52
18848: mov     dx, word_27B54
1884C: mov     cx, 87h
1884F: xor     si, si
18851: mov     di, 3400h
18854: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
18859: mov     word_27B56, ax
1885C: mov     word_27B58, bx
18860: mov     word_27B5A, dx
18864: mov     ax, word_27B56
18867: mov     bx, word_27B58
1886B: mov     dx, word_27B5A
1886F: mov     cx, 87h
18872: xor     si, si
18874: mov     di, 3400h
18877: call    @__Cmp$q4Realt1; Compare two reals
1887C: jb      short loc_18882
1887E: mov     al, 0
18880: jmp     short loc_18884
18882: mov     al, 1
18884: push    ax
18885: mov     ax, word_27B56
18888: mov     bx, word_27B58
1888C: mov     dx, word_27B5A
18890: xor     cx, cx
18892: xor     si, si
18894: xor     di, di
18896: call    @__Cmp$q4Realt1; Compare two reals
1889B: jnb     short loc_188A1
1889D: mov     al, 0
1889F: jmp     short loc_188A3
188A1: mov     al, 1
188A3: pop     dx
188A4: and     al, dl
188A6: or      al, al
188A8: jz      short loc_188D2
188AA: mov     ax, word_27B56
188AD: mov     bx, word_27B58
188B1: mov     dx, word_27B5A
188B5: mov     word_27B5C, ax
188B8: mov     word_27B5E, bx
188BC: mov     word_27B60, dx
188C0: mov     word_27C10, 81h
188C6: mov     word_27C12, 0
188CC: mov     word_27C14, 0
188D2: mov     ax, word_27B56
188D5: mov     bx, word_27B58
188D9: mov     dx, word_27B5A
188DD: mov     cx, 88h
188E0: xor     si, si
188E2: mov     di, 3400h
188E5: call    @__Cmp$q4Realt1; Compare two reals
188EA: jb      short loc_188F0
188EC: mov     al, 0
188EE: jmp     short loc_188F2
188F0: mov     al, 1
188F2: push    ax
188F3: mov     ax, word_27B56
188F6: mov     bx, word_27B58
188FA: mov     dx, word_27B5A
188FE: mov     cx, 87h
18901: xor     si, si
18903: mov     di, 3400h
18906: call    @__Cmp$q4Realt1; Compare two reals
1890B: jnb     short loc_18911
1890D: mov     al, 0
1890F: jmp     short loc_18913
18911: mov     al, 1
18913: pop     dx
18914: and     al, dl
18916: or      al, al
18918: jz      short loc_18950
1891A: mov     ax, 88h
1891D: xor     bx, bx
1891F: mov     dx, 3400h
18922: mov     cx, word_27B56
18926: mov     si, word_27B58
1892A: mov     di, word_27B5A
1892E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18933: mov     word_27B5C, ax
18936: mov     word_27B5E, bx
1893A: mov     word_27B60, dx
1893E: mov     word_27C10, 82h
18944: mov     word_27C12, 0
1894A: mov     word_27C14, 0
18950: mov     ax, word_27B56
18953: mov     bx, word_27B58
18957: mov     dx, word_27B5A
1895B: mov     cx, 89h
1895E: xor     si, si
18960: mov     di, 700h
18963: call    @__Cmp$q4Realt1; Compare two reals
18968: jb      short loc_1896E
1896A: mov     al, 0
1896C: jmp     short loc_18970
1896E: mov     al, 1
18970: push    ax
18971: mov     ax, word_27B56
18974: mov     bx, word_27B58
18978: mov     dx, word_27B5A
1897C: mov     cx, 88h
1897F: xor     si, si
18981: mov     di, 3400h
18984: call    @__Cmp$q4Realt1; Compare two reals
18989: jnb     short loc_1898F
1898B: mov     al, 0
1898D: jmp     short loc_18991
1898F: mov     al, 1
18991: pop     dx
18992: and     al, dl
18994: or      al, al
18996: jz      short loc_189CD
18998: mov     ax, word_27B56
1899B: mov     bx, word_27B58
1899F: mov     dx, word_27B5A
189A3: mov     cx, 88h
189A6: xor     si, si
189A8: mov     di, 3400h
189AB: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
189B0: mov     word_27B5C, ax
189B3: mov     word_27B5E, bx
189B7: mov     word_27B60, dx
189BB: mov     word_27C10, 82h
189C1: mov     word_27C12, 0
189C7: mov     word_27C14, 4000h
189CD: mov     ax, word_27B56
189D0: mov     bx, word_27B58
189D4: mov     dx, word_27B5A
189D8: mov     cx, 89h
189DB: xor     si, si
189DD: mov     di, 3400h
189E0: call    @__Cmp$q4Realt1; Compare two reals
189E5: jbe     short loc_189EB
189E7: mov     al, 0
189E9: jmp     short loc_189ED
189EB: mov     al, 1
189ED: push    ax
189EE: mov     ax, word_27B56
189F1: mov     bx, word_27B58
189F5: mov     dx, word_27B5A
189F9: mov     cx, 89h
189FC: xor     si, si
189FE: mov     di, 700h
18A01: call    @__Cmp$q4Realt1; Compare two reals
18A06: jnb     short loc_18A0C
18A08: mov     al, 0
18A0A: jmp     short loc_18A0E
18A0C: mov     al, 1
18A0E: pop     dx
18A0F: and     al, dl
18A11: or      al, al
18A13: jz      short loc_18A4B
18A15: mov     ax, 89h
18A18: xor     bx, bx
18A1A: mov     dx, 3400h
18A1D: mov     cx, word_27B56
18A21: mov     si, word_27B58
18A25: mov     di, word_27B5A
18A29: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18A2E: mov     word_27B5C, ax
18A31: mov     word_27B5E, bx
18A35: mov     word_27B60, dx
18A39: mov     word_27C10, 83h
18A3F: mov     word_27C12, 0
18A45: mov     word_27C14, 0
18A4B: mov     ax, word_27B56
18A4E: mov     bx, word_27B58
18A52: mov     dx, word_27B5A
18A56: mov     cx, 89h
18A59: xor     si, si
18A5B: mov     di, 3400h
18A5E: call    @__Cmp$q4Realt1; Compare two reals
18A63: jb      short loc_18AB0
18A65: mov     ax, word_27B56
18A68: mov     bx, word_27B58
18A6C: mov     dx, word_27B5A
18A70: mov     cx, 89h
18A73: xor     si, si
18A75: mov     di, 3400h
18A78: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18A7D: mov     word_27B56, ax
18A80: mov     word_27B58, bx
18A84: mov     word_27B5A, dx
18A88: mov     ax, word_27B56
18A8B: mov     bx, word_27B58
18A8F: mov     dx, word_27B5A
18A93: mov     word_27B5C, ax
18A96: mov     word_27B5E, bx
18A9A: mov     word_27B60, dx
18A9E: mov     word_27C10, 81h
18AA4: mov     word_27C12, 0
18AAA: mov     word_27C14, 0
18AB0: mov     ax, word_27C0A
18AB3: mov     bx, word_27C0C
18AB7: mov     dx, word_27C0E
18ABB: mov     cx, 2182h
18ABE: mov     si, 0DAA2h
18AC1: mov     di, 490Fh
18AC4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18AC9: mov     cx, 88h
18ACC: xor     si, si
18ACE: mov     di, 3400h
18AD1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18AD6: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18ADB: push    dx
18ADC: push    bx
18ADD: push    ax
18ADE: mov     ax, word_27B5C
18AE1: mov     bx, word_27B5E
18AE5: mov     dx, word_27B60
18AE9: mov     cx, 2182h
18AEC: mov     si, 0DAA2h
18AEF: mov     di, 490Fh
18AF2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18AF7: mov     cx, 88h
18AFA: xor     si, si
18AFC: mov     di, 3400h
18AFF: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18B04: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18B09: push    dx
18B0A: push    bx
18B0B: push    ax
18B0C: mov     ax, word_27C0A
18B0F: mov     bx, word_27C0C
18B13: mov     dx, word_27C0E
18B17: mov     cx, 2182h
18B1A: mov     si, 0DAA2h
18B1D: mov     di, 490Fh
18B20: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18B25: mov     cx, 88h
18B28: xor     si, si
18B2A: mov     di, 3400h
18B2D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18B32: call    @Cos$q4Real; Cos(x: Real): Real
18B37: pop     cx
18B38: pop     si
18B39: pop     di
18B3A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18B3F: pop     cx
18B40: pop     si
18B41: pop     di
18B42: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18B47: call    @ArcTan$q4Real; ArcTan(x: Real): Real
18B4C: mov     word_27B62, ax
18B4F: mov     word_27B64, bx
18B53: mov     word_27B66, dx
18B57: mov     ax, word_27B62
18B5A: mov     bx, word_27B64
18B5E: mov     dx, word_27B66
18B62: mov     cx, 88h
18B65: xor     si, si
18B67: mov     di, 3400h
18B6A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18B6F: mov     cx, 2182h
18B72: mov     si, 0DAA2h
18B75: mov     di, 490Fh
18B78: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18B7D: mov     word_27B62, ax
18B80: mov     word_27B64, bx
18B84: mov     word_27B66, dx
18B88: mov     ax, word_27C10
18B8B: mov     bx, word_27C12
18B8F: mov     dx, word_27C14
18B93: mov     cx, 83h
18B96: xor     si, si
18B98: xor     di, di
18B9A: call    @__Cmp$q4Realt1; Compare two reals
18B9F: jz      short loc_18BA5
18BA1: mov     al, 0
18BA3: jmp     short loc_18BA7
18BA5: mov     al, 1
18BA7: push    ax
18BA8: mov     ax, word_27C10
18BAB: mov     bx, word_27C12
18BAF: mov     dx, word_27C14
18BB3: mov     cx, 81h
18BB6: xor     si, si
18BB8: xor     di, di
18BBA: call    @__Cmp$q4Realt1; Compare two reals
18BBF: jz      short loc_18BC5
18BC1: mov     al, 0
18BC3: jmp     short loc_18BC7
18BC5: mov     al, 1
18BC7: pop     dx
18BC8: or      al, dl
18BCA: or      al, al
18BCC: jz      short loc_18BF2
18BCE: mov     ax, word_27B62
18BD1: mov     bx, word_27B64
18BD5: mov     dx, word_27B66
18BD9: mov     cx, 9A85h
18BDC: mov     si, 9999h
18BDF: mov     di, 3B99h
18BE2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
18BE7: mov     word_27B68, ax
18BEA: mov     word_27B6A, bx
18BEE: mov     word_27B6C, dx
18BF2: mov     ax, word_27C10
18BF5: mov     bx, word_27C12
18BF9: mov     dx, word_27C14
18BFD: mov     cx, 82h
18C00: xor     si, si
18C02: mov     di, 4000h
18C05: call    @__Cmp$q4Realt1; Compare two reals
18C0A: jz      short loc_18C10
18C0C: mov     al, 0
18C0E: jmp     short loc_18C12
18C10: mov     al, 1
18C12: push    ax
18C13: mov     ax, word_27C10
18C16: mov     bx, word_27C12
18C1A: mov     dx, word_27C14
18C1E: mov     cx, 82h
18C21: xor     si, si
18C23: xor     di, di
18C25: call    @__Cmp$q4Realt1; Compare two reals
18C2A: jz      short loc_18C30
18C2C: mov     al, 0
18C2E: jmp     short loc_18C32
18C30: mov     al, 1
18C32: pop     dx
18C33: or      al, dl
18C35: or      al, al
18C37: jz      short loc_18C5D
18C39: mov     ax, word_27B62
18C3C: mov     bx, word_27B64
18C40: mov     dx, word_27B66
18C44: mov     cx, 9A85h
18C47: mov     si, 9999h
18C4A: mov     di, 3B99h
18C4D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18C52: mov     word_27B68, ax
18C55: mov     word_27B6A, bx
18C59: mov     word_27B6C, dx
18C5D: mov     ax, word_27B68
18C60: mov     bx, word_27B6A
18C64: mov     dx, word_27B6C
18C68: mov     cx, 87h
18C6B: xor     si, si
18C6D: mov     di, 3400h
18C70: call    @__Cmp$q4Realt1; Compare two reals
18C75: jb      short loc_18C7A
18C77: jmp     loc_18EB3
18C7A: mov     ax, word_27B68
18C7D: mov     bx, word_27B6A
18C81: mov     dx, word_27B6C
18C85: mov     cx, 2182h
18C88: mov     si, 0DAA2h
18C8B: mov     di, 490Fh
18C8E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18C93: mov     cx, 88h
18C96: xor     si, si
18C98: mov     di, 3400h
18C9B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18CA0: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18CA5: push    dx
18CA6: push    bx
18CA7: push    ax
18CA8: mov     ax, word_27B62
18CAB: mov     bx, word_27B64
18CAF: mov     dx, word_27B66
18CB3: mov     cx, 2182h
18CB6: mov     si, 0DAA2h
18CB9: mov     di, 490Fh
18CBC: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18CC1: mov     cx, 88h
18CC4: xor     si, si
18CC6: mov     di, 3400h
18CC9: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18CCE: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18CD3: push    dx
18CD4: push    bx
18CD5: push    ax
18CD6: mov     ax, word_27B5C
18CD9: mov     bx, word_27B5E
18CDD: mov     dx, word_27B60
18CE1: mov     cx, 2182h
18CE4: mov     si, 0DAA2h
18CE7: mov     di, 490Fh
18CEA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18CEF: mov     cx, 88h
18CF2: xor     si, si
18CF4: mov     di, 3400h
18CF7: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18CFC: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18D01: push    dx
18D02: push    bx
18D03: push    ax
18D04: mov     ax, word_27B5C
18D07: mov     bx, word_27B5E
18D0B: mov     dx, word_27B60
18D0F: mov     cx, 2182h
18D12: mov     si, 0DAA2h
18D15: mov     di, 490Fh
18D18: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18D1D: mov     cx, 88h
18D20: xor     si, si
18D22: mov     di, 3400h
18D25: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18D2A: call    @Cos$q4Real; Cos(x: Real): Real
18D2F: pop     cx
18D30: pop     si
18D31: pop     di
18D32: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18D37: pop     cx
18D38: pop     si
18D39: pop     di
18D3A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18D3F: pop     cx
18D40: pop     si
18D41: pop     di
18D42: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18D47: call    @ArcTan$q4Real; ArcTan(x: Real): Real
18D4C: mov     word_27B6E, ax
18D4F: mov     word_27B70, bx
18D53: mov     word_27B72, dx
18D57: mov     ax, word_27C10
18D5A: mov     bx, word_27C12
18D5E: mov     dx, word_27C14
18D62: mov     cx, 81h
18D65: xor     si, si
18D67: xor     di, di
18D69: call    @__Cmp$q4Realt1; Compare two reals
18D6E: jnz     short loc_18DA1
18D70: mov     ax, word_27B6E
18D73: mov     bx, word_27B70
18D77: mov     dx, word_27B72
18D7B: mov     cx, 88h
18D7E: xor     si, si
18D80: mov     di, 3400h
18D83: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18D88: mov     cx, 2182h
18D8B: mov     si, 0DAA2h
18D8E: mov     di, 490Fh
18D91: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18D96: mov     word_27B6E, ax
18D99: mov     word_27B70, bx
18D9D: mov     word_27B72, dx
18DA1: mov     ax, word_27C10
18DA4: mov     bx, word_27C12
18DA8: mov     dx, word_27C14
18DAC: mov     cx, 82h
18DAF: xor     si, si
18DB1: xor     di, di
18DB3: call    @__Cmp$q4Realt1; Compare two reals
18DB8: jnz     short loc_18DFE
18DBA: mov     ax, word_27B6E
18DBD: mov     bx, word_27B70
18DC1: mov     dx, word_27B72
18DC5: mov     cx, 88h
18DC8: xor     si, si
18DCA: mov     di, 3400h
18DCD: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18DD2: mov     cx, 2182h
18DD5: mov     si, 0DAA2h
18DD8: mov     di, 490Fh
18DDB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18DE0: push    dx
18DE1: push    bx
18DE2: push    ax
18DE3: mov     ax, 88h
18DE6: xor     bx, bx
18DE8: mov     dx, 3400h
18DEB: pop     cx
18DEC: pop     si
18DED: pop     di
18DEE: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18DF3: mov     word_27B6E, ax
18DF6: mov     word_27B70, bx
18DFA: mov     word_27B72, dx
18DFE: mov     ax, word_27C10
18E01: mov     bx, word_27C12
18E05: mov     dx, word_27C14
18E09: mov     cx, 82h
18E0C: xor     si, si
18E0E: mov     di, 4000h
18E11: call    @__Cmp$q4Realt1; Compare two reals
18E16: jnz     short loc_18E56
18E18: mov     ax, word_27B6E
18E1B: mov     bx, word_27B70
18E1F: mov     dx, word_27B72
18E23: mov     cx, 88h
18E26: xor     si, si
18E28: mov     di, 3400h
18E2B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18E30: mov     cx, 2182h
18E33: mov     si, 0DAA2h
18E36: mov     di, 490Fh
18E39: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18E3E: mov     cx, 88h
18E41: xor     si, si
18E43: mov     di, 3400h
18E46: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
18E4B: mov     word_27B6E, ax
18E4E: mov     word_27B70, bx
18E52: mov     word_27B72, dx
18E56: mov     ax, word_27C10
18E59: mov     bx, word_27C12
18E5D: mov     dx, word_27C14
18E61: mov     cx, 83h
18E64: xor     si, si
18E66: xor     di, di
18E68: call    @__Cmp$q4Realt1; Compare two reals
18E6D: jnz     short loc_18EB3
18E6F: mov     ax, word_27B6E
18E72: mov     bx, word_27B70
18E76: mov     dx, word_27B72
18E7A: mov     cx, 88h
18E7D: xor     si, si
18E7F: mov     di, 3400h
18E82: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18E87: mov     cx, 2182h
18E8A: mov     si, 0DAA2h
18E8D: mov     di, 490Fh
18E90: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18E95: push    dx
18E96: push    bx
18E97: push    ax
18E98: mov     ax, 89h
18E9B: xor     bx, bx
18E9D: mov     dx, 3400h
18EA0: pop     cx
18EA1: pop     si
18EA2: pop     di
18EA3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18EA8: mov     word_27B6E, ax
18EAB: mov     word_27B70, bx
18EAF: mov     word_27B72, dx
18EB3: mov     ax, word_27B68
18EB6: mov     bx, word_27B6A
18EBA: mov     dx, word_27B6C
18EBE: mov     cx, 87h
18EC1: xor     si, si
18EC3: mov     di, 3400h
18EC6: call    @__Cmp$q4Realt1; Compare two reals
18ECB: ja      short loc_18ED0
18ECD: jmp     loc_18FF8
18ED0: mov     ax, word_27B68
18ED3: mov     bx, word_27B6A
18ED7: mov     dx, word_27B6C
18EDB: mov     cx, 2182h
18EDE: mov     si, 0DAA2h
18EE1: mov     di, 490Fh
18EE4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18EE9: mov     cx, 88h
18EEC: xor     si, si
18EEE: mov     di, 3400h
18EF1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18EF6: mov     cx, 87h
18EF9: xor     si, si
18EFB: mov     di, 3400h
18EFE: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18F03: call    @Cos$q4Real; Cos(x: Real): Real
18F08: push    dx
18F09: push    bx
18F0A: push    ax
18F0B: mov     ax, word_27B62
18F0E: mov     bx, word_27B64
18F12: mov     dx, word_27B66
18F16: mov     cx, 2182h
18F19: mov     si, 0DAA2h
18F1C: mov     di, 490Fh
18F1F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18F24: mov     cx, 88h
18F27: xor     si, si
18F29: mov     di, 3400h
18F2C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18F31: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18F36: push    dx
18F37: push    bx
18F38: push    ax
18F39: mov     ax, word_27B5C
18F3C: mov     bx, word_27B5E
18F40: mov     dx, word_27B60
18F44: mov     cx, 2182h
18F47: mov     si, 0DAA2h
18F4A: mov     di, 490Fh
18F4D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18F52: mov     cx, 88h
18F55: xor     si, si
18F57: mov     di, 3400h
18F5A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18F5F: call    far ptr @Sin$q4Real; Sin(x: Real): Real
18F64: push    dx
18F65: push    bx
18F66: push    ax
18F67: mov     ax, word_27B5C
18F6A: mov     bx, word_27B5E
18F6E: mov     dx, word_27B60
18F72: mov     cx, 2182h
18F75: mov     si, 0DAA2h
18F78: mov     di, 490Fh
18F7B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18F80: mov     cx, 88h
18F83: xor     si, si
18F85: mov     di, 3400h
18F88: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18F8D: call    @Cos$q4Real; Cos(x: Real): Real
18F92: pop     cx
18F93: pop     si
18F94: pop     di
18F95: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18F9A: pop     cx
18F9B: pop     si
18F9C: pop     di
18F9D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18FA2: pop     cx
18FA3: pop     si
18FA4: pop     di
18FA5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18FAA: call    @ArcTan$q4Real; ArcTan(x: Real): Real
18FAF: mov     word_27B6E, ax
18FB2: mov     word_27B70, bx
18FB6: mov     word_27B72, dx
18FBA: mov     ax, word_27B6E
18FBD: mov     bx, word_27B70
18FC1: mov     dx, word_27B72
18FC5: mov     cx, 88h
18FC8: xor     si, si
18FCA: mov     di, 3400h
18FCD: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18FD2: mov     cx, 2182h
18FD5: mov     si, 0DAA2h
18FD8: mov     di, 490Fh
18FDB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
18FE0: mov     cx, 88h
18FE3: xor     si, si
18FE5: mov     di, 3400h
18FE8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
18FED: mov     word_27B6E, ax
18FF0: mov     word_27B70, bx
18FF4: mov     word_27B72, dx
18FF8: mov     ax, word_27B6E
18FFB: mov     bx, word_27B70
18FFF: mov     dx, word_27B72
19003: call    @Int$q4Real; Int(x: Real): Real
19008: mov     word_27B7A, ax
1900B: mov     word_27B7C, bx
1900F: mov     word_27B7E, dx
19013: mov     ax, word_27B6E
19016: mov     bx, word_27B70
1901A: mov     dx, word_27B72
1901E: call    @Int$q4Real; Int(x: Real): Real
19023: mov     cx, 81h
19026: xor     si, si
19028: xor     di, di
1902A: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1902F: mov     word_27B80, ax
19032: mov     word_27B82, bx
19036: mov     word_27B84, dx
1903A: mov     ax, 9A85h
1903D: mov     bx, 9999h
19040: mov     dx, 3B99h
19043: push    dx
19044: push    bx
19045: push    ax
19046: call    sub_25FC7
1904B: call    @Cos$q4Real; Cos(x: Real): Real
19050: push    dx
19051: push    bx
19052: push    ax
19053: push    word_27B7E
19057: push    word_27B7C
1905B: push    word_27B7A
1905F: call    sub_25FC7
19064: call    @Cos$q4Real; Cos(x: Real): Real
19069: pop     cx
1906A: pop     si
1906B: pop     di
1906C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19071: push    dx
19072: push    bx
19073: push    ax
19074: call    sub_260ED
19079: push    dx
1907A: push    bx
1907B: push    ax
1907C: call    sub_25F7D
19081: mov     word_27B98, ax
19084: mov     word_27B9A, bx
19088: mov     word_27B9C, dx
1908C: mov     ax, 9A85h
1908F: mov     bx, 9999h
19092: mov     dx, 3B99h
19095: push    dx
19096: push    bx
19097: push    ax
19098: call    sub_25FC7
1909D: call    @Cos$q4Real; Cos(x: Real): Real
190A2: push    dx
190A3: push    bx
190A4: push    ax
190A5: push    word_27B84
190A9: push    word_27B82
190AD: push    word_27B80
190B1: call    sub_25FC7
190B6: call    @Cos$q4Real; Cos(x: Real): Real
190BB: pop     cx
190BC: pop     si
190BD: pop     di
190BE: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
190C3: push    dx
190C4: push    bx
190C5: push    ax
190C6: call    sub_260ED
190CB: push    dx
190CC: push    bx
190CD: push    ax
190CE: call    sub_25F7D
190D3: mov     word_27B9E, ax
190D6: mov     word_27BA0, bx
190DA: mov     word_27BA2, dx
190DE: push    word_27B9C
190E2: push    word_27B9A
190E6: push    word_27B98
190EA: call    sub_25FC7
190EF: push    dx
190F0: push    bx
190F1: push    ax
190F2: call    sub_25F30
190F7: push    dx
190F8: push    bx
190F9: push    ax
190FA: push    word_27C0E
190FE: push    word_27C0C
19102: push    word_27C0A
19106: call    sub_25FC7
1910B: push    dx
1910C: push    bx
1910D: push    ax
1910E: call    sub_25F30
19113: pop     cx
19114: pop     si
19115: pop     di
19116: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1911B: push    dx
1911C: push    bx
1911D: push    ax
1911E: call    sub_260ED
19123: push    dx
19124: push    bx
19125: push    ax
19126: call    sub_25F7D
1912B: mov     word_27BA4, ax
1912E: mov     word_27BA6, bx
19132: mov     word_27BA8, dx
19136: push    word_27BA2
1913A: push    word_27BA0
1913E: push    word_27B9E
19142: call    sub_25FC7
19147: push    dx
19148: push    bx
19149: push    ax
1914A: call    sub_25F30
1914F: push    dx
19150: push    bx
19151: push    ax
19152: push    word_27C0E
19156: push    word_27C0C
1915A: push    word_27C0A
1915E: call    sub_25FC7
19163: push    dx
19164: push    bx
19165: push    ax
19166: call    sub_25F30
1916B: pop     cx
1916C: pop     si
1916D: pop     di
1916E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19173: push    dx
19174: push    bx
19175: push    ax
19176: call    sub_260ED
1917B: push    dx
1917C: push    bx
1917D: push    ax
1917E: call    sub_25F7D
19183: mov     word_27BAA, ax
19186: mov     word_27BAC, bx
1918A: mov     word_27BAE, dx
1918E: mov     ax, 87h
19191: xor     bx, bx
19193: mov     dx, 3400h
19196: mov     cx, word_27BA4
1919A: mov     si, word_27BA6
1919E: mov     di, word_27BA8
191A2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
191A7: mov     word_27BBC, ax
191AA: mov     word_27BBE, bx
191AE: mov     word_27BC0, dx
191B2: mov     ax, 87h
191B5: xor     bx, bx
191B7: mov     dx, 3400h
191BA: mov     cx, word_27BAA
191BE: mov     si, word_27BAC
191C2: mov     di, word_27BAE
191C6: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
191CB: mov     word_27BC2, ax
191CE: mov     word_27BC4, bx
191D2: mov     word_27BC6, dx
191D6: mov     ax, word_27B80
191D9: mov     bx, word_27B82
191DD: mov     dx, word_27B84
191E1: mov     cx, 87h
191E4: xor     si, si
191E6: mov     di, 3400h
191E9: call    @__Cmp$q4Realt1; Compare two reals
191EE: jbe     short loc_191F4
191F0: mov     al, 0
191F2: jmp     short loc_191F6
191F4: mov     al, 1
191F6: push    ax
191F7: mov     ax, word_27B80
191FA: mov     bx, word_27B82
191FE: mov     dx, word_27B84
19202: mov     cx, 0FF87h
19205: mov     si, 0FFFFh
19208: mov     di, 33FFh
1920B: call    @__Cmp$q4Realt1; Compare two reals
19210: jnb     short loc_19216
19212: mov     al, 0
19214: jmp     short loc_19218
19216: mov     al, 1
19218: pop     dx
19219: and     al, dl
1921B: or      al, al
1921D: jz      short loc_19231
1921F: mov     word_27B80, 0FF87h
19225: mov     word_27B82, 0FFFFh
1922B: mov     word_27B84, 33FFh
19231: mov     ax, 3C7Fh
19234: mov     bx, 1C2Fh
19237: mov     dx, 518Dh
1923A: call    far ptr @Sin$q4Real; Sin(x: Real): Real
1923F: push    dx
19240: push    bx
19241: push    ax
19242: mov     ax, word_27B7A
19245: mov     bx, word_27B7C
19249: mov     dx, word_27B7E
1924D: mov     cx, 2182h
19250: mov     si, 0DAA2h
19253: mov     di, 490Fh
19256: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1925B: mov     cx, 88h
1925E: xor     si, si
19260: mov     di, 3400h
19263: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
19268: call    far ptr @Sin$q4Real; Sin(x: Real): Real
1926D: push    dx
1926E: push    bx
1926F: push    ax
19270: mov     ax, word_27B7A
19273: mov     bx, word_27B7C
19277: mov     dx, word_27B7E
1927B: mov     cx, 2182h
1927E: mov     si, 0DAA2h
19281: mov     di, 490Fh
19284: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19289: mov     cx, 88h
1928C: xor     si, si
1928E: mov     di, 3400h
19291: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
19296: call    @Cos$q4Real; Cos(x: Real): Real
1929B: pop     cx
1929C: pop     si
1929D: pop     di
1929E: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
192A3: pop     cx
192A4: pop     si
192A5: pop     di
192A6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
192AB: call    @ArcTan$q4Real; ArcTan(x: Real): Real
192B0: mov     cx, 88h
192B3: xor     si, si
192B5: mov     di, 3400h
192B8: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
192BD: mov     cx, 2182h
192C0: mov     si, 0DAA2h
192C3: mov     di, 490Fh
192C6: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
192CB: mov     word_27BB0, ax
192CE: mov     word_27BB2, bx
192D2: mov     word_27BB4, dx
192D6: mov     ax, 3C7Fh
192D9: mov     bx, 1C2Fh
192DC: mov     dx, 518Dh
192DF: call    far ptr @Sin$q4Real; Sin(x: Real): Real
192E4: push    dx
192E5: push    bx
192E6: push    ax
192E7: mov     ax, word_27B80
192EA: mov     bx, word_27B82
192EE: mov     dx, word_27B84
192F2: mov     cx, 2182h
192F5: mov     si, 0DAA2h
192F8: mov     di, 490Fh
192FB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19300: mov     cx, 88h
19303: xor     si, si
19305: mov     di, 3400h
19308: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1930D: call    far ptr @Sin$q4Real; Sin(x: Real): Real
19312: push    dx
19313: push    bx
19314: push    ax
19315: mov     ax, word_27B80
19318: mov     bx, word_27B82
1931C: mov     dx, word_27B84
19320: mov     cx, 2182h
19323: mov     si, 0DAA2h
19326: mov     di, 490Fh
19329: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1932E: mov     cx, 88h
19331: xor     si, si
19333: mov     di, 3400h
19336: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1933B: call    @Cos$q4Real; Cos(x: Real): Real
19340: pop     cx
19341: pop     si
19342: pop     di
19343: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
19348: pop     cx
19349: pop     si
1934A: pop     di
1934B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19350: call    @ArcTan$q4Real; ArcTan(x: Real): Real
19355: mov     cx, 88h
19358: xor     si, si
1935A: mov     di, 3400h
1935D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19362: mov     cx, 2182h
19365: mov     si, 0DAA2h
19368: mov     di, 490Fh
1936B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
19370: mov     word_27BB6, ax
19373: mov     word_27BB8, bx
19377: mov     word_27BBA, dx
1937B: mov     ax, word_27B50
1937E: mov     bx, word_27B52
19382: mov     dx, word_27B54
19386: mov     cx, 88h
19389: xor     si, si
1938B: mov     di, 3400h
1938E: call    @__Cmp$q4Realt1; Compare two reals
19393: jbe     short loc_19399
19395: mov     al, 0
19397: jmp     short loc_1939B
19399: mov     al, 1
1939B: push    ax
1939C: mov     ax, word_27B50
1939F: mov     bx, word_27B52
193A3: mov     dx, word_27B54
193A7: xor     cx, cx
193A9: xor     si, si
193AB: xor     di, di
193AD: call    @__Cmp$q4Realt1; Compare two reals
193B2: jnb     short loc_193B8
193B4: mov     al, 0
193B6: jmp     short loc_193BA
193B8: mov     al, 1
193BA: pop     dx
193BB: and     al, dl
193BD: or      al, al
193BF: jz      short loc_19407
193C1: mov     ax, word_27BB0
193C4: mov     bx, word_27BB2
193C8: mov     dx, word_27BB4
193CC: mov     cx, 88h
193CF: xor     si, si
193D1: mov     di, 3400h
193D4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
193D9: mov     word_27BB0, ax
193DC: mov     word_27BB2, bx
193E0: mov     word_27BB4, dx
193E4: mov     ax, word_27BB6
193E7: mov     bx, word_27BB8
193EB: mov     dx, word_27BBA
193EF: mov     cx, 88h
193F2: xor     si, si
193F4: mov     di, 3400h
193F7: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
193FC: mov     word_27BB6, ax
193FF: mov     word_27BB8, bx
19403: mov     word_27BBA, dx
19407: mov     ax, word_27B50
1940A: mov     bx, word_27B52
1940E: mov     dx, word_27B54
19412: mov     cx, 89h
19415: xor     si, si
19417: mov     di, 3400h
1941A: call    @__Cmp$q4Realt1; Compare two reals
1941F: jbe     short loc_19425
19421: mov     al, 0
19423: jmp     short loc_19427
19425: mov     al, 1
19427: push    ax
19428: mov     ax, word_27B50
1942B: mov     bx, word_27B52
1942F: mov     dx, word_27B54
19433: mov     cx, 88h
19436: xor     si, si
19438: mov     di, 3400h
1943B: call    @__Cmp$q4Realt1; Compare two reals
19440: ja      short loc_19446
19442: mov     al, 0
19444: jmp     short loc_19448
19446: mov     al, 1
19448: pop     dx
19449: and     al, dl
1944B: or      al, al
1944D: jz      short loc_19495
1944F: mov     ax, word_27BB0
19452: mov     bx, word_27BB2
19456: mov     dx, word_27BB4
1945A: mov     cx, 89h
1945D: xor     si, si
1945F: mov     di, 3400h
19462: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
19467: mov     word_27BB0, ax
1946A: mov     word_27BB2, bx
1946E: mov     word_27BB4, dx
19472: mov     ax, word_27BB6
19475: mov     bx, word_27BB8
19479: mov     dx, word_27BBA
1947D: mov     cx, 89h
19480: xor     si, si
19482: mov     di, 3400h
19485: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1948A: mov     word_27BB6, ax
1948D: mov     word_27BB8, bx
19491: mov     word_27BBA, dx
19495: mov     ax, word_27BB0
19498: mov     bx, word_27BB2
1949C: mov     dx, word_27BB4
194A0: mov     cx, word_27BBC
194A4: mov     si, word_27BBE
194A8: mov     di, word_27BC0
194AC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
194B1: mov     word_27BC8, ax
194B4: mov     word_27BCA, bx
194B8: mov     word_27BCC, dx
194BC: mov     ax, word_27BB6
194BF: mov     bx, word_27BB8
194C3: mov     dx, word_27BBA
194C7: mov     cx, word_27BC2
194CB: mov     si, word_27BC4
194CF: mov     di, word_27BC6
194D3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
194D8: mov     word_27BCE, ax
194DB: mov     word_27BD0, bx
194DF: mov     word_27BD2, dx
194E3: mov     ax, word_27BCE
194E6: mov     bx, word_27BD0
194EA: mov     dx, word_27BD2
194EE: mov     cx, word_27BC8
194F2: mov     si, word_27BCA
194F6: mov     di, word_27BCC
194FA: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
194FF: push    dx
19500: push    bx
19501: push    ax
19502: mov     ax, word_27B80
19505: mov     bx, word_27B82
19509: mov     dx, word_27B84
1950D: mov     cx, word_27B7A
19511: mov     si, word_27B7C
19515: mov     di, word_27B7E
19519: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1951E: push    dx
1951F: push    bx
19520: push    ax
19521: mov     ax, word_27B50
19524: mov     bx, word_27B52
19528: mov     dx, word_27B54
1952C: mov     cx, word_27BC8
19530: mov     si, word_27BCA
19534: mov     di, word_27BCC
19538: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1953D: pop     cx
1953E: pop     si
1953F: pop     di
19540: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
19545: pop     cx
19546: pop     si
19547: pop     di
19548: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1954D: mov     cx, word_27B7A
19551: mov     si, word_27B7C
19555: mov     di, word_27B7E
19559: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1955E: mov     word_27C88, ax
19561: mov     word_27C8A, bx
19565: mov     word_27C8C, dx
19569: mov     sp, bp
1956B: pop     bp
1956C: retf
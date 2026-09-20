/*
 * func-name: sub_195D3
 * func-address: 0x195d3
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x21ee1, 0x220b3, 0x23a58, 0x263ee, 0x263fc, 0x26424, 0x2650b, 0x265f6, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a2a, 0x26a74, 0x27681, 0x2772a
 * fallback-reason: decompile returned None
 */

195D3: push    bp
195D4: mov     bp, sp
195D6: xor     ax, ax
195D8: call    @__StackCheck$q4Word; Stack overflow check (AX)
195DD: mov     word_27C8E, 4988h
195E3: mov     word_27C90, 0D80Eh
195E9: mov     word_27C92, 322Dh
195EF: mov     word_27C94, 0A992h
195F5: mov     word_27C96, 8487h
195FB: mov     word_27C98, 11F8h
19601: mov     word_27C9A, 0FD75h
19607: mov     word_27C9C, 0F538h
1960D: mov     word_27C9E, 1DDCh
19613: mov     word_27CA0, 0
19619: mov     word_27CA2, 0
1961F: mov     word_27CA4, 0
19625: mov     word_27CA6, 2C7Eh
1962B: mov     word_27CA8, 880Eh
19631: mov     word_27CAA, 528Ch
19637: mov     word_27CAC, 3771h
1963D: mov     word_27CAE, 0F538h
19643: mov     word_27CB0, 2BA7h
19649: mov     word_27CB2, 2368h
1964F: mov     word_27CB4, 594Dh
19655: mov     word_27CB6, 80D9h
1965B: mov     word_27CB8, 0
19661: mov     word_27CBA, 0
19667: mov     word_27CBC, 0
1966D: mov     word_27CBE, 1983h
19673: mov     word_27CC0, 99E5h
19679: mov     word_27CC2, 6017h
1967F: mov     word_27CC4, 0EE77h
19685: mov     word_27CC6, 1649h
1968B: mov     word_27CC8, 73E6h
19691: mov     word_27CCA, 0E771h
19697: mov     word_27CCC, 0F364h
1969D: mov     word_27CCE, 9982h
196A3: mov     word_27CD0, 0
196A9: mov     word_27CD2, 0
196AF: mov     word_27CD4, 0
196B5: mov     word_27CD6, 0C86h
196BB: mov     word_27CD8, 7258h
196C1: mov     word_27CDA, 3C95h
196C7: mov     word_27CDC, 0B981h
196CD: mov     word_27CDE, 0E7D3h
196D3: mov     word_27CE0, 17B4h
196D9: mov     word_27CE2, 2074h
196DF: mov     word_27CE4, 0ED01h
196E5: mov     word_27CE6, 3658h
196EB: mov     word_27CE8, 0
196F1: mov     word_27CEA, 0
196F7: mov     word_27CEC, 0
196FD: mov     word_27CEE, 3687h
19703: mov     word_27CF0, 0AE5h
19709: mov     word_27CF2, 4C8Fh
1970F: mov     word_27CF4, 8392h
19715: mov     word_27CF6, 20FAh
1971B: mov     word_27CF8, 11F8h
19721: mov     word_27CFA, 0F36Fh
19727: mov     word_27CFC, 8AC9h
1972D: mov     word_27CFE, 6AE1h
19733: mov     word_27D00, 0
19739: mov     word_27D02, 0
1973F: mov     word_27D04, 0
19745: mov     word_27D06, 0A87Fh
1974B: mov     word_27D08, 0C9A6h
19751: mov     word_27D0A, 4631h
19757: mov     word_27C10, 81h
1975D: mov     word_27C12, 0
19763: mov     word_27C14, 0
19769: mov     di, offset unk_2F60A
1976C: push    ds
1976D: push    di
1976E: mov     di, offset aBudha_1; "Budha "
19771: push    cs
19772: push    di
19773: xor     ax, ax
19775: push    ax
19776: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1977B: call    @Write$qm4Text; Write(var f: Text)
19780: call    @__IOCheck$qv; Exit if error
19785: mov     word_27DF6, 4
1978B: call    sub_220B3
19790: mov     ax, word_27B92
19793: mov     bx, word_27B94
19797: mov     dx, word_27B96
1979B: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
197A0: add     ax, 1
197A3: adc     dx, 0
197A6: mov     di, 7
197A9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
197AE: mov     word_27E00, ax
197B1: mov     ax, word_27B92
197B4: mov     bx, word_27B94
197B8: mov     dx, word_27B96
197BC: mov     word_27D3C, ax
197BF: mov     word_27D3E, bx
197C3: mov     word_27D40, dx
197C7: mov     ax, word_27B92
197CA: mov     bx, word_27B94
197CE: mov     dx, word_27B96
197D2: xor     cx, cx
197D4: xor     si, si
197D6: xor     di, di
197D8: call    @__Cmp$q4Realt1; Compare two reals
197DD: jnb     short loc_19802
197DF: mov     ax, word_27B92
197E2: mov     bx, word_27B94
197E6: mov     dx, word_27B96
197EA: mov     cx, 89h
197ED: xor     si, si
197EF: mov     di, 3400h
197F2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
197F7: mov     word_27B92, ax
197FA: mov     word_27B94, bx
197FE: mov     word_27B96, dx
19802: call    sub_23A58
19807: mov     di, offset unk_28018
1980A: push    ds
1980B: push    di
1980C: mov     di, offset unk_28518
1980F: push    ds
19810: push    di
19811: mov     ax, 0FFh
19814: push    ax
19815: call    @$basg$qm6Stringt14Byte; Store string
1981A: mov     di, offset unk_28118
1981D: push    ds
1981E: push    di
1981F: mov     di, offset unk_29218
19822: push    ds
19823: push    di
19824: mov     ax, 0FFh
19827: push    ax
19828: call    @$basg$qm6Stringt14Byte; Store string
1982D: mov     di, offset unk_2C218
19830: push    ds
19831: push    di
19832: mov     di, offset unk_2B818
19835: push    ds
19836: push    di
19837: mov     ax, 0FFh
1983A: push    ax
1983B: call    @$basg$qm6Stringt14Byte; Store string
19840: mov     di, offset unk_2D018
19843: push    ds
19844: push    di
19845: mov     di, offset unk_2C618
19848: push    ds
19849: push    di
1984A: mov     ax, 0FFh
1984D: push    ax
1984E: call    @$basg$qm6Stringt14Byte; Store string
19853: mov     di, offset unk_2DE18
19856: push    ds
19857: push    di
19858: mov     di, offset unk_2D418
1985B: push    ds
1985C: push    di
1985D: mov     ax, 0FFh
19860: push    ax
19861: call    @$basg$qm6Stringt14Byte; Store string
19866: mov     di, offset unk_2EC18
19869: push    ds
1986A: push    di
1986B: mov     di, offset unk_2E218
1986E: push    ds
1986F: push    di
19870: mov     ax, 0FFh
19873: push    ax
19874: call    @$basg$qm6Stringt14Byte; Store string
19879: mov     word_27C8E, 0EF89h
1987F: mov     word_27C90, 2ECAh
19885: mov     word_27C92, 2B62h
1988B: mov     word_27C94, 0BC90h
19891: mov     word_27C96, 363Fh
19897: mov     word_27C98, 6497h
1989D: mov     word_27C9A, 0FA75h
198A3: mov     word_27C9C, 3AF8h
198A9: mov     word_27C9E, 225Fh
198AF: mov     word_27CA0, 0
198B5: mov     word_27CA2, 0
198BB: mov     word_27CA4, 0
198C1: mov     word_27CA6, 3A79h
198C7: mov     word_27CA8, 183Eh
198CD: mov     word_27CAA, 5F80h
198D3: mov     word_27CAC, 4672h
198D9: mov     word_27CAE, 7C29h
198DF: mov     word_27CB0, 0C811h
198E5: mov     word_27CB2, 7069h
198EB: mov     word_27CB4, 0C608h
198F1: mov     word_27CB6, 436Bh
198F7: mov     word_27CB8, 0
198FD: mov     word_27CBA, 0
19903: mov     word_27CBC, 0
19909: mov     word_27CBE, 0EC82h
1990F: mov     word_27CC0, 4013h
19915: mov     word_27CC2, 5931h
1991B: mov     word_27CC4, 6F77h
19921: mov     word_27CC6, 0C36h
19927: mov     word_27CC8, 3D5h
1992D: mov     word_27CCA, 0AF6Dh
19933: mov     word_27CCC, 0BD05h
19939: mov     word_27CCE, 8637h
1993F: mov     word_27CD0, 0
19945: mov     word_27CD2, 0
1994B: mov     word_27CD4, 0
19951: mov     word_27CD6, 3F87h
19957: mov     word_27CD8, 2DE4h
1995D: mov     word_27CDA, 178Fh
19963: mov     word_27CDC, 0CF80h
19969: mov     word_27CDE, 9023h
1996F: mov     word_27CE0, 665Ch
19975: mov     word_27CE2, 1B75h
1997B: mov     word_27CE4, 44BBh
19981: mov     word_27CE6, 56F5h
19987: mov     word_27CE8, 0
1998D: mov     word_27CEA, 0
19993: mov     word_27CEC, 0
19999: mov     word_27CEE, 3C88h
1999F: mov     word_27CF0, 6CA0h
199A5: mov     word_27CF2, 549Ah
199AB: mov     word_27CF4, 6D90h
199B1: mov     word_27CF6, 0CDCAh
199B7: mov     word_27CF8, 6495h
199BD: mov     word_27CFA, 0A477h
199C3: mov     word_27CFC, 0FFE2h
199C9: mov     word_27CFE, 288Eh
199CF: mov     word_27D00, 0
199D5: mov     word_27D02, 0
199DB: mov     word_27D04, 0
199E1: mov     word_27D06, 2A80h
199E7: mov     word_27D08, 427Eh
199ED: mov     word_27D0A, 392Ch
199F3: mov     word_27C10, 82h
199F9: mov     word_27C12, 0
199FF: mov     word_27C14, 0
19A05: mov     di, offset unk_2F60A
19A08: push    ds
19A09: push    di
19A0A: mov     di, offset aSikuru_1; "Sikuru"
19A0D: push    cs
19A0E: push    di
19A0F: xor     ax, ax
19A11: push    ax
19A12: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
19A17: call    @Write$qm4Text; Write(var f: Text)
19A1C: call    @__IOCheck$qv; Exit if error
19A21: mov     word_27DF6, 6
19A27: call    sub_220B3
19A2C: mov     ax, word_27B92
19A2F: mov     bx, word_27B94
19A33: mov     dx, word_27B96
19A37: mov     word_27D54, ax
19A3A: mov     word_27D56, bx
19A3E: mov     word_27D58, dx
19A42: mov     ax, word_27B92
19A45: mov     bx, word_27B94
19A49: mov     dx, word_27B96
19A4D: xor     cx, cx
19A4F: xor     si, si
19A51: xor     di, di
19A53: call    @__Cmp$q4Realt1; Compare two reals
19A58: jnb     short loc_19A7D
19A5A: mov     ax, word_27B92
19A5D: mov     bx, word_27B94
19A61: mov     dx, word_27B96
19A65: mov     cx, 89h
19A68: xor     si, si
19A6A: mov     di, 3400h
19A6D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
19A72: mov     word_27B92, ax
19A75: mov     word_27B94, bx
19A79: mov     word_27B96, dx
19A7D: call    sub_23A58
19A82: mov     di, offset unk_28018
19A85: push    ds
19A86: push    di
19A87: mov     di, offset unk_28618
19A8A: push    ds
19A8B: push    di
19A8C: mov     ax, 0FFh
19A8F: push    ax
19A90: call    @$basg$qm6Stringt14Byte; Store string
19A95: mov     di, offset unk_28118
19A98: push    ds
19A99: push    di
19A9A: mov     di, offset unk_29318
19A9D: push    ds
19A9E: push    di
19A9F: mov     ax, 0FFh
19AA2: push    ax
19AA3: call    @$basg$qm6Stringt14Byte; Store string
19AA8: mov     di, offset unk_2C218
19AAB: push    ds
19AAC: push    di
19AAD: mov     di, offset unk_2C118
19AB0: push    ds
19AB1: push    di
19AB2: mov     ax, 0FFh
19AB5: push    ax
19AB6: call    @$basg$qm6Stringt14Byte; Store string
19ABB: mov     di, offset unk_2D018
19ABE: push    ds
19ABF: push    di
19AC0: mov     di, offset unk_2CF18
19AC3: push    ds
19AC4: push    di
19AC5: mov     ax, 0FFh
19AC8: push    ax
19AC9: call    @$basg$qm6Stringt14Byte; Store string
19ACE: mov     di, offset unk_2DE18
19AD1: push    ds
19AD2: push    di
19AD3: mov     di, offset unk_2DD18
19AD6: push    ds
19AD7: push    di
19AD8: mov     ax, 0FFh
19ADB: push    ax
19ADC: call    @$basg$qm6Stringt14Byte; Store string
19AE1: mov     di, offset unk_2EC18
19AE4: push    ds
19AE5: push    di
19AE6: mov     di, offset unk_2EB18
19AE9: push    ds
19AEA: push    di
19AEB: mov     ax, 0FFh
19AEE: push    ax
19AEF: call    @$basg$qm6Stringt14Byte; Store string
19AF4: mov     word_27C8E, 0E489h
19AFA: mov     word_27C90, 60F5h
19B00: mov     word_27C92, 12DEh
19B06: mov     word_27C94, 0E38Fh
19B0C: mov     word_27C96, 6419h
19B12: mov     word_27C98, 158Bh
19B18: mov     word_27C9A, 75h ; 'u'
19B1E: mov     word_27C9C, 72B6h
19B24: mov     word_27C9E, 22E5h
19B2A: mov     word_27CA0, 0
19B30: mov     word_27CA2, 0
19B36: mov     word_27CA4, 0
19B3C: mov     word_27CA6, 0C37Dh
19B42: mov     word_27CA8, 0D416h
19B48: mov     word_27CAA, 3F1Ah
19B4E: mov     word_27CAC, 2473h
19B54: mov     word_27CAE, 7A70h
19B5A: mov     word_27CB0, 4112h
19B60: mov     word_27CB2, 7669h
19B66: mov     word_27CB4, 329Ah
19B6C: mov     word_27CB6, 0A55Bh
19B72: mov     word_27CB8, 0
19B78: mov     word_27CBA, 0
19B7E: mov     word_27CBC, 0
19B84: mov     word_27CBE, 0DB81h
19B8A: mov     word_27CC0, 0B634h
19B90: mov     word_27CC2, 6CD7h
19B96: mov     word_27CC4, 0FF76h
19B9C: mov     word_27CC6, 7BB2h
19BA2: mov     word_27CC8, 0B0F2h
19BA8: mov     word_27CCA, 8E70h
19BAE: mov     word_27CCC, 9682h
19BB4: mov     word_27CCE, 5364h
19BBA: mov     word_27CD0, 0
19BC0: mov     word_27CD2, 0
19BC6: mov     word_27CD4, 0
19BCC: mov     word_27CD6, 3986h
19BD2: mov     word_27CD8, 510Dh
19BD8: mov     word_27CDA, 4325h
19BDE: mov     word_27CDC, 0FD80h
19BE4: mov     word_27CDE, 0B648h
19BEA: mov     word_27CE0, 455Fh
19BF0: mov     word_27CE2, 296Dh
19BF6: mov     word_27CE4, 0A23Bh
19BFC: mov     word_27CE6, 0BBE7h
19C02: mov     word_27CE8, 0BC6Fh
19C08: mov     word_27CEA, 59F3h
19C0E: mov     word_27CEC, 0B2D8h
19C14: mov     word_27CEE, 1289h
19C1A: mov     word_27CF0, 72DAh
19C20: mov     word_27CF2, 1FC2h
19C26: mov     word_27CF4, 0CB8Fh
19C2C: mov     word_27CF6, 0B5A1h
19C32: mov     word_27CF8, 1587h
19C38: mov     word_27CFA, 0A74h
19C3E: mov     word_27CFC, 0D14Ah
19C44: mov     word_27CFE, 3DCAh
19C4A: mov     word_27D00, 0
19C50: mov     word_27D02, 0
19C56: mov     word_27D04, 0
19C5C: mov     word_27D06, 0E681h
19C62: mov     word_27D08, 37DCh
19C68: mov     word_27D0A, 4308h
19C6E: mov     word_27C10, 82h
19C74: mov     word_27C12, 0
19C7A: mov     word_27C14, 4000h
19C80: mov     di, offset unk_2F60A
19C83: push    ds
19C84: push    di
19C85: mov     di, offset aKuja_1; "Kuja  "
19C88: push    cs
19C89: push    di
19C8A: xor     ax, ax
19C8C: push    ax
19C8D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
19C92: call    @Write$qm4Text; Write(var f: Text)
19C97: call    @__IOCheck$qv; Exit if error
19C9C: mov     word_27DF6, 3
19CA2: call    sub_220B3
19CA7: mov     ax, word_27B92
19CAA: mov     bx, word_27B94
19CAE: mov     dx, word_27B96
19CB2: mov     word_27D36, ax
19CB5: mov     word_27D38, bx
19CB9: mov     word_27D3A, dx
19CBD: mov     ax, word_27B92
19CC0: mov     bx, word_27B94
19CC4: mov     dx, word_27B96
19CC8: xor     cx, cx
19CCA: xor     si, si
19CCC: xor     di, di
19CCE: call    @__Cmp$q4Realt1; Compare two reals
19CD3: jnb     short loc_19CF8
19CD5: mov     ax, word_27B92
19CD8: mov     bx, word_27B94
19CDC: mov     dx, word_27B96
19CE0: mov     cx, 89h
19CE3: xor     si, si
19CE5: mov     di, 3400h
19CE8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
19CED: mov     word_27B92, ax
19CF0: mov     word_27B94, bx
19CF4: mov     word_27B96, dx
19CF8: call    sub_23A58
19CFD: mov     di, offset unk_28018
19D00: push    ds
19D01: push    di
19D02: mov     di, offset unk_28718
19D05: push    ds
19D06: push    di
19D07: mov     ax, 0FFh
19D0A: push    ax
19D0B: call    @$basg$qm6Stringt14Byte; Store string
19D10: mov     di, offset unk_28118
19D13: push    ds
19D14: push    di
19D15: mov     di, offset unk_29418
19D18: push    ds
19D19: push    di
19D1A: mov     ax, 0FFh
19D1D: push    ax
19D1E: call    @$basg$qm6Stringt14Byte; Store string
19D23: mov     di, offset unk_2C218
19D26: push    ds
19D27: push    di
19D28: mov     di, offset unk_2B918
19D2B: push    ds
19D2C: push    di
19D2D: mov     ax, 0FFh
19D30: push    ax
19D31: call    @$basg$qm6Stringt14Byte; Store string
19D36: mov     di, offset unk_2D018
19D39: push    ds
19D3A: push    di
19D3B: mov     di, offset unk_2C718
19D3E: push    ds
19D3F: push    di
19D40: mov     ax, 0FFh
19D43: push    ax
19D44: call    @$basg$qm6Stringt14Byte; Store string
19D49: mov     di, offset unk_2DE18
19D4C: push    ds
19D4D: push    di
19D4E: mov     di, offset unk_2D518
19D51: push    ds
19D52: push    di
19D53: mov     ax, 0FFh
19D56: push    ax
19D57: call    @$basg$qm6Stringt14Byte; Store string
19D5C: mov     di, offset unk_2EC18
19D5F: push    ds
19D60: push    di
19D61: mov     di, offset unk_2E318
19D64: push    ds
19D65: push    di
19D66: mov     ax, 0FFh
19D69: push    ax
19D6A: call    @$basg$qm6Stringt14Byte; Store string
19D6F: mov     word_27C8E, 5488h
19D75: mov     word_27C90, 9C1Bh
19D7B: mov     word_27C92, 6E0Ch
19D81: mov     word_27C94, 468Ch
19D87: mov     word_27C96, 0D4EFh
19D8D: mov     word_27C98, 3DC4h
19D93: mov     word_27C9A, 8875h
19D99: mov     word_27C9C, 0AC6Eh
19D9F: mov     word_27C9E, 2F7Ah
19DA5: mov     word_27CA0, 956Dh
19DAB: mov     word_27CA2, 917Ch
19DB1: mov     word_27CA4, 0DD75h
19DB7: mov     word_27CA6, 2A7Ch
19DBD: mov     word_27CA8, 0A8A8h
19DC3: mov     word_27CAA, 45FAh
19DC9: mov     word_27CAC, 0C674h
19DCF: mov     word_27CAE, 0BBB0h
19DD5: mov     word_27CB0, 2C27h
19DDB: mov     word_27CB2, 846Bh
19DE1: mov     word_27CB4, 7463h
19DE7: mov     word_27CB6, 0FB0Ah
19DED: mov     word_27CB8, 0AA63h
19DF3: mov     word_27CBA, 6EBBh
19DF9: mov     word_27CBC, 0E9A5h
19DFF: mov     word_27CBE, 8D81h
19E05: mov     word_27CC0, 0A947h
19E0B: mov     word_27CC2, 2784h
19E11: mov     word_27CC4, 7D79h
19E17: mov     word_27CC6, 599Bh
19E1D: mov     word_27CC8, 0BAA6h
19E23: mov     word_27CCA, 586Fh
19E29: mov     word_27CCC, 0BEB2h
19E2F: mov     word_27CCE, 2DCh
19E35: mov     word_27CD0, 0
19E3B: mov     word_27CD2, 0
19E41: mov     word_27CD4, 0
19E47: mov     word_27CD6, 0E987h
19E4D: mov     word_27CD8, 728h
19E53: mov     word_27CDA, 46E3h
19E59: mov     word_27CDC, 0D081h
19E5F: mov     word_27CDE, 0C0Ah
19E65: mov     word_27CE0, 159h
19E6B: mov     word_27CE2, 4875h
19E71: mov     word_27CE4, 2B0Ch
19E77: mov     word_27CE6, 38AAh
19E7D: mov     word_27CE8, 0CF70h
19E83: mov     word_27CEA, 2BF3h
19E89: mov     word_27CEC, 8EC6h
19E8F: mov     word_27CEE, 5488h
19E95: mov     word_27CF0, 0D6Fh
19E9B: mov     word_27CF2, 6154h
19EA1: mov     word_27CF4, 908Ch
19EA7: mov     word_27CF6, 1283h
19EAD: mov     word_27CF8, 3DABh
19EB3: mov     word_27CFA, 0D276h
19EB9: mov     word_27CFC, 9B44h
19EBF: mov     word_27CFE, 0BD44h
19EC5: mov     word_27D00, 0
19ECB: mov     word_27D02, 0
19ED1: mov     word_27D04, 0
19ED7: mov     word_27D06, 0CE83h
19EDD: mov     word_27D08, 6134h
19EE3: mov     word_27D0A, 267Bh
19EE9: mov     word_27C10, 83h
19EEF: mov     word_27C12, 0
19EF5: mov     word_27C14, 0
19EFB: mov     di, offset unk_2F60A
19EFE: push    ds
19EFF: push    di
19F00: mov     di, offset aGuru_1; "Guru  "
19F03: push    cs
19F04: push    di
19F05: xor     ax, ax
19F07: push    ax
19F08: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
19F0D: call    @Write$qm4Text; Write(var f: Text)
19F12: call    @__IOCheck$qv; Exit if error
19F17: mov     word_27DF6, 5
19F1D: call    sub_220B3
19F22: mov     ax, word_27B92
19F25: mov     bx, word_27B94
19F29: mov     dx, word_27B96
19F2D: mov     word_27D5A, ax
19F30: mov     word_27D5C, bx
19F34: mov     word_27D5E, dx
19F38: mov     ax, word_27B92
19F3B: mov     bx, word_27B94
19F3F: mov     dx, word_27B96
19F43: xor     cx, cx
19F45: xor     si, si
19F47: xor     di, di
19F49: call    @__Cmp$q4Realt1; Compare two reals
19F4E: jnb     short loc_19F73
19F50: mov     ax, word_27B92
19F53: mov     bx, word_27B94
19F57: mov     dx, word_27B96
19F5B: mov     cx, 89h
19F5E: xor     si, si
19F60: mov     di, 3400h
19F63: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
19F68: mov     word_27B92, ax
19F6B: mov     word_27B94, bx
19F6F: mov     word_27B96, dx
19F73: call    sub_23A58
19F78: mov     di, offset unk_28018
19F7B: push    ds
19F7C: push    di
19F7D: mov     di, offset unk_28818
19F80: push    ds
19F81: push    di
19F82: mov     ax, 0FFh
19F85: push    ax
19F86: call    @$basg$qm6Stringt14Byte; Store string
19F8B: mov     di, offset unk_28118
19F8E: push    ds
19F8F: push    di
19F90: mov     di, offset unk_29518
19F93: push    ds
19F94: push    di
19F95: mov     ax, 0FFh
19F98: push    ax
19F99: call    @$basg$qm6Stringt14Byte; Store string
19F9E: mov     di, offset unk_2C218
19FA1: push    ds
19FA2: push    di
19FA3: mov     di, offset unk_2BA18
19FA6: push    ds
19FA7: push    di
19FA8: mov     ax, 0FFh
19FAB: push    ax
19FAC: call    @$basg$qm6Stringt14Byte; Store string
19FB1: mov     di, offset unk_2D018
19FB4: push    ds
19FB5: push    di
19FB6: mov     di, offset unk_2C818
19FB9: push    ds
19FBA: push    di
19FBB: mov     ax, 0FFh
19FBE: push    ax
19FBF: call    @$basg$qm6Stringt14Byte; Store string
19FC4: mov     di, offset unk_2DE18
19FC7: push    ds
19FC8: push    di
19FC9: mov     di, offset unk_2D618
19FCC: push    ds
19FCD: push    di
19FCE: mov     ax, 0FFh
19FD1: push    ax
19FD2: call    @$basg$qm6Stringt14Byte; Store string
19FD7: mov     di, offset unk_2EC18
19FDA: push    ds
19FDB: push    di
19FDC: mov     di, offset unk_2E418
19FDF: push    ds
19FE0: push    di
19FE1: mov     ax, 0FFh
19FE4: push    ax
19FE5: call    @$basg$qm6Stringt14Byte; Store string
19FEA: mov     word_27C8E, 6B89h
19FF0: mov     word_27C90, 3D81h
19FF6: mov     word_27C92, 548h
19FFC: mov     word_27C94, 408Bh
1A002: mov     word_27C96, 50F8h
1A008: mov     word_27C98, 18F0h
1A00E: mov     word_27C9A, 0B575h
1A014: mov     word_27C9C, 0A719h
1A01A: mov     word_27C9E, 2A21h
1A020: mov     word_27CA0, 0D86Fh
1A026: mov     word_27CA2, 9EE1h
1A02C: mov     word_27CA4, 0C29Dh
1A032: mov     word_27CA6, 0F67Ch
1A038: mov     word_27CA8, 5867h
1A03E: mov     word_27CAA, 64EFh
1A044: mov     word_27CAC, 2C75h
1A04A: mov     word_27CAE, 399Bh
1A050: mov     word_27CB0, 0B524h
1A056: mov     word_27CB2, 0BA6Ch
1A05C: mov     word_27CB4, 0C770h
1A062: mov     word_27CB6, 0C36Bh
1A068: mov     word_27CB8, 0A362h
1A06E: mov     word_27CBA, 0DEE5h
1A074: mov     word_27CBC, 4B68h
1A07A: mov     word_27CBE, 6A82h
1A080: mov     word_27CC0, 6E69h
1A086: mov     word_27CC2, 1F85h
1A08C: mov     word_27CC4, 0C79h
1A092: mov     word_27CC6, 1DABh
1A098: mov     word_27CC8, 806Ah
1A09E: mov     word_27CCA, 0A071h
1A0A4: mov     word_27CCC, 858Eh
1A0AA: mov     word_27CCE, 81F0h
1A0B0: mov     word_27CD0, 8468h
1A0B6: mov     word_27CD2, 7711h
1A0BC: mov     word_27CD4, 2BCCh
1A0C2: mov     word_27CD6, 0D187h
1A0C8: mov     word_27CD8, 0B124h
1A0CE: mov     word_27CDA, 6194h
1A0D4: mov     word_27CDC, 8780h
1A0DA: mov     word_27CDE, 0B6CDh
1A0E0: mov     word_27CE0, 5F89h
1A0E6: mov     word_27CE2, 3D74h
1A0EC: mov     word_27CE4, 81F8h
1A0F2: mov     word_27CE6, 9F92h
1A0F8: mov     word_27CE8, 0AB6Fh
1A0FE: mov     word_27CEA, 8D7Ch
1A104: mov     word_27CEC, 0B22Ch
1A10A: mov     word_27CEE, 0A588h
1A110: mov     word_27CF0, 5A31h
1A116: mov     word_27CF2, 2F77h
1A11C: mov     word_27CF4, 6A8Bh
1A122: mov     word_27CF6, 0A5A4h
1A128: mov     word_27CF8, 18B1h
1A12E: mov     word_27CFA, 9376h
1A134: mov     word_27CFC, 0A654h
1A13A: mov     word_27CFE, 8398h
1A140: mov     word_27D00, 0
1A146: mov     word_27D02, 0
1A14C: mov     word_27D04, 0
1A152: mov     word_27D06, 7984h
1A158: mov     word_27D08, 3D57h
1A15E: mov     word_27D0A, 18E0h
1A164: mov     word_27C10, 83h
1A16A: mov     word_27C12, 0
1A170: mov     word_27C14, 2000h
1A176: mov     di, offset unk_2F60A
1A179: push    ds
1A17A: push    di
1A17B: mov     di, offset aShani_1; "Shani "
1A17E: push    cs
1A17F: push    di
1A180: xor     ax, ax
1A182: push    ax
1A183: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A188: call    @Write$qm4Text; Write(var f: Text)
1A18D: call    @__IOCheck$qv; Exit if error
1A192: mov     word_27DF6, 7
1A198: call    sub_220B3
1A19D: mov     ax, word_27B92
1A1A0: mov     bx, word_27B94
1A1A4: mov     dx, word_27B96
1A1A8: mov     word_27D42, ax
1A1AB: mov     word_27D44, bx
1A1AF: mov     word_27D46, dx
1A1B3: mov     ax, word_27B92
1A1B6: mov     bx, word_27B94
1A1BA: mov     dx, word_27B96
1A1BE: xor     cx, cx
1A1C0: xor     si, si
1A1C2: xor     di, di
1A1C4: call    @__Cmp$q4Realt1; Compare two reals
1A1C9: jnb     short loc_1A1EE
1A1CB: mov     ax, word_27B92
1A1CE: mov     bx, word_27B94
1A1D2: mov     dx, word_27B96
1A1D6: mov     cx, 89h
1A1D9: xor     si, si
1A1DB: mov     di, 3400h
1A1DE: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A1E3: mov     word_27B92, ax
1A1E6: mov     word_27B94, bx
1A1EA: mov     word_27B96, dx
1A1EE: call    sub_23A58
1A1F3: mov     di, offset unk_28018
1A1F6: push    ds
1A1F7: push    di
1A1F8: mov     di, offset unk_28918
1A1FB: push    ds
1A1FC: push    di
1A1FD: mov     ax, 0FFh
1A200: push    ax
1A201: call    @$basg$qm6Stringt14Byte; Store string
1A206: mov     di, offset unk_28118
1A209: push    ds
1A20A: push    di
1A20B: mov     di, offset unk_29618
1A20E: push    ds
1A20F: push    di
1A210: mov     ax, 0FFh
1A213: push    ax
1A214: call    @$basg$qm6Stringt14Byte; Store string
1A219: mov     di, offset unk_2C218
1A21C: push    ds
1A21D: push    di
1A21E: mov     di, offset unk_2BB18
1A221: push    ds
1A222: push    di
1A223: mov     ax, 0FFh
1A226: push    ax
1A227: call    @$basg$qm6Stringt14Byte; Store string
1A22C: mov     di, offset unk_2D018
1A22F: push    ds
1A230: push    di
1A231: mov     di, offset unk_2C918
1A234: push    ds
1A235: push    di
1A236: mov     ax, 0FFh
1A239: push    ax
1A23A: call    @$basg$qm6Stringt14Byte; Store string
1A23F: mov     di, offset unk_2DE18
1A242: push    ds
1A243: push    di
1A244: mov     di, offset unk_2D718
1A247: push    ds
1A248: push    di
1A249: mov     ax, 0FFh
1A24C: push    ax
1A24D: call    @$basg$qm6Stringt14Byte; Store string
1A252: mov     di, offset unk_2EC18
1A255: push    ds
1A256: push    di
1A257: mov     di, offset unk_2E518
1A25A: push    ds
1A25B: push    di
1A25C: mov     ax, 0FFh
1A25F: push    ax
1A260: call    @$basg$qm6Stringt14Byte; Store string
1A265: mov     ax, 8578h
1A268: mov     bx, 0E0Ah
1A26B: mov     dx, 82Fh
1A26E: mov     cx, word_27C4C
1A272: mov     si, word_27C4E
1A276: mov     di, word_27C50
1A27A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1A27F: mov     cx, word_27C4C
1A283: mov     si, word_27C4E
1A287: mov     di, word_27C50
1A28B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1A290: push    dx
1A291: push    bx
1A292: push    ax
1A293: mov     ax, 968Bh
1A296: mov     bx, 8B43h
1A299: mov     dx, 71C4h
1A29C: mov     cx, word_27C4C
1A2A0: mov     si, word_27C4E
1A2A4: mov     di, word_27C50
1A2A8: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1A2AD: push    dx
1A2AE: push    bx
1A2AF: push    ax
1A2B0: mov     ax, 2289h
1A2B3: mov     bx, 758Eh
1A2B6: mov     dx, 197h
1A2B9: pop     cx
1A2BA: pop     si
1A2BB: pop     di
1A2BC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1A2C1: pop     cx
1A2C2: pop     si
1A2C3: pop     di
1A2C4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A2C9: mov     word_27D0C, ax
1A2CC: mov     word_27D0E, bx
1A2D0: mov     word_27D10, dx
1A2D4: mov     ax, word_27D0C
1A2D7: mov     bx, word_27D0E
1A2DB: mov     dx, word_27D10
1A2DF: mov     cx, 89h
1A2E2: xor     si, si
1A2E4: mov     di, 3400h
1A2E7: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1A2EC: call    @Int$q4Real; Int(x: Real): Real
1A2F1: push    dx
1A2F2: push    bx
1A2F3: push    ax
1A2F4: mov     ax, word_27D0C
1A2F7: mov     bx, word_27D0E
1A2FB: mov     dx, word_27D10
1A2FF: mov     cx, 89h
1A302: xor     si, si
1A304: mov     di, 3400h
1A307: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1A30C: pop     cx
1A30D: pop     si
1A30E: pop     di
1A30F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1A314: mov     cx, 89h
1A317: xor     si, si
1A319: mov     di, 3400h
1A31C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1A321: mov     word_27D0C, ax
1A324: mov     word_27D0E, bx
1A328: mov     word_27D10, dx
1A32C: mov     ax, word_27D0C
1A32F: mov     bx, word_27D0E
1A333: mov     dx, word_27D10
1A337: xor     cx, cx
1A339: xor     si, si
1A33B: xor     di, di
1A33D: call    @__Cmp$q4Realt1; Compare two reals
1A342: jnb     short loc_1A367
1A344: mov     ax, word_27D0C
1A347: mov     bx, word_27D0E
1A34B: mov     dx, word_27D10
1A34F: mov     cx, 89h
1A352: xor     si, si
1A354: mov     di, 3400h
1A357: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A35C: mov     word_27D0C, ax
1A35F: mov     word_27D0E, bx
1A363: mov     word_27D10, dx
1A367: mov     di, offset unk_27F18
1A36A: push    ds
1A36B: push    di
1A36C: mov     di, offset aN_0; "N"
1A36F: push    cs
1A370: push    di
1A371: call    @$bsub$qm6Stringt1; Compare two strings
1A376: jnz     short loc_1A3A1
1A378: mov     ax, word_27D0C
1A37B: mov     bx, word_27D0E
1A37F: mov     dx, word_27D10
1A383: mov     cx, word_27C76
1A387: mov     si, word_27C78
1A38B: mov     di, word_27C7A
1A38F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1A394: mov     word_27D0C, ax
1A397: mov     word_27D0E, bx
1A39B: mov     word_27D10, dx
1A39F: jmp     short loc_1A3B7
1A3A1: mov     ax, word_27D0C
1A3A4: mov     bx, word_27D0E
1A3A8: mov     dx, word_27D10
1A3AC: mov     word_27D0C, ax
1A3AF: mov     word_27D0E, bx
1A3B3: mov     word_27D10, dx
1A3B7: mov     di, offset unk_2F60A
1A3BA: push    ds
1A3BB: push    di
1A3BC: mov     di, offset aRaahu_0; "Raahu "
1A3BF: push    cs
1A3C0: push    di
1A3C1: xor     ax, ax
1A3C3: push    ax
1A3C4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A3C9: call    @Write$qm4Text; Write(var f: Text)
1A3CE: call    @__IOCheck$qv; Exit if error
1A3D3: mov     word_27DF6, 8
1A3D9: mov     ax, word_27D0C
1A3DC: mov     bx, word_27D0E
1A3E0: mov     dx, word_27D10
1A3E4: xor     cx, cx
1A3E6: xor     si, si
1A3E8: xor     di, di
1A3EA: call    @__Cmp$q4Realt1; Compare two reals
1A3EF: jnb     short loc_1A414
1A3F1: mov     ax, word_27D0C
1A3F4: mov     bx, word_27D0E
1A3F8: mov     dx, word_27D10
1A3FC: mov     cx, 89h
1A3FF: xor     si, si
1A401: mov     di, 3400h
1A404: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A409: mov     word_27D0C, ax
1A40C: mov     word_27D0E, bx
1A410: mov     word_27D10, dx
1A414: mov     ax, word_27D0C
1A417: mov     bx, word_27D0E
1A41B: mov     dx, word_27D10
1A41F: mov     word_27B6E, ax
1A422: mov     word_27B70, bx
1A426: mov     word_27B72, dx
1A42A: mov     ax, word_27D0C
1A42D: mov     bx, word_27D0E
1A431: mov     dx, word_27D10
1A435: mov     word_27D48, ax
1A438: mov     word_27D4A, bx
1A43C: mov     word_27D4C, dx
1A440: call    sub_21EE1
1A445: mov     di, offset unk_2F60A
1A448: push    ds
1A449: push    di
1A44A: mov     di, offset asc_195B4; "  "
1A44D: push    cs
1A44E: push    di
1A44F: xor     ax, ax
1A451: push    ax
1A452: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A457: call    @Write$qm4Text; Write(var f: Text)
1A45C: call    @__IOCheck$qv; Exit if error
1A461: call    sub_23A58
1A466: mov     di, offset unk_28018
1A469: push    ds
1A46A: push    di
1A46B: mov     di, offset unk_28A18
1A46E: push    ds
1A46F: push    di
1A470: mov     ax, 0FFh
1A473: push    ax
1A474: call    @$basg$qm6Stringt14Byte; Store string
1A479: mov     di, offset unk_28118
1A47C: push    ds
1A47D: push    di
1A47E: mov     di, offset unk_29718
1A481: push    ds
1A482: push    di
1A483: mov     ax, 0FFh
1A486: push    ax
1A487: call    @$basg$qm6Stringt14Byte; Store string
1A48C: mov     di, offset unk_2C218
1A48F: push    ds
1A490: push    di
1A491: mov     di, offset unk_2BC18
1A494: push    ds
1A495: push    di
1A496: mov     ax, 0FFh
1A499: push    ax
1A49A: call    @$basg$qm6Stringt14Byte; Store string
1A49F: mov     di, offset unk_2D018
1A4A2: push    ds
1A4A3: push    di
1A4A4: mov     di, offset unk_2CA18
1A4A7: push    ds
1A4A8: push    di
1A4A9: mov     ax, 0FFh
1A4AC: push    ax
1A4AD: call    @$basg$qm6Stringt14Byte; Store string
1A4B2: mov     di, offset unk_2DE18
1A4B5: push    ds
1A4B6: push    di
1A4B7: mov     di, offset unk_2D818
1A4BA: push    ds
1A4BB: push    di
1A4BC: mov     ax, 0FFh
1A4BF: push    ax
1A4C0: call    @$basg$qm6Stringt14Byte; Store string
1A4C5: mov     di, offset unk_2EC18
1A4C8: push    ds
1A4C9: push    di
1A4CA: mov     di, offset unk_2E618
1A4CD: push    ds
1A4CE: push    di
1A4CF: mov     ax, 0FFh
1A4D2: push    ax
1A4D3: call    @$basg$qm6Stringt14Byte; Store string
1A4D8: mov     ax, word_27D0C
1A4DB: mov     bx, word_27D0E
1A4DF: mov     dx, word_27D10
1A4E3: mov     cx, 88h
1A4E6: xor     si, si
1A4E8: mov     di, 3400h
1A4EB: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A4F0: mov     word_27D18, ax
1A4F3: mov     word_27D1A, bx
1A4F7: mov     word_27D1C, dx
1A4FB: mov     ax, word_27D18
1A4FE: mov     bx, word_27D1A
1A502: mov     dx, word_27D1C
1A506: mov     cx, 89h
1A509: xor     si, si
1A50B: mov     di, 3400h
1A50E: call    @__Cmp$q4Realt1; Compare two reals
1A513: jbe     short loc_1A538
1A515: mov     ax, word_27D18
1A518: mov     bx, word_27D1A
1A51C: mov     dx, word_27D1C
1A520: mov     cx, 89h
1A523: xor     si, si
1A525: mov     di, 3400h
1A528: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1A52D: mov     word_27D18, ax
1A530: mov     word_27D1A, bx
1A534: mov     word_27D1C, dx
1A538: mov     ax, word_27D18
1A53B: mov     bx, word_27D1A
1A53F: mov     dx, word_27D1C
1A543: xor     cx, cx
1A545: xor     si, si
1A547: xor     di, di
1A549: call    @__Cmp$q4Realt1; Compare two reals
1A54E: jnb     short loc_1A573
1A550: mov     ax, word_27D18
1A553: mov     bx, word_27D1A
1A557: mov     dx, word_27D1C
1A55B: mov     cx, 89h
1A55E: xor     si, si
1A560: mov     di, 3400h
1A563: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A568: mov     word_27D18, ax
1A56B: mov     word_27D1A, bx
1A56F: mov     word_27D1C, dx
1A573: mov     di, offset unk_2F60A
1A576: push    ds
1A577: push    di
1A578: mov     di, offset aKethu_0; "Kethu "
1A57B: push    cs
1A57C: push    di
1A57D: xor     ax, ax
1A57F: push    ax
1A580: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A585: call    @Write$qm4Text; Write(var f: Text)
1A58A: call    @__IOCheck$qv; Exit if error
1A58F: mov     word_27DF6, 9
1A595: mov     ax, word_27D18
1A598: mov     bx, word_27D1A
1A59C: mov     dx, word_27D1C
1A5A0: mov     word_27B6E, ax
1A5A3: mov     word_27B70, bx
1A5A7: mov     word_27B72, dx
1A5AB: mov     ax, word_27D18
1A5AE: mov     bx, word_27D1A
1A5B2: mov     dx, word_27D1C
1A5B6: mov     word_27D4E, ax
1A5B9: mov     word_27D50, bx
1A5BD: mov     word_27D52, dx
1A5C1: call    sub_21EE1
1A5C6: mov     di, offset unk_2F60A
1A5C9: push    ds
1A5CA: push    di
1A5CB: mov     di, offset asc_195B4; "  "
1A5CE: push    cs
1A5CF: push    di
1A5D0: xor     ax, ax
1A5D2: push    ax
1A5D3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A5D8: call    @Write$qm4Text; Write(var f: Text)
1A5DD: call    @__IOCheck$qv; Exit if error
1A5E2: call    sub_23A58
1A5E7: mov     di, offset unk_28018
1A5EA: push    ds
1A5EB: push    di
1A5EC: mov     di, offset unk_28B18
1A5EF: push    ds
1A5F0: push    di
1A5F1: mov     ax, 0FFh
1A5F4: push    ax
1A5F5: call    @$basg$qm6Stringt14Byte; Store string
1A5FA: mov     di, offset unk_28118
1A5FD: push    ds
1A5FE: push    di
1A5FF: mov     di, offset unk_29818
1A602: push    ds
1A603: push    di
1A604: mov     ax, 0FFh
1A607: push    ax
1A608: call    @$basg$qm6Stringt14Byte; Store string
1A60D: mov     di, offset unk_2C218
1A610: push    ds
1A611: push    di
1A612: mov     di, offset unk_2BD18
1A615: push    ds
1A616: push    di
1A617: mov     ax, 0FFh
1A61A: push    ax
1A61B: call    @$basg$qm6Stringt14Byte; Store string
1A620: mov     di, offset unk_2D018
1A623: push    ds
1A624: push    di
1A625: mov     di, offset unk_2CB18
1A628: push    ds
1A629: push    di
1A62A: mov     ax, 0FFh
1A62D: push    ax
1A62E: call    @$basg$qm6Stringt14Byte; Store string
1A633: mov     di, offset unk_2DE18
1A636: push    ds
1A637: push    di
1A638: mov     di, offset unk_2D918
1A63B: push    ds
1A63C: push    di
1A63D: mov     ax, 0FFh
1A640: push    ax
1A641: call    @$basg$qm6Stringt14Byte; Store string
1A646: mov     di, offset unk_2EC18
1A649: push    ds
1A64A: push    di
1A64B: mov     di, offset unk_2E718
1A64E: push    ds
1A64F: push    di
1A650: mov     ax, 0FFh
1A653: push    ax
1A654: call    @$basg$qm6Stringt14Byte; Store string
1A659: mov     word_27C8E, 0A588h
1A65F: mov     word_27C90, 5A31h
1A665: mov     word_27C92, 737Fh
1A66B: mov     word_27C94, 0E289h
1A671: mov     word_27C96, 88ACh
1A677: mov     word_27C98, 56EEh
1A67D: mov     word_27C9A, 575h
1A683: mov     word_27C9C, 0CD53h
1A689: mov     word_27C9E, 25ACh
1A68F: mov     word_27CA0, 6C6Ch
1A695: mov     word_27CA2, 0AFA0h
1A69B: mov     word_27CA4, 0A10Fh
1A6A1: mov     word_27CA6, 0A57Ch
1A6A7: mov     word_27CA8, 0A025h
1A6AD: mov     word_27CAA, 3DD3h
1A6B3: mov     word_27CAC, 7C71h
1A6B9: mov     word_27CAE, 1D88h
1A6BF: mov     word_27CB0, 0DEF8h
1A6C5: mov     word_27CB2, 7669h
1A6CB: mov     word_27CB4, 329Ah
1A6D1: mov     word_27CB6, 0A55Bh
1A6D7: mov     word_27CB8, 0
1A6DD: mov     word_27CBA, 0
1A6E3: mov     word_27CBC, 0
1A6E9: mov     word_27CBE, 5680h
1A6EF: mov     word_27CC0, 3361h
1A6F5: mov     word_27CC2, 45C0h
1A6FB: mov     word_27CC4, 6576h
1A701: mov     word_27CC6, 2C33h
1A707: mov     word_27CC8, 23EBh
1A70D: mov     word_27CCA, 572h
1A713: mov     word_27CCC, 0CD53h
1A719: mov     word_27CCE, 25ACh
1A71F: mov     word_27CD0, 0
1A725: mov     word_27CD2, 0
1A72B: mov     word_27CD4, 0
1A731: mov     word_27CD6, 9B87h
1A737: mov     word_27CD8, 47E4h
1A73D: mov     word_27CDA, 12F4h
1A743: mov     word_27CDC, 237Fh
1A749: mov     word_27CDE, 62C9h
1A74F: mov     word_27CE0, 7F51h
1A755: mov     word_27CE2, 4F77h
1A75B: mov     word_27CE4, 5934h
1A761: mov     word_27CE6, 2BEDh
1A767: mov     word_27CE8, 0
1A76D: mov     word_27CEA, 0
1A773: mov     word_27CEC, 0
1A779: mov     word_27CEE, 0
1A77F: mov     word_27CF0, 0
1A785: mov     word_27CF2, 0
1A78B: mov     word_27CF4, 0
1A791: mov     word_27CF6, 0
1A797: mov     word_27CF8, 0
1A79D: mov     word_27CFA, 0
1A7A3: mov     word_27CFC, 0
1A7A9: mov     word_27CFE, 0
1A7AF: mov     word_27D00, 0
1A7B5: mov     word_27D02, 0
1A7BB: mov     word_27D04, 0
1A7C1: mov     word_27D06, 3085h
1A7C7: mov     word_27D08, 0C02Fh
1A7CD: mov     word_27D0A, 19BEh
1A7D3: mov     word_27C10, 83h
1A7D9: mov     word_27C12, 0
1A7DF: mov     word_27C14, 4000h
1A7E5: mov     di, offset unk_2F60A
1A7E8: push    ds
1A7E9: push    di
1A7EA: mov     di, offset aUrenus_0; "Urenus"
1A7ED: push    cs
1A7EE: push    di
1A7EF: xor     ax, ax
1A7F1: push    ax
1A7F2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1A7F7: call    @Write$qm4Text; Write(var f: Text)
1A7FC: call    @__IOCheck$qv; Exit if error
1A801: call    sub_220B3
1A806: mov     ax, word_27B92
1A809: mov     bx, word_27B94
1A80D: mov     dx, word_27B96
1A811: mov     word_27D60, ax
1A814: mov     word_27D62, bx
1A818: mov     word_27D64, dx
1A81C: mov     ax, word_27B92
1A81F: mov     bx, word_27B94
1A823: mov     dx, word_27B96
1A827: xor     cx, cx
1A829: xor     si, si
1A82B: xor     di, di
1A82D: call    @__Cmp$q4Realt1; Compare two reals
1A832: jnb     short loc_1A857
1A834: mov     ax, word_27B92
1A837: mov     bx, word_27B94
1A83B: mov     dx, word_27B96
1A83F: mov     cx, 89h
1A842: xor     si, si
1A844: mov     di, 3400h
1A847: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1A84C: mov     word_27B92, ax
1A84F: mov     word_27B94, bx
1A853: mov     word_27B96, dx
1A857: mov     word_27E04, 1
1A85D: call    sub_23A58
1A862: mov     di, offset unk_28018
1A865: push    ds
1A866: push    di
1A867: mov     di, offset unk_28C18
1A86A: push    ds
1A86B: push    di
1A86C: mov     ax, 0FFh
1A86F: push    ax
1A870: call    @$basg$qm6Stringt14Byte; Store string
1A875: mov     di, offset unk_28118
1A878: push    ds
1A879: push    di
1A87A: mov     di, offset unk_29918
1A87D: push    ds
1A87E: push    di
1A87F: mov     ax, 0FFh
1A882: push    ax
1A883: call    @$basg$qm6Stringt14Byte; Store string
1A888: mov     di, offset unk_2EC18
1A88B: push    ds
1A88C: push    di
1A88D: mov     di, offset unk_2E818
1A890: push    ds
1A891: push    di
1A892: mov     ax, 0FFh
1A895: push    ax
1A896: call    @$basg$qm6Stringt14Byte; Store string
1A89B: mov     di, offset unk_2C218
1A89E: push    ds
1A89F: push    di
1A8A0: mov     di, offset unk_2BE18
1A8A3: push    ds
1A8A4: push    di
1A8A5: mov     ax, 0FFh
1A8A8: push    ax
1A8A9: call    @$basg$qm6Stringt14Byte; Store string
1A8AE: mov     di, offset unk_2D018
1A8B1: push    ds
1A8B2: push    di
1A8B3: mov     di, offset unk_2CC18
1A8B6: push    ds
1A8B7: push    di
1A8B8: mov     ax, 0FFh
1A8BB: push    ax
1A8BC: call    @$basg$qm6Stringt14Byte; Store string
1A8C1: mov     di, offset unk_2DE18
1A8C4: push    ds
1A8C5: push    di
1A8C6: mov     di, offset unk_2DA18
1A8C9: push    ds
1A8CA: push    di
1A8CB: mov     ax, 0FFh
1A8CE: push    ax
1A8CF: call    @$basg$qm6Stringt14Byte; Store string
1A8D4: mov     word_27C8E, 487h
1A8DA: mov     word_27C90, 7E48h
1A8E0: mov     word_27C92, 29EAh
1A8E6: mov     word_27C94, 8988h
1A8EC: mov     word_27C96, 0CB42h
1A8F2: mov     word_27C98, 5BE2h
1A8F8: mov     word_27C9A, 9E75h
1A8FE: mov     word_27C9C, 0C825h
1A904: mov     word_27C9E, 2808h
1A90A: mov     word_27CA0, 6C6Ch
1A910: mov     word_27CA2, 0AFA0h
1A916: mov     word_27CA4, 210Fh
1A91C: mov     word_27CA6, 0C17Ah
1A922: mov     word_27CA8, 6F4Dh
1A928: mov     word_27CAA, 1314h
1A92E: mov     word_27CAC, 286Fh
1A934: mov     word_27CAE, 4935h
1A93A: mov     word_27CB0, 5466h
1A940: mov     word_27CB2, 3764h
1A946: mov     word_27CB4, 5F41h
1A94C: mov     word_27CB6, 8970h
1A952: mov     word_27CB8, 0
1A958: mov     word_27CBA, 0
1A95E: mov     word_27CBC, 0
1A964: mov     word_27CBE, 0D681h
1A96A: mov     word_27CC0, 33ACh
1A970: mov     word_27CC2, 63BEh
1A976: mov     word_27CC4, 0D57Ah
1A97C: mov     word_27CC6, 0C165h
1A982: mov     word_27CC8, 9C5Ch
1A988: mov     word_27CCA, 1170h
1A98E: mov     word_27CCC, 33D0h
1A994: mov     word_27CCE, 98ACh
1A99A: mov     word_27CD0, 0
1A9A0: mov     word_27CD2, 0
1A9A6: mov     word_27CD4, 0
1A9AC: mov     word_27CD6, 6F88h
1A9B2: mov     word_27CD8, 6F82h
1A9B8: mov     word_27CDA, 2AEh
1A9BE: mov     word_27CDC, 0B481h
1A9C4: mov     word_27CDE, 0EDA4h
1A9CA: mov     word_27CE0, 0CA9h
1A9D0: mov     word_27CE2, 7675h
1A9D6: mov     word_27CE4, 0FBD3h
1A9DC: mov     word_27CE6, 300h
1A9E2: mov     word_27CE8, 3E6Fh
1A9E8: mov     word_27CEA, 4FB8h
1A9EE: mov     word_27CEC, 1E4Fh
1A9F4: mov     word_27CEE, 0
1A9FA: mov     word_27CF0, 0
1AA00: mov     word_27CF2, 0
1AA06: mov     word_27CF4, 0
1AA0C: mov     word_27CF6, 0
1AA12: mov     word_27CF8, 0
1AA18: mov     word_27CFA, 0
1AA1E: mov     word_27CFC, 0
1AA24: mov     word_27CFE, 0
1AA2A: mov     word_27D00, 0
1AA30: mov     word_27D02, 0
1AA36: mov     word_27D04, 0
1AA3C: mov     word_27D06, 7585h
1AA42: mov     word_27D08, 663Ch
1AA48: mov     word_27D0A, 70E0h
1AA4E: mov     word_27C10, 83h
1AA54: mov     word_27C12, 0
1AA5A: mov     word_27C14, 6000h
1AA60: mov     di, offset unk_2F60A
1AA63: push    ds
1AA64: push    di
1AA65: mov     di, offset aNeptun; "Neptun"
1AA68: push    cs
1AA69: push    di
1AA6A: xor     ax, ax
1AA6C: push    ax
1AA6D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1AA72: call    @Write$qm4Text; Write(var f: Text)
1AA77: call    @__IOCheck$qv; Exit if error
1AA7C: call    sub_220B3
1AA81: mov     ax, word_27B92
1AA84: mov     bx, word_27B94
1AA88: mov     dx, word_27B96
1AA8C: mov     word_27D66, ax
1AA8F: mov     word_27D68, bx
1AA93: mov     word_27D6A, dx
1AA97: mov     ax, word_27B92
1AA9A: mov     bx, word_27B94
1AA9E: mov     dx, word_27B96
1AAA2: xor     cx, cx
1AAA4: xor     si, si
1AAA6: xor     di, di
1AAA8: call    @__Cmp$q4Realt1; Compare two reals
1AAAD: jnb     short loc_1AAD2
1AAAF: mov     ax, word_27B92
1AAB2: mov     bx, word_27B94
1AAB6: mov     dx, word_27B96
1AABA: mov     cx, 89h
1AABD: xor     si, si
1AABF: mov     di, 3400h
1AAC2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1AAC7: mov     word_27B92, ax
1AACA: mov     word_27B94, bx
1AACE: mov     word_27B96, dx
1AAD2: mov     word_27E04, 1
1AAD8: call    sub_23A58
1AADD: mov     di, offset unk_28018
1AAE0: push    ds
1AAE1: push    di
1AAE2: mov     di, offset unk_28D18
1AAE5: push    ds
1AAE6: push    di
1AAE7: mov     ax, 0FFh
1AAEA: push    ax
1AAEB: call    @$basg$qm6Stringt14Byte; Store string
1AAF0: mov     di, offset unk_28118
1AAF3: push    ds
1AAF4: push    di
1AAF5: mov     di, offset unk_29A18
1AAF8: push    ds
1AAF9: push    di
1AAFA: mov     ax, 0FFh
1AAFD: push    ax
1AAFE: call    @$basg$qm6Stringt14Byte; Store string
1AB03: mov     di, offset unk_2EC18
1AB06: push    ds
1AB07: push    di
1AB08: mov     di, offset unk_2E918
1AB0B: push    ds
1AB0C: push    di
1AB0D: mov     ax, 0FFh
1AB10: push    ax
1AB11: call    @$basg$qm6Stringt14Byte; Store string
1AB16: mov     di, offset unk_2C218
1AB19: push    ds
1AB1A: push    di
1AB1B: mov     di, offset unk_2BF18
1AB1E: push    ds
1AB1F: push    di
1AB20: mov     ax, 0FFh
1AB23: push    ax
1AB24: call    @$basg$qm6Stringt14Byte; Store string
1AB29: mov     di, offset unk_2D018
1AB2C: push    ds
1AB2D: push    di
1AB2E: mov     di, offset unk_2CD18
1AB31: push    ds
1AB32: push    di
1AB33: mov     ax, 0FFh
1AB36: push    ax
1AB37: call    @$basg$qm6Stringt14Byte; Store string
1AB3C: mov     di, offset unk_2DE18
1AB3F: push    ds
1AB40: push    di
1AB41: mov     di, offset unk_2DB18
1AB44: push    ds
1AB45: push    di
1AB46: mov     ax, 0FFh
1AB49: push    ax
1AB4A: call    @$basg$qm6Stringt14Byte; Store string
1AB4F: mov     word_27C8E, 3F88h
1AB55: mov     word_27C90, 753Ah
1AB5B: mov     word_27C92, 35A5h
1AB61: mov     word_27C94, 0
1AB67: mov     word_27C96, 0
1AB6D: mov     word_27C98, 0
1AB73: mov     word_27C9A, 0
1AB79: mov     word_27C9C, 0
1AB7F: mov     word_27C9E, 0
1AB85: mov     word_27CA0, 0
1AB8B: mov     word_27CA2, 0
1AB91: mov     word_27CA4, 0
1AB97: mov     word_27CA6, 907Fh
1AB9D: mov     word_27CA8, 0EED8h
1ABA3: mov     word_27CAA, 1Eh
1ABA9: mov     word_27CAC, 0
1ABAF: mov     word_27CAE, 0
1ABB5: mov     word_27CB0, 0
1ABBB: mov     word_27CB2, 0
1ABC1: mov     word_27CB4, 0
1ABC7: mov     word_27CB6, 0
1ABCD: mov     word_27CB8, 0
1ABD3: mov     word_27CBA, 0
1ABD9: mov     word_27CBC, 0
1ABDF: mov     word_27CBE, 0FD85h
1ABE5: mov     word_27CC0, 0F487h
1ABEB: mov     word_27CC2, 95Bh
1ABF1: mov     word_27CC4, 0
1ABF7: mov     word_27CC6, 0
1ABFD: mov     word_27CC8, 0
1AC03: mov     word_27CCA, 0
1AC09: mov     word_27CCC, 0
1AC0F: mov     word_27CCE, 0
1AC15: mov     word_27CD0, 0
1AC1B: mov     word_27CD2, 0
1AC21: mov     word_27CD4, 0
1AC27: mov     word_27CD6, 1187h
1AC2D: mov     word_27CD8, 6FFCh
1AC33: mov     word_27CDA, 5BC5h
1AC39: mov     word_27CDC, 0
1AC3F: mov     word_27CDE, 0
1AC45: mov     word_27CE0, 0
1AC4B: mov     word_27CE2, 0
1AC51: mov     word_27CE4, 0
1AC57: mov     word_27CE6, 0
1AC5D: mov     word_27CE8, 0
1AC63: mov     word_27CEA, 0
1AC69: mov     word_27CEC, 0
1AC6F: mov     word_27CEE, 0
1AC75: mov     word_27CF0, 0
1AC7B: mov     word_27CF2, 0
1AC81: mov     word_27CF4, 0
1AC87: mov     word_27CF6, 0
1AC8D: mov     word_27CF8, 0
1AC93: mov     word_27CFA, 0
1AC99: mov     word_27CFC, 0
1AC9F: mov     word_27CFE, 0
1ACA5: mov     word_27D00, 0
1ACAB: mov     word_27D02, 0
1ACB1: mov     word_27D04, 0
1ACB7: mov     word_27D06, 0BA86h
1ACBD: mov     word_27D08, 3D31h
1ACC3: mov     word_27D0A, 1DC1h
1ACC9: mov     word_27C10, 84h
1ACCF: mov     word_27C12, 0
1ACD5: mov     word_27C14, 0
1ACDB: mov     di, offset unk_2F60A
1ACDE: push    ds
1ACDF: push    di
1ACE0: mov     di, offset aPluto; "Pluto "
1ACE3: push    cs
1ACE4: push    di
1ACE5: xor     ax, ax
1ACE7: push    ax
1ACE8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ACED: call    @Write$qm4Text; Write(var f: Text)
1ACF2: call    @__IOCheck$qv; Exit if error
1ACF7: call    sub_220B3
1ACFC: mov     ax, word_27B92
1ACFF: mov     bx, word_27B94
1AD03: mov     dx, word_27B96
1AD07: mov     word_27D6C, ax
1AD0A: mov     word_27D6E, bx
1AD0E: mov     word_27D70, dx
1AD12: mov     ax, word_27B92
1AD15: mov     bx, word_27B94
1AD19: mov     dx, word_27B96
1AD1D: xor     cx, cx
1AD1F: xor     si, si
1AD21: xor     di, di
1AD23: call    @__Cmp$q4Realt1; Compare two reals
1AD28: jnb     short loc_1AD4D
1AD2A: mov     ax, word_27B92
1AD2D: mov     bx, word_27B94
1AD31: mov     dx, word_27B96
1AD35: mov     cx, 89h
1AD38: xor     si, si
1AD3A: mov     di, 3400h
1AD3D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1AD42: mov     word_27B92, ax
1AD45: mov     word_27B94, bx
1AD49: mov     word_27B96, dx
1AD4D: mov     word_27E04, 1
1AD53: call    sub_23A58
1AD58: mov     di, offset unk_28018
1AD5B: push    ds
1AD5C: push    di
1AD5D: mov     di, offset unk_28E18
1AD60: push    ds
1AD61: push    di
1AD62: mov     ax, 0FFh
1AD65: push    ax
1AD66: call    @$basg$qm6Stringt14Byte; Store string
1AD6B: mov     di, offset unk_28118
1AD6E: push    ds
1AD6F: push    di
1AD70: mov     di, offset unk_29B18
1AD73: push    ds
1AD74: push    di
1AD75: mov     ax, 0FFh
1AD78: push    ax
1AD79: call    @$basg$qm6Stringt14Byte; Store string
1AD7E: mov     di, offset unk_2C218
1AD81: push    ds
1AD82: push    di
1AD83: mov     di, offset unk_2C018
1AD86: push    ds
1AD87: push    di
1AD88: mov     ax, 0FFh
1AD8B: push    ax
1AD8C: call    @$basg$qm6Stringt14Byte; Store string
1AD91: mov     di, offset unk_2D018
1AD94: push    ds
1AD95: push    di
1AD96: mov     di, offset unk_2CE18
1AD99: push    ds
1AD9A: push    di
1AD9B: mov     ax, 0FFh
1AD9E: push    ax
1AD9F: call    @$basg$qm6Stringt14Byte; Store string
1ADA4: mov     di, offset unk_2DE18
1ADA7: push    ds
1ADA8: push    di
1ADA9: mov     di, offset unk_2DC18
1ADAC: push    ds
1ADAD: push    di
1ADAE: mov     ax, 0FFh
1ADB1: push    ax
1ADB2: call    @$basg$qm6Stringt14Byte; Store string
1ADB7: mov     di, offset unk_2EC18
1ADBA: push    ds
1ADBB: push    di
1ADBC: mov     di, offset unk_2EA18
1ADBF: push    ds
1ADC0: push    di
1ADC1: mov     ax, 0FFh
1ADC4: push    ax
1ADC5: call    @$basg$qm6Stringt14Byte; Store string
1ADCA: mov     sp, bp
1ADCC: pop     bp
1ADCD: retf
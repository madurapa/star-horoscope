/*
 * func-name: sub_1633A
 * func-address: 0x1633a
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x15ff8, 0x21576, 0x25ad2, 0x263ee, 0x263fc, 0x26424, 0x2650b, 0x265f6, 0x26a00, 0x26a06, 0x26a18, 0x26a22, 0x26a26, 0x27639, 0x27662, 0x27681, 0x276c5, 0x2772a, 0x277c0
 * fallback-reason: decompile returned None
 */

1633A: push    bp
1633B: mov     bp, sp
1633D: mov     ax, 0ACh
16340: call    @__StackCheck$q4Word; Stack overflow check (AX)
16345: sub     sp, 0ACh
16349: call    sub_21576
1634E: mov     di, offset aRavi_1; "Ravi  "
16351: push    cs
16352: push    di
16353: mov     di, offset unk_2F480
16356: push    ds
16357: push    di
16358: mov     ax, 0Ch
1635B: push    ax
1635C: call    @$basg$qm6Stringt14Byte; Store string
16361: mov     [bp+var_AC], 6
16366: mov     di, offset aSandu_0; "Sandu "
16369: push    cs
1636A: push    di
1636B: mov     di, offset unk_2F48D
1636E: push    ds
1636F: push    di
16370: mov     ax, 0Ch
16373: push    ax
16374: call    @$basg$qm6Stringt14Byte; Store string
16379: mov     [bp+var_AB], 0Ah
1637E: mov     di, offset aKuja_0; "Kuja  "
16381: push    cs
16382: push    di
16383: mov     di, offset unk_2F49A
16386: push    ds
16387: push    di
16388: mov     ax, 0Ch
1638B: push    ax
1638C: call    @$basg$qm6Stringt14Byte; Store string
16391: mov     [bp+var_AA], 7
16396: mov     di, offset aRahu; "Rahu  "
16399: push    cs
1639A: push    di
1639B: mov     di, offset unk_2F4A7
1639E: push    ds
1639F: push    di
163A0: mov     ax, 0Ch
163A3: push    ax
163A4: call    @$basg$qm6Stringt14Byte; Store string
163A9: mov     [bp+var_A9], 12h
163AE: mov     di, offset aGuru_0; "Guru  "
163B1: push    cs
163B2: push    di
163B3: mov     di, offset unk_2F4B4
163B6: push    ds
163B7: push    di
163B8: mov     ax, 0Ch
163BB: push    ax
163BC: call    @$basg$qm6Stringt14Byte; Store string
163C1: mov     [bp+var_A8], 10h
163C6: mov     di, offset aShani_0; "Shani "
163C9: push    cs
163CA: push    di
163CB: mov     di, offset unk_2F4C1
163CE: push    ds
163CF: push    di
163D0: mov     ax, 0Ch
163D3: push    ax
163D4: call    @$basg$qm6Stringt14Byte; Store string
163D9: mov     [bp+var_A7], 13h
163DE: mov     di, offset aBudha_0; "Budha "
163E1: push    cs
163E2: push    di
163E3: mov     di, offset unk_2F4CE
163E6: push    ds
163E7: push    di
163E8: mov     ax, 0Ch
163EB: push    ax
163EC: call    @$basg$qm6Stringt14Byte; Store string
163F1: mov     [bp+var_A6], 11h
163F6: mov     di, offset aKetu; "Ketu  "
163F9: push    cs
163FA: push    di
163FB: mov     di, offset unk_2F4DB
163FE: push    ds
163FF: push    di
16400: mov     ax, 0Ch
16403: push    ax
16404: call    @$basg$qm6Stringt14Byte; Store string
16409: mov     [bp+var_A5], 7
1640E: mov     di, offset aSikuru_0; "Sikuru"
16411: push    cs
16412: push    di
16413: mov     di, offset unk_2F4E8
16416: push    ds
16417: push    di
16418: mov     ax, 0Ch
1641B: push    ax
1641C: call    @$basg$qm6Stringt14Byte; Store string
16421: mov     [bp+var_A4], 14h
16426: mov     di, offset unk_2A218
16429: push    ds
1642A: push    di
1642B: mov     di, offset unk_2EEFE
1642E: push    ds
1642F: push    di
16430: call    @$bsub$qm6Stringt1; Compare two strings
16435: jnz     short loc_1644A
16437: mov     di, offset unk_2F48D
1643A: push    ds
1643B: push    di
1643C: mov     di, offset unk_2B318
1643F: push    ds
16440: push    di
16441: mov     ax, 0FFh
16444: push    ax
16445: call    @$basg$qm6Stringt14Byte; Store string
1644A: mov     di, offset unk_2A218
1644D: push    ds
1644E: push    di
1644F: mov     di, offset unk_2EF08
16452: push    ds
16453: push    di
16454: call    @$bsub$qm6Stringt1; Compare two strings
16459: jnz     short loc_1646E
1645B: mov     di, offset unk_2F480
1645E: push    ds
1645F: push    di
16460: mov     di, offset unk_2B318
16463: push    ds
16464: push    di
16465: mov     ax, 0FFh
16468: push    ax
16469: call    @$basg$qm6Stringt14Byte; Store string
1646E: mov     di, offset unk_2A218
16471: push    ds
16472: push    di
16473: mov     di, offset unk_2EF12
16476: push    ds
16477: push    di
16478: call    @$bsub$qm6Stringt1; Compare two strings
1647D: jnz     short loc_16492
1647F: mov     di, offset unk_2F4CE
16482: push    ds
16483: push    di
16484: mov     di, offset unk_2B318
16487: push    ds
16488: push    di
16489: mov     ax, 0FFh
1648C: push    ax
1648D: call    @$basg$qm6Stringt14Byte; Store string
16492: mov     di, offset unk_2A218
16495: push    ds
16496: push    di
16497: mov     di, offset unk_2EF1C
1649A: push    ds
1649B: push    di
1649C: call    @$bsub$qm6Stringt1; Compare two strings
164A1: jnz     short loc_164B6
164A3: mov     di, offset unk_2F4E8
164A6: push    ds
164A7: push    di
164A8: mov     di, offset unk_2B318
164AB: push    ds
164AC: push    di
164AD: mov     ax, 0FFh
164B0: push    ax
164B1: call    @$basg$qm6Stringt14Byte; Store string
164B6: mov     di, offset unk_2A218
164B9: push    ds
164BA: push    di
164BB: mov     di, offset unk_2EF26
164BE: push    ds
164BF: push    di
164C0: call    @$bsub$qm6Stringt1; Compare two strings
164C5: jnz     short loc_164DA
164C7: mov     di, offset unk_2F49A
164CA: push    ds
164CB: push    di
164CC: mov     di, offset unk_2B318
164CF: push    ds
164D0: push    di
164D1: mov     ax, 0FFh
164D4: push    ax
164D5: call    @$basg$qm6Stringt14Byte; Store string
164DA: mov     di, offset unk_2A218
164DD: push    ds
164DE: push    di
164DF: mov     di, offset unk_2EF30
164E2: push    ds
164E3: push    di
164E4: call    @$bsub$qm6Stringt1; Compare two strings
164E9: jnz     short loc_164FE
164EB: mov     di, offset unk_2F4B4
164EE: push    ds
164EF: push    di
164F0: mov     di, offset unk_2B318
164F3: push    ds
164F4: push    di
164F5: mov     ax, 0FFh
164F8: push    ax
164F9: call    @$basg$qm6Stringt14Byte; Store string
164FE: mov     di, offset unk_2A218
16501: push    ds
16502: push    di
16503: mov     di, offset unk_2EF3A
16506: push    ds
16507: push    di
16508: call    @$bsub$qm6Stringt1; Compare two strings
1650D: jnz     short loc_16522
1650F: mov     di, offset unk_2F4C1
16512: push    ds
16513: push    di
16514: mov     di, offset unk_2B318
16517: push    ds
16518: push    di
16519: mov     ax, 0FFh
1651C: push    ax
1651D: call    @$basg$qm6Stringt14Byte; Store string
16522: mov     di, offset unk_2A218
16525: push    ds
16526: push    di
16527: mov     di, offset unk_2EF44
1652A: push    ds
1652B: push    di
1652C: call    @$bsub$qm6Stringt1; Compare two strings
16531: jnz     short loc_16546
16533: mov     di, offset unk_2F4A7
16536: push    ds
16537: push    di
16538: mov     di, offset unk_2B318
1653B: push    ds
1653C: push    di
1653D: mov     ax, 0FFh
16540: push    ax
16541: call    @$basg$qm6Stringt14Byte; Store string
16546: mov     di, offset unk_2A218
16549: push    ds
1654A: push    di
1654B: mov     di, offset unk_2EF4E
1654E: push    ds
1654F: push    di
16550: call    @$bsub$qm6Stringt1; Compare two strings
16555: jnz     short loc_1656A
16557: mov     di, offset unk_2F4DB
1655A: push    ds
1655B: push    di
1655C: mov     di, offset unk_2B318
1655F: push    ds
16560: push    di
16561: mov     ax, 0FFh
16564: push    ax
16565: call    @$basg$qm6Stringt14Byte; Store string
1656A: mov     ax, word_27DF2
1656D: cwd
1656E: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16573: mov     cx, 89h
16576: xor     si, si
16578: mov     di, 3680h
1657B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
16580: push    dx
16581: push    bx
16582: push    ax
16583: mov     ax, word_27DF0
16586: cwd
16587: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1658C: mov     cx, 84h
1658F: xor     si, si
16591: mov     di, 4000h
16594: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
16599: push    dx
1659A: push    bx
1659B: push    ax
1659C: mov     ax, word_27DEE
1659F: cwd
165A0: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
165A5: pop     cx
165A6: pop     si
165A7: pop     di
165A8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
165AD: pop     cx
165AE: pop     si
165AF: pop     di
165B0: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
165B5: mov     [bp+var_12], ax
165B8: mov     [bp+var_10], bx
165BB: mov     [bp+var_E], dx
165BE: call    @CLRSCR$qv; CLRSCR(void)
165C3: mov     ax, [bp+var_12]
165C6: mov     bx, [bp+var_10]
165C9: mov     dx, [bp+var_E]
165CC: mov     cx, word_27D9C
165D0: mov     si, word_27D9E
165D4: mov     di, word_27DA0
165D8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
165DD: mov     [bp+var_18], ax
165E0: mov     [bp+var_16], bx
165E3: mov     [bp+var_14], dx
165E6: mov     ax, word_27D9C
165E9: mov     bx, word_27D9E
165ED: mov     dx, word_27DA0
165F1: mov     [bp+var_6C], ax
165F4: mov     [bp+var_6A], bx
165F7: mov     [bp+var_68], dx
165FA: mov     ax, [bp+var_12]
165FD: mov     bx, [bp+var_10]
16600: mov     dx, [bp+var_E]
16603: mov     [bp+var_54], ax
16606: mov     [bp+var_52], bx
16609: mov     [bp+var_50], dx
1660C: push    bp
1660D: call    sub_15FF8
16610: mov     di, offset unk_2F60A
16613: push    ds
16614: push    di
16615: mov     di, offset aAllMahaAndAthu; "ALL MAHA AND ATHURU DASAS DURING PARAMA"...
16618: push    cs
16619: push    di
1661A: xor     ax, ax
1661C: push    ax
1661D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16622: mov     di, offset unk_2B418
16625: push    ds
16626: push    di
16627: xor     ax, ax
16629: push    ax
1662A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1662F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
16634: call    @__IOCheck$qv; Exit if error
16639: mov     di, offset unk_2F60A
1663C: push    ds
1663D: push    di
1663E: mov     di, offset asc_161EE; "======================================="...
16641: push    cs
16642: push    di
16643: xor     ax, ax
16645: push    ax
16646: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1664B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
16650: call    @__IOCheck$qv; Exit if error
16655: mov     di, offset unk_2F60A
16658: push    ds
16659: push    di
1665A: mov     di, offset unk_2B318
1665D: push    ds
1665E: push    di
1665F: xor     ax, ax
16661: push    ax
16662: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16667: mov     di, offset aMahaDasavaFrom; " Maha   dasava from "
1666A: push    cs
1666B: push    di
1666C: xor     ax, ax
1666E: push    ax
1666F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16674: mov     ax, [bp+var_9E]
16678: cwd
16679: mov     di, 243h
1667C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16681: push    dx
16682: push    ax
16683: mov     ax, 4
16686: push    ax
16687: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1668C: mov     al, 2Dh ; '-'
1668E: push    ax
1668F: xor     ax, ax
16691: push    ax
16692: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16697: mov     ax, [bp+var_A0]
1669B: cwd
1669C: mov     di, 243h
1669F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
166A4: push    dx
166A5: push    ax
166A6: mov     ax, 2
166A9: push    ax
166AA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
166AF: mov     al, 2Dh ; '-'
166B1: push    ax
166B2: xor     ax, ax
166B4: push    ax
166B5: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
166BA: mov     ax, [bp+var_9C]
166BE: cwd
166BF: mov     di, 243h
166C2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
166C7: push    dx
166C8: push    ax
166C9: mov     ax, 2
166CC: push    ax
166CD: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
166D2: call    @Write$qm4Text; Write(var f: Text)
166D7: call    @__IOCheck$qv; Exit if error
166DC: mov     ax, [bp+var_18]
166DF: mov     bx, [bp+var_16]
166E2: mov     dx, [bp+var_14]
166E5: mov     [bp+var_54], ax
166E8: mov     [bp+var_52], bx
166EB: mov     [bp+var_50], dx
166EE: push    bp
166EF: call    sub_15FF8
166F2: mov     di, offset unk_2F60A
166F5: push    ds
166F6: push    di
166F7: mov     di, offset aTo; " to "
166FA: push    cs
166FB: push    di
166FC: xor     ax, ax
166FE: push    ax
166FF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16704: mov     ax, [bp+var_9E]
16708: cwd
16709: mov     di, 243h
1670C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16711: push    dx
16712: push    ax
16713: mov     ax, 4
16716: push    ax
16717: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1671C: mov     al, 2Dh ; '-'
1671E: push    ax
1671F: xor     ax, ax
16721: push    ax
16722: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16727: mov     ax, [bp+var_A0]
1672B: cwd
1672C: mov     di, 243h
1672F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16734: push    dx
16735: push    ax
16736: mov     ax, 2
16739: push    ax
1673A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1673F: mov     al, 2Dh ; '-'
16741: push    ax
16742: xor     ax, ax
16744: push    ax
16745: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1674A: mov     ax, [bp+var_9C]
1674E: cwd
1674F: mov     di, 243h
16752: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16757: push    dx
16758: push    ax
16759: mov     ax, 2
1675C: push    ax
1675D: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16762: call    @Write$qm4Text; Write(var f: Text)
16767: call    @__IOCheck$qv; Exit if error
1676C: mov     [bp+var_9A], 1
16771: mov     [bp+var_54], 0
16776: mov     [bp+var_52], 0
1677B: mov     [bp+var_50], 0
16780: mov     di, offset unk_2F60A
16783: push    ds
16784: push    di
16785: mov     di, offset aAge; "  Age "
16788: push    cs
16789: push    di
1678A: xor     ax, ax
1678C: push    ax
1678D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16792: xor     ax, ax
16794: xor     dx, dx
16796: push    dx
16797: push    ax
16798: mov     ax, 3
1679B: push    ax
1679C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
167A1: mov     al, 2Dh ; '-'
167A3: push    ax
167A4: xor     ax, ax
167A6: push    ax
167A7: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
167AC: xor     ax, ax
167AE: xor     dx, dx
167B0: push    dx
167B1: push    ax
167B2: mov     ax, 2
167B5: push    ax
167B6: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
167BB: mov     al, 2Dh ; '-'
167BD: push    ax
167BE: xor     ax, ax
167C0: push    ax
167C1: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
167C6: xor     ax, ax
167C8: xor     dx, dx
167CA: push    dx
167CB: push    ax
167CC: mov     ax, 2
167CF: push    ax
167D0: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
167D5: call    @Write$qm4Text; Write(var f: Text)
167DA: call    @__IOCheck$qv; Exit if error
167DF: mov     ax, [bp+var_6C]
167E2: mov     bx, [bp+var_6A]
167E5: mov     dx, [bp+var_68]
167E8: mov     [bp+var_54], ax
167EB: mov     [bp+var_52], bx
167EE: mov     [bp+var_50], dx
167F1: push    bp
167F2: call    sub_15FF8
167F5: mov     di, offset unk_2F60A
167F8: push    ds
167F9: push    di
167FA: mov     di, offset aTo; " to "
167FD: push    cs
167FE: push    di
167FF: xor     ax, ax
16801: push    ax
16802: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16807: mov     ax, [bp+var_9E]
1680B: cwd
1680C: mov     di, 243h
1680F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16814: push    dx
16815: push    ax
16816: mov     ax, 3
16819: push    ax
1681A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1681F: mov     al, 2Dh ; '-'
16821: push    ax
16822: xor     ax, ax
16824: push    ax
16825: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1682A: mov     ax, [bp+var_A0]
1682E: cwd
1682F: mov     di, 243h
16832: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16837: push    dx
16838: push    ax
16839: mov     ax, 2
1683C: push    ax
1683D: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16842: mov     al, 2Dh ; '-'
16844: push    ax
16845: xor     ax, ax
16847: push    ax
16848: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1684D: mov     ax, [bp+var_9C]
16851: cwd
16852: mov     di, 243h
16855: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1685A: push    dx
1685B: push    ax
1685C: mov     ax, 2
1685F: push    ax
16860: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16865: call    @Write$qm4Text; Write(var f: Text)
1686A: call    @__IOCheck$qv; Exit if error
1686F: mov     di, offset unk_2F60A
16872: push    ds
16873: push    di
16874: mov     di, offset asc_16247; "  "
16877: push    cs
16878: push    di
16879: xor     ax, ax
1687B: push    ax
1687C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16881: call    @Write$qm4Text; Write(var f: Text)
16886: call    @__IOCheck$qv; Exit if error
1688B: mov     di, offset unk_2F60A
1688E: push    ds
1688F: push    di
16890: mov     di, offset asc_1624A; "---------------------------------------"...
16893: push    cs
16894: push    di
16895: xor     ax, ax
16897: push    ax
16898: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1689D: call    @Write$qm4Text; Write(var f: Text)
168A2: call    @__IOCheck$qv; Exit if error
168A7: mov     di, offset unk_2F60A
168AA: push    ds
168AB: push    di
168AC: call    @WriteLn$qm4Text; WriteLn(var f: Text)
168B1: call    @__IOCheck$qv; Exit if error
168B6: mov     [bp+var_9A], 0
168BB: mov     [bp+var_91], 1
168C0: jmp     short loc_168C6
168C2: inc     [bp+var_91]
168C6: mov     di, offset unk_2B318
168C9: push    ds
168CA: push    di
168CB: mov     al, [bp+var_91]
168CF: xor     ah, ah
168D1: xor     dx, dx
168D3: mov     di, 2A9h
168D6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
168DB: mov     dx, 0Dh
168DE: mul     dx
168E0: mov     di, ax
168E2: add     di, 7B93h
168E6: push    ds
168E7: push    di
168E8: call    @$bsub$qm6Stringt1; Compare two strings
168ED: jnz     short loc_16903
168EF: mov     al, [bp+var_91]
168F3: xor     ah, ah
168F5: xor     dx, dx
168F7: mov     di, 2B1h
168FA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
168FF: mov     [bp+var_95], al
16903: cmp     [bp+var_91], 9
16908: jnz     short loc_168C2
1690A: mov     di, offset unk_2F60A
1690D: push    ds
1690E: push    di
1690F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
16914: call    @__IOCheck$qv; Exit if error
16919: mov     [bp+var_36], 0
1691E: mov     [bp+var_34], 0
16923: mov     [bp+var_32], 0
16928: mov     al, [bp+var_95]
1692C: xor     ah, ah
1692E: xor     dx, dx
16930: mov     di, 2A9h
16933: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16938: mov     di, ax
1693A: mov     al, [bp+di+var_AD]
1693E: xor     ah, ah
16940: mov     cx, ax
16942: mov     al, [bp+var_95]
16946: xor     ah, ah
16948: xor     dx, dx
1694A: mov     di, 2A9h
1694D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16952: mov     di, ax
16954: mov     al, [bp+di+var_AD]
16958: xor     ah, ah
1695A: imul    cx
1695C: cwd
1695D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16962: mov     cx, 87h
16965: xor     si, si
16967: mov     di, 7000h
1696A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1696F: mov     [bp+var_36], ax
16972: mov     [bp+var_34], bx
16975: mov     [bp+var_32], dx
16978: mov     al, [bp+var_95]
1697C: xor     ah, ah
1697E: xor     dx, dx
16980: mov     di, 2B1h
16983: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16988: mov     [bp+var_97], al
1698C: mov     al, [bp+var_95]
16990: xor     ah, ah
16992: xor     dx, dx
16994: mov     di, 2B1h
16997: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1699C: mov     [bp+var_98], al
169A0: mov     al, [bp+var_95]
169A4: xor     ah, ah
169A6: xor     dx, dx
169A8: mov     di, 2A9h
169AB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
169B0: mov     di, ax
169B2: mov     al, [bp+di+var_AD]
169B6: xor     ah, ah
169B8: xor     dx, dx
169BA: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
169BF: mov     cx, word_27D9C
169C3: mov     si, word_27D9E
169C7: mov     di, word_27DA0
169CB: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
169D0: mov     [bp+var_30], ax
169D3: mov     [bp+var_2E], bx
169D6: mov     [bp+var_2C], dx
169D9: mov     [bp+var_99], 0
169DE: mov     [bp+var_91], 1
169E3: jmp     short loc_169E9
169E5: inc     [bp+var_91]
169E9: cmp     [bp+var_97], 9
169EE: jbe     short loc_16A06
169F0: mov     al, [bp+var_97]
169F4: xor     ah, ah
169F6: sub     ax, 9
169F9: cwd
169FA: mov     di, 2B1h
169FD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16A02: mov     [bp+var_97], al
16A06: cmp     [bp+var_98], 8
16A0B: jbe     short loc_16A23
16A0D: mov     al, [bp+var_98]
16A11: xor     ah, ah
16A13: sub     ax, 9
16A16: cwd
16A17: mov     di, 2B1h
16A1A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16A1F: mov     [bp+var_98], al
16A23: mov     ax, [bp+var_36]
16A26: mov     bx, [bp+var_34]
16A29: mov     dx, [bp+var_32]
16A2C: mov     cx, [bp+var_30]
16A2F: mov     si, [bp+var_2E]
16A32: mov     di, [bp+var_2C]
16A35: call    @__Cmp$q4Realt1; Compare two reals
16A3A: ja      short loc_16A3F
16A3C: jmp     loc_1713B
16A3F: cmp     [bp+var_99], 1
16A44: jnz     short loc_16A49
16A46: jmp     loc_16D25
16A49: mov     ax, [bp+var_12]
16A4C: mov     bx, [bp+var_10]
16A4F: mov     dx, [bp+var_E]
16A52: mov     [bp+var_54], ax
16A55: mov     [bp+var_52], bx
16A58: mov     [bp+var_50], dx
16A5B: push    bp
16A5C: call    sub_15FF8
16A5F: mov     di, offset unk_2F60A
16A62: push    ds
16A63: push    di
16A64: mov     al, [bp+var_97]
16A68: xor     ah, ah
16A6A: xor     dx, dx
16A6C: mov     di, 2A9h
16A6F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16A74: mov     dx, 0Dh
16A77: mul     dx
16A79: mov     di, ax
16A7B: add     di, 7B93h
16A7F: push    ds
16A80: push    di
16A81: xor     ax, ax
16A83: push    ax
16A84: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16A89: mov     di, offset aAthuruDasavaFr; " Athuru dasava from "
16A8C: push    cs
16A8D: push    di
16A8E: xor     ax, ax
16A90: push    ax
16A91: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16A96: mov     ax, [bp+var_9E]
16A9A: cwd
16A9B: mov     di, 243h
16A9E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16AA3: push    dx
16AA4: push    ax
16AA5: mov     ax, 4
16AA8: push    ax
16AA9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16AAE: mov     al, 2Dh ; '-'
16AB0: push    ax
16AB1: xor     ax, ax
16AB3: push    ax
16AB4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16AB9: mov     ax, [bp+var_A0]
16ABD: cwd
16ABE: mov     di, 243h
16AC1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16AC6: push    dx
16AC7: push    ax
16AC8: mov     ax, 2
16ACB: push    ax
16ACC: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16AD1: mov     al, 2Dh ; '-'
16AD3: push    ax
16AD4: xor     ax, ax
16AD6: push    ax
16AD7: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16ADC: mov     ax, [bp+var_9C]
16AE0: cwd
16AE1: mov     di, 243h
16AE4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16AE9: push    dx
16AEA: push    ax
16AEB: mov     ax, 2
16AEE: push    ax
16AEF: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16AF4: call    @Write$qm4Text; Write(var f: Text)
16AF9: call    @__IOCheck$qv; Exit if error
16AFE: mov     [bp+var_99], 1
16B03: mov     ax, [bp+var_12]
16B06: mov     bx, [bp+var_10]
16B09: mov     dx, [bp+var_E]
16B0C: mov     cx, [bp+var_36]
16B0F: mov     si, [bp+var_34]
16B12: mov     di, [bp+var_32]
16B15: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
16B1A: mov     cx, [bp+var_30]
16B1D: mov     si, [bp+var_2E]
16B20: mov     di, [bp+var_2C]
16B23: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
16B28: mov     [bp+var_54], ax
16B2B: mov     [bp+var_52], bx
16B2E: mov     [bp+var_50], dx
16B31: push    bp
16B32: call    sub_15FF8
16B35: mov     di, offset unk_2F60A
16B38: push    ds
16B39: push    di
16B3A: mov     di, offset aTo; " to "
16B3D: push    cs
16B3E: push    di
16B3F: xor     ax, ax
16B41: push    ax
16B42: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16B47: mov     ax, [bp+var_9E]
16B4B: cwd
16B4C: mov     di, 243h
16B4F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16B54: push    dx
16B55: push    ax
16B56: mov     ax, 4
16B59: push    ax
16B5A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16B5F: mov     al, 2Dh ; '-'
16B61: push    ax
16B62: xor     ax, ax
16B64: push    ax
16B65: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16B6A: mov     ax, [bp+var_A0]
16B6E: cwd
16B6F: mov     di, 243h
16B72: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16B77: push    dx
16B78: push    ax
16B79: mov     ax, 2
16B7C: push    ax
16B7D: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16B82: mov     al, 2Dh ; '-'
16B84: push    ax
16B85: xor     ax, ax
16B87: push    ax
16B88: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16B8D: mov     ax, [bp+var_9C]
16B91: cwd
16B92: mov     di, 243h
16B95: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16B9A: push    dx
16B9B: push    ax
16B9C: mov     ax, 2
16B9F: push    ax
16BA0: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16BA5: call    @Write$qm4Text; Write(var f: Text)
16BAA: call    @__IOCheck$qv; Exit if error
16BAF: mov     [bp+var_9A], 1
16BB4: mov     [bp+var_54], 0
16BB9: mov     [bp+var_52], 0
16BBE: mov     [bp+var_50], 0
16BC3: mov     di, offset unk_2F60A
16BC6: push    ds
16BC7: push    di
16BC8: mov     di, offset aAge; "  Age "
16BCB: push    cs
16BCC: push    di
16BCD: xor     ax, ax
16BCF: push    ax
16BD0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16BD5: xor     ax, ax
16BD7: xor     dx, dx
16BD9: push    dx
16BDA: push    ax
16BDB: mov     ax, 3
16BDE: push    ax
16BDF: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16BE4: mov     al, 2Dh ; '-'
16BE6: push    ax
16BE7: xor     ax, ax
16BE9: push    ax
16BEA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16BEF: xor     ax, ax
16BF1: xor     dx, dx
16BF3: push    dx
16BF4: push    ax
16BF5: mov     ax, 2
16BF8: push    ax
16BF9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16BFE: mov     al, 2Dh ; '-'
16C00: push    ax
16C01: xor     ax, ax
16C03: push    ax
16C04: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16C09: xor     ax, ax
16C0B: xor     dx, dx
16C0D: push    dx
16C0E: push    ax
16C0F: mov     ax, 2
16C12: push    ax
16C13: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16C18: call    @Write$qm4Text; Write(var f: Text)
16C1D: call    @__IOCheck$qv; Exit if error
16C22: mov     ax, [bp+var_36]
16C25: mov     bx, [bp+var_34]
16C28: mov     dx, [bp+var_32]
16C2B: mov     cx, [bp+var_30]
16C2E: mov     si, [bp+var_2E]
16C31: mov     di, [bp+var_2C]
16C34: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
16C39: mov     [bp+var_54], ax
16C3C: mov     [bp+var_52], bx
16C3F: mov     [bp+var_50], dx
16C42: push    bp
16C43: call    sub_15FF8
16C46: mov     di, offset unk_2F60A
16C49: push    ds
16C4A: push    di
16C4B: mov     di, offset aTo; " to "
16C4E: push    cs
16C4F: push    di
16C50: xor     ax, ax
16C52: push    ax
16C53: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16C58: mov     ax, [bp+var_9E]
16C5C: cwd
16C5D: mov     di, 243h
16C60: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16C65: push    dx
16C66: push    ax
16C67: mov     ax, 3
16C6A: push    ax
16C6B: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16C70: mov     al, 2Dh ; '-'
16C72: push    ax
16C73: xor     ax, ax
16C75: push    ax
16C76: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16C7B: mov     ax, [bp+var_A0]
16C7F: cwd
16C80: mov     di, 243h
16C83: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16C88: push    dx
16C89: push    ax
16C8A: mov     ax, 2
16C8D: push    ax
16C8E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16C93: mov     al, 2Dh ; '-'
16C95: push    ax
16C96: xor     ax, ax
16C98: push    ax
16C99: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16C9E: mov     ax, [bp+var_9C]
16CA2: cwd
16CA3: mov     di, 243h
16CA6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16CAB: push    dx
16CAC: push    ax
16CAD: mov     ax, 2
16CB0: push    ax
16CB1: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16CB6: call    @Write$qm4Text; Write(var f: Text)
16CBB: call    @__IOCheck$qv; Exit if error
16CC0: mov     di, offset unk_2F60A
16CC3: push    ds
16CC4: push    di
16CC5: call    @WriteLn$qm4Text; WriteLn(var f: Text)
16CCA: call    @__IOCheck$qv; Exit if error
16CCF: mov     [bp+var_9A], 0
16CD4: mov     ax, [bp+var_12]
16CD7: mov     bx, [bp+var_10]
16CDA: mov     dx, [bp+var_E]
16CDD: mov     cx, [bp+var_36]
16CE0: mov     si, [bp+var_34]
16CE3: mov     di, [bp+var_32]
16CE6: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
16CEB: mov     cx, [bp+var_30]
16CEE: mov     si, [bp+var_2E]
16CF1: mov     di, [bp+var_2C]
16CF4: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
16CF9: mov     [bp+var_5A], ax
16CFC: mov     [bp+var_58], bx
16CFF: mov     [bp+var_56], dx
16D02: mov     ax, [bp+var_36]
16D05: mov     bx, [bp+var_34]
16D08: mov     dx, [bp+var_32]
16D0B: mov     cx, [bp+var_30]
16D0E: mov     si, [bp+var_2E]
16D11: mov     di, [bp+var_2C]
16D14: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
16D19: mov     [bp+var_90], ax
16D1D: mov     [bp+var_8E], bx
16D21: mov     [bp+var_8C], dx
16D25: cmp     [bp+var_91], 8
16D2A: jbe     short loc_16D2F
16D2C: jmp     loc_1713B
16D2F: mov     ax, [bp+var_5A]
16D32: mov     bx, [bp+var_58]
16D35: mov     dx, [bp+var_56]
16D38: mov     [bp+var_54], ax
16D3B: mov     [bp+var_52], bx
16D3E: mov     [bp+var_50], dx
16D41: push    bp
16D42: call    sub_15FF8
16D45: mov     di, offset unk_2F60A
16D48: push    ds
16D49: push    di
16D4A: mov     al, [bp+var_98]
16D4E: xor     ah, ah
16D50: inc     ax
16D51: cwd
16D52: mov     di, 2A9h
16D55: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16D5A: mov     dx, 0Dh
16D5D: mul     dx
16D5F: mov     di, ax
16D61: add     di, 7B93h
16D65: push    ds
16D66: push    di
16D67: xor     ax, ax
16D69: push    ax
16D6A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16D6F: mov     di, offset aAthuruDasavaFr; " Athuru dasava from "
16D72: push    cs
16D73: push    di
16D74: xor     ax, ax
16D76: push    ax
16D77: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16D7C: mov     ax, [bp+var_9E]
16D80: cwd
16D81: mov     di, 243h
16D84: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16D89: push    dx
16D8A: push    ax
16D8B: mov     ax, 4
16D8E: push    ax
16D8F: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16D94: mov     al, 2Dh ; '-'
16D96: push    ax
16D97: xor     ax, ax
16D99: push    ax
16D9A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16D9F: mov     ax, [bp+var_A0]
16DA3: cwd
16DA4: mov     di, 243h
16DA7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16DAC: push    dx
16DAD: push    ax
16DAE: mov     ax, 2
16DB1: push    ax
16DB2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16DB7: mov     al, 2Dh ; '-'
16DB9: push    ax
16DBA: xor     ax, ax
16DBC: push    ax
16DBD: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16DC2: mov     ax, [bp+var_9C]
16DC6: cwd
16DC7: mov     di, 243h
16DCA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16DCF: push    dx
16DD0: push    ax
16DD1: mov     ax, 2
16DD4: push    ax
16DD5: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16DDA: call    @Write$qm4Text; Write(var f: Text)
16DDF: call    @__IOCheck$qv; Exit if error
16DE4: mov     al, [bp+var_98]
16DE8: xor     ah, ah
16DEA: inc     ax
16DEB: cwd
16DEC: mov     di, 2A9h
16DEF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16DF4: mov     di, ax
16DF6: mov     al, [bp+di+var_AD]
16DFA: xor     ah, ah
16DFC: mov     cx, ax
16DFE: mov     al, [bp+var_95]
16E02: xor     ah, ah
16E04: xor     dx, dx
16E06: mov     di, 2A9h
16E09: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16E0E: mov     di, ax
16E10: mov     al, [bp+di+var_AD]
16E14: xor     ah, ah
16E16: imul    cx
16E18: cwd
16E19: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16E1E: mov     cx, 87h
16E21: xor     si, si
16E23: mov     di, 7000h
16E26: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
16E2B: mov     cx, [bp+var_5A]
16E2E: mov     si, [bp+var_58]
16E31: mov     di, [bp+var_56]
16E34: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
16E39: mov     [bp+var_54], ax
16E3C: mov     [bp+var_52], bx
16E3F: mov     [bp+var_50], dx
16E42: push    bp
16E43: call    sub_15FF8
16E46: mov     al, [bp+var_98]
16E4A: xor     ah, ah
16E4C: inc     ax
16E4D: cwd
16E4E: mov     di, 2A9h
16E51: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16E56: mov     di, ax
16E58: mov     al, [bp+di+var_AD]
16E5C: xor     ah, ah
16E5E: mov     cx, ax
16E60: mov     al, [bp+var_95]
16E64: xor     ah, ah
16E66: xor     dx, dx
16E68: mov     di, 2A9h
16E6B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16E70: mov     di, ax
16E72: mov     al, [bp+di+var_AD]
16E76: xor     ah, ah
16E78: imul    cx
16E7A: cwd
16E7B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16E80: mov     cx, 87h
16E83: xor     si, si
16E85: mov     di, 7000h
16E88: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
16E8D: mov     cx, [bp+var_5A]
16E90: mov     si, [bp+var_58]
16E93: mov     di, [bp+var_56]
16E96: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
16E9B: mov     [bp+var_4E], ax
16E9E: mov     [bp+var_4C], bx
16EA1: mov     [bp+var_4A], dx
16EA4: mov     di, offset unk_2F60A
16EA7: push    ds
16EA8: push    di
16EA9: mov     di, offset aTo; " to "
16EAC: push    cs
16EAD: push    di
16EAE: xor     ax, ax
16EB0: push    ax
16EB1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16EB6: mov     ax, [bp+var_9E]
16EBA: cwd
16EBB: mov     di, 243h
16EBE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16EC3: push    dx
16EC4: push    ax
16EC5: mov     ax, 4
16EC8: push    ax
16EC9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16ECE: mov     al, 2Dh ; '-'
16ED0: push    ax
16ED1: xor     ax, ax
16ED3: push    ax
16ED4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16ED9: mov     ax, [bp+var_A0]
16EDD: cwd
16EDE: mov     di, 243h
16EE1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16EE6: push    dx
16EE7: push    ax
16EE8: mov     ax, 2
16EEB: push    ax
16EEC: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16EF1: mov     al, 2Dh ; '-'
16EF3: push    ax
16EF4: xor     ax, ax
16EF6: push    ax
16EF7: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16EFC: mov     ax, [bp+var_9C]
16F00: cwd
16F01: mov     di, 243h
16F04: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16F09: push    dx
16F0A: push    ax
16F0B: mov     ax, 2
16F0E: push    ax
16F0F: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16F14: call    @Write$qm4Text; Write(var f: Text)
16F19: call    @__IOCheck$qv; Exit if error
16F1E: mov     [bp+var_9A], 1
16F23: mov     ax, [bp+var_90]
16F27: mov     bx, [bp+var_8E]
16F2B: mov     dx, [bp+var_8C]
16F2F: mov     [bp+var_54], ax
16F32: mov     [bp+var_52], bx
16F35: mov     [bp+var_50], dx
16F38: push    bp
16F39: call    sub_15FF8
16F3C: mov     di, offset unk_2F60A
16F3F: push    ds
16F40: push    di
16F41: mov     di, offset aAge; "  Age "
16F44: push    cs
16F45: push    di
16F46: xor     ax, ax
16F48: push    ax
16F49: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
16F4E: mov     ax, [bp+var_9E]
16F52: cwd
16F53: mov     di, 243h
16F56: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16F5B: push    dx
16F5C: push    ax
16F5D: mov     ax, 3
16F60: push    ax
16F61: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16F66: mov     al, 2Dh ; '-'
16F68: push    ax
16F69: xor     ax, ax
16F6B: push    ax
16F6C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16F71: mov     ax, [bp+var_A0]
16F75: cwd
16F76: mov     di, 243h
16F79: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16F7E: push    dx
16F7F: push    ax
16F80: mov     ax, 2
16F83: push    ax
16F84: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16F89: mov     al, 2Dh ; '-'
16F8B: push    ax
16F8C: xor     ax, ax
16F8E: push    ax
16F8F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
16F94: mov     ax, [bp+var_9C]
16F98: cwd
16F99: mov     di, 243h
16F9C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16FA1: push    dx
16FA2: push    ax
16FA3: mov     ax, 2
16FA6: push    ax
16FA7: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
16FAC: call    @Write$qm4Text; Write(var f: Text)
16FB1: call    @__IOCheck$qv; Exit if error
16FB6: mov     al, [bp+var_98]
16FBA: xor     ah, ah
16FBC: inc     ax
16FBD: cwd
16FBE: mov     di, 2A9h
16FC1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16FC6: mov     di, ax
16FC8: mov     al, [bp+di+var_AD]
16FCC: xor     ah, ah
16FCE: mov     cx, ax
16FD0: mov     al, [bp+var_95]
16FD4: xor     ah, ah
16FD6: xor     dx, dx
16FD8: mov     di, 2A9h
16FDB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
16FE0: mov     di, ax
16FE2: mov     al, [bp+di+var_AD]
16FE6: xor     ah, ah
16FE8: imul    cx
16FEA: cwd
16FEB: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
16FF0: mov     cx, 87h
16FF3: xor     si, si
16FF5: mov     di, 7000h
16FF8: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
16FFD: mov     cx, [bp+var_90]
17001: mov     si, [bp+var_8E]
17005: mov     di, [bp+var_8C]
17009: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1700E: mov     [bp+var_54], ax
17011: mov     [bp+var_52], bx
17014: mov     [bp+var_50], dx
17017: push    bp
17018: call    sub_15FF8
1701B: mov     al, [bp+var_98]
1701F: xor     ah, ah
17021: inc     ax
17022: cwd
17023: mov     di, 2A9h
17026: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1702B: mov     di, ax
1702D: mov     al, [bp+di+var_AD]
17031: xor     ah, ah
17033: mov     cx, ax
17035: mov     al, [bp+var_95]
17039: xor     ah, ah
1703B: xor     dx, dx
1703D: mov     di, 2A9h
17040: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17045: mov     di, ax
17047: mov     al, [bp+di+var_AD]
1704B: xor     ah, ah
1704D: imul    cx
1704F: cwd
17050: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17055: mov     cx, 87h
17058: xor     si, si
1705A: mov     di, 7000h
1705D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17062: mov     cx, [bp+var_90]
17066: mov     si, [bp+var_8E]
1706A: mov     di, [bp+var_8C]
1706E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17073: mov     [bp+var_8A], ax
17077: mov     [bp+var_88], bx
1707B: mov     [bp+var_86], dx
1707F: push    bp
17080: call    sub_15FF8
17083: mov     di, offset unk_2F60A
17086: push    ds
17087: push    di
17088: mov     di, offset aTo; " to "
1708B: push    cs
1708C: push    di
1708D: xor     ax, ax
1708F: push    ax
17090: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17095: mov     ax, [bp+var_9E]
17099: cwd
1709A: mov     di, 243h
1709D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
170A2: push    dx
170A3: push    ax
170A4: mov     ax, 3
170A7: push    ax
170A8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
170AD: mov     al, 2Dh ; '-'
170AF: push    ax
170B0: xor     ax, ax
170B2: push    ax
170B3: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
170B8: mov     ax, [bp+var_A0]
170BC: cwd
170BD: mov     di, 243h
170C0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
170C5: push    dx
170C6: push    ax
170C7: mov     ax, 2
170CA: push    ax
170CB: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
170D0: mov     al, 2Dh ; '-'
170D2: push    ax
170D3: xor     ax, ax
170D5: push    ax
170D6: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
170DB: mov     ax, [bp+var_9C]
170DF: cwd
170E0: mov     di, 243h
170E3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
170E8: push    dx
170E9: push    ax
170EA: mov     ax, 2
170ED: push    ax
170EE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
170F3: call    @Write$qm4Text; Write(var f: Text)
170F8: call    @__IOCheck$qv; Exit if error
170FD: mov     di, offset unk_2F60A
17100: push    ds
17101: push    di
17102: call    @WriteLn$qm4Text; WriteLn(var f: Text)
17107: call    @__IOCheck$qv; Exit if error
1710C: mov     [bp+var_9A], 0
17111: mov     ax, [bp+var_4E]
17114: mov     bx, [bp+var_4C]
17117: mov     dx, [bp+var_4A]
1711A: mov     [bp+var_5A], ax
1711D: mov     [bp+var_58], bx
17120: mov     [bp+var_56], dx
17123: mov     ax, [bp+var_8A]
17127: mov     bx, [bp+var_88]
1712B: mov     dx, [bp+var_86]
1712F: mov     [bp+var_90], ax
17133: mov     [bp+var_8E], bx
17137: mov     [bp+var_8C], dx
1713B: mov     al, [bp+var_95]
1713F: xor     ah, ah
17141: xor     dx, dx
17143: mov     di, 2A9h
17146: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1714B: mov     di, ax
1714D: mov     al, [bp+di+var_AD]
17151: xor     ah, ah
17153: mov     cx, ax
17155: mov     al, [bp+var_98]
17159: xor     ah, ah
1715B: inc     ax
1715C: cwd
1715D: mov     di, 2A9h
17160: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17165: mov     di, ax
17167: mov     al, [bp+di+var_AD]
1716B: xor     ah, ah
1716D: imul    cx
1716F: cwd
17170: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17175: mov     cx, 87h
17178: xor     si, si
1717A: mov     di, 7000h
1717D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17182: mov     cx, [bp+var_36]
17185: mov     si, [bp+var_34]
17188: mov     di, [bp+var_32]
1718B: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17190: mov     [bp+var_36], ax
17193: mov     [bp+var_34], bx
17196: mov     [bp+var_32], dx
17199: mov     al, [bp+var_97]
1719D: xor     ah, ah
1719F: inc     ax
171A0: cwd
171A1: mov     di, 2B1h
171A4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
171A9: mov     [bp+var_97], al
171AD: mov     al, [bp+var_98]
171B1: xor     ah, ah
171B3: inc     ax
171B4: cwd
171B5: mov     di, 2B1h
171B8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
171BD: mov     [bp+var_98], al
171C1: cmp     [bp+var_91], 9
171C6: jz      short loc_171CB
171C8: jmp     loc_169E5
171CB: mov     [bp+var_36], 0
171D0: mov     [bp+var_34], 0
171D5: mov     [bp+var_32], 0
171DA: mov     di, offset unk_2F50A
171DD: push    ds
171DE: push    di
171DF: call    @ReadLn$qm4Text; ReadLn(var f: Text)
171E4: call    @__IOCheck$qv; Exit if error
171E9: call    @CLRSCR$qv; CLRSCR(void)
171EE: mov     [bp+var_91], 1
171F3: jmp     short loc_171F9
171F5: inc     [bp+var_91]
171F9: mov     di, offset unk_2B318
171FC: push    ds
171FD: push    di
171FE: mov     al, [bp+var_91]
17202: xor     ah, ah
17204: xor     dx, dx
17206: mov     di, 2A9h
17209: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1720E: mov     dx, 0Dh
17211: mul     dx
17213: mov     di, ax
17215: add     di, 7B93h
17219: push    ds
1721A: push    di
1721B: call    @$bsub$qm6Stringt1; Compare two strings
17220: jnz     short loc_17236
17222: mov     al, [bp+var_91]
17226: xor     ah, ah
17228: inc     ax
17229: cwd
1722A: mov     di, 2B1h
1722D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17232: mov     [bp+var_92], al
17236: cmp     [bp+var_91], 9
1723B: jnz     short loc_171F5
1723D: mov     ax, [bp+var_18]
17240: mov     bx, [bp+var_16]
17243: mov     dx, [bp+var_14]
17246: mov     [bp+var_1E], ax
17249: mov     [bp+var_1C], bx
1724C: mov     [bp+var_1A], dx
1724F: mov     ax, [bp+var_6C]
17252: mov     bx, [bp+var_6A]
17255: mov     dx, [bp+var_68]
17258: mov     [bp+var_72], ax
1725B: mov     [bp+var_70], bx
1725E: mov     [bp+var_6E], dx
17261: mov     [bp+var_91], 1
17266: jmp     short loc_1726C
17268: inc     [bp+var_91]
1726C: cmp     [bp+var_92], 9
17271: jbe     short loc_17289
17273: mov     al, [bp+var_92]
17277: xor     ah, ah
17279: sub     ax, 9
1727C: cwd
1727D: mov     di, 2B1h
17280: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17285: mov     [bp+var_92], al
17289: mov     ax, [bp+var_36]
1728C: mov     bx, [bp+var_34]
1728F: mov     dx, [bp+var_32]
17292: mov     cx, 84h
17295: xor     si, si
17297: xor     di, di
17299: call    @__Cmp$q4Realt1; Compare two reals
1729E: jbe     short loc_172BE
172A0: mov     ax, [bp+var_36]
172A3: mov     bx, [bp+var_34]
172A6: mov     dx, [bp+var_32]
172A9: mov     cx, 84h
172AC: xor     si, si
172AE: xor     di, di
172B0: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
172B5: mov     [bp+var_36], ax
172B8: mov     [bp+var_34], bx
172BB: mov     [bp+var_32], dx
172BE: mov     ax, [bp+var_1E]
172C1: mov     bx, [bp+var_1C]
172C4: mov     dx, [bp+var_1A]
172C7: mov     [bp+var_54], ax
172CA: mov     [bp+var_52], bx
172CD: mov     [bp+var_50], dx
172D0: push    bp
172D1: call    sub_15FF8
172D4: mov     di, offset unk_2F60A
172D7: push    ds
172D8: push    di
172D9: mov     al, [bp+var_92]
172DD: xor     ah, ah
172DF: xor     dx, dx
172E1: mov     di, 2A9h
172E4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
172E9: mov     dx, 0Dh
172EC: mul     dx
172EE: mov     di, ax
172F0: add     di, 7B93h
172F4: push    ds
172F5: push    di
172F6: xor     ax, ax
172F8: push    ax
172F9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
172FE: mov     di, offset aMahaDasavaFrom_0; " Maha   dasava from  "
17301: push    cs
17302: push    di
17303: xor     ax, ax
17305: push    ax
17306: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1730B: mov     ax, [bp+var_9E]
1730F: cwd
17310: mov     di, 243h
17313: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17318: push    dx
17319: push    ax
1731A: mov     ax, 4
1731D: push    ax
1731E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17323: mov     al, 2Dh ; '-'
17325: push    ax
17326: xor     ax, ax
17328: push    ax
17329: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1732E: mov     ax, [bp+var_A0]
17332: cwd
17333: mov     di, 243h
17336: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1733B: push    dx
1733C: push    ax
1733D: mov     ax, 2
17340: push    ax
17341: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17346: mov     al, 2Dh ; '-'
17348: push    ax
17349: xor     ax, ax
1734B: push    ax
1734C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17351: mov     ax, [bp+var_9C]
17355: cwd
17356: mov     di, 243h
17359: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1735E: push    dx
1735F: push    ax
17360: mov     ax, 2
17363: push    ax
17364: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17369: call    @Write$qm4Text; Write(var f: Text)
1736E: call    @__IOCheck$qv; Exit if error
17373: mov     al, [bp+var_92]
17377: xor     ah, ah
17379: xor     dx, dx
1737B: mov     di, 2A9h
1737E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17383: mov     di, ax
17385: mov     al, [bp+di+var_AD]
17389: xor     ah, ah
1738B: xor     dx, dx
1738D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17392: mov     cx, [bp+var_18]
17395: mov     si, [bp+var_16]
17398: mov     di, [bp+var_14]
1739B: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
173A0: mov     [bp+var_54], ax
173A3: mov     [bp+var_52], bx
173A6: mov     [bp+var_50], dx
173A9: push    bp
173AA: call    sub_15FF8
173AD: mov     di, offset unk_2F60A
173B0: push    ds
173B1: push    di
173B2: mov     di, offset aTo; " to "
173B5: push    cs
173B6: push    di
173B7: xor     ax, ax
173B9: push    ax
173BA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
173BF: mov     ax, [bp+var_9E]
173C3: cwd
173C4: mov     di, 243h
173C7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
173CC: push    dx
173CD: push    ax
173CE: mov     ax, 4
173D1: push    ax
173D2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
173D7: mov     al, 2Dh ; '-'
173D9: push    ax
173DA: xor     ax, ax
173DC: push    ax
173DD: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
173E2: mov     ax, [bp+var_A0]
173E6: cwd
173E7: mov     di, 243h
173EA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
173EF: push    dx
173F0: push    ax
173F1: mov     ax, 2
173F4: push    ax
173F5: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
173FA: mov     al, 2Dh ; '-'
173FC: push    ax
173FD: xor     ax, ax
173FF: push    ax
17400: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17405: mov     ax, [bp+var_9C]
17409: cwd
1740A: mov     di, 243h
1740D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17412: push    dx
17413: push    ax
17414: mov     ax, 2
17417: push    ax
17418: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1741D: call    @Write$qm4Text; Write(var f: Text)
17422: call    @__IOCheck$qv; Exit if error
17427: mov     [bp+var_9A], 1
1742C: mov     ax, [bp+var_72]
1742F: mov     bx, [bp+var_70]
17432: mov     dx, [bp+var_6E]
17435: mov     [bp+var_54], ax
17438: mov     [bp+var_52], bx
1743B: mov     [bp+var_50], dx
1743E: push    bp
1743F: call    sub_15FF8
17442: mov     di, offset unk_2F60A
17445: push    ds
17446: push    di
17447: mov     di, offset aAge; "  Age "
1744A: push    cs
1744B: push    di
1744C: xor     ax, ax
1744E: push    ax
1744F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17454: mov     ax, [bp+var_9E]
17458: cwd
17459: mov     di, 243h
1745C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17461: push    dx
17462: push    ax
17463: mov     ax, 3
17466: push    ax
17467: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1746C: mov     al, 2Dh ; '-'
1746E: push    ax
1746F: xor     ax, ax
17471: push    ax
17472: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17477: mov     ax, [bp+var_A0]
1747B: cwd
1747C: mov     di, 243h
1747F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17484: push    dx
17485: push    ax
17486: mov     ax, 2
17489: push    ax
1748A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1748F: mov     al, 2Dh ; '-'
17491: push    ax
17492: xor     ax, ax
17494: push    ax
17495: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1749A: mov     ax, [bp+var_9C]
1749E: cwd
1749F: mov     di, 243h
174A2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
174A7: push    dx
174A8: push    ax
174A9: mov     ax, 2
174AC: push    ax
174AD: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
174B2: call    @Write$qm4Text; Write(var f: Text)
174B7: call    @__IOCheck$qv; Exit if error
174BC: mov     al, [bp+var_92]
174C0: xor     ah, ah
174C2: xor     dx, dx
174C4: mov     di, 2A9h
174C7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
174CC: mov     di, ax
174CE: mov     al, [bp+di+var_AD]
174D2: xor     ah, ah
174D4: xor     dx, dx
174D6: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
174DB: mov     cx, [bp+var_6C]
174DE: mov     si, [bp+var_6A]
174E1: mov     di, [bp+var_68]
174E4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
174E9: mov     [bp+var_54], ax
174EC: mov     [bp+var_52], bx
174EF: mov     [bp+var_50], dx
174F2: push    bp
174F3: call    sub_15FF8
174F6: mov     di, offset unk_2F60A
174F9: push    ds
174FA: push    di
174FB: mov     di, offset aTo; " to "
174FE: push    cs
174FF: push    di
17500: xor     ax, ax
17502: push    ax
17503: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17508: mov     ax, [bp+var_9E]
1750C: cwd
1750D: mov     di, 243h
17510: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17515: push    dx
17516: push    ax
17517: mov     ax, 3
1751A: push    ax
1751B: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17520: mov     al, 2Dh ; '-'
17522: push    ax
17523: xor     ax, ax
17525: push    ax
17526: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1752B: mov     ax, [bp+var_A0]
1752F: cwd
17530: mov     di, 243h
17533: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17538: push    dx
17539: push    ax
1753A: mov     ax, 2
1753D: push    ax
1753E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17543: mov     al, 2Dh ; '-'
17545: push    ax
17546: xor     ax, ax
17548: push    ax
17549: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1754E: mov     ax, [bp+var_9C]
17552: cwd
17553: mov     di, 243h
17556: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1755B: push    dx
1755C: push    ax
1755D: mov     ax, 2
17560: push    ax
17561: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17566: call    @Write$qm4Text; Write(var f: Text)
1756B: call    @__IOCheck$qv; Exit if error
17570: mov     di, offset unk_2F60A
17573: push    ds
17574: push    di
17575: mov     al, 20h ; ' '
17577: push    ax
17578: xor     ax, ax
1757A: push    ax
1757B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17580: call    @Write$qm4Text; Write(var f: Text)
17585: call    @__IOCheck$qv; Exit if error
1758A: mov     di, offset unk_2F60A
1758D: push    ds
1758E: push    di
1758F: mov     di, offset asc_162D4; "---------------------------------------"...
17592: push    cs
17593: push    di
17594: xor     ax, ax
17596: push    ax
17597: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1759C: call    @Write$qm4Text; Write(var f: Text)
175A1: call    @__IOCheck$qv; Exit if error
175A6: mov     di, offset unk_2F60A
175A9: push    ds
175AA: push    di
175AB: call    @WriteLn$qm4Text; WriteLn(var f: Text)
175B0: call    @__IOCheck$qv; Exit if error
175B5: mov     [bp+var_9A], 0
175BA: mov     al, [bp+var_92]
175BE: xor     ah, ah
175C0: xor     dx, dx
175C2: mov     di, 2A9h
175C5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
175CA: mov     di, ax
175CC: mov     al, [bp+di+var_AD]
175D0: xor     ah, ah
175D2: mov     cx, ax
175D4: mov     al, [bp+var_92]
175D8: xor     ah, ah
175DA: xor     dx, dx
175DC: mov     di, 2A9h
175DF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
175E4: mov     di, ax
175E6: mov     al, [bp+di+var_AD]
175EA: xor     ah, ah
175EC: imul    cx
175EE: cwd
175EF: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
175F4: mov     cx, 87h
175F7: xor     si, si
175F9: mov     di, 7000h
175FC: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17601: mov     cx, [bp+var_1E]
17604: mov     si, [bp+var_1C]
17607: mov     di, [bp+var_1A]
1760A: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1760F: mov     [bp+var_24], ax
17612: mov     [bp+var_22], bx
17615: mov     [bp+var_20], dx
17618: mov     al, [bp+var_92]
1761C: xor     ah, ah
1761E: xor     dx, dx
17620: mov     di, 2A9h
17623: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17628: mov     di, ax
1762A: mov     al, [bp+di+var_AD]
1762E: xor     ah, ah
17630: mov     cx, ax
17632: mov     al, [bp+var_92]
17636: xor     ah, ah
17638: xor     dx, dx
1763A: mov     di, 2A9h
1763D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17642: mov     di, ax
17644: mov     al, [bp+di+var_AD]
17648: xor     ah, ah
1764A: imul    cx
1764C: cwd
1764D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17652: mov     cx, 87h
17655: xor     si, si
17657: mov     di, 7000h
1765A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1765F: mov     cx, [bp+var_72]
17662: mov     si, [bp+var_70]
17665: mov     di, [bp+var_6E]
17668: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1766D: mov     [bp+var_78], ax
17670: mov     [bp+var_76], bx
17673: mov     [bp+var_74], dx
17676: mov     ax, [bp+var_1E]
17679: mov     bx, [bp+var_1C]
1767C: mov     dx, [bp+var_1A]
1767F: mov     [bp+var_54], ax
17682: mov     [bp+var_52], bx
17685: mov     [bp+var_50], dx
17688: push    bp
17689: call    sub_15FF8
1768C: mov     di, offset unk_2F60A
1768F: push    ds
17690: push    di
17691: mov     al, [bp+var_92]
17695: xor     ah, ah
17697: xor     dx, dx
17699: mov     di, 2A9h
1769C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
176A1: mov     dx, 0Dh
176A4: mul     dx
176A6: mov     di, ax
176A8: add     di, 7B93h
176AC: push    ds
176AD: push    di
176AE: xor     ax, ax
176B0: push    ax
176B1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
176B6: mov     di, offset aAthuruDasavaFr_0; " Athuru dasava from  "
176B9: push    cs
176BA: push    di
176BB: xor     ax, ax
176BD: push    ax
176BE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
176C3: mov     ax, [bp+var_9E]
176C7: cwd
176C8: mov     di, 243h
176CB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
176D0: push    dx
176D1: push    ax
176D2: mov     ax, 4
176D5: push    ax
176D6: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
176DB: mov     al, 2Dh ; '-'
176DD: push    ax
176DE: xor     ax, ax
176E0: push    ax
176E1: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
176E6: mov     ax, [bp+var_A0]
176EA: cwd
176EB: mov     di, 243h
176EE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
176F3: push    dx
176F4: push    ax
176F5: mov     ax, 2
176F8: push    ax
176F9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
176FE: mov     al, 2Dh ; '-'
17700: push    ax
17701: xor     ax, ax
17703: push    ax
17704: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17709: mov     ax, [bp+var_9C]
1770D: cwd
1770E: mov     di, 243h
17711: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17716: push    dx
17717: push    ax
17718: mov     ax, 2
1771B: push    ax
1771C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17721: call    @Write$qm4Text; Write(var f: Text)
17726: call    @__IOCheck$qv; Exit if error
1772B: mov     ax, [bp+var_24]
1772E: mov     bx, [bp+var_22]
17731: mov     dx, [bp+var_20]
17734: mov     [bp+var_54], ax
17737: mov     [bp+var_52], bx
1773A: mov     [bp+var_50], dx
1773D: push    bp
1773E: call    sub_15FF8
17741: mov     di, offset unk_2F60A
17744: push    ds
17745: push    di
17746: mov     di, offset aTo; " to "
17749: push    cs
1774A: push    di
1774B: xor     ax, ax
1774D: push    ax
1774E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17753: mov     ax, [bp+var_9E]
17757: cwd
17758: mov     di, 243h
1775B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17760: push    dx
17761: push    ax
17762: mov     ax, 4
17765: push    ax
17766: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1776B: mov     al, 2Dh ; '-'
1776D: push    ax
1776E: xor     ax, ax
17770: push    ax
17771: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17776: mov     ax, [bp+var_A0]
1777A: cwd
1777B: mov     di, 243h
1777E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17783: push    dx
17784: push    ax
17785: mov     ax, 2
17788: push    ax
17789: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1778E: mov     al, 2Dh ; '-'
17790: push    ax
17791: xor     ax, ax
17793: push    ax
17794: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17799: mov     ax, [bp+var_9C]
1779D: cwd
1779E: mov     di, 243h
177A1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
177A6: push    dx
177A7: push    ax
177A8: mov     ax, 2
177AB: push    ax
177AC: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
177B1: call    @Write$qm4Text; Write(var f: Text)
177B6: call    @__IOCheck$qv; Exit if error
177BB: mov     [bp+var_9A], 1
177C0: mov     ax, [bp+var_72]
177C3: mov     bx, [bp+var_70]
177C6: mov     dx, [bp+var_6E]
177C9: mov     [bp+var_54], ax
177CC: mov     [bp+var_52], bx
177CF: mov     [bp+var_50], dx
177D2: push    bp
177D3: call    sub_15FF8
177D6: mov     di, offset unk_2F60A
177D9: push    ds
177DA: push    di
177DB: mov     di, offset aAge; "  Age "
177DE: push    cs
177DF: push    di
177E0: xor     ax, ax
177E2: push    ax
177E3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
177E8: mov     ax, [bp+var_9E]
177EC: cwd
177ED: mov     di, 243h
177F0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
177F5: push    dx
177F6: push    ax
177F7: mov     ax, 3
177FA: push    ax
177FB: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17800: mov     al, 2Dh ; '-'
17802: push    ax
17803: xor     ax, ax
17805: push    ax
17806: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1780B: mov     ax, [bp+var_A0]
1780F: cwd
17810: mov     di, 243h
17813: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17818: push    dx
17819: push    ax
1781A: mov     ax, 2
1781D: push    ax
1781E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17823: mov     al, 2Dh ; '-'
17825: push    ax
17826: xor     ax, ax
17828: push    ax
17829: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1782E: mov     ax, [bp+var_9C]
17832: cwd
17833: mov     di, 243h
17836: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1783B: push    dx
1783C: push    ax
1783D: mov     ax, 2
17840: push    ax
17841: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17846: call    @Write$qm4Text; Write(var f: Text)
1784B: call    @__IOCheck$qv; Exit if error
17850: mov     ax, [bp+var_78]
17853: mov     bx, [bp+var_76]
17856: mov     dx, [bp+var_74]
17859: mov     [bp+var_54], ax
1785C: mov     [bp+var_52], bx
1785F: mov     [bp+var_50], dx
17862: push    bp
17863: call    sub_15FF8
17866: mov     di, offset unk_2F60A
17869: push    ds
1786A: push    di
1786B: mov     di, offset aTo; " to "
1786E: push    cs
1786F: push    di
17870: xor     ax, ax
17872: push    ax
17873: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17878: mov     ax, [bp+var_9E]
1787C: cwd
1787D: mov     di, 243h
17880: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17885: push    dx
17886: push    ax
17887: mov     ax, 3
1788A: push    ax
1788B: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17890: mov     al, 2Dh ; '-'
17892: push    ax
17893: xor     ax, ax
17895: push    ax
17896: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1789B: mov     ax, [bp+var_A0]
1789F: cwd
178A0: mov     di, 243h
178A3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
178A8: push    dx
178A9: push    ax
178AA: mov     ax, 2
178AD: push    ax
178AE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
178B3: mov     al, 2Dh ; '-'
178B5: push    ax
178B6: xor     ax, ax
178B8: push    ax
178B9: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
178BE: mov     ax, [bp+var_9C]
178C2: cwd
178C3: mov     di, 243h
178C6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
178CB: push    dx
178CC: push    ax
178CD: mov     ax, 2
178D0: push    ax
178D1: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
178D6: call    @Write$qm4Text; Write(var f: Text)
178DB: call    @__IOCheck$qv; Exit if error
178E0: mov     di, offset unk_2F60A
178E3: push    ds
178E4: push    di
178E5: call    @WriteLn$qm4Text; WriteLn(var f: Text)
178EA: call    @__IOCheck$qv; Exit if error
178EF: mov     [bp+var_9A], 0
178F4: mov     al, [bp+var_92]
178F8: xor     ah, ah
178FA: inc     ax
178FB: cwd
178FC: mov     di, 2B1h
178FF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17904: mov     [bp+var_94], al
17908: mov     ax, [bp+var_24]
1790B: mov     bx, [bp+var_22]
1790E: mov     dx, [bp+var_20]
17911: mov     [bp+var_1E], ax
17914: mov     [bp+var_1C], bx
17917: mov     [bp+var_1A], dx
1791A: mov     ax, [bp+var_78]
1791D: mov     bx, [bp+var_76]
17920: mov     dx, [bp+var_74]
17923: mov     [bp+var_72], ax
17926: mov     [bp+var_70], bx
17929: mov     [bp+var_6E], dx
1792C: mov     [bp+var_93], 1
17931: jmp     short loc_17937
17933: inc     [bp+var_93]
17937: cmp     [bp+var_94], 9
1793C: jbe     short loc_17954
1793E: mov     al, [bp+var_94]
17942: xor     ah, ah
17944: sub     ax, 9
17947: cwd
17948: mov     di, 2B1h
1794B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17950: mov     [bp+var_94], al
17954: mov     ax, [bp+var_1E]
17957: mov     bx, [bp+var_1C]
1795A: mov     dx, [bp+var_1A]
1795D: mov     [bp+var_54], ax
17960: mov     [bp+var_52], bx
17963: mov     [bp+var_50], dx
17966: push    bp
17967: call    sub_15FF8
1796A: mov     di, offset unk_2F60A
1796D: push    ds
1796E: push    di
1796F: mov     al, [bp+var_94]
17973: xor     ah, ah
17975: xor     dx, dx
17977: mov     di, 2A9h
1797A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1797F: mov     dx, 0Dh
17982: mul     dx
17984: mov     di, ax
17986: add     di, 7B93h
1798A: push    ds
1798B: push    di
1798C: xor     ax, ax
1798E: push    ax
1798F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17994: mov     di, offset aAthuruDasavaFr_0; " Athuru dasava from  "
17997: push    cs
17998: push    di
17999: xor     ax, ax
1799B: push    ax
1799C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
179A1: mov     ax, [bp+var_9E]
179A5: cwd
179A6: mov     di, 243h
179A9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
179AE: push    dx
179AF: push    ax
179B0: mov     ax, 4
179B3: push    ax
179B4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
179B9: mov     al, 2Dh ; '-'
179BB: push    ax
179BC: xor     ax, ax
179BE: push    ax
179BF: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
179C4: mov     ax, [bp+var_A0]
179C8: cwd
179C9: mov     di, 243h
179CC: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
179D1: push    dx
179D2: push    ax
179D3: mov     ax, 2
179D6: push    ax
179D7: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
179DC: mov     al, 2Dh ; '-'
179DE: push    ax
179DF: xor     ax, ax
179E1: push    ax
179E2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
179E7: mov     ax, [bp+var_9C]
179EB: cwd
179EC: mov     di, 243h
179EF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
179F4: push    dx
179F5: push    ax
179F6: mov     ax, 2
179F9: push    ax
179FA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
179FF: call    @Write$qm4Text; Write(var f: Text)
17A04: call    @__IOCheck$qv; Exit if error
17A09: mov     al, [bp+var_94]
17A0D: xor     ah, ah
17A0F: xor     dx, dx
17A11: mov     di, 2A9h
17A14: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17A19: mov     di, ax
17A1B: mov     al, [bp+di+var_AD]
17A1F: xor     ah, ah
17A21: mov     cx, ax
17A23: mov     al, [bp+var_92]
17A27: xor     ah, ah
17A29: xor     dx, dx
17A2B: mov     di, 2A9h
17A2E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17A33: mov     di, ax
17A35: mov     al, [bp+di+var_AD]
17A39: xor     ah, ah
17A3B: imul    cx
17A3D: cwd
17A3E: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17A43: mov     cx, 87h
17A46: xor     si, si
17A48: mov     di, 7000h
17A4B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17A50: mov     cx, [bp+var_1E]
17A53: mov     si, [bp+var_1C]
17A56: mov     di, [bp+var_1A]
17A59: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17A5E: mov     [bp+var_54], ax
17A61: mov     [bp+var_52], bx
17A64: mov     [bp+var_50], dx
17A67: push    bp
17A68: call    sub_15FF8
17A6B: mov     di, offset unk_2F60A
17A6E: push    ds
17A6F: push    di
17A70: mov     di, offset aTo; " to "
17A73: push    cs
17A74: push    di
17A75: xor     ax, ax
17A77: push    ax
17A78: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17A7D: mov     ax, [bp+var_9E]
17A81: cwd
17A82: mov     di, 243h
17A85: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17A8A: push    dx
17A8B: push    ax
17A8C: mov     ax, 4
17A8F: push    ax
17A90: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17A95: mov     al, 2Dh ; '-'
17A97: push    ax
17A98: xor     ax, ax
17A9A: push    ax
17A9B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17AA0: mov     ax, [bp+var_A0]
17AA4: cwd
17AA5: mov     di, 243h
17AA8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17AAD: push    dx
17AAE: push    ax
17AAF: mov     ax, 2
17AB2: push    ax
17AB3: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17AB8: mov     al, 2Dh ; '-'
17ABA: push    ax
17ABB: xor     ax, ax
17ABD: push    ax
17ABE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17AC3: mov     ax, [bp+var_9C]
17AC7: cwd
17AC8: mov     di, 243h
17ACB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17AD0: push    dx
17AD1: push    ax
17AD2: mov     ax, 2
17AD5: push    ax
17AD6: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17ADB: call    @Write$qm4Text; Write(var f: Text)
17AE0: call    @__IOCheck$qv; Exit if error
17AE5: mov     [bp+var_9A], 1
17AEA: mov     ax, [bp+var_72]
17AED: mov     bx, [bp+var_70]
17AF0: mov     dx, [bp+var_6E]
17AF3: mov     [bp+var_54], ax
17AF6: mov     [bp+var_52], bx
17AF9: mov     [bp+var_50], dx
17AFC: push    bp
17AFD: call    sub_15FF8
17B00: mov     di, offset unk_2F60A
17B03: push    ds
17B04: push    di
17B05: mov     di, offset aAge; "  Age "
17B08: push    cs
17B09: push    di
17B0A: xor     ax, ax
17B0C: push    ax
17B0D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17B12: mov     ax, [bp+var_9E]
17B16: cwd
17B17: mov     di, 243h
17B1A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17B1F: push    dx
17B20: push    ax
17B21: mov     ax, 3
17B24: push    ax
17B25: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17B2A: mov     al, 2Dh ; '-'
17B2C: push    ax
17B2D: xor     ax, ax
17B2F: push    ax
17B30: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17B35: mov     ax, [bp+var_A0]
17B39: cwd
17B3A: mov     di, 243h
17B3D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17B42: push    dx
17B43: push    ax
17B44: mov     ax, 2
17B47: push    ax
17B48: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17B4D: mov     al, 2Dh ; '-'
17B4F: push    ax
17B50: xor     ax, ax
17B52: push    ax
17B53: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17B58: mov     ax, [bp+var_9C]
17B5C: cwd
17B5D: mov     di, 243h
17B60: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17B65: push    dx
17B66: push    ax
17B67: mov     ax, 2
17B6A: push    ax
17B6B: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17B70: call    @Write$qm4Text; Write(var f: Text)
17B75: call    @__IOCheck$qv; Exit if error
17B7A: mov     al, [bp+var_94]
17B7E: xor     ah, ah
17B80: xor     dx, dx
17B82: mov     di, 2A9h
17B85: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17B8A: mov     di, ax
17B8C: mov     al, [bp+di+var_AD]
17B90: xor     ah, ah
17B92: mov     cx, ax
17B94: mov     al, [bp+var_92]
17B98: xor     ah, ah
17B9A: xor     dx, dx
17B9C: mov     di, 2A9h
17B9F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17BA4: mov     di, ax
17BA6: mov     al, [bp+di+var_AD]
17BAA: xor     ah, ah
17BAC: imul    cx
17BAE: cwd
17BAF: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17BB4: mov     cx, 87h
17BB7: xor     si, si
17BB9: mov     di, 7000h
17BBC: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17BC1: mov     cx, [bp+var_72]
17BC4: mov     si, [bp+var_70]
17BC7: mov     di, [bp+var_6E]
17BCA: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17BCF: mov     [bp+var_54], ax
17BD2: mov     [bp+var_52], bx
17BD5: mov     [bp+var_50], dx
17BD8: push    bp
17BD9: call    sub_15FF8
17BDC: mov     di, offset unk_2F60A
17BDF: push    ds
17BE0: push    di
17BE1: mov     di, offset aTo; " to "
17BE4: push    cs
17BE5: push    di
17BE6: xor     ax, ax
17BE8: push    ax
17BE9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
17BEE: mov     ax, [bp+var_9E]
17BF2: cwd
17BF3: mov     di, 243h
17BF6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17BFB: push    dx
17BFC: push    ax
17BFD: mov     ax, 3
17C00: push    ax
17C01: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17C06: mov     al, 2Dh ; '-'
17C08: push    ax
17C09: xor     ax, ax
17C0B: push    ax
17C0C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17C11: mov     ax, [bp+var_A0]
17C15: cwd
17C16: mov     di, 243h
17C19: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17C1E: push    dx
17C1F: push    ax
17C20: mov     ax, 2
17C23: push    ax
17C24: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17C29: mov     al, 2Dh ; '-'
17C2B: push    ax
17C2C: xor     ax, ax
17C2E: push    ax
17C2F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
17C34: mov     ax, [bp+var_9C]
17C38: cwd
17C39: mov     di, 243h
17C3C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17C41: push    dx
17C42: push    ax
17C43: mov     ax, 2
17C46: push    ax
17C47: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
17C4C: call    @Write$qm4Text; Write(var f: Text)
17C51: call    @__IOCheck$qv; Exit if error
17C56: mov     di, offset unk_2F60A
17C59: push    ds
17C5A: push    di
17C5B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
17C60: call    @__IOCheck$qv; Exit if error
17C65: mov     [bp+var_9A], 0
17C6A: mov     al, [bp+var_94]
17C6E: xor     ah, ah
17C70: xor     dx, dx
17C72: mov     di, 2A9h
17C75: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17C7A: mov     di, ax
17C7C: mov     al, [bp+di+var_AD]
17C80: xor     ah, ah
17C82: mov     cx, ax
17C84: mov     al, [bp+var_92]
17C88: xor     ah, ah
17C8A: xor     dx, dx
17C8C: mov     di, 2A9h
17C8F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17C94: mov     di, ax
17C96: mov     al, [bp+di+var_AD]
17C9A: xor     ah, ah
17C9C: imul    cx
17C9E: cwd
17C9F: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17CA4: mov     cx, 87h
17CA7: xor     si, si
17CA9: mov     di, 7000h
17CAC: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17CB1: mov     cx, [bp+var_1E]
17CB4: mov     si, [bp+var_1C]
17CB7: mov     di, [bp+var_1A]
17CBA: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17CBF: mov     [bp+var_2A], ax
17CC2: mov     [bp+var_28], bx
17CC5: mov     [bp+var_26], dx
17CC8: mov     al, [bp+var_92]
17CCC: xor     ah, ah
17CCE: xor     dx, dx
17CD0: mov     di, 2A9h
17CD3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17CD8: mov     di, ax
17CDA: mov     al, [bp+di+var_AD]
17CDE: xor     ah, ah
17CE0: mov     cx, ax
17CE2: mov     al, [bp+var_94]
17CE6: xor     ah, ah
17CE8: xor     dx, dx
17CEA: mov     di, 2A9h
17CED: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17CF2: mov     di, ax
17CF4: mov     al, [bp+di+var_AD]
17CF8: xor     ah, ah
17CFA: imul    cx
17CFC: cwd
17CFD: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17D02: mov     cx, 87h
17D05: xor     si, si
17D07: mov     di, 7000h
17D0A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17D0F: mov     cx, [bp+var_1E]
17D12: mov     si, [bp+var_1C]
17D15: mov     di, [bp+var_1A]
17D18: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17D1D: mov     [bp+var_1E], ax
17D20: mov     [bp+var_1C], bx
17D23: mov     [bp+var_1A], dx
17D26: mov     al, [bp+var_94]
17D2A: xor     ah, ah
17D2C: xor     dx, dx
17D2E: mov     di, 2A9h
17D31: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17D36: mov     di, ax
17D38: mov     al, [bp+di+var_AD]
17D3C: xor     ah, ah
17D3E: mov     cx, ax
17D40: mov     al, [bp+var_92]
17D44: xor     ah, ah
17D46: xor     dx, dx
17D48: mov     di, 2A9h
17D4B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17D50: mov     di, ax
17D52: mov     al, [bp+di+var_AD]
17D56: xor     ah, ah
17D58: imul    cx
17D5A: cwd
17D5B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17D60: mov     cx, 87h
17D63: xor     si, si
17D65: mov     di, 7000h
17D68: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17D6D: mov     cx, [bp+var_72]
17D70: mov     si, [bp+var_70]
17D73: mov     di, [bp+var_6E]
17D76: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17D7B: mov     [bp+var_7E], ax
17D7E: mov     [bp+var_7C], bx
17D81: mov     [bp+var_7A], dx
17D84: mov     al, [bp+var_92]
17D88: xor     ah, ah
17D8A: xor     dx, dx
17D8C: mov     di, 2A9h
17D8F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17D94: mov     di, ax
17D96: mov     al, [bp+di+var_AD]
17D9A: xor     ah, ah
17D9C: mov     cx, ax
17D9E: mov     al, [bp+var_94]
17DA2: xor     ah, ah
17DA4: xor     dx, dx
17DA6: mov     di, 2A9h
17DA9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17DAE: mov     di, ax
17DB0: mov     al, [bp+di+var_AD]
17DB4: xor     ah, ah
17DB6: imul    cx
17DB8: cwd
17DB9: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17DBE: mov     cx, 87h
17DC1: xor     si, si
17DC3: mov     di, 7000h
17DC6: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
17DCB: mov     cx, [bp+var_72]
17DCE: mov     si, [bp+var_70]
17DD1: mov     di, [bp+var_6E]
17DD4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17DD9: mov     [bp+var_72], ax
17DDC: mov     [bp+var_70], bx
17DDF: mov     [bp+var_6E], dx
17DE2: mov     al, [bp+var_94]
17DE6: xor     ah, ah
17DE8: inc     ax
17DE9: cwd
17DEA: mov     di, 2B1h
17DED: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17DF2: mov     [bp+var_94], al
17DF6: cmp     [bp+var_93], 8
17DFB: jz      short loc_17E00
17DFD: jmp     loc_17933
17E00: mov     di, offset unk_2F60A
17E03: push    ds
17E04: push    di
17E05: call    @WriteLn$qm4Text; WriteLn(var f: Text)
17E0A: call    @__IOCheck$qv; Exit if error
17E0F: mov     al, [bp+var_91]
17E13: cmp     al, 2
17E15: jz      short loc_17E1F
17E17: cmp     al, 4
17E19: jz      short loc_17E1F
17E1B: cmp     al, 6
17E1D: jnz     short loc_17E33
17E1F: mov     di, offset unk_2F50A
17E22: push    ds
17E23: push    di
17E24: call    @ReadLn$qm4Text; ReadLn(var f: Text)
17E29: call    @__IOCheck$qv; Exit if error
17E2E: call    @CLRSCR$qv; CLRSCR(void)
17E33: mov     al, [bp+var_92]
17E37: xor     ah, ah
17E39: xor     dx, dx
17E3B: mov     di, 2A9h
17E3E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17E43: mov     di, ax
17E45: mov     al, [bp+di+var_AD]
17E49: xor     ah, ah
17E4B: xor     dx, dx
17E4D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17E52: mov     cx, [bp+var_18]
17E55: mov     si, [bp+var_16]
17E58: mov     di, [bp+var_14]
17E5B: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17E60: mov     [bp+var_1E], ax
17E63: mov     [bp+var_1C], bx
17E66: mov     [bp+var_1A], dx
17E69: mov     al, [bp+var_92]
17E6D: xor     ah, ah
17E6F: xor     dx, dx
17E71: mov     di, 2A9h
17E74: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17E79: mov     di, ax
17E7B: mov     al, [bp+di+var_AD]
17E7F: xor     ah, ah
17E81: xor     dx, dx
17E83: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17E88: mov     cx, [bp+var_18]
17E8B: mov     si, [bp+var_16]
17E8E: mov     di, [bp+var_14]
17E91: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17E96: mov     [bp+var_18], ax
17E99: mov     [bp+var_16], bx
17E9C: mov     [bp+var_14], dx
17E9F: mov     al, [bp+var_92]
17EA3: xor     ah, ah
17EA5: xor     dx, dx
17EA7: mov     di, 2A9h
17EAA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17EAF: mov     di, ax
17EB1: mov     al, [bp+di+var_AD]
17EB5: xor     ah, ah
17EB7: xor     dx, dx
17EB9: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17EBE: mov     cx, [bp+var_6C]
17EC1: mov     si, [bp+var_6A]
17EC4: mov     di, [bp+var_68]
17EC7: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17ECC: mov     [bp+var_72], ax
17ECF: mov     [bp+var_70], bx
17ED2: mov     [bp+var_6E], dx
17ED5: mov     al, [bp+var_92]
17ED9: xor     ah, ah
17EDB: xor     dx, dx
17EDD: mov     di, 2A9h
17EE0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17EE5: mov     di, ax
17EE7: mov     al, [bp+di+var_AD]
17EEB: xor     ah, ah
17EED: xor     dx, dx
17EEF: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
17EF4: mov     cx, [bp+var_6C]
17EF7: mov     si, [bp+var_6A]
17EFA: mov     di, [bp+var_68]
17EFD: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
17F02: mov     [bp+var_6C], ax
17F05: mov     [bp+var_6A], bx
17F08: mov     [bp+var_68], dx
17F0B: mov     al, [bp+var_92]
17F0F: xor     ah, ah
17F11: inc     ax
17F12: cwd
17F13: mov     di, 2B1h
17F16: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
17F1B: mov     [bp+var_92], al
17F1F: cmp     [bp+var_91], 8
17F24: jz      short loc_17F29
17F26: jmp     loc_17268
17F29: mov     di, offset unk_2F50A
17F2C: push    ds
17F2D: push    di
17F2E: call    @ReadLn$qm4Text; ReadLn(var f: Text)
17F33: call    @__IOCheck$qv; Exit if error
17F38: mov     sp, bp
17F3A: pop     bp
17F3B: retf
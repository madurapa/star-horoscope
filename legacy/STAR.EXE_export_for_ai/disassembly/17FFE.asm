/*
 * func-name: sub_17FFE
 * func-address: 0x17ffe
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x257e7, 0x263ee, 0x263fc, 0x26424, 0x2650b, 0x26a00, 0x26a06, 0x26a12, 0x26a22, 0x26a26, 0x27662, 0x27681, 0x276c5, 0x2772a, 0x277c0
 * fallback-reason: decompile returned None
 */

17FFE: push    bp
17FFF: mov     bp, sp
18001: xor     ax, ax
18003: call    @__StackCheck$q4Word; Stack overflow check (AX)
18008: mov     ax, word_27DEE
1800B: cwd
1800C: mov     di, 0
1800F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
18014: push    ax
18015: mov     ax, word_27DF0
18018: cwd
18019: mov     di, 0
1801C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
18021: push    ax
18022: mov     ax, word_27DF2
18025: cwd
18026: mov     di, 0
18029: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1802E: push    ax
1802F: call    sub_257E7
18034: cwd
18035: mov     di, 0
18038: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1803D: mov     word_27E08, ax
18040: mov     di, offset unk_2F60A
18043: push    ds
18044: push    di
18045: mov     di, offset aDay; "DAY    : "
18048: push    cs
18049: push    di
1804A: xor     ax, ax
1804C: push    ax
1804D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
18052: mov     di, offset unk_2A018
18055: push    ds
18056: push    di
18057: xor     ax, ax
18059: push    ax
1805A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1805F: call    @Write$qm4Text; Write(var f: Text)
18064: call    @__IOCheck$qv; Exit if error
18069: mov     di, offset unk_2F60A
1806C: push    ds
1806D: push    di
1806E: mov     di, offset aNekatha; "            NEKATHA : "
18071: push    cs
18072: push    di
18073: xor     ax, ax
18075: push    ax
18076: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1807B: mov     di, offset unk_29D18
1807E: push    ds
1807F: push    di
18080: xor     ax, ax
18082: push    ax
18083: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
18088: call    @Write$qm4Text; Write(var f: Text)
1808D: call    @__IOCheck$qv; Exit if error
18092: mov     di, offset unk_2F60A
18095: push    ds
18096: push    di
18097: mov     di, offset aPadaya; "       PADAYA  :  "
1809A: push    cs
1809B: push    di
1809C: xor     ax, ax
1809E: push    ax
1809F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
180A4: mov     ax, word_27E20
180A7: cwd
180A8: mov     di, 3Ch ; '<'
180AB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
180B0: push    dx
180B1: push    ax
180B2: xor     ax, ax
180B4: push    ax
180B5: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
180BA: call    @Write$qm4Text; Write(var f: Text)
180BF: call    @__IOCheck$qv; Exit if error
180C4: mov     di, offset unk_2F60A
180C7: push    ds
180C8: push    di
180C9: call    @WriteLn$qm4Text; WriteLn(var f: Text)
180CE: call    @__IOCheck$qv; Exit if error
180D3: mov     ax, word_27D30
180D6: mov     bx, word_27D32
180DA: mov     dx, word_27D34
180DE: mov     cx, word_27D2A
180E2: mov     si, word_27D2C
180E6: mov     di, word_27D2E
180EA: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
180EF: mov     word_27D72, ax
180F2: mov     word_27D74, bx
180F6: mov     word_27D76, dx
180FA: mov     ax, word_27D72
180FD: mov     bx, word_27D74
18101: mov     dx, word_27D76
18105: mov     cx, 89h
18108: xor     si, si
1810A: mov     di, 3400h
1810D: call    @__Cmp$q4Realt1; Compare two reals
18112: jbe     short loc_18137
18114: mov     ax, word_27D72
18117: mov     bx, word_27D74
1811B: mov     dx, word_27D76
1811F: mov     cx, 89h
18122: xor     si, si
18124: mov     di, 3400h
18127: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1812C: mov     word_27D72, ax
1812F: mov     word_27D74, bx
18133: mov     word_27D76, dx
18137: xor     ax, ax
18139: mov     word_27E06, ax
1813C: xor     ax, ax
1813E: mov     word_27E06, ax
18141: jmp     short loc_18147
18143: inc     word_27E06
18147: mov     ax, word_27E06
1814A: inc     ax
1814B: cwd
1814C: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
18151: mov     cx, word_27D8A
18155: mov     si, word_27D8C
18159: mov     di, word_27D8E
1815D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18162: mov     cx, word_27D72
18166: mov     si, word_27D74
1816A: mov     di, word_27D76
1816E: call    @__Cmp$q4Realt1; Compare two reals
18173: jnb     short loc_18179
18175: mov     al, 0
18177: jmp     short loc_1817B
18179: mov     al, 1
1817B: push    ax
1817C: mov     ax, word_27E06
1817F: cwd
18180: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
18185: mov     cx, word_27D8A
18189: mov     si, word_27D8C
1818D: mov     di, word_27D8E
18191: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
18196: mov     cx, word_27D72
1819A: mov     si, word_27D74
1819E: mov     di, word_27D76
181A2: call    @__Cmp$q4Realt1; Compare two reals
181A7: jbe     short loc_181AD
181A9: mov     al, 0
181AB: jmp     short loc_181AF
181AD: mov     al, 1
181AF: pop     dx
181B0: and     al, dl
181B2: or      al, al
181B4: jz      short loc_181DE
181B6: mov     ax, word_27E06
181B9: inc     ax
181BA: cwd
181BB: mov     di, 44h ; 'D'
181BE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
181C3: mov     dx, 0Dh
181C6: mul     dx
181C8: mov     di, ax
181CA: add     di, 7689h
181CE: push    ds
181CF: push    di
181D0: mov     di, offset unk_29E18
181D3: push    ds
181D4: push    di
181D5: mov     ax, 0FFh
181D8: push    ax
181D9: call    @$basg$qm6Stringt14Byte; Store string
181DE: cmp     word_27E06, 1Ah
181E3: jz      short loc_181E8
181E5: jmp     loc_18143
181E8: mov     ax, word_27D30
181EB: mov     bx, word_27D32
181EF: mov     dx, word_27D34
181F3: mov     cx, word_27D2A
181F7: mov     si, word_27D2C
181FB: mov     di, word_27D2E
181FF: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
18204: mov     word_27D78, ax
18207: mov     word_27D7A, bx
1820B: mov     word_27D7C, dx
1820F: mov     ax, word_27D78
18212: mov     bx, word_27D7A
18216: mov     dx, word_27D7C
1821A: xor     cx, cx
1821C: xor     si, si
1821E: xor     di, di
18220: call    @__Cmp$q4Realt1; Compare two reals
18225: jnb     short loc_1824A
18227: mov     ax, word_27D78
1822A: mov     bx, word_27D7A
1822E: mov     dx, word_27D7C
18232: mov     cx, 89h
18235: xor     si, si
18237: mov     di, 3400h
1823A: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1823F: mov     word_27D78, ax
18242: mov     word_27D7A, bx
18246: mov     word_27D7C, dx
1824A: mov     ax, word_27D78
1824D: mov     bx, word_27D7A
18251: mov     dx, word_27D7C
18255: mov     cx, 89h
18258: xor     si, si
1825A: mov     di, 3400h
1825D: call    @__Cmp$q4Realt1; Compare two reals
18262: jbe     short loc_18287
18264: mov     ax, word_27D78
18267: mov     bx, word_27D7A
1826B: mov     dx, word_27D7C
1826F: mov     cx, 89h
18272: xor     si, si
18274: mov     di, 3400h
18277: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1827C: mov     word_27D78, ax
1827F: mov     word_27D7A, bx
18283: mov     word_27D7C, dx
18287: xor     ax, ax
18289: mov     word_27E06, ax
1828C: xor     ax, ax
1828E: mov     word_27E06, ax
18291: jmp     short loc_18297
18293: inc     word_27E06
18297: mov     ax, word_27E06
1829A: inc     ax
1829B: mov     cx, 0Ch
1829E: imul    cx
182A0: cwd
182A1: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
182A6: mov     cx, word_27D78
182AA: mov     si, word_27D7A
182AE: mov     di, word_27D7C
182B2: call    @__Cmp$q4Realt1; Compare two reals
182B7: jnb     short loc_182BD
182B9: mov     al, 0
182BB: jmp     short loc_182BF
182BD: mov     al, 1
182BF: push    ax
182C0: mov     ax, word_27E06
182C3: mov     cx, 0Ch
182C6: imul    cx
182C8: cwd
182C9: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
182CE: mov     cx, word_27D78
182D2: mov     si, word_27D7A
182D6: mov     di, word_27D7C
182DA: call    @__Cmp$q4Realt1; Compare two reals
182DF: jb      short loc_182E5
182E1: mov     al, 0
182E3: jmp     short loc_182E7
182E5: mov     al, 1
182E7: pop     dx
182E8: and     al, dl
182EA: or      al, al
182EC: jz      short loc_1835B
182EE: mov     ax, word_27E06
182F1: cwd
182F2: mov     di, 0
182F5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
182FA: mov     word_27E0A, ax
182FD: cmp     word_27E06, 0Fh
18302: jge     short loc_1832B
18304: mov     ax, word_27E06
18307: inc     ax
18308: cwd
18309: mov     di, 4Ch ; 'L'
1830C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
18311: mov     di, ax
18313: mov     cl, 4
18315: shl     di, cl
18317: add     di, 77E6h
1831B: push    ds
1831C: push    di
1831D: mov     di, offset unk_29F18
18320: push    ds
18321: push    di
18322: mov     ax, 0FFh
18325: push    ax
18326: call    @$basg$qm6Stringt14Byte; Store string
1832B: cmp     word_27E06, 0Fh
18330: jl      short loc_1835B
18332: mov     ax, word_27E06
18335: sub     ax, 0Eh
18338: cwd
18339: mov     di, 4Ch ; 'L'
1833C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
18341: mov     di, ax
18343: mov     cl, 4
18345: shl     di, cl
18347: add     di, 77E6h
1834B: push    ds
1834C: push    di
1834D: mov     di, offset unk_29F18
18350: push    ds
18351: push    di
18352: mov     ax, 0FFh
18355: push    ax
18356: call    @$basg$qm6Stringt14Byte; Store string
1835B: cmp     word_27E06, 1Dh
18360: jz      short loc_18365
18362: jmp     loc_18293
18365: cmp     word_27E0A, 0Fh
1836A: jge     short loc_183B8
1836C: mov     di, offset unk_2F60A
1836F: push    ds
18370: push    di
18371: mov     di, offset aThitiyaPura; "THITIYA: Pura-"
18374: push    cs
18375: push    di
18376: xor     ax, ax
18378: push    ax
18379: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1837E: mov     di, offset unk_29F18
18381: push    ds
18382: push    di
18383: xor     ax, ax
18385: push    ax
18386: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1838B: mov     al, 2Dh ; '-'
1838D: push    ax
1838E: xor     ax, ax
18390: push    ax
18391: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
18396: mov     ax, word_27E0A
18399: inc     ax
1839A: cwd
1839B: mov     di, 3Ch ; '<'
1839E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
183A3: push    dx
183A4: push    ax
183A5: mov     ax, 2
183A8: push    ax
183A9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
183AE: call    @Write$qm4Text; Write(var f: Text)
183B3: call    @__IOCheck$qv; Exit if error
183B8: cmp     word_27E0A, 1Ch
183BD: jle     short loc_183C3
183BF: mov     al, 0
183C1: jmp     short loc_183C5
183C3: mov     al, 1
183C5: mov     dl, al
183C7: cmp     word_27E0A, 0Fh
183CC: jge     short loc_183D2
183CE: mov     al, 0
183D0: jmp     short loc_183D4
183D2: mov     al, 1
183D4: and     al, dl
183D6: or      al, al
183D8: jz      short loc_18428
183DA: mov     di, offset unk_2F60A
183DD: push    ds
183DE: push    di
183DF: mov     di, offset aThitiyaAva; "THITIYA: Ava -"
183E2: push    cs
183E3: push    di
183E4: xor     ax, ax
183E6: push    ax
183E7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
183EC: mov     di, offset unk_29F18
183EF: push    ds
183F0: push    di
183F1: xor     ax, ax
183F3: push    ax
183F4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
183F9: mov     al, 2Dh ; '-'
183FB: push    ax
183FC: xor     ax, ax
183FE: push    ax
183FF: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
18404: mov     ax, word_27E0A
18407: sub     ax, 0Eh
1840A: cwd
1840B: mov     di, 3Ch ; '<'
1840E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
18413: push    dx
18414: push    ax
18415: mov     ax, 2
18418: push    ax
18419: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1841E: call    @Write$qm4Text; Write(var f: Text)
18423: call    @__IOCheck$qv; Exit if error
18428: cmp     word_27E0A, 1Dh
1842D: jnz     short loc_1844B
1842F: mov     di, offset unk_2F60A
18432: push    ds
18433: push    di
18434: mov     di, offset aThitiyaAmaawak; "THITIYA:  Amaawaka-15       "
18437: push    cs
18438: push    di
18439: xor     ax, ax
1843B: push    ax
1843C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
18441: call    @Write$qm4Text; Write(var f: Text)
18446: call    @__IOCheck$qv; Exit if error
1844B: mov     di, offset unk_2F60A
1844E: push    ds
1844F: push    di
18450: mov     di, offset aYogaya; "  YOGAYA  : "
18453: push    cs
18454: push    di
18455: xor     ax, ax
18457: push    ax
18458: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1845D: mov     di, offset unk_29E18
18460: push    ds
18461: push    di
18462: xor     ax, ax
18464: push    ax
18465: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1846A: call    @Write$qm4Text; Write(var f: Text)
1846F: call    @__IOCheck$qv; Exit if error
18474: mov     ax, word_27D78
18477: mov     bx, word_27D7A
1847B: mov     dx, word_27D7C
1847F: mov     word_27D90, ax
18482: mov     word_27D92, bx
18486: mov     word_27D94, dx
1848A: xor     ax, ax
1848C: mov     word_27E06, ax
1848F: jmp     short loc_18495
18491: inc     word_27E06
18495: mov     ax, word_27E06
18498: inc     ax
18499: mov     cx, 6
1849C: imul    cx
1849E: cwd
1849F: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
184A4: mov     cx, word_27D90
184A8: mov     si, word_27D92
184AC: mov     di, word_27D94
184B0: call    @__Cmp$q4Realt1; Compare two reals
184B5: jnb     short loc_184BB
184B7: mov     al, 0
184B9: jmp     short loc_184BD
184BB: mov     al, 1
184BD: push    ax
184BE: mov     ax, word_27E06
184C1: mov     cx, 6
184C4: imul    cx
184C6: cwd
184C7: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
184CC: mov     cx, word_27D90
184D0: mov     si, word_27D92
184D4: mov     di, word_27D94
184D8: call    @__Cmp$q4Realt1; Compare two reals
184DD: jb      short loc_184E3
184DF: mov     al, 0
184E1: jmp     short loc_184E5
184E3: mov     al, 1
184E5: pop     dx
184E6: and     al, dl
184E8: or      al, al
184EA: jz      short loc_184FC
184EC: mov     ax, word_27E06
184EF: inc     ax
184F0: cwd
184F1: mov     di, 0
184F4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
184F9: mov     word_27E0C, ax
184FC: cmp     word_27E06, 3Bh ; ';'
18501: jnz     short loc_18491
18503: mov     ax, word_27E0C
18506: cmp     ax, 1
18509: jnz     short loc_18521
1850B: mov     di, offset unk_2F304
1850E: push    ds
1850F: push    di
18510: mov     di, offset unk_2A118
18513: push    ds
18514: push    di
18515: mov     ax, 0FFh
18518: push    ax
18519: call    @$basg$qm6Stringt14Byte; Store string
1851E: jmp     loc_1871E
18521: cmp     ax, 2
18524: jz      short loc_18549
18526: cmp     ax, 9
18529: jz      short loc_18549
1852B: cmp     ax, 10h
1852E: jz      short loc_18549
18530: cmp     ax, 17h
18533: jz      short loc_18549
18535: cmp     ax, 1Eh
18538: jz      short loc_18549
1853A: cmp     ax, 22h ; '"'
1853D: jz      short loc_18549
1853F: cmp     ax, 34h ; '4'
18542: jz      short loc_18549
18544: cmp     ax, 29h ; ')'
18547: jnz     short loc_1855F
18549: mov     di, offset unk_2F314
1854C: push    ds
1854D: push    di
1854E: mov     di, offset unk_2A118
18551: push    ds
18552: push    di
18553: mov     ax, 0FFh
18556: push    ax
18557: call    @$basg$qm6Stringt14Byte; Store string
1855C: jmp     loc_1871E
1855F: cmp     ax, 3
18562: jz      short loc_18587
18564: cmp     ax, 0Ah
18567: jz      short loc_18587
18569: cmp     ax, 11h
1856C: jz      short loc_18587
1856E: cmp     ax, 18h
18571: jz      short loc_18587
18573: cmp     ax, 1Fh
18576: jz      short loc_18587
18578: cmp     ax, 26h ; '&'
1857B: jz      short loc_18587
1857D: cmp     ax, 31h ; '1'
18580: jz      short loc_18587
18582: cmp     ax, 38h ; '8'
18585: jnz     short loc_1859D
18587: mov     di, offset unk_2F324
1858A: push    ds
1858B: push    di
1858C: mov     di, offset unk_2A118
1858F: push    ds
18590: push    di
18591: mov     ax, 0FFh
18594: push    ax
18595: call    @$basg$qm6Stringt14Byte; Store string
1859A: jmp     loc_1871E
1859D: cmp     ax, 4
185A0: jz      short loc_185C5
185A2: cmp     ax, 0Bh
185A5: jz      short loc_185C5
185A7: cmp     ax, 19h
185AA: jz      short loc_185C5
185AC: cmp     ax, 12h
185AF: jz      short loc_185C5
185B1: cmp     ax, 23h ; '#'
185B4: jz      short loc_185C5
185B6: cmp     ax, 2Ah ; '*'
185B9: jz      short loc_185C5
185BB: cmp     ax, 2Eh ; '.'
185BE: jz      short loc_185C5
185C0: cmp     ax, 35h ; '5'
185C3: jnz     short loc_185DB
185C5: mov     di, offset unk_2F334
185C8: push    ds
185C9: push    di
185CA: mov     di, offset unk_2A118
185CD: push    ds
185CE: push    di
185CF: mov     ax, 0FFh
185D2: push    ax
185D3: call    @$basg$qm6Stringt14Byte; Store string
185D8: jmp     loc_1871E
185DB: cmp     ax, 5
185DE: jz      short loc_18603
185E0: cmp     ax, 0Ch
185E3: jz      short loc_18603
185E5: cmp     ax, 13h
185E8: jz      short loc_18603
185EA: cmp     ax, 1Ah
185ED: jz      short loc_18603
185EF: cmp     ax, 20h ; ' '
185F2: jz      short loc_18603
185F4: cmp     ax, 27h ; '''
185F7: jz      short loc_18603
185F9: cmp     ax, 32h ; '2'
185FC: jz      short loc_18603
185FE: cmp     ax, 39h ; '9'
18601: jnz     short loc_18619
18603: mov     di, offset unk_2F344
18606: push    ds
18607: push    di
18608: mov     di, offset unk_2A118
1860B: push    ds
1860C: push    di
1860D: mov     ax, 0FFh
18610: push    ax
18611: call    @$basg$qm6Stringt14Byte; Store string
18616: jmp     loc_1871E
18619: cmp     ax, 6
1861C: jz      short loc_18641
1861E: cmp     ax, 0Dh
18621: jz      short loc_18641
18623: cmp     ax, 1Bh
18626: jz      short loc_18641
18628: cmp     ax, 14h
1862B: jz      short loc_18641
1862D: cmp     ax, 24h ; '$'
18630: jz      short loc_18641
18632: cmp     ax, 2Bh ; '+'
18635: jz      short loc_18641
18637: cmp     ax, 2Fh ; '/'
1863A: jz      short loc_18641
1863C: cmp     ax, 36h ; '6'
1863F: jnz     short loc_18657
18641: mov     di, offset unk_2F354
18644: push    ds
18645: push    di
18646: mov     di, offset unk_2A118
18649: push    ds
1864A: push    di
1864B: mov     ax, 0FFh
1864E: push    ax
1864F: call    @$basg$qm6Stringt14Byte; Store string
18654: jmp     loc_1871E
18657: cmp     ax, 7
1865A: jz      short loc_1867F
1865C: cmp     ax, 0Eh
1865F: jz      short loc_1867F
18661: cmp     ax, 15h
18664: jz      short loc_1867F
18666: cmp     ax, 1Ch
18669: jz      short loc_1867F
1866B: cmp     ax, 21h ; '!'
1866E: jz      short loc_1867F
18670: cmp     ax, 28h ; '('
18673: jz      short loc_1867F
18675: cmp     ax, 33h ; '3'
18678: jz      short loc_1867F
1867A: cmp     ax, 3Ah ; ':'
1867D: jnz     short loc_18695
1867F: mov     di, offset unk_2F364
18682: push    ds
18683: push    di
18684: mov     di, offset unk_2A118
18687: push    ds
18688: push    di
18689: mov     ax, 0FFh
1868C: push    ax
1868D: call    @$basg$qm6Stringt14Byte; Store string
18692: jmp     loc_1871E
18695: cmp     ax, 8
18698: jz      short loc_186BD
1869A: cmp     ax, 0Fh
1869D: jz      short loc_186BD
1869F: cmp     ax, 1Dh
186A2: jz      short loc_186BD
186A4: cmp     ax, 16h
186A7: jz      short loc_186BD
186A9: cmp     ax, 25h ; '%'
186AC: jz      short loc_186BD
186AE: cmp     ax, 2Ch ; ','
186B1: jz      short loc_186BD
186B3: cmp     ax, 30h ; '0'
186B6: jz      short loc_186BD
186B8: cmp     ax, 37h ; '7'
186BB: jnz     short loc_186D2
186BD: mov     di, offset unk_2F374
186C0: push    ds
186C1: push    di
186C2: mov     di, offset unk_2A118
186C5: push    ds
186C6: push    di
186C7: mov     ax, 0FFh
186CA: push    ax
186CB: call    @$basg$qm6Stringt14Byte; Store string
186D0: jmp     short loc_1871E
186D2: cmp     ax, 3Bh ; ';'
186D5: jnz     short loc_186EC
186D7: mov     di, offset unk_2F384
186DA: push    ds
186DB: push    di
186DC: mov     di, offset unk_2A118
186DF: push    ds
186E0: push    di
186E1: mov     ax, 0FFh
186E4: push    ax
186E5: call    @$basg$qm6Stringt14Byte; Store string
186EA: jmp     short loc_1871E
186EC: cmp     ax, 2Dh ; '-'
186EF: jnz     short loc_18706
186F1: mov     di, offset unk_2F394
186F4: push    ds
186F5: push    di
186F6: mov     di, offset unk_2A118
186F9: push    ds
186FA: push    di
186FB: mov     ax, 0FFh
186FE: push    ax
186FF: call    @$basg$qm6Stringt14Byte; Store string
18704: jmp     short loc_1871E
18706: cmp     ax, 3Ch ; '<'
18709: jnz     short loc_1871E
1870B: mov     di, offset unk_2F3A4
1870E: push    ds
1870F: push    di
18710: mov     di, offset unk_2A118
18713: push    ds
18714: push    di
18715: mov     ax, 0FFh
18718: push    ax
18719: call    @$basg$qm6Stringt14Byte; Store string
1871E: mov     di, offset unk_2F60A
18721: push    ds
18722: push    di
18723: mov     di, offset aKaranaya; "      KARANAYA:  "
18726: push    cs
18727: push    di
18728: xor     ax, ax
1872A: push    ax
1872B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
18730: mov     di, offset unk_2A118
18733: push    ds
18734: push    di
18735: xor     ax, ax
18737: push    ax
18738: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1873D: call    @Write$qm4Text; Write(var f: Text)
18742: call    @__IOCheck$qv; Exit if error
18747: mov     sp, bp
18749: pop     bp
1874A: retf
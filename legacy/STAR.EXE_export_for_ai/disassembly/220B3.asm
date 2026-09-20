/*
 * func-name: sub_220B3
 * func-address: 0x220b3
 * export-type: disassembly-fallback
 * callers: 0x195d3
 * callees: 0x21ee1, 0x263ee, 0x26424, 0x265f6, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a74, 0x26ad9, 0x26b36, 0x26b49, 0x26d20, 0x27681, 0x2772a
 * fallback-reason: decompile returned None
 */

220B3: push    bp
220B4: mov     bp, sp
220B6: mov     ax, 0A2h
220B9: call    @__StackCheck$q4Word; Stack overflow check (AX)
220BE: sub     sp, 0A2h
220C2: mov     ax, word_27C4C
220C5: mov     bx, word_27C4E
220C9: mov     dx, word_27C50
220CD: mov     cx, 83h
220D0: xor     si, si
220D2: mov     di, 2000h
220D5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
220DA: mov     cx, 0CD7Dh
220DD: mov     si, 0CCCCh
220E0: mov     di, 4CCCh
220E3: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
220E8: mov     [bp+var_6], ax
220EB: mov     [bp+var_4], bx
220EE: mov     [bp+var_2], dx
220F1: mov     ax, 0B78Ch
220F4: mov     bx, 7F62h
220F7: mov     dx, 3DAEh
220FA: mov     cx, word_27C4C
220FE: mov     si, word_27C4E
22102: mov     di, word_27C50
22106: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2210B: mov     cx, 1288h
2210E: mov     si, 0BDA5h
22111: mov     di, 6D79h
22114: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22119: mov     cx, word_27C52
2211D: mov     si, word_27C54
22121: mov     di, word_27C56
22125: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2212A: mov     [bp+var_C], ax
2212D: mov     [bp+var_A], bx
22130: mov     [bp+var_8], dx
22133: mov     ax, 9D8Bh
22136: mov     bx, 0A511h
22139: mov     dx, 18C3h
2213C: mov     cx, word_27C4C
22140: mov     si, word_27C4E
22144: mov     di, word_27C50
22148: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2214D: mov     cx, 3B89h
22150: mov     si, 4FDFh
22153: mov     di, 4F5h
22156: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2215B: mov     cx, word_27C52
2215F: mov     si, word_27C54
22163: mov     di, word_27C56
22167: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2216C: mov     [bp+var_12], ax
2216F: mov     [bp+var_10], bx
22172: mov     [bp+var_E], dx
22175: mov     ax, 82h
22178: xor     bx, bx
2217A: xor     dx, dx
2217C: mov     cx, [bp+var_C]
2217F: mov     si, [bp+var_A]
22182: mov     di, [bp+var_8]
22185: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2218A: push    dx
2218B: push    bx
2218C: push    ax
2218D: mov     ax, 83h
22190: xor     bx, bx
22192: mov     dx, 2000h
22195: mov     cx, [bp+var_12]
22198: mov     si, [bp+var_10]
2219B: mov     di, [bp+var_E]
2219E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
221A3: pop     cx
221A4: pop     si
221A5: pop     di
221A6: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
221AB: mov     [bp+var_18], ax
221AE: mov     [bp+var_16], bx
221B1: mov     [bp+var_14], dx
221B4: mov     ax, [bp+var_12]
221B7: mov     bx, [bp+var_10]
221BA: mov     dx, [bp+var_E]
221BD: mov     cx, [bp+var_C]
221C0: mov     si, [bp+var_A]
221C3: mov     di, [bp+var_8]
221C6: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
221CB: mov     [bp+var_1E], ax
221CE: mov     [bp+var_1C], bx
221D1: mov     [bp+var_1A], dx
221D4: mov     ax, word_27CB8
221D7: mov     bx, word_27CBA
221DB: mov     dx, word_27CBC
221DF: mov     cx, word_27C4C
221E3: mov     si, word_27C4E
221E7: mov     di, word_27C50
221EB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
221F0: mov     cx, word_27C4C
221F4: mov     si, word_27C4E
221F8: mov     di, word_27C50
221FC: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22201: mov     cx, word_27C4C
22205: mov     si, word_27C4E
22209: mov     di, word_27C50
2220D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22212: push    dx
22213: push    bx
22214: push    ax
22215: mov     ax, word_27CB2
22218: mov     bx, word_27CB4
2221C: mov     dx, word_27CB6
22220: mov     cx, word_27C4C
22224: mov     si, word_27C4E
22228: mov     di, word_27C50
2222C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22231: mov     cx, word_27C4C
22235: mov     si, word_27C4E
22239: mov     di, word_27C50
2223D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22242: push    dx
22243: push    bx
22244: push    ax
22245: mov     ax, word_27CAC
22248: mov     bx, word_27CAE
2224C: mov     dx, word_27CB0
22250: mov     cx, word_27C4C
22254: mov     si, word_27C4E
22258: mov     di, word_27C50
2225C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22261: mov     cx, word_27CA6
22265: mov     si, word_27CA8
22269: mov     di, word_27CAA
2226D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22272: pop     cx
22273: pop     si
22274: pop     di
22275: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2227A: pop     cx
2227B: pop     si
2227C: pop     di
2227D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22282: mov     [bp+var_4E], ax
22285: mov     [bp+var_4C], bx
22288: mov     [bp+var_4A], dx
2228B: mov     ax, [bp+var_12]
2228E: mov     bx, [bp+var_10]
22291: mov     dx, [bp+var_E]
22294: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22299: push    dx
2229A: push    bx
2229B: push    ax
2229C: mov     ax, [bp+var_1E]
2229F: mov     bx, [bp+var_1C]
222A2: mov     dx, [bp+var_1A]
222A5: call    @Cos$q4Real; Cos(x: Real): Real
222AA: mov     cx, 7F7Ch
222AD: mov     si, 0BC6Ah
222B0: mov     di, 1374h
222B3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
222B8: pop     cx
222B9: pop     si
222BA: pop     di
222BB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
222C0: push    dx
222C1: push    bx
222C2: push    ax
222C3: mov     ax, [bp+var_12]
222C6: mov     bx, [bp+var_10]
222C9: mov     dx, [bp+var_E]
222CC: call    @Cos$q4Real; Cos(x: Real): Real
222D1: push    dx
222D2: push    bx
222D3: push    ax
222D4: mov     ax, [bp+var_1E]
222D7: mov     bx, [bp+var_1C]
222DA: mov     dx, [bp+var_1A]
222DD: call    far ptr @Sin$q4Real; Sin(x: Real): Real
222E2: mov     cx, 67Ch
222E5: mov     si, 9581h
222E8: mov     di, 0B43h
222EB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
222F0: pop     cx
222F1: pop     si
222F2: pop     di
222F3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
222F8: push    dx
222F9: push    bx
222FA: push    ax
222FB: mov     ax, [bp+var_18]
222FE: mov     bx, [bp+var_16]
22301: mov     dx, [bp+var_14]
22304: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22309: push    dx
2230A: push    bx
2230B: push    ax
2230C: mov     ax, 8D7Dh
2230F: mov     bx, 6E97h
22312: mov     dx, 312h
22315: mov     cx, [bp+var_6]
22318: mov     si, [bp+var_4]
2231B: mov     di, [bp+var_2]
2231E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22323: pop     cx
22324: pop     si
22325: pop     di
22326: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2232B: push    dx
2232C: push    bx
2232D: push    ax
2232E: mov     ax, [bp+var_18]
22331: mov     bx, [bp+var_16]
22334: mov     dx, [bp+var_14]
22337: call    @Cos$q4Real; Cos(x: Real): Real
2233C: mov     cx, 0F47Fh
2233F: mov     si, 0D4FDh
22342: mov     di, 2978h
22345: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2234A: pop     cx
2234B: pop     si
2234C: pop     di
2234D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22352: pop     cx
22353: pop     si
22354: pop     di
22355: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2235A: pop     cx
2235B: pop     si
2235C: pop     di
2235D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22362: mov     [bp+var_24], ax
22365: mov     [bp+var_22], bx
22368: mov     [bp+var_20], dx
2236B: mov     ax, [bp+var_12]
2236E: mov     bx, [bp+var_10]
22371: mov     dx, [bp+var_E]
22374: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22379: push    dx
2237A: push    bx
2237B: push    ax
2237C: mov     ax, [bp+var_1E]
2237F: mov     bx, [bp+var_1C]
22382: mov     dx, [bp+var_1A]
22385: call    @Cos$q4Real; Cos(x: Real): Real
2238A: mov     cx, 3B7Ch
2238D: mov     si, 4FDFh
22390: mov     di, 178Dh
22393: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22398: pop     cx
22399: pop     si
2239A: pop     di
2239B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
223A0: push    dx
223A1: push    bx
223A2: push    ax
223A3: mov     ax, [bp+var_12]
223A6: mov     bx, [bp+var_10]
223A9: mov     dx, [bp+var_E]
223AC: call    @Cos$q4Real; Cos(x: Real): Real
223B1: push    dx
223B2: push    bx
223B3: push    ax
223B4: mov     ax, [bp+var_1E]
223B7: mov     bx, [bp+var_1C]
223BA: mov     dx, [bp+var_1A]
223BD: call    far ptr @Sin$q4Real; Sin(x: Real): Real
223C2: mov     cx, 67Ch
223C5: mov     si, 9581h
223C8: mov     di, 0B43h
223CB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
223D0: pop     cx
223D1: pop     si
223D2: pop     di
223D3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
223D8: push    dx
223D9: push    bx
223DA: push    ax
223DB: mov     ax, [bp+var_18]
223DE: mov     bx, [bp+var_16]
223E1: mov     dx, [bp+var_14]
223E4: call    far ptr @Sin$q4Real; Sin(x: Real): Real
223E9: mov     cx, 717Bh
223EC: mov     si, 0A3Dh
223EF: mov     di, 0A3D7h
223F2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
223F7: pop     cx
223F8: pop     si
223F9: pop     di
223FA: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
223FF: pop     cx
22400: pop     si
22401: pop     di
22402: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22407: mov     cx, [bp+var_4E]
2240A: mov     si, [bp+var_4C]
2240D: mov     di, [bp+var_4A]
22410: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22415: push    dx
22416: push    bx
22417: push    ax
22418: mov     ax, [bp+var_24]
2241B: mov     bx, [bp+var_22]
2241E: mov     dx, [bp+var_20]
22421: pop     cx
22422: pop     si
22423: pop     di
22424: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22429: mov     [bp+var_30], ax
2242C: mov     [bp+var_2E], bx
2242F: mov     [bp+var_2C], dx
22432: mov     ax, [bp+var_12]
22435: mov     bx, [bp+var_10]
22438: mov     dx, [bp+var_E]
2243B: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22440: push    dx
22441: push    bx
22442: push    ax
22443: mov     ax, [bp+var_1E]
22446: mov     bx, [bp+var_1C]
22449: mov     dx, [bp+var_1A]
2244C: call    @Cos$q4Real; Cos(x: Real): Real
22451: mov     cx, 0A67Dh
22454: mov     si, 0C49Bh
22457: mov     di, 3020h
2245A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2245F: pop     cx
22460: pop     si
22461: pop     di
22462: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22467: push    dx
22468: push    bx
22469: push    ax
2246A: mov     ax, [bp+var_12]
2246D: mov     bx, [bp+var_10]
22470: mov     dx, [bp+var_E]
22473: call    @Cos$q4Real; Cos(x: Real): Real
22478: push    dx
22479: push    bx
2247A: push    ax
2247B: mov     ax, [bp+var_1E]
2247E: mov     bx, [bp+var_1C]
22481: mov     dx, [bp+var_1A]
22484: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22489: mov     cx, 0CF7Dh
2248C: mov     si, 53F7h
2248F: mov     di, 25E3h
22492: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22497: pop     cx
22498: pop     si
22499: pop     di
2249A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2249F: push    dx
224A0: push    bx
224A1: push    ax
224A2: mov     ax, 82h
224A5: xor     bx, bx
224A7: xor     dx, dx
224A9: mov     cx, [bp+var_1E]
224AC: mov     si, [bp+var_1C]
224AF: mov     di, [bp+var_1A]
224B2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
224B7: call    @Cos$q4Real; Cos(x: Real): Real
224BC: mov     cx, 2D7Ch
224BF: mov     si, 9DB2h
224C2: mov     di, 27EFh
224C5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
224CA: push    dx
224CB: push    bx
224CC: push    ax
224CD: mov     ax, [bp+var_1E]
224D0: mov     bx, [bp+var_1C]
224D3: mov     dx, [bp+var_1A]
224D6: call    @Cos$q4Real; Cos(x: Real): Real
224DB: mov     cx, 6A7Eh
224DE: mov     si, 74BCh
224E1: mov     di, 1893h
224E4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
224E9: push    dx
224EA: push    bx
224EB: push    ax
224EC: mov     ax, [bp+var_18]
224EF: mov     bx, [bp+var_16]
224F2: mov     dx, [bp+var_14]
224F5: call    far ptr @Sin$q4Real; Sin(x: Real): Real
224FA: push    dx
224FB: push    bx
224FC: push    ax
224FD: mov     ax, 0A07Eh
22500: mov     bx, 2F1Ah
22503: mov     dx, 24DDh
22506: mov     cx, [bp+var_6]
22509: mov     si, [bp+var_4]
2250C: mov     di, [bp+var_2]
2250F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22514: pop     cx
22515: pop     si
22516: pop     di
22517: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2251C: push    dx
2251D: push    bx
2251E: push    ax
2251F: mov     ax, [bp+var_18]
22522: mov     bx, [bp+var_16]
22525: mov     dx, [bp+var_14]
22528: call    @Cos$q4Real; Cos(x: Real): Real
2252D: mov     cx, 0F280h
22530: mov     si, 4DD2h
22533: mov     di, 0D062h
22536: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2253B: pop     cx
2253C: pop     si
2253D: pop     di
2253E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22543: pop     cx
22544: pop     si
22545: pop     di
22546: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2254B: pop     cx
2254C: pop     si
2254D: pop     di
2254E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22553: pop     cx
22554: pop     si
22555: pop     di
22556: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2255B: pop     cx
2255C: pop     si
2255D: pop     di
2255E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22563: mov     [bp+var_2A], ax
22566: mov     [bp+var_28], bx
22569: mov     [bp+var_26], dx
2256C: mov     ax, [bp+var_12]
2256F: mov     bx, [bp+var_10]
22572: mov     dx, [bp+var_E]
22575: call    far ptr @Sin$q4Real; Sin(x: Real): Real
2257A: push    dx
2257B: push    bx
2257C: push    ax
2257D: mov     ax, [bp+var_1E]
22580: mov     bx, [bp+var_1C]
22583: mov     dx, [bp+var_1A]
22586: call    far ptr @Sin$q4Real; Sin(x: Real): Real
2258B: mov     cx, 9A7Eh
2258E: mov     si, 9999h
22591: mov     di, 1999h
22594: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22599: pop     cx
2259A: pop     si
2259B: pop     di
2259C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
225A1: push    dx
225A2: push    bx
225A3: push    ax
225A4: mov     ax, [bp+var_12]
225A7: mov     bx, [bp+var_10]
225AA: mov     dx, [bp+var_E]
225AD: call    far ptr @Sin$q4Real; Sin(x: Real): Real
225B2: mov     cx, 0DD7Dh
225B5: mov     si, 624h
225B8: mov     di, 1581h
225BB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
225C0: push    dx
225C1: push    bx
225C2: push    ax
225C3: mov     ax, [bp+var_12]
225C6: mov     bx, [bp+var_10]
225C9: mov     dx, [bp+var_E]
225CC: call    @Cos$q4Real; Cos(x: Real): Real
225D1: push    dx
225D2: push    bx
225D3: push    ax
225D4: mov     ax, [bp+var_1E]
225D7: mov     bx, [bp+var_1C]
225DA: mov     dx, [bp+var_1A]
225DD: call    @Cos$q4Real; Cos(x: Real): Real
225E2: mov     cx, 917Dh
225E5: mov     si, 0E4ABh
225E8: mov     di, 1BA5h
225EB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
225F0: pop     cx
225F1: pop     si
225F2: pop     di
225F3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
225F8: push    dx
225F9: push    bx
225FA: push    ax
225FB: mov     ax, [bp+var_18]
225FE: mov     bx, [bp+var_16]
22601: mov     dx, [bp+var_14]
22604: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22609: mov     cx, 0D7Ch
2260C: mov     si, 81A9h
2260F: mov     di, 3C6Ah
22612: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22617: push    dx
22618: push    bx
22619: push    ax
2261A: mov     ax, [bp+var_18]
2261D: mov     bx, [bp+var_16]
22620: mov     dx, [bp+var_14]
22623: call    @Cos$q4Real; Cos(x: Real): Real
22628: mov     cx, 0EF7Dh
2262B: mov     si, 2E65h
2262E: mov     di, 1DB2h
22631: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22636: pop     cx
22637: pop     si
22638: pop     di
22639: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2263E: pop     cx
2263F: pop     si
22640: pop     di
22641: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22646: pop     cx
22647: pop     si
22648: pop     di
22649: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2264E: pop     cx
2264F: pop     si
22650: pop     di
22651: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22656: mov     cx, [bp+var_4E]
22659: mov     si, [bp+var_4C]
2265C: mov     di, [bp+var_4A]
2265F: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22664: push    dx
22665: push    bx
22666: push    ax
22667: mov     ax, [bp+var_2A]
2266A: mov     bx, [bp+var_28]
2266D: mov     dx, [bp+var_26]
22670: pop     cx
22671: pop     si
22672: pop     di
22673: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22678: mov     [bp+var_36], ax
2267B: mov     [bp+var_34], bx
2267E: mov     [bp+var_32], dx
22681: mov     ax, word_27C10
22684: mov     bx, word_27C12
22688: mov     dx, word_27C14
2268C: mov     cx, 83h
2268F: xor     si, si
22691: xor     di, di
22693: call    @__Cmp$q4Realt1; Compare two reals
22698: jnz     short loc_226BA
2269A: mov     [bp+var_3C], 81h
2269F: mov     [bp+var_3A], 0
226A4: mov     [bp+var_38], 0
226A9: mov     [bp+var_42], 0
226AE: mov     [bp+var_40], 0
226B3: mov     [bp+var_3E], 0
226B8: jmp     short loc_226D8
226BA: mov     [bp+var_3C], 0
226BF: mov     [bp+var_3A], 0
226C4: mov     [bp+var_38], 0
226C9: mov     [bp+var_42], 0
226CE: mov     [bp+var_40], 0
226D3: mov     [bp+var_3E], 0
226D8: mov     ax, word_27C10
226DB: mov     bx, word_27C12
226DF: mov     dx, word_27C14
226E3: mov     cx, 83h
226E6: xor     si, si
226E8: mov     di, 2000h
226EB: call    @__Cmp$q4Realt1; Compare two reals
226F0: jnz     short loc_22710
226F2: mov     [bp+var_3C], 0
226F7: mov     [bp+var_3A], 0
226FC: mov     [bp+var_38], 0
22701: mov     [bp+var_42], 81h
22706: mov     [bp+var_40], 0
2270B: mov     [bp+var_3E], 0
22710: mov     ax, [bp+var_42]
22713: mov     bx, [bp+var_40]
22716: mov     dx, [bp+var_3E]
22719: mov     cx, [bp+var_2A]
2271C: mov     si, [bp+var_28]
2271F: mov     di, [bp+var_26]
22722: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22727: push    dx
22728: push    bx
22729: push    ax
2272A: mov     ax, [bp+var_3C]
2272D: mov     bx, [bp+var_3A]
22730: mov     dx, [bp+var_38]
22733: mov     cx, [bp+var_24]
22736: mov     si, [bp+var_22]
22739: mov     di, [bp+var_20]
2273C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22741: push    dx
22742: push    bx
22743: push    ax
22744: mov     ax, word_27CA0
22747: mov     bx, word_27CA2
2274B: mov     dx, word_27CA4
2274F: mov     cx, word_27C4C
22753: mov     si, word_27C4E
22757: mov     di, word_27C50
2275B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22760: mov     cx, word_27C4C
22764: mov     si, word_27C4E
22768: mov     di, word_27C50
2276C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22771: mov     cx, word_27C4C
22775: mov     si, word_27C4E
22779: mov     di, word_27C50
2277D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22782: push    dx
22783: push    bx
22784: push    ax
22785: mov     ax, word_27C9A
22788: mov     bx, word_27C9C
2278C: mov     dx, word_27C9E
22790: mov     cx, word_27C4C
22794: mov     si, word_27C4E
22798: mov     di, word_27C50
2279C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
227A1: mov     cx, word_27C4C
227A5: mov     si, word_27C4E
227A9: mov     di, word_27C50
227AD: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
227B2: push    dx
227B3: push    bx
227B4: push    ax
227B5: mov     ax, word_27C94
227B8: mov     bx, word_27C96
227BC: mov     dx, word_27C98
227C0: mov     cx, word_27C4C
227C4: mov     si, word_27C4E
227C8: mov     di, word_27C50
227CC: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
227D1: mov     cx, word_27C8E
227D5: mov     si, word_27C90
227D9: mov     di, word_27C92
227DD: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
227E2: pop     cx
227E3: pop     si
227E4: pop     di
227E5: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
227EA: pop     cx
227EB: pop     si
227EC: pop     di
227ED: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
227F2: pop     cx
227F3: pop     si
227F4: pop     di
227F5: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
227FA: pop     cx
227FB: pop     si
227FC: pop     di
227FD: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22802: mov     [bp+var_90], ax
22806: mov     [bp+var_8E], bx
2280A: mov     [bp+var_8C], dx
2280E: mov     ax, word_27C10
22811: mov     bx, word_27C12
22815: mov     dx, word_27C14
22819: mov     cx, 84h
2281C: xor     si, si
2281E: xor     di, di
22820: call    @__Cmp$q4Realt1; Compare two reals
22825: jnz     short loc_22878
22827: mov     ax, word_27BE0
2282A: mov     bx, word_27BE2
2282E: mov     dx, word_27BE4
22832: mov     cx, 96h
22835: mov     si, 4200h
22838: mov     di, 14C1h
2283B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22840: mov     cx, 89h
22843: xor     si, si
22845: mov     di, 3400h
22848: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2284D: mov     cx, 3B91h
22850: mov     si, 0A7DFh
22853: mov     di, 30B1h
22856: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2285B: mov     cx, [bp+var_90]
2285F: mov     si, [bp+var_8E]
22863: mov     di, [bp+var_8C]
22867: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2286C: mov     [bp+var_90], ax
22870: mov     [bp+var_8E], bx
22874: mov     [bp+var_8C], dx
22878: mov     ax, [bp+var_90]
2287C: mov     bx, [bp+var_8E]
22880: mov     dx, [bp+var_8C]
22884: mov     cx, 89h
22887: xor     si, si
22889: mov     di, 3400h
2288C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22891: call    @Int$q4Real; Int(x: Real): Real
22896: push    dx
22897: push    bx
22898: push    ax
22899: mov     ax, [bp+var_90]
2289D: mov     bx, [bp+var_8E]
228A1: mov     dx, [bp+var_8C]
228A5: mov     cx, 89h
228A8: xor     si, si
228AA: mov     di, 3400h
228AD: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
228B2: pop     cx
228B3: pop     si
228B4: pop     di
228B5: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
228BA: mov     cx, 89h
228BD: xor     si, si
228BF: mov     di, 3400h
228C2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
228C7: mov     [bp+var_90], ax
228CB: mov     [bp+var_8E], bx
228CF: mov     [bp+var_8C], dx
228D3: mov     ax, word_27CD0
228D6: mov     bx, word_27CD2
228DA: mov     dx, word_27CD4
228DE: mov     cx, word_27C4C
228E2: mov     si, word_27C4E
228E6: mov     di, word_27C50
228EA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
228EF: mov     cx, word_27C4C
228F3: mov     si, word_27C4E
228F7: mov     di, word_27C50
228FB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22900: mov     cx, word_27C4C
22904: mov     si, word_27C4E
22908: mov     di, word_27C50
2290C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22911: push    dx
22912: push    bx
22913: push    ax
22914: mov     ax, word_27CCA
22917: mov     bx, word_27CCC
2291B: mov     dx, word_27CCE
2291F: mov     cx, word_27C4C
22923: mov     si, word_27C4E
22927: mov     di, word_27C50
2292B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22930: mov     cx, word_27C4C
22934: mov     si, word_27C4E
22938: mov     di, word_27C50
2293C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22941: push    dx
22942: push    bx
22943: push    ax
22944: mov     ax, word_27CC4
22947: mov     bx, word_27CC6
2294B: mov     dx, word_27CC8
2294F: mov     cx, word_27C4C
22953: mov     si, word_27C4E
22957: mov     di, word_27C50
2295B: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22960: mov     cx, word_27CBE
22964: mov     si, word_27CC0
22968: mov     di, word_27CC2
2296C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22971: pop     cx
22972: pop     si
22973: pop     di
22974: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22979: pop     cx
2297A: pop     si
2297B: pop     di
2297C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22981: mov     [bp+var_96], ax
22985: mov     [bp+var_94], bx
22989: mov     [bp+var_92], dx
2298D: mov     ax, word_27CE8
22990: mov     bx, word_27CEA
22994: mov     dx, word_27CEC
22998: mov     cx, word_27C4C
2299C: mov     si, word_27C4E
229A0: mov     di, word_27C50
229A4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
229A9: mov     cx, word_27C4C
229AD: mov     si, word_27C4E
229B1: mov     di, word_27C50
229B5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
229BA: mov     cx, word_27C4C
229BE: mov     si, word_27C4E
229C2: mov     di, word_27C50
229C6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
229CB: push    dx
229CC: push    bx
229CD: push    ax
229CE: mov     ax, word_27CE2
229D1: mov     bx, word_27CE4
229D5: mov     dx, word_27CE6
229D9: mov     cx, word_27C4C
229DD: mov     si, word_27C4E
229E1: mov     di, word_27C50
229E5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
229EA: mov     cx, word_27C4C
229EE: mov     si, word_27C4E
229F2: mov     di, word_27C50
229F6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
229FB: push    dx
229FC: push    bx
229FD: push    ax
229FE: mov     ax, word_27CDC
22A01: mov     bx, word_27CDE
22A05: mov     dx, word_27CE0
22A09: mov     cx, word_27C4C
22A0D: mov     si, word_27C4E
22A11: mov     di, word_27C50
22A15: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22A1A: mov     cx, word_27CD6
22A1E: mov     si, word_27CD8
22A22: mov     di, word_27CDA
22A26: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22A2B: pop     cx
22A2C: pop     si
22A2D: pop     di
22A2E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22A33: pop     cx
22A34: pop     si
22A35: pop     di
22A36: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22A3B: mov     [bp+var_9C], ax
22A3F: mov     [bp+var_9A], bx
22A43: mov     [bp+var_98], dx
22A47: mov     ax, word_27D00
22A4A: mov     bx, word_27D02
22A4E: mov     dx, word_27D04
22A52: mov     cx, word_27C4C
22A56: mov     si, word_27C4E
22A5A: mov     di, word_27C50
22A5E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22A63: mov     cx, word_27C4C
22A67: mov     si, word_27C4E
22A6B: mov     di, word_27C50
22A6F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22A74: mov     cx, word_27C4C
22A78: mov     si, word_27C4E
22A7C: mov     di, word_27C50
22A80: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22A85: push    dx
22A86: push    bx
22A87: push    ax
22A88: mov     ax, [bp+var_42]
22A8B: mov     bx, [bp+var_40]
22A8E: mov     dx, [bp+var_3E]
22A91: mov     cx, [bp+var_36]
22A94: mov     si, [bp+var_34]
22A97: mov     di, [bp+var_32]
22A9A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22A9F: push    dx
22AA0: push    bx
22AA1: push    ax
22AA2: mov     ax, [bp+var_3C]
22AA5: mov     bx, [bp+var_3A]
22AA8: mov     dx, [bp+var_38]
22AAB: mov     cx, [bp+var_30]
22AAE: mov     si, [bp+var_2E]
22AB1: mov     di, [bp+var_2C]
22AB4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22AB9: push    dx
22ABA: push    bx
22ABB: push    ax
22ABC: mov     ax, word_27CFA
22ABF: mov     bx, word_27CFC
22AC3: mov     dx, word_27CFE
22AC7: mov     cx, word_27C4C
22ACB: mov     si, word_27C4E
22ACF: mov     di, word_27C50
22AD3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22AD8: mov     cx, word_27C4C
22ADC: mov     si, word_27C4E
22AE0: mov     di, word_27C50
22AE4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22AE9: push    dx
22AEA: push    bx
22AEB: push    ax
22AEC: mov     ax, word_27CF4
22AEF: mov     bx, word_27CF6
22AF3: mov     dx, word_27CF8
22AF7: mov     cx, word_27C4C
22AFB: mov     si, word_27C4E
22AFF: mov     di, word_27C50
22B03: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22B08: mov     cx, word_27CEE
22B0C: mov     si, word_27CF0
22B10: mov     di, word_27CF2
22B14: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22B19: pop     cx
22B1A: pop     si
22B1B: pop     di
22B1C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22B21: pop     cx
22B22: pop     si
22B23: pop     di
22B24: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22B29: pop     cx
22B2A: pop     si
22B2B: pop     di
22B2C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22B31: pop     cx
22B32: pop     si
22B33: pop     di
22B34: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22B39: mov     [bp+var_A2], ax
22B3D: mov     [bp+var_A0], bx
22B41: mov     [bp+var_9E], dx
22B45: mov     ax, [bp+var_A2]
22B49: mov     bx, [bp+var_A0]
22B4D: mov     dx, [bp+var_9E]
22B51: mov     cx, 89h
22B54: xor     si, si
22B56: mov     di, 3400h
22B59: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22B5E: call    @Int$q4Real; Int(x: Real): Real
22B63: push    dx
22B64: push    bx
22B65: push    ax
22B66: mov     ax, [bp+var_A2]
22B6A: mov     bx, [bp+var_A0]
22B6E: mov     dx, [bp+var_9E]
22B72: mov     cx, 89h
22B75: xor     si, si
22B77: mov     di, 3400h
22B7A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22B7F: pop     cx
22B80: pop     si
22B81: pop     di
22B82: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22B87: mov     cx, 89h
22B8A: xor     si, si
22B8C: mov     di, 3400h
22B8F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22B94: mov     [bp+var_A2], ax
22B98: mov     [bp+var_A0], bx
22B9C: mov     [bp+var_9E], dx
22BA0: mov     ax, word_27C10
22BA3: mov     bx, word_27C12
22BA7: mov     dx, word_27C14
22BAB: mov     cx, 83h
22BAE: xor     si, si
22BB0: mov     di, 4000h
22BB3: call    @__Cmp$q4Realt1; Compare two reals
22BB8: jnz     short loc_22C16
22BBA: mov     ax, 8B80h
22BBD: mov     bx, 1854h
22BC0: mov     dx, 7C5Bh
22BC3: mov     cx, word_27C4C
22BC7: mov     si, word_27C4E
22BCB: mov     di, word_27C50
22BCF: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22BD4: push    dx
22BD5: push    bx
22BD6: push    ax
22BD7: mov     ax, [bp+var_90]
22BDB: mov     bx, [bp+var_8E]
22BDF: mov     dx, [bp+var_8C]
22BE3: mov     cx, [bp+var_9C]
22BE7: mov     si, [bp+var_9A]
22BEB: mov     di, [bp+var_98]
22BEF: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22BF4: mov     cx, 0CC87h
22BF7: mov     si, 0A643h
22BFA: mov     di, 4424h
22BFD: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22C02: pop     cx
22C03: pop     si
22C04: pop     di
22C05: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22C0A: mov     [bp+var_A2], ax
22C0E: mov     [bp+var_A0], bx
22C12: mov     [bp+var_9E], dx
22C16: mov     ax, word_27C10
22C19: mov     bx, word_27C12
22C1D: mov     dx, word_27C14
22C21: mov     cx, 83h
22C24: xor     si, si
22C26: mov     di, 6000h
22C29: call    @__Cmp$q4Realt1; Compare two reals
22C2E: jnz     short loc_22C8C
22C30: mov     ax, 947Fh
22C33: mov     bx, 351Ah
22C36: mov     dx, 26BAh
22C39: mov     cx, word_27C4C
22C3D: mov     si, word_27C4E
22C41: mov     di, word_27C50
22C45: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22C4A: push    dx
22C4B: push    bx
22C4C: push    ax
22C4D: mov     ax, [bp+var_90]
22C51: mov     bx, [bp+var_8E]
22C55: mov     dx, [bp+var_8C]
22C59: mov     cx, [bp+var_9C]
22C5D: mov     si, [bp+var_9A]
22C61: mov     di, [bp+var_98]
22C65: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22C6A: mov     cx, 4189h
22C6D: mov     si, 0E282h
22C70: mov     di, 0A05h
22C73: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22C78: pop     cx
22C79: pop     si
22C7A: pop     di
22C7B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22C80: mov     [bp+var_A2], ax
22C84: mov     [bp+var_A0], bx
22C88: mov     [bp+var_9E], dx
22C8C: mov     ax, word_27C10
22C8F: mov     bx, word_27C12
22C93: mov     dx, word_27C14
22C97: mov     cx, 84h
22C9A: xor     si, si
22C9C: xor     di, di
22C9E: call    @__Cmp$q4Realt1; Compare two reals
22CA3: jnz     short loc_22CCB
22CA5: mov     ax, [bp+var_90]
22CA9: mov     bx, [bp+var_8E]
22CAD: mov     dx, [bp+var_8C]
22CB1: mov     cx, 1888h
22CB4: mov     si, 57Dh
22CB7: mov     di, 6029h
22CBA: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22CBF: mov     [bp+var_A2], ax
22CC3: mov     [bp+var_A0], bx
22CC7: mov     [bp+var_9E], dx
22CCB: mov     ax, [bp+var_A2]
22CCF: mov     bx, [bp+var_A0]
22CD3: mov     dx, [bp+var_9E]
22CD7: xor     cx, cx
22CD9: xor     si, si
22CDB: xor     di, di
22CDD: call    @__Cmp$q4Realt1; Compare two reals
22CE2: jnb     short loc_22D09
22CE4: mov     ax, [bp+var_A2]
22CE8: mov     bx, [bp+var_A0]
22CEC: mov     dx, [bp+var_9E]
22CF0: mov     cx, 89h
22CF3: xor     si, si
22CF5: mov     di, 3400h
22CF8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22CFD: mov     [bp+var_A2], ax
22D01: mov     [bp+var_A0], bx
22D05: mov     [bp+var_9E], dx
22D09: mov     ax, [bp+var_A2]
22D0D: mov     bx, [bp+var_A0]
22D11: mov     dx, [bp+var_9E]
22D15: mov     [bp+var_48], ax
22D18: mov     [bp+var_46], bx
22D1B: mov     [bp+var_44], dx
22D1E: mov     ax, [bp+var_48]
22D21: mov     bx, [bp+var_46]
22D24: mov     dx, [bp+var_44]
22D27: mov     cx, word_27C52
22D2B: mov     si, word_27C54
22D2F: mov     di, word_27C56
22D33: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22D38: call    @Cos$q4Real; Cos(x: Real): Real
22D3D: mov     cx, [bp+var_4E]
22D40: mov     si, [bp+var_4C]
22D43: mov     di, [bp+var_4A]
22D46: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22D4B: mov     cx, word_27C52
22D4F: mov     si, word_27C54
22D53: mov     di, word_27C56
22D57: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22D5C: mov     cx, [bp+var_A2]
22D60: mov     si, [bp+var_A0]
22D64: mov     di, [bp+var_9E]
22D68: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22D6D: mov     [bp+var_48], ax
22D70: mov     [bp+var_46], bx
22D73: mov     [bp+var_44], dx
22D76: mov     ax, [bp+var_48]
22D79: mov     bx, [bp+var_46]
22D7C: mov     dx, [bp+var_44]
22D7F: mov     cx, word_27C52
22D83: mov     si, word_27C54
22D87: mov     di, word_27C56
22D8B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22D90: call    @Cos$q4Real; Cos(x: Real): Real
22D95: mov     cx, [bp+var_4E]
22D98: mov     si, [bp+var_4C]
22D9B: mov     di, [bp+var_4A]
22D9E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22DA3: mov     cx, word_27C52
22DA7: mov     si, word_27C54
22DAB: mov     di, word_27C56
22DAF: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22DB4: mov     cx, [bp+var_A2]
22DB8: mov     si, [bp+var_A0]
22DBC: mov     di, [bp+var_9E]
22DC0: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22DC5: mov     [bp+var_48], ax
22DC8: mov     [bp+var_46], bx
22DCB: mov     [bp+var_44], dx
22DCE: mov     ax, [bp+var_48]
22DD1: mov     bx, [bp+var_46]
22DD4: mov     dx, [bp+var_44]
22DD7: mov     cx, word_27C52
22DDB: mov     si, word_27C54
22DDF: mov     di, word_27C56
22DE3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22DE8: call    @Cos$q4Real; Cos(x: Real): Real
22DED: mov     cx, [bp+var_4E]
22DF0: mov     si, [bp+var_4C]
22DF3: mov     di, [bp+var_4A]
22DF6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22DFB: mov     cx, word_27C52
22DFF: mov     si, word_27C54
22E03: mov     di, word_27C56
22E07: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22E0C: mov     cx, [bp+var_A2]
22E10: mov     si, [bp+var_A0]
22E14: mov     di, [bp+var_9E]
22E18: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22E1D: mov     [bp+var_48], ax
22E20: mov     [bp+var_46], bx
22E23: mov     [bp+var_44], dx
22E26: mov     ax, [bp+var_48]
22E29: mov     bx, [bp+var_46]
22E2C: mov     dx, [bp+var_44]
22E2F: mov     cx, word_27C52
22E33: mov     si, word_27C54
22E37: mov     di, word_27C56
22E3B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22E40: call    @Cos$q4Real; Cos(x: Real): Real
22E45: mov     cx, [bp+var_4E]
22E48: mov     si, [bp+var_4C]
22E4B: mov     di, [bp+var_4A]
22E4E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22E53: mov     cx, word_27C52
22E57: mov     si, word_27C54
22E5B: mov     di, word_27C56
22E5F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22E64: mov     cx, [bp+var_A2]
22E68: mov     si, [bp+var_A0]
22E6C: mov     di, [bp+var_9E]
22E70: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22E75: mov     [bp+var_48], ax
22E78: mov     [bp+var_46], bx
22E7B: mov     [bp+var_44], dx
22E7E: mov     ax, [bp+var_48]
22E81: mov     bx, [bp+var_46]
22E84: mov     dx, [bp+var_44]
22E87: mov     cx, word_27C52
22E8B: mov     si, word_27C54
22E8F: mov     di, word_27C56
22E93: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22E98: call    @Cos$q4Real; Cos(x: Real): Real
22E9D: mov     cx, [bp+var_4E]
22EA0: mov     si, [bp+var_4C]
22EA3: mov     di, [bp+var_4A]
22EA6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22EAB: mov     cx, word_27C52
22EAF: mov     si, word_27C54
22EB3: mov     di, word_27C56
22EB7: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22EBC: mov     cx, [bp+var_A2]
22EC0: mov     si, [bp+var_A0]
22EC4: mov     di, [bp+var_9E]
22EC8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22ECD: mov     [bp+var_48], ax
22ED0: mov     [bp+var_46], bx
22ED3: mov     [bp+var_44], dx
22ED6: mov     ax, [bp+var_48]
22ED9: mov     bx, [bp+var_46]
22EDC: mov     dx, [bp+var_44]
22EDF: mov     cx, word_27C52
22EE3: mov     si, word_27C54
22EE7: mov     di, word_27C56
22EEB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22EF0: call    @Cos$q4Real; Cos(x: Real): Real
22EF5: mov     cx, [bp+var_4E]
22EF8: mov     si, [bp+var_4C]
22EFB: mov     di, [bp+var_4A]
22EFE: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22F03: mov     cx, word_27C52
22F07: mov     si, word_27C54
22F0B: mov     di, word_27C56
22F0F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22F14: mov     cx, [bp+var_A2]
22F18: mov     si, [bp+var_A0]
22F1C: mov     di, [bp+var_9E]
22F20: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22F25: mov     [bp+var_48], ax
22F28: mov     [bp+var_46], bx
22F2B: mov     [bp+var_44], dx
22F2E: mov     ax, 81h
22F31: xor     bx, bx
22F33: xor     dx, dx
22F35: mov     cx, [bp+var_4E]
22F38: mov     si, [bp+var_4C]
22F3B: mov     di, [bp+var_4A]
22F3E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
22F43: push    dx
22F44: push    bx
22F45: push    ax
22F46: mov     ax, 81h
22F49: xor     bx, bx
22F4B: xor     dx, dx
22F4D: mov     cx, [bp+var_4E]
22F50: mov     si, [bp+var_4C]
22F53: mov     di, [bp+var_4A]
22F56: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
22F5B: pop     cx
22F5C: pop     si
22F5D: pop     di
22F5E: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22F63: mov     [bp+var_84], ax
22F67: mov     [bp+var_82], bx
22F6B: mov     [bp+var_80], dx
22F6E: mov     ax, [bp+var_48]
22F71: mov     bx, [bp+var_46]
22F74: mov     dx, [bp+var_44]
22F77: mov     cx, word_27C52
22F7B: mov     si, word_27C54
22F7F: mov     di, word_27C56
22F83: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22F88: mov     cx, 82h
22F8B: xor     si, si
22F8D: xor     di, di
22F8F: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22F94: call    far ptr @Sin$q4Real; Sin(x: Real): Real
22F99: push    dx
22F9A: push    bx
22F9B: push    ax
22F9C: mov     ax, [bp+var_48]
22F9F: mov     bx, [bp+var_46]
22FA2: mov     dx, [bp+var_44]
22FA5: mov     cx, word_27C52
22FA9: mov     si, word_27C54
22FAD: mov     di, word_27C56
22FB1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22FB6: mov     cx, 82h
22FB9: xor     si, si
22FBB: xor     di, di
22FBD: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22FC2: call    @Cos$q4Real; Cos(x: Real): Real
22FC7: pop     cx
22FC8: pop     si
22FC9: pop     di
22FCA: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
22FCF: push    dx
22FD0: push    bx
22FD1: push    ax
22FD2: mov     ax, [bp+var_84]
22FD6: mov     bx, [bp+var_82]
22FDA: mov     dx, [bp+var_80]
22FDD: call    @Sqrt$q4Real; Sqrt(x: Real): Real
22FE2: pop     cx
22FE3: pop     si
22FE4: pop     di
22FE5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
22FEA: mov     [bp+var_84], ax
22FEE: mov     [bp+var_82], bx
22FF2: mov     [bp+var_80], dx
22FF5: mov     ax, [bp+var_84]
22FF9: mov     bx, [bp+var_82]
22FFD: mov     dx, [bp+var_80]
23000: call    @ArcTan$q4Real; ArcTan(x: Real): Real
23005: mov     cx, 82h
23008: xor     si, si
2300A: xor     di, di
2300C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23011: mov     cx, word_27C52
23015: mov     si, word_27C54
23019: mov     di, word_27C56
2301D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23022: mov     [bp+var_54], ax
23025: mov     [bp+var_52], bx
23028: mov     [bp+var_50], dx
2302B: mov     ax, [bp+var_54]
2302E: mov     bx, [bp+var_52]
23031: mov     dx, [bp+var_50]
23034: xor     cx, cx
23036: xor     si, si
23038: xor     di, di
2303A: call    @__Cmp$q4Realt1; Compare two reals
2303F: jnb     short loc_23060
23041: mov     ax, [bp+var_54]
23044: mov     bx, [bp+var_52]
23047: mov     dx, [bp+var_50]
2304A: mov     cx, 89h
2304D: xor     si, si
2304F: mov     di, 3400h
23052: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
23057: mov     [bp+var_54], ax
2305A: mov     [bp+var_52], bx
2305D: mov     [bp+var_50], dx
23060: mov     ax, [bp+var_54]
23063: mov     bx, [bp+var_52]
23066: mov     dx, [bp+var_50]
23069: mov     cx, 89h
2306C: xor     si, si
2306E: mov     di, 3400h
23071: call    @__Cmp$q4Realt1; Compare two reals
23076: jbe     short loc_23097
23078: mov     ax, [bp+var_54]
2307B: mov     bx, [bp+var_52]
2307E: mov     dx, [bp+var_50]
23081: mov     cx, 89h
23084: xor     si, si
23086: mov     di, 3400h
23089: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2308E: mov     [bp+var_54], ax
23091: mov     [bp+var_52], bx
23094: mov     [bp+var_50], dx
23097: mov     ax, [bp+var_48]
2309A: mov     bx, [bp+var_46]
2309D: mov     dx, [bp+var_44]
230A0: mov     cx, word_27C52
230A4: mov     si, word_27C54
230A8: mov     di, word_27C56
230AC: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
230B1: call    far ptr @Sin$q4Real; Sin(x: Real): Real
230B6: mov     cx, [bp+var_4E]
230B9: mov     si, [bp+var_4C]
230BC: mov     di, [bp+var_4A]
230BF: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
230C4: push    dx
230C5: push    bx
230C6: push    ax
230C7: mov     ax, 81h
230CA: xor     bx, bx
230CC: xor     dx, dx
230CE: pop     cx
230CF: pop     si
230D0: pop     di
230D1: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
230D6: mov     cx, word_27D06
230DA: mov     si, word_27D08
230DE: mov     di, word_27D0A
230E2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
230E7: mov     [bp+var_5A], ax
230EA: mov     [bp+var_58], bx
230ED: mov     [bp+var_56], dx
230F0: mov     ax, [bp+var_90]
230F4: mov     bx, [bp+var_8E]
230F8: mov     dx, [bp+var_8C]
230FC: mov     cx, [bp+var_54]
230FF: mov     si, [bp+var_52]
23102: mov     di, [bp+var_50]
23105: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
2310A: mov     cx, [bp+var_A2]
2310E: mov     si, [bp+var_A0]
23112: mov     di, [bp+var_9E]
23116: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2311B: mov     cx, [bp+var_9C]
2311F: mov     si, [bp+var_9A]
23123: mov     di, [bp+var_98]
23127: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2312C: mov     [bp+var_60], ax
2312F: mov     [bp+var_5E], bx
23132: mov     [bp+var_5C], dx
23135: mov     ax, [bp+var_60]
23138: mov     bx, [bp+var_5E]
2313B: mov     dx, [bp+var_5C]
2313E: mov     cx, word_27C52
23142: mov     si, word_27C54
23146: mov     di, word_27C56
2314A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2314F: call    far ptr @Sin$q4Real; Sin(x: Real): Real
23154: push    dx
23155: push    bx
23156: push    ax
23157: mov     ax, [bp+var_60]
2315A: mov     bx, [bp+var_5E]
2315D: mov     dx, [bp+var_5C]
23160: mov     cx, word_27C52
23164: mov     si, word_27C54
23168: mov     di, word_27C56
2316C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23171: call    @Cos$q4Real; Cos(x: Real): Real
23176: push    dx
23177: push    bx
23178: push    ax
23179: mov     ax, [bp+var_96]
2317D: mov     bx, [bp+var_94]
23181: mov     dx, [bp+var_92]
23185: mov     cx, word_27C52
23189: mov     si, word_27C54
2318D: mov     di, word_27C56
23191: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23196: call    far ptr @Sin$q4Real; Sin(x: Real): Real
2319B: pop     cx
2319C: pop     si
2319D: pop     di
2319E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
231A3: pop     cx
231A4: pop     si
231A5: pop     di
231A6: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
231AB: mov     [bp+var_66], ax
231AE: mov     [bp+var_64], bx
231B1: mov     [bp+var_62], dx
231B4: mov     ax, [bp+var_60]
231B7: mov     bx, [bp+var_5E]
231BA: mov     dx, [bp+var_5C]
231BD: mov     cx, word_27C52
231C1: mov     si, word_27C54
231C5: mov     di, word_27C56
231C9: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
231CE: call    @Cos$q4Real; Cos(x: Real): Real
231D3: push    dx
231D4: push    bx
231D5: push    ax
231D6: mov     ax, [bp+var_96]
231DA: mov     bx, [bp+var_94]
231DE: mov     dx, [bp+var_92]
231E2: mov     cx, word_27C52
231E6: mov     si, word_27C54
231EA: mov     di, word_27C56
231EE: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
231F3: call    far ptr @Sin$q4Real; Sin(x: Real): Real
231F8: pop     cx
231F9: pop     si
231FA: pop     di
231FB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23200: mov     word_27D12, ax
23203: mov     word_27D14, bx
23207: mov     word_27D16, dx
2320B: mov     ax, [bp+var_66]
2320E: mov     bx, [bp+var_64]
23211: mov     dx, [bp+var_62]
23214: call    @ArcTan$q4Real; ArcTan(x: Real): Real
23219: mov     cx, word_27C52
2321D: mov     si, word_27C54
23221: mov     di, word_27C56
23225: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2322A: mov     [bp+var_8A], ax
2322E: mov     [bp+var_88], bx
23232: mov     [bp+var_86], dx
23236: mov     ax, word_27D12
23239: mov     bx, word_27D14
2323D: mov     dx, word_27D16
23241: xor     cx, cx
23243: xor     si, si
23245: xor     di, di
23247: call    @__Cmp$q4Realt1; Compare two reals
2324C: ja      short loc_23252
2324E: mov     al, 0
23250: jmp     short loc_23254
23252: mov     al, 1
23254: push    ax
23255: mov     ax, [bp+var_66]
23258: mov     bx, [bp+var_64]
2325B: mov     dx, [bp+var_62]
2325E: xor     cx, cx
23260: xor     si, si
23262: xor     di, di
23264: call    @__Cmp$q4Realt1; Compare two reals
23269: ja      short loc_2326F
2326B: mov     al, 0
2326D: jmp     short loc_23271
2326F: mov     al, 1
23271: pop     dx
23272: and     al, dl
23274: or      al, al
23276: jz      short loc_23290
23278: mov     ax, [bp+var_8A]
2327C: mov     bx, [bp+var_88]
23280: mov     dx, [bp+var_86]
23284: mov     [bp+var_8A], ax
23288: mov     [bp+var_88], bx
2328C: mov     [bp+var_86], dx
23290: mov     ax, word_27D12
23293: mov     bx, word_27D14
23297: mov     dx, word_27D16
2329B: xor     cx, cx
2329D: xor     si, si
2329F: xor     di, di
232A1: call    @__Cmp$q4Realt1; Compare two reals
232A6: jb      short loc_232AC
232A8: mov     al, 0
232AA: jmp     short loc_232AE
232AC: mov     al, 1
232AE: push    ax
232AF: mov     ax, [bp+var_66]
232B2: mov     bx, [bp+var_64]
232B5: mov     dx, [bp+var_62]
232B8: xor     cx, cx
232BA: xor     si, si
232BC: xor     di, di
232BE: call    @__Cmp$q4Realt1; Compare two reals
232C3: ja      short loc_232C9
232C5: mov     al, 0
232C7: jmp     short loc_232CB
232C9: mov     al, 1
232CB: pop     dx
232CC: and     al, dl
232CE: or      al, al
232D0: jz      short loc_232F7
232D2: mov     ax, [bp+var_8A]
232D6: mov     bx, [bp+var_88]
232DA: mov     dx, [bp+var_86]
232DE: mov     cx, 88h
232E1: xor     si, si
232E3: mov     di, 3400h
232E6: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
232EB: mov     [bp+var_8A], ax
232EF: mov     [bp+var_88], bx
232F3: mov     [bp+var_86], dx
232F7: mov     ax, word_27D12
232FA: mov     bx, word_27D14
232FE: mov     dx, word_27D16
23302: xor     cx, cx
23304: xor     si, si
23306: xor     di, di
23308: call    @__Cmp$q4Realt1; Compare two reals
2330D: ja      short loc_23313
2330F: mov     al, 0
23311: jmp     short loc_23315
23313: mov     al, 1
23315: push    ax
23316: mov     ax, [bp+var_66]
23319: mov     bx, [bp+var_64]
2331C: mov     dx, [bp+var_62]
2331F: xor     cx, cx
23321: xor     si, si
23323: xor     di, di
23325: call    @__Cmp$q4Realt1; Compare two reals
2332A: jb      short loc_23330
2332C: mov     al, 0
2332E: jmp     short loc_23332
23330: mov     al, 1
23332: pop     dx
23333: and     al, dl
23335: or      al, al
23337: jz      short loc_2335E
23339: mov     ax, [bp+var_8A]
2333D: mov     bx, [bp+var_88]
23341: mov     dx, [bp+var_86]
23345: mov     cx, 88h
23348: xor     si, si
2334A: mov     di, 3400h
2334D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
23352: mov     [bp+var_8A], ax
23356: mov     [bp+var_88], bx
2335A: mov     [bp+var_86], dx
2335E: mov     ax, word_27D12
23361: mov     bx, word_27D14
23365: mov     dx, word_27D16
23369: xor     cx, cx
2336B: xor     si, si
2336D: xor     di, di
2336F: call    @__Cmp$q4Realt1; Compare two reals
23374: jb      short loc_2337A
23376: mov     al, 0
23378: jmp     short loc_2337C
2337A: mov     al, 1
2337C: push    ax
2337D: mov     ax, [bp+var_66]
23380: mov     bx, [bp+var_64]
23383: mov     dx, [bp+var_62]
23386: xor     cx, cx
23388: xor     si, si
2338A: xor     di, di
2338C: call    @__Cmp$q4Realt1; Compare two reals
23391: jb      short loc_23397
23393: mov     al, 0
23395: jmp     short loc_23399
23397: mov     al, 1
23399: pop     dx
2339A: and     al, dl
2339C: or      al, al
2339E: jz      short loc_233C5
233A0: mov     ax, [bp+var_8A]
233A4: mov     bx, [bp+var_88]
233A8: mov     dx, [bp+var_86]
233AC: mov     cx, 89h
233AF: xor     si, si
233B1: mov     di, 3400h
233B4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
233B9: mov     [bp+var_8A], ax
233BD: mov     [bp+var_88], bx
233C1: mov     [bp+var_86], dx
233C5: mov     ax, [bp+var_8A]
233C9: mov     bx, [bp+var_88]
233CD: mov     dx, [bp+var_86]
233D1: mov     cx, [bp+var_9C]
233D5: mov     si, [bp+var_9A]
233D9: mov     di, [bp+var_98]
233DD: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
233E2: mov     [bp+var_8A], ax
233E6: mov     [bp+var_88], bx
233EA: mov     [bp+var_86], dx
233EE: mov     ax, [bp+var_8A]
233F2: mov     bx, [bp+var_88]
233F6: mov     dx, [bp+var_86]
233FA: mov     cx, 89h
233FD: xor     si, si
233FF: mov     di, 3400h
23402: call    @__Cmp$q4Realt1; Compare two reals
23407: jbe     short loc_2342E
23409: mov     ax, [bp+var_8A]
2340D: mov     bx, [bp+var_88]
23411: mov     dx, [bp+var_86]
23415: mov     cx, 89h
23418: xor     si, si
2341A: mov     di, 3400h
2341D: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23422: mov     [bp+var_8A], ax
23426: mov     [bp+var_88], bx
2342A: mov     [bp+var_86], dx
2342E: mov     ax, [bp+var_96]
23432: mov     bx, [bp+var_94]
23436: mov     dx, [bp+var_92]
2343A: mov     cx, word_27C52
2343E: mov     si, word_27C54
23442: mov     di, word_27C56
23446: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2344B: call    @Cos$q4Real; Cos(x: Real): Real
23450: push    dx
23451: push    bx
23452: push    ax
23453: mov     ax, [bp+var_60]
23456: mov     bx, [bp+var_5E]
23459: mov     dx, [bp+var_5C]
2345C: mov     cx, word_27C52
23460: mov     si, word_27C54
23464: mov     di, word_27C56
23468: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2346D: call    @Cos$q4Real; Cos(x: Real): Real
23472: pop     cx
23473: pop     si
23474: pop     di
23475: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2347A: mov     [bp+var_72], ax
2347D: mov     [bp+var_70], bx
23480: mov     [bp+var_6E], dx
23483: mov     ax, [bp+var_72]
23486: mov     bx, [bp+var_70]
23489: mov     dx, [bp+var_6E]
2348C: mov     cx, [bp+var_72]
2348F: mov     si, [bp+var_70]
23492: mov     di, [bp+var_6E]
23495: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2349A: push    dx
2349B: push    bx
2349C: push    ax
2349D: mov     ax, 81h
234A0: xor     bx, bx
234A2: xor     dx, dx
234A4: pop     cx
234A5: pop     si
234A6: pop     di
234A7: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
234AC: call    @Sqrt$q4Real; Sqrt(x: Real): Real
234B1: push    dx
234B2: push    bx
234B3: push    ax
234B4: mov     ax, [bp+var_72]
234B7: mov     bx, [bp+var_70]
234BA: mov     dx, [bp+var_6E]
234BD: pop     cx
234BE: pop     si
234BF: pop     di
234C0: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
234C5: call    @ArcTan$q4Real; ArcTan(x: Real): Real
234CA: mov     [bp+var_6C], ax
234CD: mov     [bp+var_6A], bx
234D0: mov     [bp+var_68], dx
234D3: mov     ax, word_27C40
234D6: mov     bx, word_27C42
234DA: mov     dx, word_27C44
234DE: mov     cx, word_27C52
234E2: mov     si, word_27C54
234E6: mov     di, word_27C56
234EA: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
234EF: push    dx
234F0: push    bx
234F1: push    ax
234F2: mov     ax, [bp+var_8A]
234F6: mov     bx, [bp+var_88]
234FA: mov     dx, [bp+var_86]
234FE: mov     cx, word_27C52
23502: mov     si, word_27C54
23506: mov     di, word_27C56
2350A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
2350F: pop     cx
23510: pop     si
23511: pop     di
23512: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23517: call    @Cos$q4Real; Cos(x: Real): Real
2351C: push    dx
2351D: push    bx
2351E: push    ax
2351F: mov     ax, [bp+var_6C]
23522: mov     bx, [bp+var_6A]
23525: mov     dx, [bp+var_68]
23528: call    far ptr @Sin$q4Real; Sin(x: Real): Real
2352D: mov     cx, [bp+var_5A]
23530: mov     si, [bp+var_58]
23533: mov     di, [bp+var_56]
23536: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
2353B: pop     cx
2353C: pop     si
2353D: pop     di
2353E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23543: mov     [bp+var_78], ax
23546: mov     [bp+var_76], bx
23549: mov     [bp+var_74], dx
2354C: mov     ax, word_27C40
2354F: mov     bx, word_27C42
23553: mov     dx, word_27C44
23557: mov     cx, word_27C52
2355B: mov     si, word_27C54
2355F: mov     di, word_27C56
23563: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23568: push    dx
23569: push    bx
2356A: push    ax
2356B: mov     ax, [bp+var_8A]
2356F: mov     bx, [bp+var_88]
23573: mov     dx, [bp+var_86]
23577: mov     cx, word_27C52
2357B: mov     si, word_27C54
2357F: mov     di, word_27C56
23583: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23588: pop     cx
23589: pop     si
2358A: pop     di
2358B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23590: call    far ptr @Sin$q4Real; Sin(x: Real): Real
23595: push    dx
23596: push    bx
23597: push    ax
23598: mov     ax, [bp+var_6C]
2359B: mov     bx, [bp+var_6A]
2359E: mov     dx, [bp+var_68]
235A1: call    far ptr @Sin$q4Real; Sin(x: Real): Real
235A6: mov     cx, [bp+var_5A]
235A9: mov     si, [bp+var_58]
235AC: mov     di, [bp+var_56]
235AF: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
235B4: pop     cx
235B5: pop     si
235B6: pop     di
235B7: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
235BC: mov     cx, word_27C7C
235C0: mov     si, word_27C7E
235C4: mov     di, word_27C80
235C8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
235CD: mov     [bp+var_7E], ax
235D0: mov     [bp+var_7C], bx
235D3: mov     [bp+var_7A], dx
235D6: mov     ax, [bp+var_78]
235D9: mov     bx, [bp+var_76]
235DC: mov     dx, [bp+var_74]
235DF: mov     cx, [bp+var_7E]
235E2: mov     si, [bp+var_7C]
235E5: mov     di, [bp+var_7A]
235E8: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
235ED: call    @ArcTan$q4Real; ArcTan(x: Real): Real
235F2: mov     cx, word_27C52
235F6: mov     si, word_27C54
235FA: mov     di, word_27C56
235FE: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
23603: mov     word_27B92, ax
23606: mov     word_27B94, bx
2360A: mov     word_27B96, dx
2360E: mov     ax, [bp+var_78]
23611: mov     bx, [bp+var_76]
23614: mov     dx, [bp+var_74]
23617: xor     cx, cx
23619: xor     si, si
2361B: xor     di, di
2361D: call    @__Cmp$q4Realt1; Compare two reals
23622: ja      short loc_23628
23624: mov     al, 0
23626: jmp     short loc_2362A
23628: mov     al, 1
2362A: push    ax
2362B: mov     ax, [bp+var_78]
2362E: mov     bx, [bp+var_76]
23631: mov     dx, [bp+var_74]
23634: mov     cx, [bp+var_7E]
23637: mov     si, [bp+var_7C]
2363A: mov     di, [bp+var_7A]
2363D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23642: xor     cx, cx
23644: xor     si, si
23646: xor     di, di
23648: call    @__Cmp$q4Realt1; Compare two reals
2364D: ja      short loc_23653
2364F: mov     al, 0
23651: jmp     short loc_23655
23653: mov     al, 1
23655: pop     dx
23656: and     al, dl
23658: or      al, al
2365A: jz      short loc_23672
2365C: mov     ax, word_27B92
2365F: mov     bx, word_27B94
23663: mov     dx, word_27B96
23667: mov     word_27B92, ax
2366A: mov     word_27B94, bx
2366E: mov     word_27B96, dx
23672: mov     ax, [bp+var_78]
23675: mov     bx, [bp+var_76]
23678: mov     dx, [bp+var_74]
2367B: xor     cx, cx
2367D: xor     si, si
2367F: xor     di, di
23681: call    @__Cmp$q4Realt1; Compare two reals
23686: jb      short loc_2368C
23688: mov     al, 0
2368A: jmp     short loc_2368E
2368C: mov     al, 1
2368E: push    ax
2368F: mov     ax, [bp+var_78]
23692: mov     bx, [bp+var_76]
23695: mov     dx, [bp+var_74]
23698: mov     cx, [bp+var_7E]
2369B: mov     si, [bp+var_7C]
2369E: mov     di, [bp+var_7A]
236A1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
236A6: xor     cx, cx
236A8: xor     si, si
236AA: xor     di, di
236AC: call    @__Cmp$q4Realt1; Compare two reals
236B1: ja      short loc_236B7
236B3: mov     al, 0
236B5: jmp     short loc_236B9
236B7: mov     al, 1
236B9: pop     dx
236BA: and     al, dl
236BC: or      al, al
236BE: jz      short loc_236E3
236C0: mov     ax, word_27B92
236C3: mov     bx, word_27B94
236C7: mov     dx, word_27B96
236CB: mov     cx, 88h
236CE: xor     si, si
236D0: mov     di, 3400h
236D3: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
236D8: mov     word_27B92, ax
236DB: mov     word_27B94, bx
236DF: mov     word_27B96, dx
236E3: mov     ax, [bp+var_78]
236E6: mov     bx, [bp+var_76]
236E9: mov     dx, [bp+var_74]
236EC: xor     cx, cx
236EE: xor     si, si
236F0: xor     di, di
236F2: call    @__Cmp$q4Realt1; Compare two reals
236F7: ja      short loc_236FD
236F9: mov     al, 0
236FB: jmp     short loc_236FF
236FD: mov     al, 1
236FF: push    ax
23700: mov     ax, [bp+var_78]
23703: mov     bx, [bp+var_76]
23706: mov     dx, [bp+var_74]
23709: mov     cx, [bp+var_7E]
2370C: mov     si, [bp+var_7C]
2370F: mov     di, [bp+var_7A]
23712: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23717: xor     cx, cx
23719: xor     si, si
2371B: xor     di, di
2371D: call    @__Cmp$q4Realt1; Compare two reals
23722: jb      short loc_23728
23724: mov     al, 0
23726: jmp     short loc_2372A
23728: mov     al, 1
2372A: pop     dx
2372B: and     al, dl
2372D: or      al, al
2372F: jz      short loc_23754
23731: mov     ax, word_27B92
23734: mov     bx, word_27B94
23738: mov     dx, word_27B96
2373C: mov     cx, 88h
2373F: xor     si, si
23741: mov     di, 3400h
23744: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
23749: mov     word_27B92, ax
2374C: mov     word_27B94, bx
23750: mov     word_27B96, dx
23754: mov     ax, [bp+var_78]
23757: mov     bx, [bp+var_76]
2375A: mov     dx, [bp+var_74]
2375D: xor     cx, cx
2375F: xor     si, si
23761: xor     di, di
23763: call    @__Cmp$q4Realt1; Compare two reals
23768: jb      short loc_2376E
2376A: mov     al, 0
2376C: jmp     short loc_23770
2376E: mov     al, 1
23770: push    ax
23771: mov     ax, [bp+var_78]
23774: mov     bx, [bp+var_76]
23777: mov     dx, [bp+var_74]
2377A: mov     cx, [bp+var_7E]
2377D: mov     si, [bp+var_7C]
23780: mov     di, [bp+var_7A]
23783: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
23788: xor     cx, cx
2378A: xor     si, si
2378C: xor     di, di
2378E: call    @__Cmp$q4Realt1; Compare two reals
23793: jb      short loc_23799
23795: mov     al, 0
23797: jmp     short loc_2379B
23799: mov     al, 1
2379B: pop     dx
2379C: and     al, dl
2379E: or      al, al
237A0: jz      short loc_237C5
237A2: mov     ax, word_27B92
237A5: mov     bx, word_27B94
237A9: mov     dx, word_27B96
237AD: mov     cx, 89h
237B0: xor     si, si
237B2: mov     di, 3400h
237B5: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
237BA: mov     word_27B92, ax
237BD: mov     word_27B94, bx
237C1: mov     word_27B96, dx
237C5: mov     ax, word_27B92
237C8: mov     bx, word_27B94
237CC: mov     dx, word_27B96
237D0: mov     cx, word_27C40
237D4: mov     si, word_27C42
237D8: mov     di, word_27C44
237DC: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
237E1: mov     word_27B92, ax
237E4: mov     word_27B94, bx
237E8: mov     word_27B96, dx
237EC: mov     ax, word_27B92
237EF: mov     bx, word_27B94
237F3: mov     dx, word_27B96
237F7: mov     cx, 89h
237FA: xor     si, si
237FC: mov     di, 3400h
237FF: call    @__Cmp$q4Realt1; Compare two reals
23804: jbe     short loc_23829
23806: mov     ax, word_27B92
23809: mov     bx, word_27B94
2380D: mov     dx, word_27B96
23811: mov     cx, 89h
23814: xor     si, si
23816: mov     di, 3400h
23819: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
2381E: mov     word_27B92, ax
23821: mov     word_27B94, bx
23825: mov     word_27B96, dx
23829: mov     di, offset unk_27F18
2382C: push    ds
2382D: push    di
2382E: mov     di, offset aN_1; "N"
23831: push    cs
23832: push    di
23833: call    @$bsub$qm6Stringt1; Compare two strings
23838: jnz     short loc_23863
2383A: mov     ax, word_27B92
2383D: mov     bx, word_27B94
23841: mov     dx, word_27B96
23845: mov     cx, word_27C76
23849: mov     si, word_27C78
2384D: mov     di, word_27C7A
23851: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
23856: mov     word_27B92, ax
23859: mov     word_27B94, bx
2385D: mov     word_27B96, dx
23861: jmp     short loc_23879
23863: mov     ax, word_27B92
23866: mov     bx, word_27B94
2386A: mov     dx, word_27B96
2386E: mov     word_27B92, ax
23871: mov     word_27B94, bx
23875: mov     word_27B96, dx
23879: mov     ax, word_27B92
2387C: mov     bx, word_27B94
23880: mov     dx, word_27B96
23884: xor     cx, cx
23886: xor     si, si
23888: xor     di, di
2388A: call    @__Cmp$q4Realt1; Compare two reals
2388F: jnb     short loc_238B4
23891: mov     ax, word_27B92
23894: mov     bx, word_27B94
23898: mov     dx, word_27B96
2389C: mov     cx, 89h
2389F: xor     si, si
238A1: mov     di, 3400h
238A4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
238A9: mov     word_27B92, ax
238AC: mov     word_27B94, bx
238B0: mov     word_27B96, dx
238B4: mov     ax, word_27B92
238B7: mov     bx, word_27B94
238BB: mov     dx, word_27B96
238BF: mov     word_27B6E, ax
238C2: mov     word_27B70, bx
238C6: mov     word_27B72, dx
238CA: push    cs
238CB: call    near ptr sub_21EE1
238CE: mov     di, offset unk_2F60A
238D1: push    ds
238D2: push    di
238D3: mov     di, offset asc_220B0; "  "
238D6: push    cs
238D7: push    di
238D8: xor     ax, ax
238DA: push    ax
238DB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
238E0: call    @Write$qm4Text; Write(var f: Text)
238E5: call    @__IOCheck$qv; Exit if error
238EA: mov     sp, bp
238EC: pop     bp
238ED: retf
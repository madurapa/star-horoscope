/*
 * func-name: sub_1C620
 * func-address: 0x1c620
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x21576, 0x263fc, 0x26424, 0x265f6
 * fallback-reason: decompile returned None
 */

1C620: push    bp
1C621: mov     bp, sp
1C623: xor     ax, ax
1C625: call    @__StackCheck$q4Word; Stack overflow check (AX)
1C62A: call    sub_21576
1C62F: mov     word_27E06, 1
1C635: jmp     short loc_1C63B
1C637: inc     word_27E06
1C63B: mov     di, offset unk_2A318
1C63E: push    ds
1C63F: push    di
1C640: mov     ax, word_27E06
1C643: cwd
1C644: mov     di, 0
1C647: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C64C: mov     dx, 0Bh
1C64F: mul     dx
1C651: mov     di, ax
1C653: add     di, 758Fh
1C657: push    ds
1C658: push    di
1C659: call    @$bsub$qm6Stringt1; Compare two strings
1C65E: jnz     short loc_1C66F
1C660: mov     ax, word_27E06
1C663: cwd
1C664: mov     di, 8
1C667: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C66C: mov     word_27E24, ax
1C66F: mov     di, offset unk_2A518
1C672: push    ds
1C673: push    di
1C674: mov     ax, word_27E06
1C677: cwd
1C678: mov     di, 0
1C67B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C680: mov     dx, 0Bh
1C683: mul     dx
1C685: mov     di, ax
1C687: add     di, 758Fh
1C68B: push    ds
1C68C: push    di
1C68D: call    @$bsub$qm6Stringt1; Compare two strings
1C692: jnz     short loc_1C6A3
1C694: mov     ax, word_27E06
1C697: cwd
1C698: mov     di, 8
1C69B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C6A0: mov     word_27E28, ax
1C6A3: mov     di, offset unk_2A418
1C6A6: push    ds
1C6A7: push    di
1C6A8: mov     ax, word_27E06
1C6AB: cwd
1C6AC: mov     di, 0
1C6AF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C6B4: mov     dx, 0Bh
1C6B7: mul     dx
1C6B9: mov     di, ax
1C6BB: add     di, 758Fh
1C6BF: push    ds
1C6C0: push    di
1C6C1: call    @$bsub$qm6Stringt1; Compare two strings
1C6C6: jnz     short loc_1C6D7
1C6C8: mov     ax, word_27E06
1C6CB: cwd
1C6CC: mov     di, 8
1C6CF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C6D4: mov     word_27E26, ax
1C6D7: mov     di, offset unk_2A718
1C6DA: push    ds
1C6DB: push    di
1C6DC: mov     ax, word_27E06
1C6DF: cwd
1C6E0: mov     di, 0
1C6E3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C6E8: mov     dx, 0Bh
1C6EB: mul     dx
1C6ED: mov     di, ax
1C6EF: add     di, 758Fh
1C6F3: push    ds
1C6F4: push    di
1C6F5: call    @$bsub$qm6Stringt1; Compare two strings
1C6FA: jnz     short loc_1C70B
1C6FC: mov     ax, word_27E06
1C6FF: cwd
1C700: mov     di, 8
1C703: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C708: mov     word_27E2C, ax
1C70B: mov     di, offset unk_2AE18
1C70E: push    ds
1C70F: push    di
1C710: mov     ax, word_27E06
1C713: cwd
1C714: mov     di, 0
1C717: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C71C: mov     dx, 0Bh
1C71F: mul     dx
1C721: mov     di, ax
1C723: add     di, 758Fh
1C727: push    ds
1C728: push    di
1C729: call    @$bsub$qm6Stringt1; Compare two strings
1C72E: jnz     short loc_1C73F
1C730: mov     ax, word_27E06
1C733: cwd
1C734: mov     di, 8
1C737: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C73C: mov     word_27E3A, ax
1C73F: mov     di, offset unk_2A618
1C742: push    ds
1C743: push    di
1C744: mov     ax, word_27E06
1C747: cwd
1C748: mov     di, 0
1C74B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C750: mov     dx, 0Bh
1C753: mul     dx
1C755: mov     di, ax
1C757: add     di, 758Fh
1C75B: push    ds
1C75C: push    di
1C75D: call    @$bsub$qm6Stringt1; Compare two strings
1C762: jnz     short loc_1C773
1C764: mov     ax, word_27E06
1C767: cwd
1C768: mov     di, 8
1C76B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C770: mov     word_27E2A, ax
1C773: mov     di, offset unk_2AF18
1C776: push    ds
1C777: push    di
1C778: mov     ax, word_27E06
1C77B: cwd
1C77C: mov     di, 0
1C77F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C784: mov     dx, 0Bh
1C787: mul     dx
1C789: mov     di, ax
1C78B: add     di, 758Fh
1C78F: push    ds
1C790: push    di
1C791: call    @$bsub$qm6Stringt1; Compare two strings
1C796: jnz     short loc_1C7A7
1C798: mov     ax, word_27E06
1C79B: cwd
1C79C: mov     di, 8
1C79F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C7A4: mov     word_27E3C, ax
1C7A7: mov     di, offset unk_2A818
1C7AA: push    ds
1C7AB: push    di
1C7AC: mov     ax, word_27E06
1C7AF: cwd
1C7B0: mov     di, 0
1C7B3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C7B8: mov     dx, 0Bh
1C7BB: mul     dx
1C7BD: mov     di, ax
1C7BF: add     di, 758Fh
1C7C3: push    ds
1C7C4: push    di
1C7C5: call    @$bsub$qm6Stringt1; Compare two strings
1C7CA: jnz     short loc_1C7DB
1C7CC: mov     ax, word_27E06
1C7CF: cwd
1C7D0: mov     di, 8
1C7D3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C7D8: mov     word_27E2E, ax
1C7DB: mov     di, offset unk_2A918
1C7DE: push    ds
1C7DF: push    di
1C7E0: mov     ax, word_27E06
1C7E3: cwd
1C7E4: mov     di, 0
1C7E7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C7EC: mov     dx, 0Bh
1C7EF: mul     dx
1C7F1: mov     di, ax
1C7F3: add     di, 758Fh
1C7F7: push    ds
1C7F8: push    di
1C7F9: call    @$bsub$qm6Stringt1; Compare two strings
1C7FE: jnz     short loc_1C80F
1C800: mov     ax, word_27E06
1C803: cwd
1C804: mov     di, 8
1C807: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C80C: mov     word_27E30, ax
1C80F: mov     di, offset unk_2AA18
1C812: push    ds
1C813: push    di
1C814: mov     ax, word_27E06
1C817: cwd
1C818: mov     di, 0
1C81B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C820: mov     dx, 0Bh
1C823: mul     dx
1C825: mov     di, ax
1C827: add     di, 758Fh
1C82B: push    ds
1C82C: push    di
1C82D: call    @$bsub$qm6Stringt1; Compare two strings
1C832: jnz     short loc_1C843
1C834: mov     ax, word_27E06
1C837: cwd
1C838: mov     di, 8
1C83B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C840: mov     word_27E32, ax
1C843: mov     di, offset unk_2AB18
1C846: push    ds
1C847: push    di
1C848: mov     ax, word_27E06
1C84B: cwd
1C84C: mov     di, 0
1C84F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C854: mov     dx, 0Bh
1C857: mul     dx
1C859: mov     di, ax
1C85B: add     di, 758Fh
1C85F: push    ds
1C860: push    di
1C861: call    @$bsub$qm6Stringt1; Compare two strings
1C866: jnz     short loc_1C877
1C868: mov     ax, word_27E06
1C86B: cwd
1C86C: mov     di, 8
1C86F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C874: mov     word_27E34, ax
1C877: mov     di, offset unk_2AC18
1C87A: push    ds
1C87B: push    di
1C87C: mov     ax, word_27E06
1C87F: cwd
1C880: mov     di, 0
1C883: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C888: mov     dx, 0Bh
1C88B: mul     dx
1C88D: mov     di, ax
1C88F: add     di, 758Fh
1C893: push    ds
1C894: push    di
1C895: call    @$bsub$qm6Stringt1; Compare two strings
1C89A: jnz     short loc_1C8AB
1C89C: mov     ax, word_27E06
1C89F: cwd
1C8A0: mov     di, 8
1C8A3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C8A8: mov     word_27E36, ax
1C8AB: mov     di, offset unk_2AD18
1C8AE: push    ds
1C8AF: push    di
1C8B0: mov     ax, word_27E06
1C8B3: cwd
1C8B4: mov     di, 0
1C8B7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C8BC: mov     dx, 0Bh
1C8BF: mul     dx
1C8C1: mov     di, ax
1C8C3: add     di, 758Fh
1C8C7: push    ds
1C8C8: push    di
1C8C9: call    @$bsub$qm6Stringt1; Compare two strings
1C8CE: jnz     short loc_1C8DF
1C8D0: mov     ax, word_27E06
1C8D3: cwd
1C8D4: mov     di, 8
1C8D7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C8DC: mov     word_27E38, ax
1C8DF: cmp     word_27E06, 0Ch
1C8E4: jz      short loc_1C8E9
1C8E6: jmp     loc_1C637
1C8E9: mov     ax, word_27E28
1C8EC: sub     ax, word_27E24
1C8F0: inc     ax
1C8F1: cwd
1C8F2: mov     di, 8
1C8F5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C8FA: mov     word_27E28, ax
1C8FD: cmp     word_27E28, 0
1C902: jg      short loc_1C916
1C904: mov     ax, word_27E28
1C907: add     ax, 0Ch
1C90A: cwd
1C90B: mov     di, 8
1C90E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C913: mov     word_27E28, ax
1C916: mov     ax, word_27E26
1C919: sub     ax, word_27E24
1C91D: inc     ax
1C91E: cwd
1C91F: mov     di, 8
1C922: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C927: mov     word_27E26, ax
1C92A: cmp     word_27E26, 0
1C92F: jg      short loc_1C943
1C931: mov     ax, word_27E26
1C934: add     ax, 0Ch
1C937: cwd
1C938: mov     di, 8
1C93B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C940: mov     word_27E26, ax
1C943: mov     ax, word_27E2C
1C946: sub     ax, word_27E24
1C94A: inc     ax
1C94B: cwd
1C94C: mov     di, 8
1C94F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C954: mov     word_27E2C, ax
1C957: cmp     word_27E2C, 0
1C95C: jg      short loc_1C970
1C95E: mov     ax, word_27E2C
1C961: add     ax, 0Ch
1C964: cwd
1C965: mov     di, 8
1C968: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C96D: mov     word_27E2C, ax
1C970: mov     ax, word_27E3A
1C973: sub     ax, word_27E24
1C977: inc     ax
1C978: cwd
1C979: mov     di, 8
1C97C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C981: mov     word_27E3A, ax
1C984: cmp     word_27E3A, 0
1C989: jg      short loc_1C99D
1C98B: mov     ax, word_27E3A
1C98E: add     ax, 0Ch
1C991: cwd
1C992: mov     di, 8
1C995: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C99A: mov     word_27E3A, ax
1C99D: mov     ax, word_27E3C
1C9A0: sub     ax, word_27E24
1C9A4: inc     ax
1C9A5: cwd
1C9A6: mov     di, 8
1C9A9: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C9AE: mov     word_27E3C, ax
1C9B1: cmp     word_27E3C, 0
1C9B6: jg      short loc_1C9CA
1C9B8: mov     ax, word_27E3C
1C9BB: add     ax, 0Ch
1C9BE: cwd
1C9BF: mov     di, 8
1C9C2: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C9C7: mov     word_27E3C, ax
1C9CA: mov     ax, word_27E2A
1C9CD: sub     ax, word_27E24
1C9D1: inc     ax
1C9D2: cwd
1C9D3: mov     di, 8
1C9D6: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C9DB: mov     word_27E2A, ax
1C9DE: cmp     word_27E2A, 0
1C9E3: jg      short loc_1C9F7
1C9E5: mov     ax, word_27E2A
1C9E8: add     ax, 0Ch
1C9EB: cwd
1C9EC: mov     di, 8
1C9EF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1C9F4: mov     word_27E2A, ax
1C9F7: mov     ax, word_27E2E
1C9FA: sub     ax, word_27E24
1C9FE: inc     ax
1C9FF: cwd
1CA00: mov     di, 8
1CA03: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA08: mov     word_27E2E, ax
1CA0B: cmp     word_27E2E, 0
1CA10: jg      short loc_1CA24
1CA12: mov     ax, word_27E2E
1CA15: add     ax, 0Ch
1CA18: cwd
1CA19: mov     di, 8
1CA1C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA21: mov     word_27E2E, ax
1CA24: mov     ax, word_27E30
1CA27: sub     ax, word_27E24
1CA2B: inc     ax
1CA2C: cwd
1CA2D: mov     di, 8
1CA30: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA35: mov     word_27E30, ax
1CA38: cmp     word_27E30, 0
1CA3D: jg      short loc_1CA51
1CA3F: mov     ax, word_27E30
1CA42: add     ax, 0Ch
1CA45: cwd
1CA46: mov     di, 8
1CA49: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA4E: mov     word_27E30, ax
1CA51: mov     ax, word_27E32
1CA54: sub     ax, word_27E24
1CA58: inc     ax
1CA59: cwd
1CA5A: mov     di, 8
1CA5D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA62: mov     word_27E32, ax
1CA65: cmp     word_27E32, 0
1CA6A: jg      short loc_1CA7E
1CA6C: mov     ax, word_27E32
1CA6F: add     ax, 0Ch
1CA72: cwd
1CA73: mov     di, 8
1CA76: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA7B: mov     word_27E32, ax
1CA7E: mov     ax, word_27E34
1CA81: sub     ax, word_27E24
1CA85: inc     ax
1CA86: cwd
1CA87: mov     di, 8
1CA8A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CA8F: mov     word_27E34, ax
1CA92: cmp     word_27E34, 0
1CA97: jg      short loc_1CAAB
1CA99: mov     ax, word_27E34
1CA9C: add     ax, 0Ch
1CA9F: cwd
1CAA0: mov     di, 8
1CAA3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CAA8: mov     word_27E34, ax
1CAAB: mov     ax, word_27E36
1CAAE: sub     ax, word_27E24
1CAB2: inc     ax
1CAB3: cwd
1CAB4: mov     di, 8
1CAB7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CABC: mov     word_27E36, ax
1CABF: cmp     word_27E36, 0
1CAC4: jg      short loc_1CAD8
1CAC6: mov     ax, word_27E36
1CAC9: add     ax, 0Ch
1CACC: cwd
1CACD: mov     di, 8
1CAD0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CAD5: mov     word_27E36, ax
1CAD8: mov     ax, word_27E38
1CADB: sub     ax, word_27E24
1CADF: inc     ax
1CAE0: cwd
1CAE1: mov     di, 8
1CAE4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CAE9: mov     word_27E38, ax
1CAEC: cmp     word_27E38, 0
1CAF1: jg      short loc_1CB05
1CAF3: mov     ax, word_27E38
1CAF6: add     ax, 0Ch
1CAF9: cwd
1CAFA: mov     di, 8
1CAFD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CB02: mov     word_27E38, ax
1CB05: mov     sp, bp
1CB07: pop     bp
1CB08: retf
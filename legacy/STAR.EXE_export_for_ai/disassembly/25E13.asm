/*
 * func-name: sub_25E13
 * func-address: 0x25e13
 * export-type: disassembly-fallback
 * callers: none
 * callees: 0x25de4, 0x25eb0, 0x25f18
 * fallback-reason: decompile returned None
 */

25E13: push    ds
25E14: mov     ax, 40h ; '@'
25E17: mov     ds, ax
25E19: mov     dx, ds:50h
25E1D: pop     ds
25E1E: mov     bx, dx
25E20: mov     si, di
25E22: mov     al, es:[di]
25E25: cmp     al, 7
25E27: jz      short loc_25E4A
25E29: cmp     al, 8
25E2B: jz      short loc_25E59
25E2D: cmp     al, 0Ah
25E2F: jz      short loc_25E66
25E31: cmp     al, 0Dh
25E33: jz      short loc_25E6E
25E35: inc     di
25E36: inc     dl
25E38: cmp     dl, byte ptr word_2F500
25E3C: jbe     short loc_25E7A
25E3E: call    sub_25EB0
25E41: call    sub_25DE4
25E44: mov     dl, byte ptr word_2F4FE
25E48: jmp     short loc_25E76
25E4A: call    sub_25EB0
25E4D: push    cx
25E4E: push    dx
25E4F: mov     ax, 0E07h
25E52: call    sub_25F18
25E55: pop     dx
25E56: pop     cx
25E57: jmp     short loc_25E75
25E59: call    sub_25EB0
25E5C: cmp     dl, byte ptr word_2F4FE
25E60: jz      short loc_25E75
25E62: dec     dl
25E64: jmp     short loc_25E75
25E66: call    sub_25EB0
25E69: call    sub_25DE4
25E6C: jmp     short loc_25E75
25E6E: call    sub_25EB0
25E71: mov     dl, byte ptr word_2F4FE
25E75: inc     di
25E76: mov     si, di
25E78: mov     bx, dx
25E7A: loop    loc_25E22
25E7C: call    sub_25EB0
25E7F: push    ds
25E80: mov     ax, 40h ; '@'
25E83: mov     ds, ax
25E85: mov     ds:50h, dx
25E89: mov     al, dh
25E8B: mul     byte ptr ds:4Ah
25E8F: xor     dh, dh
25E91: add     ax, dx
25E93: mov     cx, ax
25E95: mov     dx, ds:63h
25E99: mov     al, 0Eh
25E9B: out     dx, al
25E9C: jmp     short $+2
25E9E: mov     al, ch
25EA0: inc     dx
25EA1: out     dx, al
25EA2: jmp     short $+2
25EA4: dec     dx
25EA5: mov     al, 0Fh
25EA7: out     dx, al
25EA8: jmp     short $+2
25EAA: mov     al, cl
25EAC: inc     dx
25EAD: out     dx, al
25EAE: pop     ds
25EAF: retn
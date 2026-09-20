/*
 * func-name: sub_25EB0
 * func-address: 0x25eb0
 * export-type: disassembly-fallback
 * callers: 0x25e13
 * callees: none
 * fallback-reason: decompile returned None
 */

25EB0: cmp     si, di
25EB2: jz      short locret_25F17
25EB4: push    cx
25EB5: push    dx
25EB6: push    di
25EB7: push    ds
25EB8: push    es
25EB9: mov     cx, di
25EBB: sub     cx, si
25EBD: mov     dl, byte_2F4F9
25EC1: mov     dh, byte_2F4FC
25EC5: mov     ax, 40h ; '@'
25EC8: mov     ds, ax
25ECA: mov     al, bh
25ECC: mul     byte ptr ds:4Ah
25ED0: xor     bh, bh
25ED2: add     ax, bx
25ED4: shl     ax, 1
25ED6: mov     di, ax
25ED8: mov     bx, dx
25EDA: mov     dx, ds:63h
25EDE: add     dx, 6
25EE1: mov     ax, 0B800h
25EE4: cmp     byte ptr ds:49h, 7
25EE9: jnz     short loc_25EED
25EEB: mov     ah, 0B0h
25EED: push    es
25EEE: pop     ds
25EEF: mov     es, ax
25EF1: cld
25EF2: or      bl, bl
25EF4: jz      short loc_25F0C
25EF6: lodsb
25EF7: mov     bl, al
25EF9: in      al, dx
25EFA: test    al, 1
25EFC: jnz     short loc_25EF9
25EFE: cli
25EFF: in      al, dx
25F00: test    al, 1
25F02: jz      short loc_25EFF
25F04: mov     ax, bx
25F06: stosw
25F07: sti
25F08: loop    loc_25EF6
25F0A: jmp     short loc_25F12
25F0C: mov     ah, bh
25F0E: lodsb
25F0F: stosw
25F10: loop    loc_25F0E
25F12: pop     es
25F13: pop     ds
25F14: pop     di
25F15: pop     dx
25F16: pop     cx
25F17: retn
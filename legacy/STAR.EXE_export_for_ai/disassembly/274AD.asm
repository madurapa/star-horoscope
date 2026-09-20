/*
 * func-name: sub_274AD
 * func-address: 0x274ad
 * export-type: disassembly-fallback
 * callers: none
 * callees: none
 * fallback-reason: decompile returned None
 */

274AD: xor     dx, dx
274AF: xor     cx, cx
274B1: mov     bx, [di]
274B3: mov     ax, 4202h
274B6: int     21h; DOS - 2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
274B8: sub     ax, 80h
274BB: sbb     dx, 0
274BE: jnb     short loc_274C4
274C0: xor     ax, ax
274C2: xor     dx, dx
274C4: mov     cx, dx
274C6: mov     dx, ax
274C8: mov     bx, [di]
274CA: mov     ax, 4200h
274CD: int     21h; DOS - 2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
274CF: lea     dx, [di+80h]
274D3: mov     cx, 80h
274D6: mov     bx, [di]
274D8: mov     ah, 3Fh
274DA: int     21h; DOS - 2+ - READ FROM FILE WITH HANDLE
274DC: jnb     short loc_274E0
274DE: xor     ax, ax
274E0: xor     bx, bx
274E2: cmp     bx, ax
274E4: jz      short locret_27506
274E6: cmp     byte ptr [bx+di+80h], 1Ah
274EB: jz      short loc_274F0
274ED: inc     bx
274EE: jmp     short loc_274E2
274F0: mov     dx, bx
274F2: sub     dx, ax
274F4: mov     cx, 0FFFFh
274F7: mov     bx, [di]
274F9: mov     ax, 4202h
274FC: int     21h; DOS - 2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
274FE: xor     cx, cx
27500: mov     bx, [di]
27502: mov     ah, 40h
27504: int     21h; DOS - 2+ - WRITE TO FILE WITH HANDLE
27506: retn
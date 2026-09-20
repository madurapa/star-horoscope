/*
 * func-name: PROGRAM
 * func-address: 0x10a46
 * export-type: disassembly-fallback
 * callers: none
 * callees: 0x1633a, 0x17f3c, 0x17ffe, 0x1874b, 0x18760, 0x1956d, 0x195d3, 0x1adce, 0x1ae29, 0x1b357, 0x1b689, 0x1c556, 0x1c560, 0x1c596, 0x1c5d2, 0x1c5eb, 0x1c620, 0x1cbb2, 0x1d989, 0x21061, 0x21576, 0x21ecb, 0x21ee1, 0x23a58, 0x2564e, 0x25909, 0x25910, 0x25a92, 0x25ad2, 0x25b25, 0x25b69, 0x25b83, 0x25c1c, 0x25f30, 0x25f7d, 0x26011, 0x260ed, 0x261ce, 0x261e0, 0x262b8, 0x2650b, 0x265f6, 0x26621, 0x26a00, 0x26a06, 0x26a12, 0x26a18, 0x26a22, 0x26a26, 0x26a2a, 0x26a32, 0x26a74, 0x26b36, 0x26b49, 0x27639, 0x27662, 0x27681, 0x276c5, 0x276f2, 0x2772a, 0x27768, 0x277c0, 0x27809, 0x27863, 0x278c4
 * fallback-reason: function too large (21925 bytes, limit 16384 bytes)
 */

10A46: call    @__SystemInit$qv; __SystemInit(void)
10A4B: call    sub_261CE
10A50: call    @__CRTInit$qv; __CRTInit(void)
10A55: call    sub_25909
10A5A: call    sub_21ECB
10A5F: call    sub_21061
10A64: call    sub_1C556
10A69: call    sub_1B357
10A6E: call    sub_1ADCE
10A73: call    sub_1956D
10A78: call    sub_1874B
10A7D: call    sub_17F3C
10A82: push    bp
10A83: mov     bp, sp
10A85: sub     sp, 100h
10A89: call    @CLRSCR$qv; CLRSCR(void)
10A8E: mov     al, 1
10A90: push    ax
10A91: mov     al, 1
10A93: push    ax
10A94: mov     al, 50h ; 'P'
10A96: push    ax
10A97: mov     al, 19h
10A99: push    ax
10A9A: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
10A9F: call    @CLRSCR$qv; CLRSCR(void)
10AA4: mov     al, 0
10AA6: push    ax
10AA7: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
10AAC: mov     al, 1
10AAE: push    ax
10AAF: mov     al, 1
10AB1: push    ax
10AB2: mov     al, 2Dh ; '-'
10AB4: push    ax
10AB5: mov     al, 6
10AB7: push    ax
10AB8: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
10ABD: mov     al, 1
10ABF: push    ax
10AC0: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
10AC5: mov     al, 0Fh
10AC7: push    ax
10AC8: call    @TEXTCOLOR$q4BYTE; TEXTCOLOR(BYTE)
10ACD: mov     di, offset unk_2F60A
10AD0: push    ds
10AD1: push    di
10AD2: mov     di, offset aYourStars; "YOUR STARS                      "
10AD5: push    cs
10AD6: push    di
10AD7: xor     ax, ax
10AD9: push    ax
10ADA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10ADF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10AE4: mov     di, offset unk_2F60A
10AE7: push    ds
10AE8: push    di
10AE9: mov     di, offset asc_10021; "                                "
10AEC: push    cs
10AED: push    di
10AEE: xor     ax, ax
10AF0: push    ax
10AF1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10AF6: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10AFB: mov     di, offset unk_2F60A
10AFE: push    ds
10AFF: push    di
10B00: mov     al, 2
10B02: push    ax
10B03: call    @DiskSize$q4Byte; DiskSize(Byte)
10B08: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10B0D: push    dx
10B0E: push    bx
10B0F: push    ax
10B10: mov     al, 2
10B12: push    ax
10B13: call    @DiskFree$q4Byte; DiskFree(Byte)
10B18: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10B1D: pop     cx
10B1E: pop     si
10B1F: pop     di
10B20: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
10B25: mov     cx, 87h
10B28: xor     si, si
10B2A: mov     di, 4800h
10B2D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
10B32: push    dx
10B33: push    bx
10B34: push    ax
10B35: mov     ax, 87h
10B38: xor     bx, bx
10B3A: mov     dx, 4800h
10B3D: pop     cx
10B3E: pop     si
10B3F: pop     di
10B40: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
10B45: push    dx
10B46: push    bx
10B47: push    ax
10B48: mov     ax, 2
10B4B: push    ax
10B4C: mov     ax, 1
10B4F: push    ax
10B50: call    @Write$qm4Text4Real4Wordt3; Write(var f; v: Real; width, decimals: Word)
10B55: mov     di, offset aOfDiskBIsFull; " % Of Disk B: Is Full       "
10B58: push    cs
10B59: push    di
10B5A: xor     ax, ax
10B5C: push    ax
10B5D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10B62: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10B67: mov     di, offset word_2792E
10B6A: push    ds
10B6B: push    di
10B6C: mov     di, offset word_27930
10B6F: push    ds
10B70: push    di
10B71: mov     di, offset word_27932
10B74: push    ds
10B75: push    di
10B76: mov     di, offset unk_27934
10B79: push    ds
10B7A: push    di
10B7B: call    @GetDate$qm4Wordt1t1t1; GetDate(Word &,Word &,Word &,Word &)
10B80: mov     di, offset unk_2F60A
10B83: push    ds
10B84: push    di
10B85: mov     di, (offset aYourStars+1Eh)
10B88: push    cs
10B89: push    di
10B8A: xor     ax, ax
10B8C: push    ax
10B8D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10B92: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10B97: mov     di, offset unk_2F60A
10B9A: push    ds
10B9B: push    di
10B9C: mov     di, offset aTodayIs; "Today is:             "
10B9F: push    cs
10BA0: push    di
10BA1: xor     ax, ax
10BA3: push    ax
10BA4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10BA9: mov     ax, word_2792E
10BAC: xor     dx, dx
10BAE: push    dx
10BAF: push    ax
10BB0: mov     ax, 4
10BB3: push    ax
10BB4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
10BB9: mov     al, 2Dh ; '-'
10BBB: push    ax
10BBC: xor     ax, ax
10BBE: push    ax
10BBF: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
10BC4: mov     ax, word_27930
10BC7: xor     dx, dx
10BC9: push    dx
10BCA: push    ax
10BCB: mov     ax, 2
10BCE: push    ax
10BCF: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
10BD4: mov     al, 2Dh ; '-'
10BD6: push    ax
10BD7: xor     ax, ax
10BD9: push    ax
10BDA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
10BDF: mov     ax, word_27932
10BE2: xor     dx, dx
10BE4: push    dx
10BE5: push    ax
10BE6: mov     ax, 2
10BE9: push    ax
10BEA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
10BEF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10BF4: mov     al, 2
10BF6: push    ax
10BF7: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
10BFC: mov     al, 0Fh
10BFE: push    ax
10BFF: call    @TEXTCOLOR$q4BYTE; TEXTCOLOR(BYTE)
10C04: mov     al, 1
10C06: push    ax
10C07: mov     al, 1
10C09: push    ax
10C0A: mov     al, 50h ; 'P'
10C0C: push    ax
10C0D: mov     al, 19h
10C0F: push    ax
10C10: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
10C15: mov     al, 1
10C17: push    ax
10C18: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
10C1D: mov     al, 0Fh
10C1F: push    ax
10C20: call    @TEXTCOLOR$q4BYTE; TEXTCOLOR(BYTE)
10C25: mov     al, 1
10C27: push    ax
10C28: mov     al, 8
10C2A: push    ax
10C2B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
10C30: mov     di, offset unk_2F60A
10C33: push    ds
10C34: push    di
10C35: mov     di, offset aThathkalaKendr; "\"Thathkala Kendra\"   ?  (Y/N)"
10C38: push    cs
10C39: push    di
10C3A: xor     ax, ax
10C3C: push    ax
10C3D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10C42: call    @Write$qm4Text; Write(var f: Text)
10C47: mov     al, 1Fh
10C49: push    ax
10C4A: mov     al, 8
10C4C: push    ax
10C4D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
10C52: mov     byte_27936, 4Eh ; 'N'
10C57: mov     di, offset unk_2F60A
10C5A: push    ds
10C5B: push    di
10C5C: mov     al, byte_27936
10C5F: push    ax
10C60: xor     ax, ax
10C62: push    ax
10C63: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
10C68: call    @Write$qm4Text; Write(var f: Text)
10C6D: mov     al, 1Fh
10C6F: push    ax
10C70: mov     al, 8
10C72: push    ax
10C73: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
10C78: call    @READKEY$qv; READKEY(void)
10C7D: push    ax
10C7E: call    @UpCase$q4Char; UpCase(ch: Char): Char{AL}
10C83: mov     byte_27DEA, al
10C86: cmp     byte_27DEA, 0Dh
10C8B: jz      short loc_10C9B
10C8D: cmp     byte_27DEA, 4Eh ; 'N'
10C92: jz      short loc_10C9B
10C94: cmp     byte_27DEA, 59h ; 'Y'
10C99: jnz     short loc_10C6D
10C9B: cmp     byte_27DEA, 0Dh
10CA0: jz      short loc_10CA8
10CA2: mov     al, byte_27DEA
10CA5: mov     byte_27936, al
10CA8: mov     al, 1Fh
10CAA: push    ax
10CAB: mov     al, 8
10CAD: push    ax
10CAE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
10CB3: mov     di, offset unk_2F60A
10CB6: push    ds
10CB7: push    di
10CB8: mov     al, byte_27DEA
10CBB: push    ax
10CBC: xor     ax, ax
10CBE: push    ax
10CBF: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
10CC4: call    @Write$qm4Text; Write(var f: Text)
10CC9: cmp     byte_27936, 59h ; 'Y'
10CCE: jz      short loc_10CD3
10CD0: jmp     loc_10DEB
10CD3: mov     di, offset word_2791E
10CD6: push    ds
10CD7: push    di
10CD8: mov     di, offset word_27920
10CDB: push    ds
10CDC: push    di
10CDD: mov     di, offset word_27922
10CE0: push    ds
10CE1: push    di
10CE2: mov     di, offset unk_27928
10CE5: push    ds
10CE6: push    di
10CE7: call    @GetDate$qm4Wordt1t1t1; GetDate(Word &,Word &,Word &,Word &)
10CEC: mov     di, offset word_27924
10CEF: push    ds
10CF0: push    di
10CF1: mov     di, offset word_27926
10CF4: push    ds
10CF5: push    di
10CF6: mov     di, offset unk_2792A
10CF9: push    ds
10CFA: push    di
10CFB: mov     di, offset unk_2792C
10CFE: push    ds
10CFF: push    di
10D00: call    @GetTime$qm4Wordt1t1t1; GetTime(Word &,Word &,Word &,Word &)
10D05: mov     di, offset aThatkalaKendra; "\"Thatkala Kendra\""
10D08: push    cs
10D09: push    di
10D0A: mov     di, offset unk_2B418
10D0D: push    ds
10D0E: push    di
10D0F: mov     ax, 0FFh
10D12: push    ax
10D13: call    @$basg$qm6Stringt14Byte; Store string
10D18: mov     ax, word_2791E
10D1B: mov     word_27DEE, ax
10D1E: mov     ax, word_27920
10D21: mov     word_27DF0, ax
10D24: mov     ax, word_27922
10D27: mov     word_27DF2, ax
10D2A: mov     ax, word_27926
10D2D: xor     dx, dx
10D2F: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10D34: mov     cx, 86h
10D37: xor     si, si
10D39: mov     di, 7000h
10D3C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
10D41: push    dx
10D42: push    bx
10D43: push    ax
10D44: mov     ax, word_27924
10D47: xor     dx, dx
10D49: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10D4E: pop     cx
10D4F: pop     si
10D50: pop     di
10D51: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
10D56: mov     word_27BFE, ax
10D59: mov     word_27C00, bx
10D5D: mov     word_27C02, dx
10D61: mov     word_2793A, 6
10D67: mov     word_2793C, 32h ; '2'
10D6D: mov     word_2793E, 4Fh ; 'O'
10D73: mov     word_27940, 32h ; '2'
10D79: mov     ax, word_27940
10D7C: cwd
10D7D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10D82: mov     cx, 86h
10D85: xor     si, si
10D87: mov     di, 7000h
10D8A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
10D8F: push    dx
10D90: push    bx
10D91: push    ax
10D92: mov     ax, word_2793E
10D95: cwd
10D96: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10D9B: pop     cx
10D9C: pop     si
10D9D: pop     di
10D9E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
10DA3: mov     word_27C04, ax
10DA6: mov     word_27C06, bx
10DAA: mov     word_27C08, dx
10DAE: mov     ax, word_2793C
10DB1: cwd
10DB2: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10DB7: mov     cx, 86h
10DBA: xor     si, si
10DBC: mov     di, 7000h
10DBF: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
10DC4: push    dx
10DC5: push    bx
10DC6: push    ax
10DC7: mov     ax, word_2793A
10DCA: cwd
10DCB: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10DD0: pop     cx
10DD1: pop     si
10DD2: pop     di
10DD3: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
10DD8: mov     word_27C0A, ax
10DDB: mov     word_27C0C, bx
10DDF: mov     word_27C0E, dx
10DE3: mov     byte_27B4E, 0
10DE8: jmp     loc_10F19
10DEB: call    @CLRSCR$qv; CLRSCR(void)
10DF0: mov     di, offset unk_2F60A
10DF3: push    ds
10DF4: push    di
10DF5: mov     di, offset aHoroscopeOwner; " HOROSCOPE  OWNER\"S   DEATALS "
10DF8: push    cs
10DF9: push    di
10DFA: xor     ax, ax
10DFC: push    ax
10DFD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10E02: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10E07: mov     di, offset unk_2F60A
10E0A: push    ds
10E0B: push    di
10E0C: mov     di, offset asc_100C5; " ****************************"
10E0F: push    cs
10E10: push    di
10E11: xor     ax, ax
10E13: push    ax
10E14: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10E19: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10E1E: mov     di, offset unk_2F60A
10E21: push    ds
10E22: push    di
10E23: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10E28: mov     di, offset unk_2F60A
10E2B: push    ds
10E2C: push    di
10E2D: mov     di, offset aName; "Name ? "
10E30: push    cs
10E31: push    di
10E32: xor     ax, ax
10E34: push    ax
10E35: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10E3A: call    @Write$qm4Text; Write(var f: Text)
10E3F: mov     di, offset unk_2F50A
10E42: push    ds
10E43: push    di
10E44: mov     di, offset unk_2B418
10E47: push    ds
10E48: push    di
10E49: mov     ax, 0FFh
10E4C: push    ax
10E4D: call    @Read$qm4Textm6String4Word; Read(var f; var s: String; width: Word)
10E52: call    @Write$qm4Text; Write(var f: Text)
10E57: mov     di, offset unk_2F60A
10E5A: push    ds
10E5B: push    di
10E5C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10E61: mov     di, offset unk_2F60A
10E64: push    ds
10E65: push    di
10E66: mov     di, offset aBirthDateYearM; "Birth date - Year Month Day  ? "
10E69: push    cs
10E6A: push    di
10E6B: xor     ax, ax
10E6D: push    ax
10E6E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10E73: call    @Write$qm4Text; Write(var f: Text)
10E78: mov     di, offset unk_2F50A
10E7B: push    ds
10E7C: push    di
10E7D: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
10E82: mov     word_27DEE, ax
10E85: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
10E8A: mov     word_27DF0, ax
10E8D: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
10E92: mov     word_27DF2, ax
10E95: call    @Write$qm4Text; Write(var f: Text)
10E9A: mov     di, offset unk_2F60A
10E9D: push    ds
10E9E: push    di
10E9F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10EA4: mov     di, offset unk_2F60A
10EA7: push    ds
10EA8: push    di
10EA9: mov     di, offset aBirthTimeHrMin; "Birth time - Hr Min [24Hrs]  ? "
10EAC: push    cs
10EAD: push    di
10EAE: xor     ax, ax
10EB0: push    ax
10EB1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10EB6: call    @Write$qm4Text; Write(var f: Text)
10EBB: mov     di, offset unk_2F50A
10EBE: push    ds
10EBF: push    di
10EC0: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
10EC5: mov     word_27E1C, ax
10EC8: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
10ECD: mov     word_27E1E, ax
10ED0: call    @Write$qm4Text; Write(var f: Text)
10ED5: mov     di, offset unk_2F60A
10ED8: push    ds
10ED9: push    di
10EDA: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10EDF: mov     ax, word_27E1E
10EE2: cwd
10EE3: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10EE8: mov     cx, 86h
10EEB: xor     si, si
10EED: mov     di, 7000h
10EF0: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
10EF5: push    dx
10EF6: push    bx
10EF7: push    ax
10EF8: mov     ax, word_27E1C
10EFB: cwd
10EFC: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
10F01: pop     cx
10F02: pop     si
10F03: pop     di
10F04: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
10F09: mov     word_27BFE, ax
10F0C: mov     word_27C00, bx
10F10: mov     word_27C02, dx
10F14: mov     byte_27B4E, 1
10F19: call    @CLRSCR$qv; CLRSCR(void)
10F1E: mov     al, 1
10F20: push    ax
10F21: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
10F26: cmp     byte_27B4E, 1
10F2B: jz      short loc_10F30
10F2D: jmp     loc_11424
10F30: mov     di, offset unk_2F60A
10F33: push    ds
10F34: push    di
10F35: mov     di, offset aListOfCities; "          LIST  OF  CITIES    "
10F38: push    cs
10F39: push    di
10F3A: xor     ax, ax
10F3C: push    ax
10F3D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10F42: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F47: mov     di, offset unk_2F60A
10F4A: push    ds
10F4B: push    di
10F4C: mov     di, offset asc_1014A; "          ----------------    "
10F4F: push    cs
10F50: push    di
10F51: xor     ax, ax
10F53: push    ax
10F54: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10F59: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F5E: mov     di, offset unk_2F60A
10F61: push    ds
10F62: push    di
10F63: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F68: mov     di, offset unk_2F60A
10F6B: push    ds
10F6C: push    di
10F6D: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F72: mov     di, offset unk_2F60A
10F75: push    ds
10F76: push    di
10F77: mov     di, offset a1Clombo2Galle3; " 1. CLOMBO     2. GALLE     3. MATHARA "...
10F7A: push    cs
10F7B: push    di
10F7C: xor     ax, ax
10F7E: push    ax
10F7F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10F84: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F89: mov     di, offset unk_2F60A
10F8C: push    ds
10F8D: push    di
10F8E: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F93: mov     di, offset unk_2F60A
10F96: push    ds
10F97: push    di
10F98: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10F9D: mov     di, offset unk_2F60A
10FA0: push    ds
10FA1: push    di
10FA2: mov     di, offset a6Kaluthara7Rat; " 6. KALUTHARA  7. RATNAPURA 8. PUTTLAM "...
10FA5: push    cs
10FA6: push    di
10FA7: xor     ax, ax
10FA9: push    ax
10FAA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10FAF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FB4: mov     di, offset unk_2F60A
10FB7: push    ds
10FB8: push    di
10FB9: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FBE: mov     di, offset unk_2F60A
10FC1: push    ds
10FC2: push    di
10FC3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FC8: mov     di, offset unk_2F60A
10FCB: push    ds
10FCC: push    di
10FCD: mov     di, offset a11Jaffna12Trin; "11. JAFFNA    12. TRINCO   13. MATHARA "...
10FD0: push    cs
10FD1: push    di
10FD2: xor     ax, ax
10FD4: push    ax
10FD5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
10FDA: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FDF: mov     di, offset unk_2F60A
10FE2: push    ds
10FE3: push    di
10FE4: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FE9: mov     di, offset unk_2F60A
10FEC: push    ds
10FED: push    di
10FEE: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FF3: mov     di, offset unk_2F60A
10FF6: push    ds
10FF7: push    di
10FF8: call    @WriteLn$qm4Text; WriteLn(var f: Text)
10FFD: mov     di, offset unk_2F60A
11000: push    ds
11001: push    di
11002: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11007: mov     di, offset unk_2F60A
1100A: push    ds
1100B: push    di
1100C: mov     di, offset aClosestCity; "Closest city ? "
1100F: push    cs
11010: push    di
11011: xor     ax, ax
11013: push    ax
11014: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11019: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1101E: mov     di, offset unk_2F60A
11021: push    ds
11022: push    di
11023: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11028: mov     di, offset unk_2F60A
1102B: push    ds
1102C: push    di
1102D: mov     di, offset asc_1024B; "|--------------------------------------"...
11030: push    cs
11031: push    di
11032: xor     ax, ax
11034: push    ax
11035: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1103A: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1103F: mov     di, offset unk_2F60A
11042: push    ds
11043: push    di
11044: mov     di, offset aEnterANumber15; "| ENTER A NUMBER > 15 FOR CITIES NOT GI"...
11047: push    cs
11048: push    di
11049: xor     ax, ax
1104B: push    ax
1104C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11051: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11056: mov     di, offset unk_2F60A
11059: push    ds
1105A: push    di
1105B: mov     di, offset asc_1024B; "|--------------------------------------"...
1105E: push    cs
1105F: push    di
11060: xor     ax, ax
11062: push    ax
11063: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11068: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1106D: mov     di, offset unk_2F60A
11070: push    ds
11071: push    di
11072: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11077: mov     di, offset unk_2F60A
1107A: push    ds
1107B: push    di
1107C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11081: mov     al, 0Fh
11083: push    ax
11084: mov     al, 0Fh
11086: push    ax
11087: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1108C: mov     di, offset unk_2F50A
1108F: push    ds
11090: push    di
11091: call    @Read$qm4Text4Real; Read(var f; var v: Real{DX:BX:AX})
11096: mov     word_27B48, ax
11099: mov     word_27B4A, bx
1109D: mov     word_27B4C, dx
110A1: call    @Write$qm4Text; Write(var f: Text)
110A6: mov     ax, word_27B48
110A9: mov     bx, word_27B4A
110AD: mov     dx, word_27B4C
110B1: mov     cx, 81h
110B4: xor     si, si
110B6: xor     di, di
110B8: call    @__Cmp$q4Realt1; Compare two reals
110BD: jnz     short loc_110D7
110BF: mov     word_2793A, 6
110C5: mov     word_2793C, 35h ; '5'
110CB: mov     word_2793E, 4Fh ; 'O'
110D1: mov     word_27940, 33h ; '3'
110D7: mov     ax, word_27B48
110DA: mov     bx, word_27B4A
110DE: mov     dx, word_27B4C
110E2: mov     cx, 82h
110E5: xor     si, si
110E7: xor     di, di
110E9: call    @__Cmp$q4Realt1; Compare two reals
110EE: jnz     short loc_11108
110F0: mov     word_2793A, 5
110F6: mov     word_2793C, 3Ah ; ':'
110FC: mov     word_2793E, 50h ; 'P'
11102: mov     word_27940, 0Dh
11108: mov     ax, word_27B48
1110B: mov     bx, word_27B4A
1110F: mov     dx, word_27B4C
11113: mov     cx, 82h
11116: xor     si, si
11118: mov     di, 4000h
1111B: call    @__Cmp$q4Realt1; Compare two reals
11120: jnz     short loc_1113A
11122: mov     word_2793A, 5
11128: mov     word_2793C, 36h ; '6'
1112E: mov     word_2793E, 50h ; 'P'
11134: mov     word_27940, 21h ; '!'
1113A: mov     ax, word_27B48
1113D: mov     bx, word_27B4A
11141: mov     dx, word_27B4C
11145: mov     cx, 83h
11148: xor     si, si
1114A: xor     di, di
1114C: call    @__Cmp$q4Realt1; Compare two reals
11151: jnz     short loc_1116B
11153: mov     word_2793A, 7
11159: mov     word_2793C, 7
1115F: mov     word_2793E, 50h ; 'P'
11165: mov     word_27940, 26h ; '&'
1116B: mov     ax, word_27B48
1116E: mov     bx, word_27B4A
11172: mov     dx, word_27B4C
11176: mov     cx, 83h
11179: xor     si, si
1117B: mov     di, 2000h
1117E: call    @__Cmp$q4Realt1; Compare two reals
11183: jnz     short loc_1119D
11185: mov     word_2793A, 6
1118B: mov     word_2793C, 3
11191: mov     word_2793E, 51h ; 'Q'
11197: mov     word_27940, 7
1119D: mov     ax, word_27B48
111A0: mov     bx, word_27B4A
111A4: mov     dx, word_27B4C
111A8: mov     cx, 83h
111AB: xor     si, si
111AD: mov     di, 4000h
111B0: call    @__Cmp$q4Realt1; Compare two reals
111B5: jnz     short loc_111CF
111B7: mov     word_2793A, 6
111BD: mov     word_2793C, 1Fh
111C3: mov     word_2793E, 4Fh ; 'O'
111C9: mov     word_27940, 3Ah ; ':'
111CF: mov     ax, word_27B48
111D2: mov     bx, word_27B4A
111D6: mov     dx, word_27B4C
111DA: mov     cx, 83h
111DD: xor     si, si
111DF: mov     di, 6000h
111E2: call    @__Cmp$q4Realt1; Compare two reals
111E7: jnz     short loc_11201
111E9: mov     word_2793A, 6
111EF: mov     word_2793C, 25h ; '%'
111F5: mov     word_2793E, 50h ; 'P'
111FB: mov     word_27940, 18h
11201: mov     ax, word_27B48
11204: mov     bx, word_27B4A
11208: mov     dx, word_27B4C
1120C: mov     cx, 84h
1120F: xor     si, si
11211: xor     di, di
11213: call    @__Cmp$q4Realt1; Compare two reals
11218: jnz     short loc_11232
1121A: mov     word_2793A, 7
11220: mov     word_2793C, 3Bh ; ';'
11226: mov     word_2793E, 4Fh ; 'O'
1122C: mov     word_27940, 32h ; '2'
11232: mov     ax, word_27B48
11235: mov     bx, word_27B4A
11239: mov     dx, word_27B4C
1123D: mov     cx, 84h
11240: xor     si, si
11242: mov     di, 1000h
11245: call    @__Cmp$q4Realt1; Compare two reals
1124A: jnz     short loc_11264
1124C: mov     word_2793A, 8
11252: mov     word_2793C, 0Dh
11258: mov     word_2793E, 50h ; 'P'
1125E: mov     word_27940, 19h
11264: mov     ax, word_27B48
11267: mov     bx, word_27B4A
1126B: mov     dx, word_27B4C
1126F: mov     cx, 84h
11272: xor     si, si
11274: mov     di, 2000h
11277: call    @__Cmp$q4Realt1; Compare two reals
1127C: jnz     short loc_11295
1127E: mov     word_2793A, 7
11284: mov     word_2793C, 36h ; '6'
1128A: mov     word_2793E, 51h ; 'Q'
11290: xor     ax, ax
11292: mov     word_27940, ax
11295: mov     ax, word_27B48
11298: mov     bx, word_27B4A
1129C: mov     dx, word_27B4C
112A0: mov     cx, 84h
112A3: xor     si, si
112A5: mov     di, 3000h
112A8: call    @__Cmp$q4Realt1; Compare two reals
112AD: jnz     short loc_112C7
112AF: mov     word_2793A, 9
112B5: mov     word_2793C, 24h ; '$'
112BB: mov     word_2793E, 50h ; 'P'
112C1: mov     word_27940, 1
112C7: mov     ax, word_27B48
112CA: mov     bx, word_27B4A
112CE: mov     dx, word_27B4C
112D2: mov     cx, 84h
112D5: xor     si, si
112D7: mov     di, 4000h
112DA: call    @__Cmp$q4Realt1; Compare two reals
112DF: jnz     short loc_112F9
112E1: mov     word_2793A, 8
112E7: mov     word_2793C, 20h ; ' '
112ED: mov     word_2793E, 51h ; 'Q'
112F3: mov     word_27940, 0Eh
112F9: mov     ax, word_27B48
112FC: mov     bx, word_27B4A
11300: mov     dx, word_27B4C
11304: mov     cx, 84h
11307: xor     si, si
11309: mov     di, 5000h
1130C: call    @__Cmp$q4Realt1; Compare two reals
11311: jnz     short loc_1132B
11313: mov     word_2793A, 7
11319: mov     word_2793C, 28h ; '('
1131F: mov     word_2793E, 51h ; 'Q'
11325: mov     word_27940, 2Bh ; '+'
1132B: mov     ax, word_27B48
1132E: mov     bx, word_27B4A
11332: mov     dx, word_27B4C
11336: mov     cx, 84h
11339: xor     si, si
1133B: mov     di, 6000h
1133E: call    @__Cmp$q4Realt1; Compare two reals
11343: jnz     short loc_1135D
11345: mov     word_2793A, 6
1134B: mov     word_2793C, 37h ; '7'
11351: mov     word_2793E, 51h ; 'Q'
11357: mov     word_27940, 3
1135D: mov     ax, word_27B48
11360: mov     bx, word_27B4A
11364: mov     dx, word_27B4C
11368: mov     cx, 84h
1136B: xor     si, si
1136D: mov     di, 7000h
11370: call    @__Cmp$q4Realt1; Compare two reals
11375: jnz     short loc_1138F
11377: mov     word_2793A, 7
1137D: mov     word_2793C, 19h
11383: mov     word_2793E, 50h ; 'P'
11389: mov     word_27940, 17h
1138F: mov     ax, word_27B48
11392: mov     bx, word_27B4A
11396: mov     dx, word_27B4C
1139A: mov     cx, 84h
1139D: xor     si, si
1139F: mov     di, 7000h
113A2: call    @__Cmp$q4Realt1; Compare two reals
113A7: jbe     short loc_11424
113A9: call    @CLRSCR$qv; CLRSCR(void)
113AE: mov     di, offset unk_2F60A
113B1: push    ds
113B2: push    di
113B3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
113B8: mov     di, offset unk_2F60A
113BB: push    ds
113BC: push    di
113BD: mov     di, offset aGeocentricLati; "Geocentric latitude  (Deg  Min) ?   "
113C0: push    cs
113C1: push    di
113C2: xor     ax, ax
113C4: push    ax
113C5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
113CA: call    @Write$qm4Text; Write(var f: Text)
113CF: mov     di, offset unk_2F50A
113D2: push    ds
113D3: push    di
113D4: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
113D9: mov     word_2793A, ax
113DC: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
113E1: mov     word_2793C, ax
113E4: call    @Write$qm4Text; Write(var f: Text)
113E9: mov     di, offset unk_2F60A
113EC: push    ds
113ED: push    di
113EE: call    @WriteLn$qm4Text; WriteLn(var f: Text)
113F3: mov     di, offset unk_2F60A
113F6: push    ds
113F7: push    di
113F8: mov     di, offset aGeocentricLong; "Geocentric longitude (Deg  Min) ?   "
113FB: push    cs
113FC: push    di
113FD: xor     ax, ax
113FF: push    ax
11400: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11405: call    @Write$qm4Text; Write(var f: Text)
1140A: mov     di, offset unk_2F50A
1140D: push    ds
1140E: push    di
1140F: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
11414: mov     word_2793E, ax
11417: call    @Read$qm4Text7Longint; Read(var f; var v: Longint{DX:AX})
1141C: mov     word_27940, ax
1141F: call    @Write$qm4Text; Write(var f: Text)
11424: call    sub_21576
11429: mov     ax, word_27940
1142C: cwd
1142D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
11432: mov     cx, 86h
11435: xor     si, si
11437: mov     di, 7000h
1143A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1143F: push    dx
11440: push    bx
11441: push    ax
11442: mov     ax, word_2793E
11445: cwd
11446: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1144B: pop     cx
1144C: pop     si
1144D: pop     di
1144E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11453: mov     word_27C04, ax
11456: mov     word_27C06, bx
1145A: mov     word_27C08, dx
1145E: mov     ax, word_2793C
11461: cwd
11462: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
11467: mov     cx, 86h
1146A: xor     si, si
1146C: mov     di, 7000h
1146F: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11474: push    dx
11475: push    bx
11476: push    ax
11477: mov     ax, word_2793A
1147A: cwd
1147B: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
11480: pop     cx
11481: pop     si
11482: pop     di
11483: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11488: mov     word_27C0A, ax
1148B: mov     word_27C0C, bx
1148F: mov     word_27C0E, dx
11493: call    @CLRSCR$qv; CLRSCR(void)
11498: mov     word_27C52, 1E86h
1149E: mov     word_27C54, 0E0D3h
114A4: mov     word_27C56, 652Eh
114AA: mov     di, offset unk_2F60A
114AD: push    ds
114AE: push    di
114AF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
114B4: mov     di, offset unk_2F60A
114B7: push    ds
114B8: push    di
114B9: mov     di, offset aSayanaMethodOr; "\"SAYANA\"  method  or \"NRAYANA\"  met"...
114BC: push    cs
114BD: push    di
114BE: xor     ax, ax
114C0: push    ax
114C1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
114C6: call    @WriteLn$qm4Text; WriteLn(var f: Text)
114CB: mov     al, 2Fh ; '/'
114CD: push    ax
114CE: mov     al, 2
114D0: push    ax
114D1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
114D6: mov     di, offset aN; "N"
114D9: push    cs
114DA: push    di
114DB: mov     di, offset unk_27F18
114DE: push    ds
114DF: push    di
114E0: mov     ax, 0FFh
114E3: push    ax
114E4: call    @$basg$qm6Stringt14Byte; Store string
114E9: mov     di, offset unk_2F60A
114EC: push    ds
114ED: push    di
114EE: mov     di, offset unk_27F18
114F1: push    ds
114F2: push    di
114F3: xor     ax, ax
114F5: push    ax
114F6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
114FB: call    @Write$qm4Text; Write(var f: Text)
11500: mov     al, 2Fh ; '/'
11502: push    ax
11503: mov     al, 2
11505: push    ax
11506: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1150B: call    @READKEY$qv; READKEY(void)
11510: push    ax
11511: call    @UpCase$q4Char; UpCase(ch: Char): Char{AL}
11516: mov     byte_27DEA, al
11519: cmp     byte_27DEA, 0Dh
1151E: jz      short loc_1152E
11520: cmp     byte_27DEA, 4Eh ; 'N'
11525: jz      short loc_1152E
11527: cmp     byte_27DEA, 53h ; 'S'
1152C: jnz     short loc_11500
1152E: cmp     byte_27DEA, 0Dh
11533: jz      short loc_11552
11535: lea     di, [bp+var_100]
11539: push    ss
1153A: push    di
1153B: mov     al, byte_27DEA
1153E: push    ax
1153F: call    @$basg$qm6String4Char; Str:=Char
11544: mov     di, offset unk_27F18
11547: push    ds
11548: push    di
11549: mov     ax, 0FFh
1154C: push    ax
1154D: call    @$basg$qm6Stringt14Byte; Store string
11552: call    @CLRSCR$qv; CLRSCR(void)
11557: mov     ax, word_27DEE
1155A: mov     word_27F12, ax
1155D: mov     ax, word_27DF0
11560: mov     word_27F14, ax
11563: mov     ax, word_27DF2
11566: mov     word_27F16, ax
11569: mov     ax, word_27DEE
1156C: cwd
1156D: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
11572: push    dx
11573: push    bx
11574: push    ax
11575: mov     ax, word_27DF0
11578: cwd
11579: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1157E: push    dx
1157F: push    bx
11580: push    ax
11581: mov     ax, word_27DF2
11584: cwd
11585: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
1158A: push    dx
1158B: push    bx
1158C: push    ax
1158D: call    sub_2564E
11592: mov     word_27BDA, ax
11595: mov     word_27BDC, bx
11599: mov     word_27BDE, dx
1159D: mov     ax, word_27BDA
115A0: mov     bx, word_27BDC
115A4: mov     dx, word_27BDE
115A8: mov     cx, 96h
115AB: mov     si, 6400h
115AE: mov     di, 15A1h
115B1: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
115B6: mov     cx, 90h
115B9: xor     si, si
115BB: mov     di, 0EADh
115BE: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
115C3: mov     word_27BEC, ax
115C6: mov     word_27BEE, bx
115CA: mov     word_27BF0, dx
115CE: mov     ax, 366Fh
115D1: mov     bx, 982Fh
115D4: mov     dx, 5009h
115D7: mov     cx, word_27BEC
115DB: mov     si, word_27BEE
115DF: mov     di, word_27BF0
115E3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
115E8: mov     cx, word_27BEC
115EC: mov     si, word_27BEE
115F0: mov     di, word_27BF0
115F4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
115F9: mov     cx, word_27BEC
115FD: mov     si, word_27BEE
11601: mov     di, word_27BF0
11605: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1160A: push    dx
1160B: push    bx
1160C: push    ax
1160D: mov     ax, 47Dh
11610: mov     bx, 4F59h
11613: mov     dx, 3EADh
11616: mov     cx, word_27BEC
1161A: mov     si, word_27BEE
1161E: mov     di, word_27BF0
11622: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11627: mov     cx, word_27BEC
1162B: mov     si, word_27BEE
1162F: mov     di, word_27BF0
11633: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11638: push    dx
11639: push    bx
1163A: push    ax
1163B: mov     ax, 1898h
1163E: mov     bx, 0B8D0h
11641: mov     dx, 3D6h
11644: mov     cx, word_27BEC
11648: mov     si, word_27BEE
1164C: mov     di, word_27BF0
11650: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11655: mov     cx, 0FB8Fh
11658: mov     si, 173Fh
1165B: mov     di, 3C5Dh
1165E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11663: pop     cx
11664: pop     si
11665: pop     di
11666: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1166B: pop     cx
1166C: pop     si
1166D: pop     di
1166E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11673: mov     word_27BF2, ax
11676: mov     word_27BF4, bx
1167A: mov     word_27BF6, dx
1167E: mov     ax, word_27BF2
11681: mov     bx, word_27BF4
11685: mov     dx, word_27BF6
11689: mov     cx, 91h
1168C: xor     si, si
1168E: mov     di, 28C0h
11691: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11696: call    @Int$q4Real; Int(x: Real): Real
1169B: mov     cx, 91h
1169E: xor     si, si
116A0: mov     di, 28C0h
116A3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
116A8: push    dx
116A9: push    bx
116AA: push    ax
116AB: mov     ax, word_27BF2
116AE: mov     bx, word_27BF4
116B2: mov     dx, word_27BF6
116B6: pop     cx
116B7: pop     si
116B8: pop     di
116B9: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
116BE: mov     word_27BF2, ax
116C1: mov     word_27BF4, bx
116C5: mov     word_27BF6, dx
116C9: mov     ax, word_27BF2
116CC: mov     bx, word_27BF4
116D0: mov     dx, word_27BF6
116D4: xor     cx, cx
116D6: xor     si, si
116D8: xor     di, di
116DA: call    @__Cmp$q4Realt1; Compare two reals
116DF: jnb     short loc_11704
116E1: mov     ax, word_27BF2
116E4: mov     bx, word_27BF4
116E8: mov     dx, word_27BF6
116EC: mov     cx, 91h
116EF: xor     si, si
116F1: mov     di, 28C0h
116F4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
116F9: mov     word_27BF2, ax
116FC: mov     word_27BF4, bx
11700: mov     word_27BF6, dx
11704: mov     ax, word_27BF2
11707: mov     bx, word_27BF4
1170B: mov     dx, word_27BF6
1170F: mov     cx, 8Ch
11712: xor     si, si
11714: mov     di, 6100h
11717: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1171C: mov     word_27BF2, ax
1171F: mov     word_27BF4, bx
11723: mov     word_27BF6, dx
11727: mov     word_27D84, 83h
1172D: mov     word_27D86, 0
11733: mov     word_27D88, 3000h
11739: mov     ax, word_27C04
1173C: mov     bx, word_27C06
11740: mov     dx, word_27C08
11744: mov     cx, 84h
11747: xor     si, si
11749: mov     di, 7000h
1174C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11751: push    dx
11752: push    bx
11753: push    ax
11754: mov     ax, 87h
11757: xor     bx, bx
11759: mov     dx, 2500h
1175C: mov     cx, word_27C04
11760: mov     si, word_27C06
11764: mov     di, word_27C08
11768: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1176D: mov     cx, 84h
11770: xor     si, si
11772: mov     di, 7000h
11775: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1177A: push    dx
1177B: push    bx
1177C: push    ax
1177D: mov     ax, word_27BFE
11780: mov     bx, word_27C00
11784: mov     dx, word_27C02
11788: pop     cx
11789: pop     si
1178A: pop     di
1178B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11790: pop     cx
11791: pop     si
11792: pop     di
11793: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11798: mov     cx, 2578h
1179B: mov     si, 7EE7h
1179E: mov     di, 336Eh
117A1: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
117A6: push    dx
117A7: push    bx
117A8: push    ax
117A9: mov     ax, 87h
117AC: xor     bx, bx
117AE: mov     dx, 2500h
117B1: mov     cx, word_27C04
117B5: mov     si, word_27C06
117B9: mov     di, word_27C08
117BD: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
117C2: mov     cx, 84h
117C5: xor     si, si
117C7: mov     di, 7000h
117CA: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
117CF: push    dx
117D0: push    bx
117D1: push    ax
117D2: mov     ax, word_27BF2
117D5: mov     bx, word_27BF4
117D9: mov     dx, word_27BF6
117DD: mov     cx, word_27BFE
117E1: mov     si, word_27C00
117E5: mov     di, word_27C02
117E9: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
117EE: pop     cx
117EF: pop     si
117F0: pop     di
117F1: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
117F6: pop     cx
117F7: pop     si
117F8: pop     di
117F9: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
117FE: mov     word_27BF8, ax
11801: mov     word_27BFA, bx
11805: mov     word_27BFC, dx
11809: mov     ax, word_27BFE
1180C: mov     bx, word_27C00
11810: mov     dx, word_27C02
11814: mov     cx, word_27D84
11818: mov     si, word_27D86
1181C: mov     di, word_27D88
11820: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11825: mov     cx, 7481h
11828: mov     si, 0B73Fh
1182B: mov     di, 59h ; 'Y'
1182E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11833: push    dx
11834: push    bx
11835: push    ax
11836: mov     ax, word_27C04
11839: mov     bx, word_27C06
1183D: mov     dx, word_27C08
11841: mov     cx, 84h
11844: xor     si, si
11846: mov     di, 7000h
11849: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1184E: mov     cx, word_27BF2
11852: mov     si, word_27BF4
11856: mov     di, word_27BF6
1185A: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1185F: pop     cx
11860: pop     si
11861: pop     di
11862: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11867: mov     word_27BF8, ax
1186A: mov     word_27BFA, bx
1186E: mov     word_27BFC, dx
11872: mov     ax, word_27BF8
11875: mov     bx, word_27BFA
11879: mov     dx, word_27BFC
1187D: xor     cx, cx
1187F: xor     si, si
11881: xor     di, di
11883: call    @__Cmp$q4Realt1; Compare two reals
11888: jnb     short loc_118AD
1188A: mov     ax, word_27BF8
1188D: mov     bx, word_27BFA
11891: mov     dx, word_27BFC
11895: mov     cx, 85h
11898: xor     si, si
1189A: mov     di, 4000h
1189D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
118A2: mov     word_27BF8, ax
118A5: mov     word_27BFA, bx
118A9: mov     word_27BFC, dx
118AD: mov     ax, word_27BF8
118B0: mov     bx, word_27BFA
118B4: mov     dx, word_27BFC
118B8: mov     cx, 85h
118BB: xor     si, si
118BD: mov     di, 4000h
118C0: call    @__Cmp$q4Realt1; Compare two reals
118C5: jbe     short loc_118EA
118C7: mov     ax, word_27BF8
118CA: mov     bx, word_27BFA
118CE: mov     dx, word_27BFC
118D2: mov     cx, 85h
118D5: xor     si, si
118D7: mov     di, 4000h
118DA: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
118DF: mov     word_27BF8, ax
118E2: mov     word_27BFA, bx
118E6: mov     word_27BFC, dx
118EA: mov     ax, word_27BFE
118ED: mov     bx, word_27C00
118F1: mov     dx, word_27C02
118F5: mov     cx, word_27D84
118F9: mov     si, word_27D86
118FD: mov     di, word_27D88
11901: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11906: mov     word_27DDE, ax
11909: mov     word_27DE0, bx
1190D: mov     word_27DE2, dx
11911: mov     ax, word_27DDE
11914: mov     bx, word_27DE0
11918: mov     dx, word_27DE2
1191C: xor     cx, cx
1191E: xor     si, si
11920: xor     di, di
11922: call    @__Cmp$q4Realt1; Compare two reals
11927: jnb     short loc_1194C
11929: mov     ax, word_27DDE
1192C: mov     bx, word_27DE0
11930: mov     dx, word_27DE2
11934: mov     cx, 85h
11937: xor     si, si
11939: mov     di, 4000h
1193C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11941: mov     word_27DDE, ax
11944: mov     word_27DE0, bx
11948: mov     word_27DE2, dx
1194C: mov     ax, word_27BF8
1194F: mov     bx, word_27BFA
11953: mov     dx, word_27BFC
11957: mov     cx, word_27D84
1195B: mov     si, word_27D86
1195F: mov     di, word_27D88
11963: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11968: mov     word_27B42, ax
1196B: mov     word_27B44, bx
1196F: mov     word_27B46, dx
11973: mov     ax, word_27B42
11976: mov     bx, word_27B44
1197A: mov     dx, word_27B46
1197E: xor     cx, cx
11980: xor     si, si
11982: xor     di, di
11984: call    @__Cmp$q4Realt1; Compare two reals
11989: jnb     short loc_119AE
1198B: mov     ax, word_27B42
1198E: mov     bx, word_27B44
11992: mov     dx, word_27B46
11996: mov     cx, 85h
11999: xor     si, si
1199B: mov     di, 4000h
1199E: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
119A3: mov     word_27B42, ax
119A6: mov     word_27B44, bx
119AA: mov     word_27B46, dx
119AE: mov     ax, word_27C04
119B1: mov     bx, word_27C06
119B5: mov     dx, word_27C08
119B9: mov     cx, 84h
119BC: xor     si, si
119BE: mov     di, 7000h
119C1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
119C6: push    dx
119C7: push    bx
119C8: push    ax
119C9: mov     ax, word_27BFE
119CC: mov     bx, word_27C00
119D0: mov     dx, word_27C02
119D4: mov     cx, word_27D84
119D8: mov     si, word_27D86
119DC: mov     di, word_27D88
119E0: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
119E5: pop     cx
119E6: pop     si
119E7: pop     di
119E8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
119ED: mov     word_27D7E, ax
119F0: mov     word_27D80, bx
119F4: mov     word_27D82, dx
119F8: mov     ax, word_27D7E
119FB: mov     bx, word_27D80
119FF: mov     dx, word_27D82
11A03: xor     cx, cx
11A05: xor     si, si
11A07: xor     di, di
11A09: call    @__Cmp$q4Realt1; Compare two reals
11A0E: jnb     short loc_11A33
11A10: mov     ax, word_27D7E
11A13: mov     bx, word_27D80
11A17: mov     dx, word_27D82
11A1B: mov     cx, 85h
11A1E: xor     si, si
11A20: mov     di, 4000h
11A23: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11A28: mov     word_27D7E, ax
11A2B: mov     word_27D80, bx
11A2F: mov     word_27D82, dx
11A33: call    sub_18760
11A38: mov     ax, word_27BFE
11A3B: mov     bx, word_27C00
11A3F: mov     dx, word_27C02
11A43: mov     cx, word_27D84
11A47: mov     si, word_27D86
11A4B: mov     di, word_27D88
11A4F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11A54: mov     cx, 85h
11A57: xor     si, si
11A59: mov     di, 4000h
11A5C: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11A61: mov     cx, word_27BDA
11A65: mov     si, word_27BDC
11A69: mov     di, word_27BDE
11A6D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11A72: mov     word_27BE0, ax
11A75: mov     word_27BE2, bx
11A79: mov     word_27BE4, dx
11A7D: mov     ax, word_27BE0
11A80: mov     bx, word_27BE2
11A84: mov     dx, word_27BE4
11A88: mov     cx, 96h
11A8B: mov     si, 0B200h
11A8E: mov     di, 1366h
11A91: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11A96: mov     word_27C70, ax
11A99: mov     word_27C72, bx
11A9D: mov     word_27C74, dx
11AA1: mov     ax, word_27C70
11AA4: mov     bx, word_27C72
11AA8: mov     dx, word_27C74
11AAC: mov     cx, 89h
11AAF: xor     si, si
11AB1: mov     di, 3680h
11AB4: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11AB9: mov     cx, 81h
11ABC: xor     si, si
11ABE: xor     di, di
11AC0: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11AC5: mov     cx, 0E273h
11AC8: mov     si, 0E392h
11ACB: mov     di, 694Eh
11ACE: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11AD3: mov     cx, 0BB86h
11AD6: mov     si, 8DB8h
11AD9: mov     di, 4906h
11ADC: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11AE1: mov     cx, word_27C70
11AE5: mov     si, word_27C72
11AE9: mov     di, word_27C74
11AED: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11AF2: mov     cx, 95h
11AF5: mov     si, 8000h
11AF8: mov     di, 2066h
11AFB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11B00: mov     cx, 2985h
11B03: mov     si, 0C7C7h
11B06: mov     di, 336Bh
11B09: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11B0E: mov     word_27C76, ax
11B11: mov     word_27C78, bx
11B15: mov     word_27C7A, dx
11B19: mov     word_27D1E, 81h
11B1F: mov     word_27D20, 0
11B25: mov     word_27D22, 0
11B2B: mov     di, offset unk_27F18
11B2E: push    ds
11B2F: push    di
11B30: mov     di, offset aN; "N"
11B33: push    cs
11B34: push    di
11B35: call    @$bsub$qm6Stringt1; Compare two strings
11B3A: jnz     short loc_11B55
11B3C: mov     di, offset unk_2F60A
11B3F: push    ds
11B40: push    di
11B41: mov     di, offset aNirayanaTableO; "                            NIRAYANA  T"...
11B44: push    cs
11B45: push    di
11B46: xor     ax, ax
11B48: push    ax
11B49: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11B4E: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11B53: jmp     short loc_11B6C
11B55: mov     di, offset unk_2F60A
11B58: push    ds
11B59: push    di
11B5A: mov     di, offset aSayanaTableOfH; "                        SAYANA   TABLE "...
11B5D: push    cs
11B5E: push    di
11B5F: xor     ax, ax
11B61: push    ax
11B62: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11B67: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11B6C: mov     di, offset unk_2F60A
11B6F: push    ds
11B70: push    di
11B71: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11B76: mov     di, offset unk_2F60A
11B79: push    ds
11B7A: push    di
11B7B: mov     di, offset aPlanetLongitud; "PLANET      LONGITUDE    NEKETH   PADA "...
11B7E: push    cs
11B7F: push    di
11B80: xor     ax, ax
11B82: push    ax
11B83: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11B88: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11B8D: mov     di, offset unk_2F60A
11B90: push    ds
11B91: push    di
11B92: mov     di, offset asc_103D2; "_______________________________________"...
11B95: push    cs
11B96: push    di
11B97: xor     ax, ax
11B99: push    ax
11B9A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11B9F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11BA4: mov     di, offset unk_27F18
11BA7: push    ds
11BA8: push    di
11BA9: mov     di, offset aN; "N"
11BAC: push    cs
11BAD: push    di
11BAE: call    @$bsub$qm6Stringt1; Compare two strings
11BB3: jnz     short loc_11BDE
11BB5: mov     ax, word_27C88
11BB8: mov     bx, word_27C8A
11BBC: mov     dx, word_27C8C
11BC0: mov     cx, word_27C76
11BC4: mov     si, word_27C78
11BC8: mov     di, word_27C7A
11BCC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11BD1: mov     word_27B8C, ax
11BD4: mov     word_27B8E, bx
11BD8: mov     word_27B90, dx
11BDC: jmp     short loc_11BF4
11BDE: mov     ax, word_27C88
11BE1: mov     bx, word_27C8A
11BE5: mov     dx, word_27C8C
11BE9: mov     word_27B8C, ax
11BEC: mov     word_27B8E, bx
11BF0: mov     word_27B90, dx
11BF4: mov     word_27E04, 1
11BFA: mov     di, offset unk_2F60A
11BFD: push    ds
11BFE: push    di
11BFF: mov     di, offset aLagna; "Lagna "
11C02: push    cs
11C03: push    di
11C04: xor     ax, ax
11C06: push    ax
11C07: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11C0C: call    @Write$qm4Text; Write(var f: Text)
11C11: mov     ax, word_27B8C
11C14: mov     bx, word_27B8E
11C18: mov     dx, word_27B90
11C1C: xor     cx, cx
11C1E: xor     si, si
11C20: xor     di, di
11C22: call    @__Cmp$q4Realt1; Compare two reals
11C27: jnb     short loc_11C4C
11C29: mov     ax, word_27B8C
11C2C: mov     bx, word_27B8E
11C30: mov     dx, word_27B90
11C34: mov     cx, 89h
11C37: xor     si, si
11C39: mov     di, 3400h
11C3C: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11C41: mov     word_27B8C, ax
11C44: mov     word_27B8E, bx
11C48: mov     word_27B90, dx
11C4C: mov     ax, word_27B8C
11C4F: mov     bx, word_27B8E
11C53: mov     dx, word_27B90
11C57: mov     word_27B6E, ax
11C5A: mov     word_27B70, bx
11C5E: mov     word_27B72, dx
11C62: mov     ax, word_27B8C
11C65: mov     bx, word_27B8E
11C69: mov     dx, word_27B90
11C6D: mov     word_27D24, ax
11C70: mov     word_27D26, bx
11C74: mov     word_27D28, dx
11C78: call    sub_21EE1
11C7D: mov     di, offset unk_2F60A
11C80: push    ds
11C81: push    di
11C82: mov     di, offset asc_10426; "  "
11C85: push    cs
11C86: push    di
11C87: xor     ax, ax
11C89: push    ax
11C8A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
11C8F: call    @Write$qm4Text; Write(var f: Text)
11C94: call    sub_23A58
11C99: mov     ax, word_27DFC
11C9C: mov     word_27DFA, ax
11C9F: mov     di, offset unk_28018
11CA2: push    ds
11CA3: push    di
11CA4: mov     di, offset unk_28218
11CA7: push    ds
11CA8: push    di
11CA9: mov     ax, 0FFh
11CAC: push    ax
11CAD: call    @$basg$qm6Stringt14Byte; Store string
11CB2: mov     di, offset unk_28118
11CB5: push    ds
11CB6: push    di
11CB7: mov     di, offset unk_28F18
11CBA: push    ds
11CBB: push    di
11CBC: mov     ax, 0FFh
11CBF: push    ax
11CC0: call    @$basg$qm6Stringt14Byte; Store string
11CC5: mov     ax, word_27DF4
11CC8: mov     word_27938, ax
11CCB: mov     di, offset unk_2C218
11CCE: push    ds
11CCF: push    di
11CD0: mov     di, offset unk_2B518
11CD3: push    ds
11CD4: push    di
11CD5: mov     ax, 0FFh
11CD8: push    ax
11CD9: call    @$basg$qm6Stringt14Byte; Store string
11CDE: mov     di, offset unk_2D018
11CE1: push    ds
11CE2: push    di
11CE3: mov     di, offset unk_2C318
11CE6: push    ds
11CE7: push    di
11CE8: mov     ax, 0FFh
11CEB: push    ax
11CEC: call    @$basg$qm6Stringt14Byte; Store string
11CF1: mov     di, offset unk_2DE18
11CF4: push    ds
11CF5: push    di
11CF6: mov     di, offset unk_2D118
11CF9: push    ds
11CFA: push    di
11CFB: mov     ax, 0FFh
11CFE: push    ax
11CFF: call    @$basg$qm6Stringt14Byte; Store string
11D04: mov     di, offset unk_2EC18
11D07: push    ds
11D08: push    di
11D09: mov     di, offset unk_2DF18
11D0C: push    ds
11D0D: push    di
11D0E: mov     ax, 0FFh
11D11: push    ax
11D12: call    @$basg$qm6Stringt14Byte; Store string
11D17: mov     di, offset unk_2F60A
11D1A: push    ds
11D1B: push    di
11D1C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
11D21: xor     ax, ax
11D23: mov     word_27E04, ax
11D26: mov     ax, word_27BE0
11D29: mov     bx, word_27BE2
11D2D: mov     dx, word_27BE4
11D31: mov     cx, 96h
11D34: mov     si, 0B000h
11D37: mov     di, 1366h
11D3A: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11D3F: mov     cx, 90h
11D42: xor     si, si
11D44: mov     di, 0EADh
11D47: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11D4C: mov     word_27C4C, ax
11D4F: mov     word_27C4E, bx
11D53: mov     word_27C50, dx
11D57: mov     ax, 3875h
11D5A: mov     bx, 0DCDBh
11D5D: mov     dx, 1E98h
11D60: mov     cx, word_27C4C
11D64: mov     si, word_27C4E
11D68: mov     di, word_27C50
11D6C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11D71: mov     cx, word_27C4C
11D75: mov     si, word_27C4E
11D79: mov     di, word_27C50
11D7D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11D82: push    dx
11D83: push    bx
11D84: push    ax
11D85: mov     ax, 0F190h
11D88: mov     bx, 0C4D7h
11D8B: mov     dx, 0CA0h
11D8E: mov     cx, word_27C4C
11D92: mov     si, word_27C4E
11D96: mov     di, word_27C50
11D9A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11D9F: mov     cx, 6C89h
11DA2: mov     si, 2CCFh
11DA5: mov     di, 0BD9h
11DA8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11DAD: pop     cx
11DAE: pop     si
11DAF: pop     di
11DB0: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11DB5: mov     word_27C2E, ax
11DB8: mov     word_27C30, bx
11DBC: mov     word_27C32, dx
11DC0: mov     ax, word_27C2E
11DC3: mov     bx, word_27C30
11DC7: mov     dx, word_27C32
11DCB: mov     cx, 89h
11DCE: xor     si, si
11DD0: mov     di, 3400h
11DD3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11DD8: call    @Int$q4Real; Int(x: Real): Real
11DDD: push    dx
11DDE: push    bx
11DDF: push    ax
11DE0: mov     ax, word_27C2E
11DE3: mov     bx, word_27C30
11DE7: mov     dx, word_27C32
11DEB: mov     cx, 89h
11DEE: xor     si, si
11DF0: mov     di, 3400h
11DF3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11DF8: pop     cx
11DF9: pop     si
11DFA: pop     di
11DFB: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11E00: mov     cx, 89h
11E03: xor     si, si
11E05: mov     di, 3400h
11E08: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E0D: mov     word_27C2E, ax
11E10: mov     word_27C30, bx
11E14: mov     word_27C32, dx
11E18: mov     ax, 956Eh
11E1B: mov     bx, 917Ch
11E1E: mov     dx, 5D75h
11E21: mov     cx, word_27C4C
11E25: mov     si, word_27C4E
11E29: mov     di, word_27C50
11E2D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E32: mov     cx, word_27C4C
11E36: mov     si, word_27C4E
11E3A: mov     di, word_27C50
11E3E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E43: mov     cx, word_27C4C
11E47: mov     si, word_27C4E
11E4B: mov     di, word_27C50
11E4F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E54: push    dx
11E55: push    bx
11E56: push    ax
11E57: mov     ax, 0AA74h
11E5A: mov     bx, 5182h
11E5D: mov     dx, 1D49h
11E60: mov     cx, word_27C4C
11E64: mov     si, word_27C4E
11E68: mov     di, word_27C50
11E6C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E71: mov     cx, word_27C4C
11E75: mov     si, word_27C4E
11E79: mov     di, word_27C50
11E7D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E82: push    dx
11E83: push    bx
11E84: push    ax
11E85: mov     ax, 6A90h
11E88: mov     bx, 0CBCh
11E8B: mov     dx, 0C9Fh
11E8E: mov     cx, word_27C4C
11E92: mov     si, word_27C4E
11E96: mov     di, word_27C50
11E9A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11E9F: mov     cx, 5889h
11EA2: mov     si, 0E7FFh
11EA5: mov     di, 333Ch
11EA8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
11EAD: pop     cx
11EAE: pop     si
11EAF: pop     di
11EB0: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11EB5: pop     cx
11EB6: pop     si
11EB7: pop     di
11EB8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11EBD: mov     word_27C34, ax
11EC0: mov     word_27C36, bx
11EC4: mov     word_27C38, dx
11EC8: mov     ax, word_27C34
11ECB: mov     bx, word_27C36
11ECF: mov     dx, word_27C38
11ED3: mov     cx, 89h
11ED6: xor     si, si
11ED8: mov     di, 3400h
11EDB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11EE0: call    @Int$q4Real; Int(x: Real): Real
11EE5: push    dx
11EE6: push    bx
11EE7: push    ax
11EE8: mov     ax, word_27C34
11EEB: mov     bx, word_27C36
11EEF: mov     dx, word_27C38
11EF3: mov     cx, 89h
11EF6: xor     si, si
11EF8: mov     di, 3400h
11EFB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11F00: pop     cx
11F01: pop     si
11F02: pop     di
11F03: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11F08: mov     cx, 89h
11F0B: xor     si, si
11F0D: mov     di, 3400h
11F10: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11F15: mov     word_27C34, ax
11F18: mov     word_27C36, bx
11F1C: mov     word_27C38, dx
11F20: mov     ax, 326Ah
11F23: mov     bx, 9DC4h
11F26: mov     dx, 74Ah
11F29: mov     cx, word_27C4C
11F2D: mov     si, word_27C4E
11F31: mov     di, word_27C50
11F35: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11F3A: mov     cx, word_27C4C
11F3E: mov     si, word_27C4E
11F42: mov     di, word_27C50
11F46: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11F4B: push    dx
11F4C: push    bx
11F4D: push    ax
11F4E: mov     ax, 0A072h
11F51: mov     bx, 6882h
11F54: mov     dx, 2F52h
11F57: mov     cx, word_27C4C
11F5B: mov     si, word_27C4E
11F5F: mov     di, word_27C50
11F63: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11F68: push    dx
11F69: push    bx
11F6A: push    ax
11F6B: mov     ax, 2B7Bh
11F6E: mov     bx, 7A1Fh
11F71: mov     dx, 939h
11F74: pop     cx
11F75: pop     si
11F76: pop     di
11F77: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11F7C: pop     cx
11F7D: pop     si
11F7E: pop     di
11F7F: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
11F84: mov     word_27C82, ax
11F87: mov     word_27C84, bx
11F8B: mov     word_27C86, dx
11F8F: mov     ax, 82h
11F92: xor     bx, bx
11F94: mov     dx, 4000h
11F97: mov     cx, word_27C34
11F9B: mov     si, word_27C36
11F9F: mov     di, word_27C38
11FA3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11FA8: mov     cx, word_27C52
11FAC: mov     si, word_27C54
11FB0: mov     di, word_27C56
11FB4: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11FB9: call    @Cos$q4Real; Cos(x: Real): Real
11FBE: mov     cx, 8275h
11FC1: mov     si, 0CB57h
11FC4: mov     di, 199Dh
11FC7: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11FCC: push    dx
11FCD: push    bx
11FCE: push    ax
11FCF: mov     ax, 82h
11FD2: xor     bx, bx
11FD4: xor     dx, dx
11FD6: mov     cx, word_27C34
11FDA: mov     si, word_27C36
11FDE: mov     di, word_27C38
11FE2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
11FE7: mov     cx, word_27C52
11FEB: mov     si, word_27C54
11FEF: mov     di, word_27C56
11FF3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
11FF8: call    @Cos$q4Real; Cos(x: Real): Real
11FFD: push    dx
11FFE: push    bx
11FFF: push    ax
12000: mov     ax, 0E273h
12003: mov     bx, 1758h
12006: mov     dx, 51B7h
12009: mov     cx, word_27C4C
1200D: mov     si, word_27C4E
12011: mov     di, word_27C50
12015: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1201A: push    dx
1201B: push    bx
1201C: push    ax
1201D: mov     ax, 117Bh
12020: mov     bx, 2C1Bh
12023: mov     dx, 249Ch
12026: pop     cx
12027: pop     si
12028: pop     di
12029: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1202E: pop     cx
1202F: pop     si
12030: pop     di
12031: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12036: push    dx
12037: push    bx
12038: push    ax
12039: mov     ax, word_27C34
1203C: mov     bx, word_27C36
12040: mov     dx, word_27C38
12044: mov     cx, word_27C52
12048: mov     si, word_27C54
1204C: mov     di, word_27C56
12050: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12055: call    @Cos$q4Real; Cos(x: Real): Real
1205A: push    dx
1205B: push    bx
1205C: push    ax
1205D: mov     ax, 0F370h
12060: mov     bx, 8AC9h
12063: mov     dx, 6AE1h
12066: mov     cx, word_27C4C
1206A: mov     si, word_27C4E
1206E: mov     di, word_27C50
12072: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12077: mov     cx, word_27C4C
1207B: mov     si, word_27C4E
1207F: mov     di, word_27C50
12083: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12088: push    dx
12089: push    bx
1208A: push    ax
1208B: mov     ax, 0B679h
1208E: mov     bx, 0B30h
12091: mov     dx, 1CEDh
12094: mov     cx, word_27C4C
12098: mov     si, word_27C4E
1209C: mov     di, word_27C50
120A0: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
120A5: push    dx
120A6: push    bx
120A7: push    ax
120A8: mov     ax, 0FD81h
120AB: mov     bx, 0DD82h
120AE: mov     dx, 75B0h
120B1: pop     cx
120B2: pop     si
120B3: pop     di
120B4: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
120B9: pop     cx
120BA: pop     si
120BB: pop     di
120BC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
120C1: pop     cx
120C2: pop     si
120C3: pop     di
120C4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
120C9: pop     cx
120CA: pop     si
120CB: pop     di
120CC: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
120D1: pop     cx
120D2: pop     si
120D3: pop     di
120D4: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
120D9: mov     word_27C3A, ax
120DC: mov     word_27C3C, bx
120E0: mov     word_27C3E, dx
120E4: mov     ax, word_27C2E
120E7: mov     bx, word_27C30
120EB: mov     dx, word_27C32
120EF: mov     cx, word_27C3A
120F3: mov     si, word_27C3C
120F7: mov     di, word_27C3E
120FB: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12100: mov     word_27C40, ax
12103: mov     word_27C42, bx
12107: mov     word_27C44, dx
1210B: mov     ax, word_27C34
1210E: mov     bx, word_27C36
12112: mov     dx, word_27C38
12116: mov     cx, word_27C3A
1211A: mov     si, word_27C3C
1211E: mov     di, word_27C3E
12122: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12127: mov     word_27C46, ax
1212A: mov     word_27C48, bx
1212E: mov     word_27C4A, dx
12132: mov     ax, 9A85h
12135: mov     bx, 9999h
12138: mov     dx, 3B99h
1213B: mov     cx, word_27C52
1213F: mov     si, word_27C54
12143: mov     di, word_27C56
12147: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1214C: call    @Cos$q4Real; Cos(x: Real): Real
12151: push    dx
12152: push    bx
12153: push    ax
12154: mov     ax, word_27C40
12157: mov     bx, word_27C42
1215B: mov     dx, word_27C44
1215F: mov     cx, word_27C52
12163: mov     si, word_27C54
12167: mov     di, word_27C56
1216B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12170: call    @Cos$q4Real; Cos(x: Real): Real
12175: pop     cx
12176: pop     si
12177: pop     di
12178: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1217D: push    dx
1217E: push    bx
1217F: push    ax
12180: call    sub_260ED
12185: mov     cx, word_27C52
12189: mov     si, word_27C54
1218D: mov     di, word_27C56
12191: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12196: mov     word_27DA8, ax
12199: mov     word_27DAA, bx
1219D: mov     word_27DAC, dx
121A1: mov     ax, word_27DA8
121A4: mov     bx, word_27DAA
121A8: mov     dx, word_27DAC
121AC: mov     cx, word_27C52
121B0: mov     si, word_27C54
121B4: mov     di, word_27C56
121B8: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
121BD: call    far ptr @Sin$q4Real; Sin(x: Real): Real
121C2: push    dx
121C3: push    bx
121C4: push    ax
121C5: mov     ax, word_27C0A
121C8: mov     bx, word_27C0C
121CC: mov     dx, word_27C0E
121D0: mov     cx, word_27C52
121D4: mov     si, word_27C54
121D8: mov     di, word_27C56
121DC: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
121E1: call    far ptr @Sin$q4Real; Sin(x: Real): Real
121E6: pop     cx
121E7: pop     si
121E8: pop     di
121E9: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
121EE: push    dx
121EF: push    bx
121F0: push    ax
121F1: mov     ax, 0AB87h
121F4: mov     bx, 0AAAAh
121F7: mov     dx, 35AAh
121FA: mov     cx, word_27C52
121FE: mov     si, word_27C54
12202: mov     di, word_27C56
12206: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1220B: call    far ptr @Sin$q4Real; Sin(x: Real): Real
12210: pop     cx
12211: pop     si
12212: pop     di
12213: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12218: mov     word_27DD8, ax
1221B: mov     word_27DDA, bx
1221F: mov     word_27DDC, dx
12223: mov     ax, word_27DA8
12226: mov     bx, word_27DAA
1222A: mov     dx, word_27DAC
1222E: mov     cx, word_27C52
12232: mov     si, word_27C54
12236: mov     di, word_27C56
1223A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1223F: push    dx
12240: push    bx
12241: push    ax
12242: call    sub_25F30
12247: push    dx
12248: push    bx
12249: push    ax
1224A: mov     ax, word_27C0A
1224D: mov     bx, word_27C0C
12251: mov     dx, word_27C0E
12255: mov     cx, word_27C52
12259: mov     si, word_27C54
1225D: mov     di, word_27C56
12261: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12266: push    dx
12267: push    bx
12268: push    ax
12269: call    sub_25F30
1226E: mov     cx, 81h
12271: xor     si, si
12273: mov     di, 8000h
12276: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1227B: pop     cx
1227C: pop     si
1227D: pop     di
1227E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12283: mov     cx, word_27DD8
12287: mov     si, word_27DDA
1228B: mov     di, word_27DDC
1228F: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12294: push    dx
12295: push    bx
12296: push    ax
12297: call    sub_26011
1229C: mov     cx, word_27C52
122A0: mov     si, word_27C54
122A4: mov     di, word_27C56
122A8: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
122AD: mov     cx, 84h
122B0: xor     si, si
122B2: mov     di, 7000h
122B5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
122BA: push    dx
122BB: push    bx
122BC: push    ax
122BD: mov     ax, 84h
122C0: xor     bx, bx
122C2: mov     dx, 4000h
122C5: pop     cx
122C6: pop     si
122C7: pop     di
122C8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
122CD: mov     word_27DAE, ax
122D0: mov     word_27DB0, bx
122D4: mov     word_27DB2, dx
122D8: mov     ax, word_27DEE
122DB: cwd
122DC: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
122E1: push    dx
122E2: push    bx
122E3: push    ax
122E4: mov     ax, 81h
122E7: xor     bx, bx
122E9: xor     dx, dx
122EB: push    dx
122EC: push    bx
122ED: push    ax
122EE: xor     ax, ax
122F0: xor     bx, bx
122F2: xor     dx, dx
122F4: push    dx
122F5: push    bx
122F6: push    ax
122F7: call    sub_2564E
122FC: mov     word_27DC0, ax
122FF: mov     word_27DC2, bx
12303: mov     word_27DC4, dx
12307: mov     ax, word_27DC0
1230A: mov     bx, word_27DC2
1230E: mov     dx, word_27DC4
12312: mov     cx, 80h
12315: xor     si, si
12317: xor     di, di
12319: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1231E: mov     word_27DC0, ax
12321: mov     word_27DC2, bx
12325: mov     word_27DC4, dx
12329: mov     ax, word_27BE0
1232C: mov     bx, word_27BE2
12330: mov     dx, word_27BE4
12334: mov     cx, word_27DC0
12338: mov     si, word_27DC2
1233C: mov     di, word_27DC4
12340: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12345: mov     word_27DC6, ax
12348: mov     word_27DC8, bx
1234C: mov     word_27DCA, dx
12350: mov     ax, word_27DC6
12353: mov     bx, word_27DC8
12357: mov     dx, word_27DCA
1235B: mov     cx, 81h
1235E: xor     si, si
12360: xor     di, di
12362: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12367: mov     cx, 2183h
1236A: mov     si, 0DAA2h
1236D: mov     di, 490Fh
12370: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12375: mov     cx, 89h
12378: xor     si, si
1237A: mov     di, 3680h
1237D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12382: mov     word_27DCC, ax
12385: mov     word_27DCE, bx
12389: mov     word_27DD0, dx
1238D: mov     ax, 82h
12390: xor     bx, bx
12392: xor     dx, dx
12394: mov     cx, word_27DCC
12398: mov     si, word_27DCE
1239C: mov     di, word_27DD0
123A0: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
123A5: call    @Cos$q4Real; Cos(x: Real): Real
123AA: mov     cx, 0BC7Ch
123AD: mov     si, 45CBh
123B0: mov     di, 277Ch
123B3: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
123B8: push    dx
123B9: push    bx
123BA: push    ax
123BB: mov     ax, 82h
123BE: xor     bx, bx
123C0: xor     dx, dx
123C2: mov     cx, word_27DCC
123C6: mov     si, word_27DCE
123CA: mov     di, word_27DD0
123CE: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
123D3: call    far ptr @Sin$q4Real; Sin(x: Real): Real
123D8: mov     cx, 0FD7Ah
123DB: mov     si, 0C0C1h
123DE: mov     di, 6F73h
123E1: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
123E6: push    dx
123E7: push    bx
123E8: push    ax
123E9: mov     ax, word_27DCC
123EC: mov     bx, word_27DCE
123F0: mov     dx, word_27DD0
123F4: call    @Cos$q4Real; Cos(x: Real): Real
123F9: mov     cx, 437Ch
123FC: mov     si, 2C1Fh
123FF: mov     di, 363h
12402: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12407: push    dx
12408: push    bx
12409: push    ax
1240A: mov     ax, word_27DCC
1240D: mov     bx, word_27DCE
12411: mov     dx, word_27DD0
12415: call    far ptr @Sin$q4Real; Sin(x: Real): Real
1241A: mov     cx, 5F77h
1241D: mov     si, 0ADD1h
12420: mov     di, 74D7h
12423: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12428: mov     cx, 0AA73h
1242B: mov     si, 5182h
1242E: mov     di, 1D49h
12431: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12436: pop     cx
12437: pop     si
12438: pop     di
12439: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1243E: pop     cx
1243F: pop     si
12440: pop     di
12441: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12446: pop     cx
12447: pop     si
12448: pop     di
12449: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1244E: mov     cx, 0E188h
12451: mov     si, 147Ah
12454: mov     di, 652Eh
12457: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1245C: mov     word_27DB4, ax
1245F: mov     word_27DB6, bx
12463: mov     word_27DB8, dx
12467: mov     ax, word_27DB4
1246A: mov     bx, word_27DB6
1246E: mov     dx, word_27DB8
12472: mov     cx, 86h
12475: xor     si, si
12477: mov     di, 7000h
1247A: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1247F: mov     word_27DB4, ax
12482: mov     word_27DB6, bx
12486: mov     word_27DB8, dx
1248A: mov     ax, word_27C04
1248D: mov     bx, word_27C06
12491: mov     dx, word_27C08
12495: mov     cx, 84h
12498: xor     si, si
1249A: mov     di, 7000h
1249D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
124A2: push    dx
124A3: push    bx
124A4: push    ax
124A5: mov     ax, word_27D84
124A8: mov     bx, word_27D86
124AC: mov     dx, word_27D88
124B0: pop     cx
124B1: pop     si
124B2: pop     di
124B3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
124B8: push    dx
124B9: push    bx
124BA: push    ax
124BB: mov     ax, word_27DAE
124BE: mov     bx, word_27DB0
124C2: mov     dx, word_27DB2
124C6: mov     cx, word_27DB4
124CA: mov     si, word_27DB6
124CE: mov     di, word_27DB8
124D2: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
124D7: pop     cx
124D8: pop     si
124D9: pop     di
124DA: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
124DF: mov     word_27DBA, ax
124E2: mov     word_27DBC, bx
124E6: mov     word_27DBE, dx
124EA: mov     ax, word_27BFE
124ED: mov     bx, word_27C00
124F1: mov     dx, word_27C02
124F5: mov     cx, word_27DBA
124F9: mov     si, word_27DBC
124FD: mov     di, word_27DBE
12501: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12506: mov     cx, 82h
12509: xor     si, si
1250B: mov     di, 2000h
1250E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12513: call    @Round$q4Real; Round(x: Real): Longint
12518: mov     word_27E02, ax
1251B: mov     ax, word_27BFE
1251E: mov     bx, word_27C00
12522: mov     dx, word_27C02
12526: mov     cx, word_27DBA
1252A: mov     si, word_27DBC
1252E: mov     di, word_27DBE
12532: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12537: mov     cx, 82h
1253A: xor     si, si
1253C: mov     di, 2000h
1253F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12544: mov     word_27DD2, ax
12547: mov     word_27DD4, bx
1254B: mov     word_27DD6, dx
1254F: mov     ax, word_27DD2
12552: mov     bx, word_27DD4
12556: mov     dx, word_27DD6
1255A: xor     cx, cx
1255C: xor     si, si
1255E: xor     di, di
12560: call    @__Cmp$q4Realt1; Compare two reals
12565: jnb     short loc_1258A
12567: mov     ax, word_27DD2
1256A: mov     bx, word_27DD4
1256E: mov     dx, word_27DD6
12572: mov     cx, 86h
12575: xor     si, si
12577: mov     di, 7000h
1257A: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1257F: mov     word_27DD2, ax
12582: mov     word_27DD4, bx
12586: mov     word_27DD6, dx
1258A: mov     byte_2ED18, 1
1258F: mov     ax, 5B93h
12592: mov     bx, 7C42h
12595: mov     dx, 6AFEh
12598: mov     cx, word_27C4C
1259C: mov     si, word_27C4E
125A0: mov     di, word_27C50
125A4: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
125A9: mov     cx, 9B89h
125AC: mov     si, 92AFh
125AF: mov     di, 737h
125B2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
125B7: mov     word_27C16, ax
125BA: mov     word_27C18, bx
125BE: mov     word_27C1A, dx
125C2: mov     ax, word_27C16
125C5: mov     bx, word_27C18
125C9: mov     dx, word_27C1A
125CD: mov     cx, 89h
125D0: xor     si, si
125D2: mov     di, 3400h
125D5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
125DA: call    @Int$q4Real; Int(x: Real): Real
125DF: push    dx
125E0: push    bx
125E1: push    ax
125E2: mov     ax, word_27C16
125E5: mov     bx, word_27C18
125E9: mov     dx, word_27C1A
125ED: mov     cx, 89h
125F0: xor     si, si
125F2: mov     di, 3400h
125F5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
125FA: pop     cx
125FB: pop     si
125FC: pop     di
125FD: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12602: mov     cx, 89h
12605: xor     si, si
12607: mov     di, 3400h
1260A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1260F: mov     word_27C16, ax
12612: mov     word_27C18, bx
12616: mov     word_27C1A, dx
1261A: mov     ax, 0D493h
1261D: mov     bx, 0DB2Bh
12620: mov     dx, 6901h
12623: mov     cx, word_27C4C
12627: mov     si, word_27C4E
1262B: mov     di, word_27C50
1262F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12634: mov     cx, 8189h
12637: mov     si, 63CBh
1263A: mov     di, 140Dh
1263D: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12642: mov     word_27C1C, ax
12645: mov     word_27C1E, bx
12649: mov     word_27C20, dx
1264D: mov     ax, word_27C1C
12650: mov     bx, word_27C1E
12654: mov     dx, word_27C20
12658: mov     cx, 89h
1265B: xor     si, si
1265D: mov     di, 3400h
12660: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12665: call    @Int$q4Real; Int(x: Real): Real
1266A: push    dx
1266B: push    bx
1266C: push    ax
1266D: mov     ax, word_27C1C
12670: mov     bx, word_27C1E
12674: mov     dx, word_27C20
12678: mov     cx, 89h
1267B: xor     si, si
1267D: mov     di, 3400h
12680: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12685: pop     cx
12686: pop     si
12687: pop     di
12688: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1268D: mov     cx, 89h
12690: xor     si, si
12692: mov     di, 3400h
12695: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1269A: mov     word_27C1C, ax
1269D: mov     word_27C1E, bx
126A1: mov     word_27C20, dx
126A5: mov     ax, 8793h
126A8: mov     bx, 63A7h
126AB: mov     dx, 596Ah
126AE: mov     cx, word_27C4C
126B2: mov     si, word_27C4E
126B6: mov     di, word_27C50
126BA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
126BF: mov     cx, 0F689h
126C2: mov     si, 65F0h
126C5: mov     di, 2F5Eh
126C8: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
126CD: mov     word_27C22, ax
126D0: mov     word_27C24, bx
126D4: mov     word_27C26, dx
126D8: mov     ax, word_27C22
126DB: mov     bx, word_27C24
126DF: mov     dx, word_27C26
126E3: mov     cx, 89h
126E6: xor     si, si
126E8: mov     di, 3400h
126EB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
126F0: call    @Int$q4Real; Int(x: Real): Real
126F5: push    dx
126F6: push    bx
126F7: push    ax
126F8: mov     ax, word_27C22
126FB: mov     bx, word_27C24
126FF: mov     dx, word_27C26
12703: mov     cx, 89h
12706: xor     si, si
12708: mov     di, 3400h
1270B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12710: pop     cx
12711: pop     si
12712: pop     di
12713: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12718: mov     cx, 89h
1271B: xor     si, si
1271D: mov     di, 3400h
12720: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12725: mov     word_27C22, ax
12728: mov     word_27C24, bx
1272C: mov     word_27C26, dx
12730: mov     ax, 82h
12733: xor     bx, bx
12735: xor     dx, dx
12737: mov     cx, word_27C1C
1273B: mov     si, word_27C1E
1273F: mov     di, word_27C20
12743: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12748: mov     cx, word_27C52
1274C: mov     si, word_27C54
12750: mov     di, word_27C56
12754: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12759: call    @Cos$q4Real; Cos(x: Real): Real
1275E: mov     cx, 9C7Eh
12761: mov     si, 2717h
12764: mov     di, 5ABEh
12767: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1276C: push    dx
1276D: push    bx
1276E: push    ax
1276F: mov     ax, 82h
12772: xor     bx, bx
12774: xor     dx, dx
12776: mov     cx, word_27C22
1277A: mov     si, word_27C24
1277E: mov     di, word_27C26
12782: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12787: mov     cx, word_27C52
1278B: mov     si, word_27C54
1278F: mov     di, word_27C56
12793: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12798: call    @Cos$q4Real; Cos(x: Real): Real
1279D: mov     cx, 0A880h
127A0: mov     si, 691Eh
127A3: mov     di, 2F70h
127A6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
127AB: push    dx
127AC: push    bx
127AD: push    ax
127AE: mov     ax, word_27C1C
127B1: mov     bx, word_27C1E
127B5: mov     dx, word_27C20
127B9: mov     cx, word_27C52
127BD: mov     si, word_27C54
127C1: mov     di, word_27C56
127C5: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
127CA: push    dx
127CB: push    bx
127CC: push    ax
127CD: mov     ax, 82h
127D0: xor     bx, bx
127D2: xor     dx, dx
127D4: mov     cx, word_27C22
127D8: mov     si, word_27C24
127DC: mov     di, word_27C26
127E0: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
127E5: mov     cx, word_27C52
127E9: mov     si, word_27C54
127ED: mov     di, word_27C56
127F1: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
127F6: pop     cx
127F7: pop     si
127F8: pop     di
127F9: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
127FE: call    @Cos$q4Real; Cos(x: Real): Real
12803: mov     cx, 4281h
12806: mov     si, 596h
12809: mov     di, 2313h
1280C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12811: push    dx
12812: push    bx
12813: push    ax
12814: mov     ax, word_27C1C
12817: mov     bx, word_27C1E
1281B: mov     dx, word_27C20
1281F: mov     cx, word_27C52
12823: mov     si, word_27C54
12827: mov     di, word_27C56
1282B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12830: call    @Cos$q4Real; Cos(x: Real): Real
12835: mov     cx, 0D783h
12838: mov     si, 70A3h
1283B: mov     di, 493Dh
1283E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12843: mov     cx, word_27C16
12847: mov     si, word_27C18
1284B: mov     di, word_27C1A
1284F: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12854: pop     cx
12855: pop     si
12856: pop     di
12857: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1285C: pop     cx
1285D: pop     si
1285E: pop     di
1285F: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12864: pop     cx
12865: pop     si
12866: pop     di
12867: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1286C: mov     word_27C28, ax
1286F: mov     word_27C2A, bx
12873: mov     word_27C2C, dx
12877: mov     ax, 0BA6Fh
1287A: mov     bx, 4EE1h
1287D: mov     dx, 7C54h
12880: mov     cx, word_27C4C
12884: mov     si, word_27C4E
12888: mov     di, word_27C50
1288C: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12891: mov     cx, word_27C4C
12895: mov     si, word_27C4E
12899: mov     di, word_27C50
1289D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
128A2: push    dx
128A3: push    bx
128A4: push    ax
128A5: mov     ax, 4D78h
128A8: mov     bx, 2767h
128AB: mov     dx, 2383h
128AE: mov     cx, word_27C4C
128B2: mov     si, word_27C4E
128B6: mov     di, word_27C50
128BA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
128BF: push    dx
128C0: push    bx
128C1: push    ax
128C2: mov     ax, 81h
128C5: xor     bx, bx
128C7: xor     dx, dx
128C9: pop     cx
128CA: pop     si
128CB: pop     di
128CC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
128D1: pop     cx
128D2: pop     si
128D3: pop     di
128D4: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
128D9: mov     word_27C58, ax
128DC: mov     word_27C5A, bx
128E0: mov     word_27C5C, dx
128E4: mov     ax, 9F93h
128E7: mov     bx, 40CDh
128EA: mov     dx, 6BF0h
128ED: mov     cx, word_27C4C
128F1: mov     si, word_27C4E
128F5: mov     di, word_27C50
128F9: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
128FE: mov     cx, 1F84h
12901: mov     si, 0A42Fh
12904: mov     di, 3403h
12907: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1290C: mov     word_27C5E, ax
1290F: mov     word_27C60, bx
12913: mov     word_27C62, dx
12917: mov     ax, 82h
1291A: xor     bx, bx
1291C: xor     dx, dx
1291E: mov     cx, word_27C5E
12922: mov     si, word_27C60
12926: mov     di, word_27C62
1292A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1292F: mov     cx, word_27C52
12933: mov     si, word_27C54
12937: mov     di, word_27C56
1293B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12940: call    @Cos$q4Real; Cos(x: Real): Real
12945: mov     cx, 0B7Dh
12948: mov     si, 0FE26h
1294B: mov     di, 6A28h
1294E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12953: push    dx
12954: push    bx
12955: push    ax
12956: mov     ax, word_27C46
12959: mov     bx, word_27C48
1295D: mov     dx, word_27C4A
12961: mov     cx, word_27C52
12965: mov     si, word_27C54
12969: mov     di, word_27C56
1296D: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12972: call    @Cos$q4Real; Cos(x: Real): Real
12977: push    dx
12978: push    bx
12979: push    ax
1297A: mov     ax, word_27C58
1297D: mov     bx, word_27C5A
12981: mov     dx, word_27C5C
12985: mov     cx, 137Eh
12988: mov     si, 0E0B9h
1298B: mov     di, 3E0Ch
1298E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12993: pop     cx
12994: pop     si
12995: pop     di
12996: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1299B: push    dx
1299C: push    bx
1299D: push    ax
1299E: mov     ax, word_27C28
129A1: mov     bx, word_27C2A
129A5: mov     dx, word_27C2C
129A9: pop     cx
129AA: pop     si
129AB: pop     di
129AC: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
129B1: pop     cx
129B2: pop     si
129B3: pop     di
129B4: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
129B9: mov     word_27C28, ax
129BC: mov     word_27C2A, bx
129C0: mov     word_27C2C, dx
129C4: mov     ax, word_27C1C
129C7: mov     bx, word_27C1E
129CB: mov     dx, word_27C20
129CF: mov     cx, word_27C52
129D3: mov     si, word_27C54
129D7: mov     di, word_27C56
129DB: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
129E0: push    dx
129E1: push    bx
129E2: push    ax
129E3: mov     ax, word_27C46
129E6: mov     bx, word_27C48
129EA: mov     dx, word_27C4A
129EE: mov     cx, word_27C52
129F2: mov     si, word_27C54
129F6: mov     di, word_27C56
129FA: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
129FF: push    dx
12A00: push    bx
12A01: push    ax
12A02: mov     ax, 82h
12A05: xor     bx, bx
12A07: xor     dx, dx
12A09: mov     cx, word_27C22
12A0D: mov     si, word_27C24
12A11: mov     di, word_27C26
12A15: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12A1A: mov     cx, word_27C52
12A1E: mov     si, word_27C54
12A22: mov     di, word_27C56
12A26: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12A2B: pop     cx
12A2C: pop     si
12A2D: pop     di
12A2E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12A33: pop     cx
12A34: pop     si
12A35: pop     di
12A36: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12A3B: call    @Cos$q4Real; Cos(x: Real): Real
12A40: push    dx
12A41: push    bx
12A42: push    ax
12A43: mov     ax, word_27C58
12A46: mov     bx, word_27C5A
12A4A: mov     dx, word_27C5C
12A4E: mov     cx, 57Ch
12A51: mov     si, 214Fh
12A54: mov     di, 6A57h
12A57: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12A5C: pop     cx
12A5D: pop     si
12A5E: pop     di
12A5F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12A64: push    dx
12A65: push    bx
12A66: push    ax
12A67: mov     ax, 82h
12A6A: xor     bx, bx
12A6C: xor     dx, dx
12A6E: mov     cx, word_27C1C
12A72: mov     si, word_27C1E
12A76: mov     di, word_27C20
12A7A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12A7F: mov     cx, word_27C52
12A83: mov     si, word_27C54
12A87: mov     di, word_27C56
12A8B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12A90: push    dx
12A91: push    bx
12A92: push    ax
12A93: mov     ax, 82h
12A96: xor     bx, bx
12A98: xor     dx, dx
12A9A: mov     cx, word_27C22
12A9E: mov     si, word_27C24
12AA2: mov     di, word_27C26
12AA6: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12AAB: mov     cx, word_27C52
12AAF: mov     si, word_27C54
12AB3: mov     di, word_27C56
12AB7: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12ABC: pop     cx
12ABD: pop     si
12ABE: pop     di
12ABF: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12AC4: call    @Cos$q4Real; Cos(x: Real): Real
12AC9: mov     cx, 0BD7Ch
12ACC: mov     si, 0EDC3h
12ACF: mov     di, 70D0h
12AD2: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12AD7: mov     cx, word_27C28
12ADB: mov     si, word_27C2A
12ADF: mov     di, word_27C2C
12AE3: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12AE8: pop     cx
12AE9: pop     si
12AEA: pop     di
12AEB: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12AF0: mov     word_27C28, ax
12AF3: mov     word_27C2A, bx
12AF7: mov     word_27C2C, dx
12AFB: mov     ax, word_27C1C
12AFE: mov     bx, word_27C1E
12B02: mov     dx, word_27C20
12B06: mov     cx, word_27C52
12B0A: mov     si, word_27C54
12B0E: mov     di, word_27C56
12B12: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12B17: push    dx
12B18: push    bx
12B19: push    ax
12B1A: mov     ax, word_27C46
12B1D: mov     bx, word_27C48
12B21: mov     dx, word_27C4A
12B25: mov     cx, word_27C52
12B29: mov     si, word_27C54
12B2D: mov     di, word_27C56
12B31: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12B36: pop     cx
12B37: pop     si
12B38: pop     di
12B39: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12B3E: call    @Cos$q4Real; Cos(x: Real): Real
12B43: push    dx
12B44: push    bx
12B45: push    ax
12B46: mov     ax, word_27C58
12B49: mov     bx, word_27C5A
12B4D: mov     dx, word_27C5C
12B51: mov     cx, 867Bh
12B54: mov     si, 0BC55h
12B57: mov     di, 7991h
12B5A: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12B5F: pop     cx
12B60: pop     si
12B61: pop     di
12B62: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12B67: push    dx
12B68: push    bx
12B69: push    ax
12B6A: mov     ax, word_27C22
12B6D: mov     bx, word_27C24
12B71: mov     dx, word_27C26
12B75: mov     cx, word_27C52
12B79: mov     si, word_27C54
12B7D: mov     di, word_27C56
12B81: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12B86: call    @Cos$q4Real; Cos(x: Real): Real
12B8B: mov     cx, 527Ch
12B8E: mov     si, 7629h
12B91: mov     di, 0E34h
12B94: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12B99: push    dx
12B9A: push    bx
12B9B: push    ax
12B9C: mov     ax, word_27C46
12B9F: mov     bx, word_27C48
12BA3: mov     dx, word_27C4A
12BA7: mov     cx, word_27C52
12BAB: mov     si, word_27C54
12BAF: mov     di, word_27C56
12BB3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12BB8: push    dx
12BB9: push    bx
12BBA: push    ax
12BBB: mov     ax, word_27C1C
12BBE: mov     bx, word_27C1E
12BC2: mov     dx, word_27C20
12BC6: mov     cx, word_27C52
12BCA: mov     si, word_27C54
12BCE: mov     di, word_27C56
12BD2: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12BD7: pop     cx
12BD8: pop     si
12BD9: pop     di
12BDA: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12BDF: call    @Cos$q4Real; Cos(x: Real): Real
12BE4: push    dx
12BE5: push    bx
12BE6: push    ax
12BE7: mov     ax, word_27C58
12BEA: mov     bx, word_27C5A
12BEE: mov     dx, word_27C5C
12BF2: mov     cx, 9E7Ch
12BF5: mov     si, 0C825h
12BF8: mov     di, 2808h
12BFB: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12C00: pop     cx
12C01: pop     si
12C02: pop     di
12C03: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12C08: push    dx
12C09: push    bx
12C0A: push    ax
12C0B: mov     ax, word_27C46
12C0E: mov     bx, word_27C48
12C12: mov     dx, word_27C4A
12C16: mov     cx, word_27C52
12C1A: mov     si, word_27C54
12C1E: mov     di, word_27C56
12C22: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12C27: push    dx
12C28: push    bx
12C29: push    ax
12C2A: mov     ax, 82h
12C2D: xor     bx, bx
12C2F: xor     dx, dx
12C31: mov     cx, word_27C22
12C35: mov     si, word_27C24
12C39: mov     di, word_27C26
12C3D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12C42: mov     cx, word_27C52
12C46: mov     si, word_27C54
12C4A: mov     di, word_27C56
12C4E: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12C53: pop     cx
12C54: pop     si
12C55: pop     di
12C56: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12C5B: call    @Cos$q4Real; Cos(x: Real): Real
12C60: push    dx
12C61: push    bx
12C62: push    ax
12C63: mov     ax, word_27C58
12C66: mov     bx, word_27C5A
12C6A: mov     dx, word_27C5C
12C6E: mov     cx, 0CA7Ch
12C71: mov     si, 601Bh
12C74: mov     di, 3BE6h
12C77: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12C7C: pop     cx
12C7D: pop     si
12C7E: pop     di
12C7F: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12C84: push    dx
12C85: push    bx
12C86: push    ax
12C87: mov     ax, word_27C1C
12C8A: mov     bx, word_27C1E
12C8E: mov     dx, word_27C20
12C92: mov     cx, word_27C52
12C96: mov     si, word_27C54
12C9A: mov     di, word_27C56
12C9E: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12CA3: push    dx
12CA4: push    bx
12CA5: push    ax
12CA6: mov     ax, 82h
12CA9: xor     bx, bx
12CAB: xor     dx, dx
12CAD: mov     cx, word_27C22
12CB1: mov     si, word_27C24
12CB5: mov     di, word_27C26
12CB9: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12CBE: mov     cx, word_27C52
12CC2: mov     si, word_27C54
12CC6: mov     di, word_27C56
12CCA: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12CCF: pop     cx
12CD0: pop     si
12CD1: pop     di
12CD2: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12CD7: call    @Cos$q4Real; Cos(x: Real): Real
12CDC: mov     cx, 907Ch
12CDF: mov     si, 1283h
12CE2: mov     di, 5A66h
12CE5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12CEA: mov     cx, word_27C28
12CEE: mov     si, word_27C2A
12CF2: mov     di, word_27C2C
12CF6: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12CFB: pop     cx
12CFC: pop     si
12CFD: pop     di
12CFE: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12D03: pop     cx
12D04: pop     si
12D05: pop     di
12D06: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12D0B: pop     cx
12D0C: pop     si
12D0D: pop     di
12D0E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12D13: pop     cx
12D14: pop     si
12D15: pop     di
12D16: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12D1B: mov     word_27C28, ax
12D1E: mov     word_27C2A, bx
12D22: mov     word_27C2C, dx
12D26: mov     di, offset unk_27F18
12D29: push    ds
12D2A: push    di
12D2B: mov     di, offset aN; "N"
12D2E: push    cs
12D2F: push    di
12D30: call    @$bsub$qm6Stringt1; Compare two strings
12D35: jnz     short loc_12D60
12D37: mov     ax, word_27C28
12D3A: mov     bx, word_27C2A
12D3E: mov     dx, word_27C2C
12D42: mov     cx, word_27C76
12D46: mov     si, word_27C78
12D4A: mov     di, word_27C7A
12D4E: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12D53: mov     word_27B6E, ax
12D56: mov     word_27B70, bx
12D5A: mov     word_27B72, dx
12D5E: jmp     short loc_12D76
12D60: mov     ax, word_27C28
12D63: mov     bx, word_27C2A
12D67: mov     dx, word_27C2C
12D6B: mov     word_27B6E, ax
12D6E: mov     word_27B70, bx
12D72: mov     word_27B72, dx
12D76: mov     ax, word_27B6E
12D79: mov     bx, word_27B70
12D7D: mov     dx, word_27B72
12D81: xor     cx, cx
12D83: xor     si, si
12D85: xor     di, di
12D87: call    @__Cmp$q4Realt1; Compare two reals
12D8C: jnb     short loc_12DB1
12D8E: mov     ax, word_27B6E
12D91: mov     bx, word_27B70
12D95: mov     dx, word_27B72
12D99: mov     cx, 89h
12D9C: xor     si, si
12D9E: mov     di, 3400h
12DA1: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12DA6: mov     word_27B6E, ax
12DA9: mov     word_27B70, bx
12DAD: mov     word_27B72, dx
12DB1: mov     di, offset unk_2F60A
12DB4: push    ds
12DB5: push    di
12DB6: mov     di, offset aSandu; "Sandu "
12DB9: push    cs
12DBA: push    di
12DBB: xor     ax, ax
12DBD: push    ax
12DBE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
12DC3: call    @Write$qm4Text; Write(var f: Text)
12DC8: mov     word_27DF6, 2
12DCE: mov     ax, word_27B6E
12DD1: mov     bx, word_27B70
12DD5: mov     dx, word_27B72
12DD9: mov     word_27D30, ax
12DDC: mov     word_27D32, bx
12DE0: mov     word_27D34, dx
12DE4: call    sub_21EE1
12DE9: mov     di, offset unk_2F60A
12DEC: push    ds
12DED: push    di
12DEE: mov     di, offset asc_10426; "  "
12DF1: push    cs
12DF2: push    di
12DF3: xor     ax, ax
12DF5: push    ax
12DF6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
12DFB: call    @Write$qm4Text; Write(var f: Text)
12E00: call    sub_23A58
12E05: mov     di, offset unk_28018
12E08: push    ds
12E09: push    di
12E0A: mov     di, offset unk_28318
12E0D: push    ds
12E0E: push    di
12E0F: mov     ax, 0FFh
12E12: push    ax
12E13: call    @$basg$qm6Stringt14Byte; Store string
12E18: mov     di, offset unk_28118
12E1B: push    ds
12E1C: push    di
12E1D: mov     di, offset unk_29018
12E20: push    ds
12E21: push    di
12E22: mov     ax, 0FFh
12E25: push    ax
12E26: call    @$basg$qm6Stringt14Byte; Store string
12E2B: mov     di, offset unk_29C18
12E2E: push    ds
12E2F: push    di
12E30: mov     di, offset unk_29D18
12E33: push    ds
12E34: push    di
12E35: mov     ax, 0FFh
12E38: push    ax
12E39: call    @$basg$qm6Stringt14Byte; Store string
12E3E: mov     ax, word_27E0E
12E41: dec     ax
12E42: cwd
12E43: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
12E48: mov     cx, word_27D8A
12E4C: mov     si, word_27D8C
12E50: mov     di, word_27D8E
12E54: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12E59: push    dx
12E5A: push    bx
12E5B: push    ax
12E5C: mov     ax, word_27D30
12E5F: mov     bx, word_27D32
12E63: mov     dx, word_27D34
12E67: pop     cx
12E68: pop     si
12E69: pop     di
12E6A: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12E6F: mov     word_27D9C, ax
12E72: mov     word_27D9E, bx
12E76: mov     word_27DA0, dx
12E7A: mov     ax, word_27E22
12E7D: mov     word_27E20, ax
12E80: mov     di, offset unk_2C218
12E83: push    ds
12E84: push    di
12E85: mov     di, offset unk_2B718
12E88: push    ds
12E89: push    di
12E8A: mov     ax, 0FFh
12E8D: push    ax
12E8E: call    @$basg$qm6Stringt14Byte; Store string
12E93: mov     di, offset unk_2D018
12E96: push    ds
12E97: push    di
12E98: mov     di, offset unk_2C518
12E9B: push    ds
12E9C: push    di
12E9D: mov     ax, 0FFh
12EA0: push    ax
12EA1: call    @$basg$qm6Stringt14Byte; Store string
12EA6: mov     di, offset unk_2DE18
12EA9: push    ds
12EAA: push    di
12EAB: mov     di, offset unk_2D318
12EAE: push    ds
12EAF: push    di
12EB0: mov     ax, 0FFh
12EB3: push    ax
12EB4: call    @$basg$qm6Stringt14Byte; Store string
12EB9: mov     di, offset unk_2EC18
12EBC: push    ds
12EBD: push    di
12EBE: mov     di, offset unk_2E118
12EC1: push    ds
12EC2: push    di
12EC3: mov     ax, 0FFh
12EC6: push    ax
12EC7: call    @$basg$qm6Stringt14Byte; Store string
12ECC: mov     ax, word_27C46
12ECF: mov     bx, word_27C48
12ED3: mov     dx, word_27C4A
12ED7: mov     cx, word_27C52
12EDB: mov     si, word_27C54
12EDF: mov     di, word_27C56
12EE3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12EE8: call    far ptr @Sin$q4Real; Sin(x: Real): Real
12EED: mov     cx, word_27C82
12EF1: mov     si, word_27C84
12EF5: mov     di, word_27C86
12EF9: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12EFE: mov     cx, 81h
12F01: xor     si, si
12F03: xor     di, di
12F05: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12F0A: push    dx
12F0B: push    bx
12F0C: push    ax
12F0D: mov     ax, word_27C82
12F10: mov     bx, word_27C84
12F14: mov     dx, word_27C86
12F18: mov     cx, word_27C82
12F1C: mov     si, word_27C84
12F20: mov     di, word_27C86
12F24: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12F29: push    dx
12F2A: push    bx
12F2B: push    ax
12F2C: mov     ax, 81h
12F2F: xor     bx, bx
12F31: xor     dx, dx
12F33: pop     cx
12F34: pop     si
12F35: pop     di
12F36: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12F3B: mov     cx, 7F81h
12F3E: mov     si, 1ADh
12F41: xor     di, di
12F43: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
12F48: pop     cx
12F49: pop     si
12F4A: pop     di
12F4B: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
12F50: mov     word_27C7C, ax
12F53: mov     word_27C7E, bx
12F57: mov     word_27C80, dx
12F5B: mov     di, offset unk_27F18
12F5E: push    ds
12F5F: push    di
12F60: mov     di, offset aN; "N"
12F63: push    cs
12F64: push    di
12F65: call    @$bsub$qm6Stringt1; Compare two strings
12F6A: jnz     short loc_12F95
12F6C: mov     ax, word_27C40
12F6F: mov     bx, word_27C42
12F73: mov     dx, word_27C44
12F77: mov     cx, word_27C76
12F7B: mov     si, word_27C78
12F7F: mov     di, word_27C7A
12F83: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
12F88: mov     word_27B6E, ax
12F8B: mov     word_27B70, bx
12F8F: mov     word_27B72, dx
12F93: jmp     short loc_12FAB
12F95: mov     ax, word_27C40
12F98: mov     bx, word_27C42
12F9C: mov     dx, word_27C44
12FA0: mov     word_27B6E, ax
12FA3: mov     word_27B70, bx
12FA7: mov     word_27B72, dx
12FAB: mov     ax, word_27B6E
12FAE: mov     bx, word_27B70
12FB2: mov     dx, word_27B72
12FB6: xor     cx, cx
12FB8: xor     si, si
12FBA: xor     di, di
12FBC: call    @__Cmp$q4Realt1; Compare two reals
12FC1: jnb     short loc_12FE6
12FC3: mov     ax, word_27B6E
12FC6: mov     bx, word_27B70
12FCA: mov     dx, word_27B72
12FCE: mov     cx, 89h
12FD1: xor     si, si
12FD3: mov     di, 3400h
12FD6: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
12FDB: mov     word_27B6E, ax
12FDE: mov     word_27B70, bx
12FE2: mov     word_27B72, dx
12FE6: mov     di, offset unk_2F60A
12FE9: push    ds
12FEA: push    di
12FEB: mov     di, offset aRavi; "Ravi  "
12FEE: push    cs
12FEF: push    di
12FF0: xor     ax, ax
12FF2: push    ax
12FF3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
12FF8: call    @Write$qm4Text; Write(var f: Text)
12FFD: mov     word_27DF6, 1
13003: mov     ax, word_27B6E
13006: mov     bx, word_27B70
1300A: mov     dx, word_27B72
1300E: mov     word_27D2A, ax
13011: mov     word_27D2C, bx
13015: mov     word_27D2E, dx
13019: call    sub_21EE1
1301E: mov     di, offset unk_2F60A
13021: push    ds
13022: push    di
13023: mov     di, offset asc_10426; "  "
13026: push    cs
13027: push    di
13028: xor     ax, ax
1302A: push    ax
1302B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13030: call    @Write$qm4Text; Write(var f: Text)
13035: call    sub_23A58
1303A: mov     di, offset unk_28018
1303D: push    ds
1303E: push    di
1303F: mov     di, offset unk_28418
13042: push    ds
13043: push    di
13044: mov     ax, 0FFh
13047: push    ax
13048: call    @$basg$qm6Stringt14Byte; Store string
1304D: mov     di, offset unk_28118
13050: push    ds
13051: push    di
13052: mov     di, offset unk_29118
13055: push    ds
13056: push    di
13057: mov     ax, 0FFh
1305A: push    ax
1305B: call    @$basg$qm6Stringt14Byte; Store string
13060: mov     di, offset unk_2DE18
13063: push    ds
13064: push    di
13065: mov     di, offset unk_2D218
13068: push    ds
13069: push    di
1306A: mov     ax, 0FFh
1306D: push    ax
1306E: call    @$basg$qm6Stringt14Byte; Store string
13073: mov     di, offset unk_2EC18
13076: push    ds
13077: push    di
13078: mov     di, offset unk_2E018
1307B: push    ds
1307C: push    di
1307D: mov     ax, 0FFh
13080: push    ax
13081: call    @$basg$qm6Stringt14Byte; Store string
13086: mov     di, offset unk_2C218
13089: push    ds
1308A: push    di
1308B: mov     di, offset unk_2B618
1308E: push    ds
1308F: push    di
13090: mov     ax, 0FFh
13093: push    ax
13094: call    @$basg$qm6Stringt14Byte; Store string
13099: mov     di, offset unk_2D018
1309C: push    ds
1309D: push    di
1309E: mov     di, offset unk_2C418
130A1: push    ds
130A2: push    di
130A3: mov     ax, 0FFh
130A6: push    ax
130A7: call    @$basg$qm6Stringt14Byte; Store string
130AC: call    sub_195D3
130B1: mov     di, offset unk_2F60A
130B4: push    ds
130B5: push    di
130B6: mov     di, offset asc_103D2; "_______________________________________"...
130B9: push    cs
130BA: push    di
130BB: xor     ax, ax
130BD: push    ax
130BE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
130C3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
130C8: mov     di, offset unk_2F50A
130CB: push    ds
130CC: push    di
130CD: call    @ReadLn$qm4Text; ReadLn(var f: Text)
130D2: mov     di, offset unk_2F50A
130D5: push    ds
130D6: push    di
130D7: call    @ReadLn$qm4Text; ReadLn(var f: Text)
130DC: call    @CLRSCR$qv; CLRSCR(void)
130E1: mov     di, offset unk_2F60A
130E4: push    ds
130E5: push    di
130E6: mov     di, offset aShadVargaOf; "SHAD VARGA OF "
130E9: push    cs
130EA: push    di
130EB: xor     ax, ax
130ED: push    ax
130EE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
130F3: mov     di, offset unk_2B418
130F6: push    ds
130F7: push    di
130F8: xor     ax, ax
130FA: push    ax
130FB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13100: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13105: mov     di, offset unk_2F60A
13108: push    ds
13109: push    di
1310A: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1310F: mov     di, offset unk_2F60A
13112: push    ds
13113: push    di
13114: mov     di, offset aGrhayaRashiNav; "GRHAYA    RASHI    NAVAMSAKA    HORA   "...
13117: push    cs
13118: push    di
13119: xor     ax, ax
1311B: push    ax
1311C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13121: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13126: mov     di, offset unk_2F60A
13129: push    ds
1312A: push    di
1312B: mov     di, offset asc_10492; "---------------------------------------"...
1312E: push    cs
1312F: push    di
13130: xor     ax, ax
13132: push    ax
13133: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13138: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1313D: mov     di, offset unk_2F60A
13140: push    ds
13141: push    di
13142: mov     di, offset aLagna_0; "Lagna"
13145: push    cs
13146: push    di
13147: xor     ax, ax
13149: push    ax
1314A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1314F: mov     di, offset asc_104E4; "   | "
13152: push    cs
13153: push    di
13154: xor     ax, ax
13156: push    ax
13157: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1315C: mov     di, offset unk_28F18
1315F: push    ds
13160: push    di
13161: xor     ax, ax
13163: push    ax
13164: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13169: mov     di, offset asc_104EA; "   "
1316C: push    cs
1316D: push    di
1316E: xor     ax, ax
13170: push    ax
13171: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13176: mov     di, offset unk_28218
13179: push    ds
1317A: push    di
1317B: xor     ax, ax
1317D: push    ax
1317E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13183: mov     di, offset asc_104EA; "   "
13186: push    cs
13187: push    di
13188: xor     ax, ax
1318A: push    ax
1318B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13190: mov     di, offset unk_2B518
13193: push    ds
13194: push    di
13195: xor     ax, ax
13197: push    ax
13198: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1319D: mov     di, offset asc_104EA; "   "
131A0: push    cs
131A1: push    di
131A2: xor     ax, ax
131A4: push    ax
131A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131AA: mov     di, offset unk_2C318
131AD: push    ds
131AE: push    di
131AF: xor     ax, ax
131B1: push    ax
131B2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131B7: mov     di, offset asc_104EA; "   "
131BA: push    cs
131BB: push    di
131BC: xor     ax, ax
131BE: push    ax
131BF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131C4: mov     di, offset unk_2D118
131C7: push    ds
131C8: push    di
131C9: xor     ax, ax
131CB: push    ax
131CC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131D1: mov     di, offset asc_104EA; "   "
131D4: push    cs
131D5: push    di
131D6: xor     ax, ax
131D8: push    ax
131D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131DE: mov     di, offset unk_2DF18
131E1: push    ds
131E2: push    di
131E3: xor     ax, ax
131E5: push    ax
131E6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
131EB: call    @WriteLn$qm4Text; WriteLn(var f: Text)
131F0: mov     di, offset unk_2F60A
131F3: push    ds
131F4: push    di
131F5: mov     di, offset unk_2EEFE
131F8: push    ds
131F9: push    di
131FA: xor     ax, ax
131FC: push    ax
131FD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13202: mov     di, offset asc_104EE; " | "
13205: push    cs
13206: push    di
13207: xor     ax, ax
13209: push    ax
1320A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1320F: mov     di, offset unk_29018
13212: push    ds
13213: push    di
13214: xor     ax, ax
13216: push    ax
13217: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1321C: mov     di, offset asc_104EA; "   "
1321F: push    cs
13220: push    di
13221: xor     ax, ax
13223: push    ax
13224: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13229: mov     di, offset unk_28318
1322C: push    ds
1322D: push    di
1322E: xor     ax, ax
13230: push    ax
13231: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13236: mov     di, offset asc_104EA; "   "
13239: push    cs
1323A: push    di
1323B: xor     ax, ax
1323D: push    ax
1323E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13243: mov     di, offset unk_2B718
13246: push    ds
13247: push    di
13248: xor     ax, ax
1324A: push    ax
1324B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13250: mov     di, offset asc_104EA; "   "
13253: push    cs
13254: push    di
13255: xor     ax, ax
13257: push    ax
13258: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1325D: mov     di, offset unk_2C518
13260: push    ds
13261: push    di
13262: xor     ax, ax
13264: push    ax
13265: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1326A: mov     di, offset asc_104EA; "   "
1326D: push    cs
1326E: push    di
1326F: xor     ax, ax
13271: push    ax
13272: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13277: mov     di, offset unk_2D318
1327A: push    ds
1327B: push    di
1327C: xor     ax, ax
1327E: push    ax
1327F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13284: mov     di, offset asc_104EA; "   "
13287: push    cs
13288: push    di
13289: xor     ax, ax
1328B: push    ax
1328C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13291: mov     di, offset unk_2E118
13294: push    ds
13295: push    di
13296: xor     ax, ax
13298: push    ax
13299: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1329E: call    @WriteLn$qm4Text; WriteLn(var f: Text)
132A3: mov     di, offset unk_2F60A
132A6: push    ds
132A7: push    di
132A8: mov     di, offset unk_2EF08
132AB: push    ds
132AC: push    di
132AD: xor     ax, ax
132AF: push    ax
132B0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132B5: mov     di, offset asc_104EE; " | "
132B8: push    cs
132B9: push    di
132BA: xor     ax, ax
132BC: push    ax
132BD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132C2: mov     di, offset unk_29118
132C5: push    ds
132C6: push    di
132C7: xor     ax, ax
132C9: push    ax
132CA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132CF: mov     di, offset asc_104EA; "   "
132D2: push    cs
132D3: push    di
132D4: xor     ax, ax
132D6: push    ax
132D7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132DC: mov     di, offset unk_28418
132DF: push    ds
132E0: push    di
132E1: xor     ax, ax
132E3: push    ax
132E4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132E9: mov     di, offset asc_104EA; "   "
132EC: push    cs
132ED: push    di
132EE: xor     ax, ax
132F0: push    ax
132F1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
132F6: mov     di, offset unk_2B618
132F9: push    ds
132FA: push    di
132FB: xor     ax, ax
132FD: push    ax
132FE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13303: mov     di, offset asc_104EA; "   "
13306: push    cs
13307: push    di
13308: xor     ax, ax
1330A: push    ax
1330B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13310: mov     di, offset unk_2C418
13313: push    ds
13314: push    di
13315: xor     ax, ax
13317: push    ax
13318: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1331D: mov     di, offset asc_104EA; "   "
13320: push    cs
13321: push    di
13322: xor     ax, ax
13324: push    ax
13325: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1332A: mov     di, offset unk_2D218
1332D: push    ds
1332E: push    di
1332F: xor     ax, ax
13331: push    ax
13332: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13337: mov     di, offset asc_104EA; "   "
1333A: push    cs
1333B: push    di
1333C: xor     ax, ax
1333E: push    ax
1333F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13344: mov     di, offset unk_2E018
13347: push    ds
13348: push    di
13349: xor     ax, ax
1334B: push    ax
1334C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13351: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13356: mov     di, offset unk_2F60A
13359: push    ds
1335A: push    di
1335B: mov     di, offset unk_2EF12
1335E: push    ds
1335F: push    di
13360: xor     ax, ax
13362: push    ax
13363: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13368: mov     di, offset asc_104EE; " | "
1336B: push    cs
1336C: push    di
1336D: xor     ax, ax
1336F: push    ax
13370: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13375: mov     di, offset unk_29218
13378: push    ds
13379: push    di
1337A: xor     ax, ax
1337C: push    ax
1337D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13382: mov     di, offset asc_104EA; "   "
13385: push    cs
13386: push    di
13387: xor     ax, ax
13389: push    ax
1338A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1338F: mov     di, offset unk_28518
13392: push    ds
13393: push    di
13394: xor     ax, ax
13396: push    ax
13397: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1339C: mov     di, offset asc_104EA; "   "
1339F: push    cs
133A0: push    di
133A1: xor     ax, ax
133A3: push    ax
133A4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133A9: mov     di, offset unk_2B818
133AC: push    ds
133AD: push    di
133AE: xor     ax, ax
133B0: push    ax
133B1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133B6: mov     di, offset asc_104EA; "   "
133B9: push    cs
133BA: push    di
133BB: xor     ax, ax
133BD: push    ax
133BE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133C3: mov     di, offset unk_2C618
133C6: push    ds
133C7: push    di
133C8: xor     ax, ax
133CA: push    ax
133CB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133D0: mov     di, offset asc_104EA; "   "
133D3: push    cs
133D4: push    di
133D5: xor     ax, ax
133D7: push    ax
133D8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133DD: mov     di, offset unk_2D418
133E0: push    ds
133E1: push    di
133E2: xor     ax, ax
133E4: push    ax
133E5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133EA: mov     di, offset asc_104EA; "   "
133ED: push    cs
133EE: push    di
133EF: xor     ax, ax
133F1: push    ax
133F2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
133F7: mov     di, offset unk_2E218
133FA: push    ds
133FB: push    di
133FC: xor     ax, ax
133FE: push    ax
133FF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13404: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13409: mov     di, offset unk_2F60A
1340C: push    ds
1340D: push    di
1340E: mov     di, offset unk_2EF1C
13411: push    ds
13412: push    di
13413: xor     ax, ax
13415: push    ax
13416: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1341B: mov     di, offset asc_104EE; " | "
1341E: push    cs
1341F: push    di
13420: xor     ax, ax
13422: push    ax
13423: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13428: mov     di, offset unk_29318
1342B: push    ds
1342C: push    di
1342D: xor     ax, ax
1342F: push    ax
13430: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13435: mov     di, offset asc_104EA; "   "
13438: push    cs
13439: push    di
1343A: xor     ax, ax
1343C: push    ax
1343D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13442: mov     di, offset unk_28618
13445: push    ds
13446: push    di
13447: xor     ax, ax
13449: push    ax
1344A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1344F: mov     di, offset asc_104EA; "   "
13452: push    cs
13453: push    di
13454: xor     ax, ax
13456: push    ax
13457: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1345C: mov     di, offset unk_2C118
1345F: push    ds
13460: push    di
13461: xor     ax, ax
13463: push    ax
13464: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13469: mov     di, offset asc_104EA; "   "
1346C: push    cs
1346D: push    di
1346E: xor     ax, ax
13470: push    ax
13471: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13476: mov     di, offset unk_2CF18
13479: push    ds
1347A: push    di
1347B: xor     ax, ax
1347D: push    ax
1347E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13483: mov     di, offset asc_104EA; "   "
13486: push    cs
13487: push    di
13488: xor     ax, ax
1348A: push    ax
1348B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13490: mov     di, offset unk_2DD18
13493: push    ds
13494: push    di
13495: xor     ax, ax
13497: push    ax
13498: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1349D: mov     di, offset asc_104EA; "   "
134A0: push    cs
134A1: push    di
134A2: xor     ax, ax
134A4: push    ax
134A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134AA: mov     di, offset unk_2EB18
134AD: push    ds
134AE: push    di
134AF: xor     ax, ax
134B1: push    ax
134B2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134B7: call    @WriteLn$qm4Text; WriteLn(var f: Text)
134BC: mov     di, offset unk_2F60A
134BF: push    ds
134C0: push    di
134C1: mov     di, offset unk_2EF26
134C4: push    ds
134C5: push    di
134C6: xor     ax, ax
134C8: push    ax
134C9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134CE: mov     di, offset asc_104EE; " | "
134D1: push    cs
134D2: push    di
134D3: xor     ax, ax
134D5: push    ax
134D6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134DB: mov     di, offset unk_29418
134DE: push    ds
134DF: push    di
134E0: xor     ax, ax
134E2: push    ax
134E3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134E8: mov     di, offset asc_104EA; "   "
134EB: push    cs
134EC: push    di
134ED: xor     ax, ax
134EF: push    ax
134F0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
134F5: mov     di, offset unk_28718
134F8: push    ds
134F9: push    di
134FA: xor     ax, ax
134FC: push    ax
134FD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13502: mov     di, offset asc_104EA; "   "
13505: push    cs
13506: push    di
13507: xor     ax, ax
13509: push    ax
1350A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1350F: mov     di, offset unk_2B918
13512: push    ds
13513: push    di
13514: xor     ax, ax
13516: push    ax
13517: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1351C: mov     di, offset asc_104EA; "   "
1351F: push    cs
13520: push    di
13521: xor     ax, ax
13523: push    ax
13524: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13529: mov     di, offset unk_2C718
1352C: push    ds
1352D: push    di
1352E: xor     ax, ax
13530: push    ax
13531: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13536: mov     di, offset asc_104EA; "   "
13539: push    cs
1353A: push    di
1353B: xor     ax, ax
1353D: push    ax
1353E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13543: mov     di, offset unk_2D518
13546: push    ds
13547: push    di
13548: xor     ax, ax
1354A: push    ax
1354B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13550: mov     di, offset asc_104EA; "   "
13553: push    cs
13554: push    di
13555: xor     ax, ax
13557: push    ax
13558: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1355D: mov     di, offset unk_2E318
13560: push    ds
13561: push    di
13562: xor     ax, ax
13564: push    ax
13565: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1356A: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1356F: mov     di, offset unk_2F60A
13572: push    ds
13573: push    di
13574: mov     di, offset unk_2EF30
13577: push    ds
13578: push    di
13579: xor     ax, ax
1357B: push    ax
1357C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13581: mov     di, offset asc_104EE; " | "
13584: push    cs
13585: push    di
13586: xor     ax, ax
13588: push    ax
13589: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1358E: mov     di, offset unk_29518
13591: push    ds
13592: push    di
13593: xor     ax, ax
13595: push    ax
13596: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1359B: mov     di, offset asc_104EA; "   "
1359E: push    cs
1359F: push    di
135A0: xor     ax, ax
135A2: push    ax
135A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135A8: mov     di, offset unk_28818
135AB: push    ds
135AC: push    di
135AD: xor     ax, ax
135AF: push    ax
135B0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135B5: mov     di, offset asc_104EA; "   "
135B8: push    cs
135B9: push    di
135BA: xor     ax, ax
135BC: push    ax
135BD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135C2: mov     di, offset unk_2BA18
135C5: push    ds
135C6: push    di
135C7: xor     ax, ax
135C9: push    ax
135CA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135CF: mov     di, offset asc_104EA; "   "
135D2: push    cs
135D3: push    di
135D4: xor     ax, ax
135D6: push    ax
135D7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135DC: mov     di, offset unk_2C818
135DF: push    ds
135E0: push    di
135E1: xor     ax, ax
135E3: push    ax
135E4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135E9: mov     di, offset asc_104EA; "   "
135EC: push    cs
135ED: push    di
135EE: xor     ax, ax
135F0: push    ax
135F1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
135F6: mov     di, offset unk_2D618
135F9: push    ds
135FA: push    di
135FB: xor     ax, ax
135FD: push    ax
135FE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13603: mov     di, offset asc_104EA; "   "
13606: push    cs
13607: push    di
13608: xor     ax, ax
1360A: push    ax
1360B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13610: mov     di, offset unk_2E418
13613: push    ds
13614: push    di
13615: xor     ax, ax
13617: push    ax
13618: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1361D: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13622: mov     di, offset unk_2F60A
13625: push    ds
13626: push    di
13627: mov     di, offset unk_2EF3A
1362A: push    ds
1362B: push    di
1362C: xor     ax, ax
1362E: push    ax
1362F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13634: mov     di, offset asc_104EE; " | "
13637: push    cs
13638: push    di
13639: xor     ax, ax
1363B: push    ax
1363C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13641: mov     di, offset unk_29618
13644: push    ds
13645: push    di
13646: xor     ax, ax
13648: push    ax
13649: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1364E: mov     di, offset asc_104EA; "   "
13651: push    cs
13652: push    di
13653: xor     ax, ax
13655: push    ax
13656: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1365B: mov     di, offset unk_28918
1365E: push    ds
1365F: push    di
13660: xor     ax, ax
13662: push    ax
13663: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13668: mov     di, offset asc_104EA; "   "
1366B: push    cs
1366C: push    di
1366D: xor     ax, ax
1366F: push    ax
13670: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13675: mov     di, offset unk_2BB18
13678: push    ds
13679: push    di
1367A: xor     ax, ax
1367C: push    ax
1367D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13682: mov     di, offset asc_104EA; "   "
13685: push    cs
13686: push    di
13687: xor     ax, ax
13689: push    ax
1368A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1368F: mov     di, offset unk_2C918
13692: push    ds
13693: push    di
13694: xor     ax, ax
13696: push    ax
13697: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1369C: mov     di, offset asc_104EA; "   "
1369F: push    cs
136A0: push    di
136A1: xor     ax, ax
136A3: push    ax
136A4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136A9: mov     di, offset unk_2D718
136AC: push    ds
136AD: push    di
136AE: xor     ax, ax
136B0: push    ax
136B1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136B6: mov     di, offset asc_104EA; "   "
136B9: push    cs
136BA: push    di
136BB: xor     ax, ax
136BD: push    ax
136BE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136C3: mov     di, offset unk_2E518
136C6: push    ds
136C7: push    di
136C8: xor     ax, ax
136CA: push    ax
136CB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136D0: call    @WriteLn$qm4Text; WriteLn(var f: Text)
136D5: mov     di, offset unk_2F60A
136D8: push    ds
136D9: push    di
136DA: mov     di, offset unk_2EF44
136DD: push    ds
136DE: push    di
136DF: xor     ax, ax
136E1: push    ax
136E2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136E7: mov     di, offset asc_104EE; " | "
136EA: push    cs
136EB: push    di
136EC: xor     ax, ax
136EE: push    ax
136EF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
136F4: mov     di, offset unk_29718
136F7: push    ds
136F8: push    di
136F9: xor     ax, ax
136FB: push    ax
136FC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13701: mov     di, offset asc_104EA; "   "
13704: push    cs
13705: push    di
13706: xor     ax, ax
13708: push    ax
13709: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1370E: mov     di, offset unk_28A18
13711: push    ds
13712: push    di
13713: xor     ax, ax
13715: push    ax
13716: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1371B: mov     di, offset asc_104EA; "   "
1371E: push    cs
1371F: push    di
13720: xor     ax, ax
13722: push    ax
13723: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13728: mov     di, offset unk_2BC18
1372B: push    ds
1372C: push    di
1372D: xor     ax, ax
1372F: push    ax
13730: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13735: mov     di, offset asc_104EA; "   "
13738: push    cs
13739: push    di
1373A: xor     ax, ax
1373C: push    ax
1373D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13742: mov     di, offset unk_2CA18
13745: push    ds
13746: push    di
13747: xor     ax, ax
13749: push    ax
1374A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1374F: mov     di, offset asc_104EA; "   "
13752: push    cs
13753: push    di
13754: xor     ax, ax
13756: push    ax
13757: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1375C: mov     di, offset unk_2D818
1375F: push    ds
13760: push    di
13761: xor     ax, ax
13763: push    ax
13764: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13769: mov     di, offset asc_104EA; "   "
1376C: push    cs
1376D: push    di
1376E: xor     ax, ax
13770: push    ax
13771: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13776: mov     di, offset unk_2E618
13779: push    ds
1377A: push    di
1377B: xor     ax, ax
1377D: push    ax
1377E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13783: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13788: mov     di, offset unk_2F60A
1378B: push    ds
1378C: push    di
1378D: mov     di, offset unk_2EF4E
13790: push    ds
13791: push    di
13792: xor     ax, ax
13794: push    ax
13795: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1379A: mov     di, offset asc_104EE; " | "
1379D: push    cs
1379E: push    di
1379F: xor     ax, ax
137A1: push    ax
137A2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137A7: mov     di, offset unk_29818
137AA: push    ds
137AB: push    di
137AC: xor     ax, ax
137AE: push    ax
137AF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137B4: mov     di, offset asc_104EA; "   "
137B7: push    cs
137B8: push    di
137B9: xor     ax, ax
137BB: push    ax
137BC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137C1: mov     di, offset unk_28B18
137C4: push    ds
137C5: push    di
137C6: xor     ax, ax
137C8: push    ax
137C9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137CE: mov     di, offset asc_104EA; "   "
137D1: push    cs
137D2: push    di
137D3: xor     ax, ax
137D5: push    ax
137D6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137DB: mov     di, offset unk_2BD18
137DE: push    ds
137DF: push    di
137E0: xor     ax, ax
137E2: push    ax
137E3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137E8: mov     di, offset asc_104EA; "   "
137EB: push    cs
137EC: push    di
137ED: xor     ax, ax
137EF: push    ax
137F0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
137F5: mov     di, offset unk_2CB18
137F8: push    ds
137F9: push    di
137FA: xor     ax, ax
137FC: push    ax
137FD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13802: mov     di, offset asc_104EA; "   "
13805: push    cs
13806: push    di
13807: xor     ax, ax
13809: push    ax
1380A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1380F: mov     di, offset unk_2D918
13812: push    ds
13813: push    di
13814: xor     ax, ax
13816: push    ax
13817: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1381C: mov     di, offset asc_104EA; "   "
1381F: push    cs
13820: push    di
13821: xor     ax, ax
13823: push    ax
13824: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13829: mov     di, offset unk_2E718
1382C: push    ds
1382D: push    di
1382E: xor     ax, ax
13830: push    ax
13831: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13836: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1383B: mov     di, offset unk_2F60A
1383E: push    ds
1383F: push    di
13840: mov     di, offset unk_2EF58
13843: push    ds
13844: push    di
13845: xor     ax, ax
13847: push    ax
13848: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1384D: mov     di, offset asc_104EE; " | "
13850: push    cs
13851: push    di
13852: xor     ax, ax
13854: push    ax
13855: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1385A: mov     di, offset unk_29918
1385D: push    ds
1385E: push    di
1385F: xor     ax, ax
13861: push    ax
13862: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13867: mov     di, offset asc_104EA; "   "
1386A: push    cs
1386B: push    di
1386C: xor     ax, ax
1386E: push    ax
1386F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13874: mov     di, offset unk_28C18
13877: push    ds
13878: push    di
13879: xor     ax, ax
1387B: push    ax
1387C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13881: mov     di, offset asc_104EA; "   "
13884: push    cs
13885: push    di
13886: xor     ax, ax
13888: push    ax
13889: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1388E: mov     di, offset unk_2BE18
13891: push    ds
13892: push    di
13893: xor     ax, ax
13895: push    ax
13896: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1389B: mov     di, offset asc_104EA; "   "
1389E: push    cs
1389F: push    di
138A0: xor     ax, ax
138A2: push    ax
138A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138A8: mov     di, offset unk_2CC18
138AB: push    ds
138AC: push    di
138AD: xor     ax, ax
138AF: push    ax
138B0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138B5: mov     di, offset asc_104EA; "   "
138B8: push    cs
138B9: push    di
138BA: xor     ax, ax
138BC: push    ax
138BD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138C2: mov     di, offset unk_2DA18
138C5: push    ds
138C6: push    di
138C7: xor     ax, ax
138C9: push    ax
138CA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138CF: mov     di, offset asc_104EA; "   "
138D2: push    cs
138D3: push    di
138D4: xor     ax, ax
138D6: push    ax
138D7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138DC: mov     di, offset unk_2E818
138DF: push    ds
138E0: push    di
138E1: xor     ax, ax
138E3: push    ax
138E4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
138E9: call    @WriteLn$qm4Text; WriteLn(var f: Text)
138EE: mov     di, offset unk_2F60A
138F1: push    ds
138F2: push    di
138F3: mov     di, offset unk_2EF62
138F6: push    ds
138F7: push    di
138F8: xor     ax, ax
138FA: push    ax
138FB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13900: mov     di, offset asc_104EE; " | "
13903: push    cs
13904: push    di
13905: xor     ax, ax
13907: push    ax
13908: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1390D: mov     di, offset unk_29A18
13910: push    ds
13911: push    di
13912: xor     ax, ax
13914: push    ax
13915: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1391A: mov     di, offset asc_104EA; "   "
1391D: push    cs
1391E: push    di
1391F: xor     ax, ax
13921: push    ax
13922: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13927: mov     di, offset unk_28D18
1392A: push    ds
1392B: push    di
1392C: xor     ax, ax
1392E: push    ax
1392F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13934: mov     di, offset asc_104EA; "   "
13937: push    cs
13938: push    di
13939: xor     ax, ax
1393B: push    ax
1393C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13941: mov     di, offset unk_2BF18
13944: push    ds
13945: push    di
13946: xor     ax, ax
13948: push    ax
13949: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1394E: mov     di, offset asc_104EA; "   "
13951: push    cs
13952: push    di
13953: xor     ax, ax
13955: push    ax
13956: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1395B: mov     di, offset unk_2CD18
1395E: push    ds
1395F: push    di
13960: xor     ax, ax
13962: push    ax
13963: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13968: mov     di, offset asc_104EA; "   "
1396B: push    cs
1396C: push    di
1396D: xor     ax, ax
1396F: push    ax
13970: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13975: mov     di, offset unk_2DB18
13978: push    ds
13979: push    di
1397A: xor     ax, ax
1397C: push    ax
1397D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13982: mov     di, offset asc_104EA; "   "
13985: push    cs
13986: push    di
13987: xor     ax, ax
13989: push    ax
1398A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1398F: mov     di, offset unk_2E918
13992: push    ds
13993: push    di
13994: xor     ax, ax
13996: push    ax
13997: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1399C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
139A1: mov     di, offset unk_2F60A
139A4: push    ds
139A5: push    di
139A6: mov     di, offset unk_2EF6C
139A9: push    ds
139AA: push    di
139AB: xor     ax, ax
139AD: push    ax
139AE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139B3: mov     di, offset asc_104EE; " | "
139B6: push    cs
139B7: push    di
139B8: xor     ax, ax
139BA: push    ax
139BB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139C0: mov     di, offset unk_29B18
139C3: push    ds
139C4: push    di
139C5: xor     ax, ax
139C7: push    ax
139C8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139CD: mov     di, offset asc_104EA; "   "
139D0: push    cs
139D1: push    di
139D2: xor     ax, ax
139D4: push    ax
139D5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139DA: mov     di, offset unk_28E18
139DD: push    ds
139DE: push    di
139DF: xor     ax, ax
139E1: push    ax
139E2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139E7: mov     di, offset asc_104EA; "   "
139EA: push    cs
139EB: push    di
139EC: xor     ax, ax
139EE: push    ax
139EF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
139F4: mov     di, offset unk_2C018
139F7: push    ds
139F8: push    di
139F9: xor     ax, ax
139FB: push    ax
139FC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A01: mov     di, offset asc_104EA; "   "
13A04: push    cs
13A05: push    di
13A06: xor     ax, ax
13A08: push    ax
13A09: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A0E: mov     di, offset unk_2CE18
13A11: push    ds
13A12: push    di
13A13: xor     ax, ax
13A15: push    ax
13A16: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A1B: mov     di, offset asc_104EA; "   "
13A1E: push    cs
13A1F: push    di
13A20: xor     ax, ax
13A22: push    ax
13A23: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A28: mov     di, offset unk_2DC18
13A2B: push    ds
13A2C: push    di
13A2D: xor     ax, ax
13A2F: push    ax
13A30: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A35: mov     di, offset asc_104EA; "   "
13A38: push    cs
13A39: push    di
13A3A: xor     ax, ax
13A3C: push    ax
13A3D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A42: mov     di, offset unk_2EA18
13A45: push    ds
13A46: push    di
13A47: xor     ax, ax
13A49: push    ax
13A4A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
13A4F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13A54: mov     di, offset unk_2F60A
13A57: push    ds
13A58: push    di
13A59: call    @WriteLn$qm4Text; WriteLn(var f: Text)
13A5E: mov     di, offset unk_2F50A
13A61: push    ds
13A62: push    di
13A63: call    @ReadLn$qm4Text; ReadLn(var f: Text)
13A68: mov     al, 1
13A6A: push    ax
13A6B: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
13A70: mov     al, 0Fh
13A72: push    ax
13A73: call    @TEXTCOLOR$q4BYTE; TEXTCOLOR(BYTE)
13A78: call    @CLRSCR$qv; CLRSCR(void)
13A7D: mov     di, offset unk_28F18
13A80: push    ds
13A81: push    di
13A82: mov     di, offset unk_2A318
13A85: push    ds
13A86: push    di
13A87: mov     ax, 0FFh
13A8A: push    ax
13A8B: call    @$basg$qm6Stringt14Byte; Store string
13A90: mov     di, offset unk_29018
13A93: push    ds
13A94: push    di
13A95: mov     di, offset unk_2A518
13A98: push    ds
13A99: push    di
13A9A: mov     ax, 0FFh
13A9D: push    ax
13A9E: call    @$basg$qm6Stringt14Byte; Store string
13AA3: mov     di, offset unk_29118
13AA6: push    ds
13AA7: push    di
13AA8: mov     di, offset unk_2A418
13AAB: push    ds
13AAC: push    di
13AAD: mov     ax, 0FFh
13AB0: push    ax
13AB1: call    @$basg$qm6Stringt14Byte; Store string
13AB6: mov     di, offset unk_29418
13AB9: push    ds
13ABA: push    di
13ABB: mov     di, offset unk_2A618
13ABE: push    ds
13ABF: push    di
13AC0: mov     ax, 0FFh
13AC3: push    ax
13AC4: call    @$basg$qm6Stringt14Byte; Store string
13AC9: mov     di, offset unk_29318
13ACC: push    ds
13ACD: push    di
13ACE: mov     di, offset unk_2AE18
13AD1: push    ds
13AD2: push    di
13AD3: mov     ax, 0FFh
13AD6: push    ax
13AD7: call    @$basg$qm6Stringt14Byte; Store string
13ADC: mov     di, offset unk_29518
13ADF: push    ds
13AE0: push    di
13AE1: mov     di, offset unk_2AF18
13AE4: push    ds
13AE5: push    di
13AE6: mov     ax, 0FFh
13AE9: push    ax
13AEA: call    @$basg$qm6Stringt14Byte; Store string
13AEF: mov     di, offset unk_29218
13AF2: push    ds
13AF3: push    di
13AF4: mov     di, offset unk_2A718
13AF7: push    ds
13AF8: push    di
13AF9: mov     ax, 0FFh
13AFC: push    ax
13AFD: call    @$basg$qm6Stringt14Byte; Store string
13B02: mov     di, offset unk_29618
13B05: push    ds
13B06: push    di
13B07: mov     di, offset unk_2A818
13B0A: push    ds
13B0B: push    di
13B0C: mov     ax, 0FFh
13B0F: push    ax
13B10: call    @$basg$qm6Stringt14Byte; Store string
13B15: mov     di, offset unk_29718
13B18: push    ds
13B19: push    di
13B1A: mov     di, offset unk_2A918
13B1D: push    ds
13B1E: push    di
13B1F: mov     ax, 0FFh
13B22: push    ax
13B23: call    @$basg$qm6Stringt14Byte; Store string
13B28: mov     di, offset unk_29818
13B2B: push    ds
13B2C: push    di
13B2D: mov     di, offset unk_2AA18
13B30: push    ds
13B31: push    di
13B32: mov     ax, 0FFh
13B35: push    ax
13B36: call    @$basg$qm6Stringt14Byte; Store string
13B3B: mov     di, offset unk_29918
13B3E: push    ds
13B3F: push    di
13B40: mov     di, offset unk_2AB18
13B43: push    ds
13B44: push    di
13B45: mov     ax, 0FFh
13B48: push    ax
13B49: call    @$basg$qm6Stringt14Byte; Store string
13B4E: mov     di, offset unk_29A18
13B51: push    ds
13B52: push    di
13B53: mov     di, offset unk_2AC18
13B56: push    ds
13B57: push    di
13B58: mov     ax, 0FFh
13B5B: push    ax
13B5C: call    @$basg$qm6Stringt14Byte; Store string
13B61: mov     di, offset unk_29B18
13B64: push    ds
13B65: push    di
13B66: mov     di, offset unk_2AD18
13B69: push    ds
13B6A: push    di
13B6B: mov     ax, 0FFh
13B6E: push    ax
13B6F: call    @$basg$qm6Stringt14Byte; Store string
13B74: call    sub_1C620
13B79: mov     ax, word_27E24
13B7C: mov     word_27E3E, ax
13B7F: mov     ax, word_27E28
13B82: mov     word_27E40, ax
13B85: mov     ax, word_27E26
13B88: mov     word_27E42, ax
13B8B: mov     ax, word_27E2A
13B8E: mov     word_27E48, ax
13B91: mov     ax, word_27E3A
13B94: mov     word_27E46, ax
13B97: mov     ax, word_27E3C
13B9A: mov     word_27E4A, ax
13B9D: mov     ax, word_27E2C
13BA0: mov     word_27E44, ax
13BA3: mov     ax, word_27E2E
13BA6: mov     word_27E4C, ax
13BA9: mov     ax, word_27E30
13BAC: mov     word_27E4E, ax
13BAF: mov     ax, word_27E32
13BB2: mov     word_27E50, ax
13BB5: mov     ax, word_27E34
13BB8: mov     word_27E52, ax
13BBB: mov     ax, word_27E36
13BBE: mov     word_27E54, ax
13BC1: mov     ax, word_27E38
13BC4: mov     word_27E56, ax
13BC7: mov     di, offset unk_28218
13BCA: push    ds
13BCB: push    di
13BCC: mov     di, offset unk_2A318
13BCF: push    ds
13BD0: push    di
13BD1: mov     ax, 0FFh
13BD4: push    ax
13BD5: call    @$basg$qm6Stringt14Byte; Store string
13BDA: mov     di, offset unk_28318
13BDD: push    ds
13BDE: push    di
13BDF: mov     di, offset unk_2A518
13BE2: push    ds
13BE3: push    di
13BE4: mov     ax, 0FFh
13BE7: push    ax
13BE8: call    @$basg$qm6Stringt14Byte; Store string
13BED: mov     di, offset unk_28418
13BF0: push    ds
13BF1: push    di
13BF2: mov     di, offset unk_2A418
13BF5: push    ds
13BF6: push    di
13BF7: mov     ax, 0FFh
13BFA: push    ax
13BFB: call    @$basg$qm6Stringt14Byte; Store string
13C00: mov     di, offset unk_28718
13C03: push    ds
13C04: push    di
13C05: mov     di, offset unk_2A618
13C08: push    ds
13C09: push    di
13C0A: mov     ax, 0FFh
13C0D: push    ax
13C0E: call    @$basg$qm6Stringt14Byte; Store string
13C13: mov     di, offset unk_28618
13C16: push    ds
13C17: push    di
13C18: mov     di, offset unk_2AE18
13C1B: push    ds
13C1C: push    di
13C1D: mov     ax, 0FFh
13C20: push    ax
13C21: call    @$basg$qm6Stringt14Byte; Store string
13C26: mov     di, offset unk_28818
13C29: push    ds
13C2A: push    di
13C2B: mov     di, offset unk_2AF18
13C2E: push    ds
13C2F: push    di
13C30: mov     ax, 0FFh
13C33: push    ax
13C34: call    @$basg$qm6Stringt14Byte; Store string
13C39: mov     di, offset unk_28518
13C3C: push    ds
13C3D: push    di
13C3E: mov     di, offset unk_2A718
13C41: push    ds
13C42: push    di
13C43: mov     ax, 0FFh
13C46: push    ax
13C47: call    @$basg$qm6Stringt14Byte; Store string
13C4C: mov     di, offset unk_28918
13C4F: push    ds
13C50: push    di
13C51: mov     di, offset unk_2A818
13C54: push    ds
13C55: push    di
13C56: mov     ax, 0FFh
13C59: push    ax
13C5A: call    @$basg$qm6Stringt14Byte; Store string
13C5F: mov     di, offset unk_28A18
13C62: push    ds
13C63: push    di
13C64: mov     di, offset unk_2A918
13C67: push    ds
13C68: push    di
13C69: mov     ax, 0FFh
13C6C: push    ax
13C6D: call    @$basg$qm6Stringt14Byte; Store string
13C72: mov     di, offset unk_28B18
13C75: push    ds
13C76: push    di
13C77: mov     di, offset unk_2AA18
13C7A: push    ds
13C7B: push    di
13C7C: mov     ax, 0FFh
13C7F: push    ax
13C80: call    @$basg$qm6Stringt14Byte; Store string
13C85: mov     di, offset unk_28C18
13C88: push    ds
13C89: push    di
13C8A: mov     di, offset unk_2AB18
13C8D: push    ds
13C8E: push    di
13C8F: mov     ax, 0FFh
13C92: push    ax
13C93: call    @$basg$qm6Stringt14Byte; Store string
13C98: mov     di, offset unk_28D18
13C9B: push    ds
13C9C: push    di
13C9D: mov     di, offset unk_2AC18
13CA0: push    ds
13CA1: push    di
13CA2: mov     ax, 0FFh
13CA5: push    ax
13CA6: call    @$basg$qm6Stringt14Byte; Store string
13CAB: mov     di, offset unk_28E18
13CAE: push    ds
13CAF: push    di
13CB0: mov     di, offset unk_2AD18
13CB3: push    ds
13CB4: push    di
13CB5: mov     ax, 0FFh
13CB8: push    ax
13CB9: call    @$basg$qm6Stringt14Byte; Store string
13CBE: call    sub_1C620
13CC3: mov     ax, word_27E24
13CC6: mov     word_27E58, ax
13CC9: mov     ax, word_27E28
13CCC: mov     word_27E5A, ax
13CCF: mov     ax, word_27E26
13CD2: mov     word_27E5C, ax
13CD5: mov     ax, word_27E2A
13CD8: mov     word_27E62, ax
13CDB: mov     ax, word_27E3A
13CDE: mov     word_27E60, ax
13CE1: mov     ax, word_27E3C
13CE4: mov     word_27E64, ax
13CE7: mov     ax, word_27E2C
13CEA: mov     word_27E5E, ax
13CED: mov     ax, word_27E2E
13CF0: mov     word_27E66, ax
13CF3: mov     ax, word_27E30
13CF6: mov     word_27E68, ax
13CF9: mov     ax, word_27E32
13CFC: mov     word_27E6A, ax
13CFF: mov     ax, word_27E34
13D02: mov     word_27E6C, ax
13D05: mov     ax, word_27E36
13D08: mov     word_27E6E, ax
13D0B: mov     ax, word_27E38
13D0E: mov     word_27E70, ax
13D11: mov     di, offset unk_2B518
13D14: push    ds
13D15: push    di
13D16: mov     di, offset unk_2A318
13D19: push    ds
13D1A: push    di
13D1B: mov     ax, 0FFh
13D1E: push    ax
13D1F: call    @$basg$qm6Stringt14Byte; Store string
13D24: mov     di, offset unk_2B718
13D27: push    ds
13D28: push    di
13D29: mov     di, offset unk_2A518
13D2C: push    ds
13D2D: push    di
13D2E: mov     ax, 0FFh
13D31: push    ax
13D32: call    @$basg$qm6Stringt14Byte; Store string
13D37: mov     di, offset unk_2B618
13D3A: push    ds
13D3B: push    di
13D3C: mov     di, offset unk_2A418
13D3F: push    ds
13D40: push    di
13D41: mov     ax, 0FFh
13D44: push    ax
13D45: call    @$basg$qm6Stringt14Byte; Store string
13D4A: mov     di, offset unk_2B918
13D4D: push    ds
13D4E: push    di
13D4F: mov     di, offset unk_2A618
13D52: push    ds
13D53: push    di
13D54: mov     ax, 0FFh
13D57: push    ax
13D58: call    @$basg$qm6Stringt14Byte; Store string
13D5D: mov     di, offset unk_2C118
13D60: push    ds
13D61: push    di
13D62: mov     di, offset unk_2AE18
13D65: push    ds
13D66: push    di
13D67: mov     ax, 0FFh
13D6A: push    ax
13D6B: call    @$basg$qm6Stringt14Byte; Store string
13D70: mov     di, offset unk_2BA18
13D73: push    ds
13D74: push    di
13D75: mov     di, offset unk_2AF18
13D78: push    ds
13D79: push    di
13D7A: mov     ax, 0FFh
13D7D: push    ax
13D7E: call    @$basg$qm6Stringt14Byte; Store string
13D83: mov     di, offset unk_2B818
13D86: push    ds
13D87: push    di
13D88: mov     di, offset unk_2A718
13D8B: push    ds
13D8C: push    di
13D8D: mov     ax, 0FFh
13D90: push    ax
13D91: call    @$basg$qm6Stringt14Byte; Store string
13D96: mov     di, offset unk_2BB18
13D99: push    ds
13D9A: push    di
13D9B: mov     di, offset unk_2A818
13D9E: push    ds
13D9F: push    di
13DA0: mov     ax, 0FFh
13DA3: push    ax
13DA4: call    @$basg$qm6Stringt14Byte; Store string
13DA9: mov     di, offset unk_2BC18
13DAC: push    ds
13DAD: push    di
13DAE: mov     di, offset unk_2A918
13DB1: push    ds
13DB2: push    di
13DB3: mov     ax, 0FFh
13DB6: push    ax
13DB7: call    @$basg$qm6Stringt14Byte; Store string
13DBC: mov     di, offset unk_2BD18
13DBF: push    ds
13DC0: push    di
13DC1: mov     di, offset unk_2AA18
13DC4: push    ds
13DC5: push    di
13DC6: mov     ax, 0FFh
13DC9: push    ax
13DCA: call    @$basg$qm6Stringt14Byte; Store string
13DCF: mov     di, offset unk_2BE18
13DD2: push    ds
13DD3: push    di
13DD4: mov     di, offset unk_2AB18
13DD7: push    ds
13DD8: push    di
13DD9: mov     ax, 0FFh
13DDC: push    ax
13DDD: call    @$basg$qm6Stringt14Byte; Store string
13DE2: mov     di, offset unk_2BF18
13DE5: push    ds
13DE6: push    di
13DE7: mov     di, offset unk_2AC18
13DEA: push    ds
13DEB: push    di
13DEC: mov     ax, 0FFh
13DEF: push    ax
13DF0: call    @$basg$qm6Stringt14Byte; Store string
13DF5: mov     di, offset unk_2C018
13DF8: push    ds
13DF9: push    di
13DFA: mov     di, offset unk_2AD18
13DFD: push    ds
13DFE: push    di
13DFF: mov     ax, 0FFh
13E02: push    ax
13E03: call    @$basg$qm6Stringt14Byte; Store string
13E08: call    sub_1C620
13E0D: mov     ax, word_27E24
13E10: mov     word_27E76, ax
13E13: mov     ax, word_27E28
13E16: mov     word_27E7A, ax
13E19: mov     ax, word_27E26
13E1C: mov     word_27E78, ax
13E1F: mov     ax, word_27E2A
13E22: mov     word_27E7E, ax
13E25: mov     ax, word_27E3A
13E28: mov     word_27E8E, ax
13E2B: mov     ax, word_27E3C
13E2E: mov     word_27E80, ax
13E31: mov     ax, word_27E2C
13E34: mov     word_27E7C, ax
13E37: mov     ax, word_27E2E
13E3A: mov     word_27E82, ax
13E3D: mov     ax, word_27E30
13E40: mov     word_27E84, ax
13E43: mov     ax, word_27E32
13E46: mov     word_27E86, ax
13E49: mov     ax, word_27E34
13E4C: mov     word_27E88, ax
13E4F: mov     ax, word_27E36
13E52: mov     word_27E8A, ax
13E55: mov     ax, word_27E38
13E58: mov     word_27E8C, ax
13E5B: mov     di, offset unk_2C318
13E5E: push    ds
13E5F: push    di
13E60: mov     di, offset unk_2A318
13E63: push    ds
13E64: push    di
13E65: mov     ax, 0FFh
13E68: push    ax
13E69: call    @$basg$qm6Stringt14Byte; Store string
13E6E: mov     di, offset unk_2C518
13E71: push    ds
13E72: push    di
13E73: mov     di, offset unk_2A518
13E76: push    ds
13E77: push    di
13E78: mov     ax, 0FFh
13E7B: push    ax
13E7C: call    @$basg$qm6Stringt14Byte; Store string
13E81: mov     di, offset unk_2C418
13E84: push    ds
13E85: push    di
13E86: mov     di, offset unk_2A418
13E89: push    ds
13E8A: push    di
13E8B: mov     ax, 0FFh
13E8E: push    ax
13E8F: call    @$basg$qm6Stringt14Byte; Store string
13E94: mov     di, offset unk_2C718
13E97: push    ds
13E98: push    di
13E99: mov     di, offset unk_2A618
13E9C: push    ds
13E9D: push    di
13E9E: mov     ax, 0FFh
13EA1: push    ax
13EA2: call    @$basg$qm6Stringt14Byte; Store string
13EA7: mov     di, offset unk_2CF18
13EAA: push    ds
13EAB: push    di
13EAC: mov     di, offset unk_2AE18
13EAF: push    ds
13EB0: push    di
13EB1: mov     ax, 0FFh
13EB4: push    ax
13EB5: call    @$basg$qm6Stringt14Byte; Store string
13EBA: mov     di, offset unk_2C818
13EBD: push    ds
13EBE: push    di
13EBF: mov     di, offset unk_2AF18
13EC2: push    ds
13EC3: push    di
13EC4: mov     ax, 0FFh
13EC7: push    ax
13EC8: call    @$basg$qm6Stringt14Byte; Store string
13ECD: mov     di, offset unk_2C618
13ED0: push    ds
13ED1: push    di
13ED2: mov     di, offset unk_2A718
13ED5: push    ds
13ED6: push    di
13ED7: mov     ax, 0FFh
13EDA: push    ax
13EDB: call    @$basg$qm6Stringt14Byte; Store string
13EE0: mov     di, offset unk_2C918
13EE3: push    ds
13EE4: push    di
13EE5: mov     di, offset unk_2A818
13EE8: push    ds
13EE9: push    di
13EEA: mov     ax, 0FFh
13EED: push    ax
13EEE: call    @$basg$qm6Stringt14Byte; Store string
13EF3: mov     di, offset unk_2CA18
13EF6: push    ds
13EF7: push    di
13EF8: mov     di, offset unk_2A918
13EFB: push    ds
13EFC: push    di
13EFD: mov     ax, 0FFh
13F00: push    ax
13F01: call    @$basg$qm6Stringt14Byte; Store string
13F06: mov     di, offset unk_2CB18
13F09: push    ds
13F0A: push    di
13F0B: mov     di, offset unk_2AA18
13F0E: push    ds
13F0F: push    di
13F10: mov     ax, 0FFh
13F13: push    ax
13F14: call    @$basg$qm6Stringt14Byte; Store string
13F19: mov     di, offset unk_2CC18
13F1C: push    ds
13F1D: push    di
13F1E: mov     di, offset unk_2AB18
13F21: push    ds
13F22: push    di
13F23: mov     ax, 0FFh
13F26: push    ax
13F27: call    @$basg$qm6Stringt14Byte; Store string
13F2C: mov     di, offset unk_2CD18
13F2F: push    ds
13F30: push    di
13F31: mov     di, offset unk_2AC18
13F34: push    ds
13F35: push    di
13F36: mov     ax, 0FFh
13F39: push    ax
13F3A: call    @$basg$qm6Stringt14Byte; Store string
13F3F: mov     di, offset unk_2CE18
13F42: push    ds
13F43: push    di
13F44: mov     di, offset unk_2AD18
13F47: push    ds
13F48: push    di
13F49: mov     ax, 0FFh
13F4C: push    ax
13F4D: call    @$basg$qm6Stringt14Byte; Store string
13F52: call    sub_1C620
13F57: mov     ax, word_27E24
13F5A: mov     word_27E90, ax
13F5D: mov     ax, word_27E28
13F60: mov     word_27E94, ax
13F63: mov     ax, word_27E26
13F66: mov     word_27E92, ax
13F69: mov     ax, word_27E2A
13F6C: mov     word_27E98, ax
13F6F: mov     ax, word_27E3A
13F72: mov     word_27EA8, ax
13F75: mov     ax, word_27E3C
13F78: mov     word_27E9A, ax
13F7B: mov     ax, word_27E2C
13F7E: mov     word_27E96, ax
13F81: mov     ax, word_27E2E
13F84: mov     word_27E9C, ax
13F87: mov     ax, word_27E30
13F8A: mov     word_27E9E, ax
13F8D: mov     ax, word_27E32
13F90: mov     word_27EA0, ax
13F93: mov     ax, word_27E34
13F96: mov     word_27EA2, ax
13F99: mov     ax, word_27E36
13F9C: mov     word_27EA4, ax
13F9F: mov     ax, word_27E38
13FA2: mov     word_27EA6, ax
13FA5: mov     di, offset unk_2D118
13FA8: push    ds
13FA9: push    di
13FAA: mov     di, offset unk_2A318
13FAD: push    ds
13FAE: push    di
13FAF: mov     ax, 0FFh
13FB2: push    ax
13FB3: call    @$basg$qm6Stringt14Byte; Store string
13FB8: mov     di, offset unk_2D318
13FBB: push    ds
13FBC: push    di
13FBD: mov     di, offset unk_2A518
13FC0: push    ds
13FC1: push    di
13FC2: mov     ax, 0FFh
13FC5: push    ax
13FC6: call    @$basg$qm6Stringt14Byte; Store string
13FCB: mov     di, offset unk_2D218
13FCE: push    ds
13FCF: push    di
13FD0: mov     di, offset unk_2A418
13FD3: push    ds
13FD4: push    di
13FD5: mov     ax, 0FFh
13FD8: push    ax
13FD9: call    @$basg$qm6Stringt14Byte; Store string
13FDE: mov     di, offset unk_2D518
13FE1: push    ds
13FE2: push    di
13FE3: mov     di, offset unk_2A618
13FE6: push    ds
13FE7: push    di
13FE8: mov     ax, 0FFh
13FEB: push    ax
13FEC: call    @$basg$qm6Stringt14Byte; Store string
13FF1: mov     di, offset unk_2DD18
13FF4: push    ds
13FF5: push    di
13FF6: mov     di, offset unk_2AE18
13FF9: push    ds
13FFA: push    di
13FFB: mov     ax, 0FFh
13FFE: push    ax
13FFF: call    @$basg$qm6Stringt14Byte; Store string
14004: mov     di, offset unk_2D618
14007: push    ds
14008: push    di
14009: mov     di, offset unk_2AF18
1400C: push    ds
1400D: push    di
1400E: mov     ax, 0FFh
14011: push    ax
14012: call    @$basg$qm6Stringt14Byte; Store string
14017: mov     di, offset unk_2D418
1401A: push    ds
1401B: push    di
1401C: mov     di, offset unk_2A718
1401F: push    ds
14020: push    di
14021: mov     ax, 0FFh
14024: push    ax
14025: call    @$basg$qm6Stringt14Byte; Store string
1402A: mov     di, offset unk_2D718
1402D: push    ds
1402E: push    di
1402F: mov     di, offset unk_2A818
14032: push    ds
14033: push    di
14034: mov     ax, 0FFh
14037: push    ax
14038: call    @$basg$qm6Stringt14Byte; Store string
1403D: mov     di, offset unk_2D818
14040: push    ds
14041: push    di
14042: mov     di, offset unk_2A918
14045: push    ds
14046: push    di
14047: mov     ax, 0FFh
1404A: push    ax
1404B: call    @$basg$qm6Stringt14Byte; Store string
14050: mov     di, offset unk_2D918
14053: push    ds
14054: push    di
14055: mov     di, offset unk_2AA18
14058: push    ds
14059: push    di
1405A: mov     ax, 0FFh
1405D: push    ax
1405E: call    @$basg$qm6Stringt14Byte; Store string
14063: mov     di, offset unk_2DA18
14066: push    ds
14067: push    di
14068: mov     di, offset unk_2AB18
1406B: push    ds
1406C: push    di
1406D: mov     ax, 0FFh
14070: push    ax
14071: call    @$basg$qm6Stringt14Byte; Store string
14076: mov     di, offset unk_2DB18
14079: push    ds
1407A: push    di
1407B: mov     di, offset unk_2AC18
1407E: push    ds
1407F: push    di
14080: mov     ax, 0FFh
14083: push    ax
14084: call    @$basg$qm6Stringt14Byte; Store string
14089: mov     di, offset unk_2DC18
1408C: push    ds
1408D: push    di
1408E: mov     di, offset unk_2AD18
14091: push    ds
14092: push    di
14093: mov     ax, 0FFh
14096: push    ax
14097: call    @$basg$qm6Stringt14Byte; Store string
1409C: call    sub_1C620
140A1: mov     ax, word_27E24
140A4: mov     word_27EAA, ax
140A7: mov     ax, word_27E28
140AA: mov     word_27EAE, ax
140AD: mov     ax, word_27E26
140B0: mov     word_27EAC, ax
140B3: mov     ax, word_27E2A
140B6: mov     word_27EB2, ax
140B9: mov     ax, word_27E3A
140BC: mov     word_27EC2, ax
140BF: mov     ax, word_27E3C
140C2: mov     word_27EB4, ax
140C5: mov     ax, word_27E2C
140C8: mov     word_27EB0, ax
140CB: mov     ax, word_27E2E
140CE: mov     word_27EB6, ax
140D1: mov     ax, word_27E30
140D4: mov     word_27EB8, ax
140D7: mov     ax, word_27E32
140DA: mov     word_27EBA, ax
140DD: mov     ax, word_27E34
140E0: mov     word_27EBC, ax
140E3: mov     ax, word_27E36
140E6: mov     word_27EBE, ax
140E9: mov     ax, word_27E38
140EC: mov     word_27EC0, ax
140EF: mov     di, offset unk_2DF18
140F2: push    ds
140F3: push    di
140F4: mov     di, offset unk_2A318
140F7: push    ds
140F8: push    di
140F9: mov     ax, 0FFh
140FC: push    ax
140FD: call    @$basg$qm6Stringt14Byte; Store string
14102: mov     di, offset unk_2E118
14105: push    ds
14106: push    di
14107: mov     di, offset unk_2A518
1410A: push    ds
1410B: push    di
1410C: mov     ax, 0FFh
1410F: push    ax
14110: call    @$basg$qm6Stringt14Byte; Store string
14115: mov     di, offset unk_2E018
14118: push    ds
14119: push    di
1411A: mov     di, offset unk_2A418
1411D: push    ds
1411E: push    di
1411F: mov     ax, 0FFh
14122: push    ax
14123: call    @$basg$qm6Stringt14Byte; Store string
14128: mov     di, offset unk_2E318
1412B: push    ds
1412C: push    di
1412D: mov     di, offset unk_2A618
14130: push    ds
14131: push    di
14132: mov     ax, 0FFh
14135: push    ax
14136: call    @$basg$qm6Stringt14Byte; Store string
1413B: mov     di, offset unk_2EB18
1413E: push    ds
1413F: push    di
14140: mov     di, offset unk_2AE18
14143: push    ds
14144: push    di
14145: mov     ax, 0FFh
14148: push    ax
14149: call    @$basg$qm6Stringt14Byte; Store string
1414E: mov     di, offset unk_2E418
14151: push    ds
14152: push    di
14153: mov     di, offset unk_2AF18
14156: push    ds
14157: push    di
14158: mov     ax, 0FFh
1415B: push    ax
1415C: call    @$basg$qm6Stringt14Byte; Store string
14161: mov     di, offset unk_2E218
14164: push    ds
14165: push    di
14166: mov     di, offset unk_2A718
14169: push    ds
1416A: push    di
1416B: mov     ax, 0FFh
1416E: push    ax
1416F: call    @$basg$qm6Stringt14Byte; Store string
14174: mov     di, offset unk_2E518
14177: push    ds
14178: push    di
14179: mov     di, offset unk_2A818
1417C: push    ds
1417D: push    di
1417E: mov     ax, 0FFh
14181: push    ax
14182: call    @$basg$qm6Stringt14Byte; Store string
14187: mov     di, offset unk_2E618
1418A: push    ds
1418B: push    di
1418C: mov     di, offset unk_2A918
1418F: push    ds
14190: push    di
14191: mov     ax, 0FFh
14194: push    ax
14195: call    @$basg$qm6Stringt14Byte; Store string
1419A: mov     di, offset unk_2E718
1419D: push    ds
1419E: push    di
1419F: mov     di, offset unk_2AA18
141A2: push    ds
141A3: push    di
141A4: mov     ax, 0FFh
141A7: push    ax
141A8: call    @$basg$qm6Stringt14Byte; Store string
141AD: mov     di, offset unk_2E818
141B0: push    ds
141B1: push    di
141B2: mov     di, offset unk_2AB18
141B5: push    ds
141B6: push    di
141B7: mov     ax, 0FFh
141BA: push    ax
141BB: call    @$basg$qm6Stringt14Byte; Store string
141C0: mov     di, offset unk_2E918
141C3: push    ds
141C4: push    di
141C5: mov     di, offset unk_2AC18
141C8: push    ds
141C9: push    di
141CA: mov     ax, 0FFh
141CD: push    ax
141CE: call    @$basg$qm6Stringt14Byte; Store string
141D3: mov     di, offset unk_2EA18
141D6: push    ds
141D7: push    di
141D8: mov     di, offset unk_2AD18
141DB: push    ds
141DC: push    di
141DD: mov     ax, 0FFh
141E0: push    ax
141E1: call    @$basg$qm6Stringt14Byte; Store string
141E6: call    sub_1C620
141EB: mov     ax, word_27E24
141EE: mov     word_27EC4, ax
141F1: mov     ax, word_27E28
141F4: mov     word_27EC8, ax
141F7: mov     ax, word_27E26
141FA: mov     word_27EC6, ax
141FD: mov     ax, word_27E2A
14200: mov     word_27ECC, ax
14203: mov     ax, word_27E3A
14206: mov     word_27EDC, ax
14209: mov     ax, word_27E3C
1420C: mov     word_27ECE, ax
1420F: mov     ax, word_27E2C
14212: mov     word_27ECA, ax
14215: mov     ax, word_27E2E
14218: mov     word_27ED0, ax
1421B: mov     ax, word_27E30
1421E: mov     word_27ED2, ax
14221: mov     ax, word_27E32
14224: mov     word_27ED4, ax
14227: mov     ax, word_27E34
1422A: mov     word_27ED6, ax
1422D: mov     ax, word_27E36
14230: mov     word_27ED8, ax
14233: mov     ax, word_27E38
14236: mov     word_27EDA, ax
14239: mov     di, offset unk_29118
1423C: push    ds
1423D: push    di
1423E: mov     di, offset unk_2A318
14241: push    ds
14242: push    di
14243: mov     ax, 0FFh
14246: push    ax
14247: call    @$basg$qm6Stringt14Byte; Store string
1424C: mov     di, offset unk_29018
1424F: push    ds
14250: push    di
14251: mov     di, offset unk_2A518
14254: push    ds
14255: push    di
14256: mov     ax, 0FFh
14259: push    ax
1425A: call    @$basg$qm6Stringt14Byte; Store string
1425F: mov     di, offset unk_29118
14262: push    ds
14263: push    di
14264: mov     di, offset unk_2A418
14267: push    ds
14268: push    di
14269: mov     ax, 0FFh
1426C: push    ax
1426D: call    @$basg$qm6Stringt14Byte; Store string
14272: mov     di, offset unk_29418
14275: push    ds
14276: push    di
14277: mov     di, offset unk_2A618
1427A: push    ds
1427B: push    di
1427C: mov     ax, 0FFh
1427F: push    ax
14280: call    @$basg$qm6Stringt14Byte; Store string
14285: mov     di, offset unk_29318
14288: push    ds
14289: push    di
1428A: mov     di, offset unk_2AE18
1428D: push    ds
1428E: push    di
1428F: mov     ax, 0FFh
14292: push    ax
14293: call    @$basg$qm6Stringt14Byte; Store string
14298: mov     di, offset unk_29518
1429B: push    ds
1429C: push    di
1429D: mov     di, offset unk_2AF18
142A0: push    ds
142A1: push    di
142A2: mov     ax, 0FFh
142A5: push    ax
142A6: call    @$basg$qm6Stringt14Byte; Store string
142AB: mov     di, offset unk_29218
142AE: push    ds
142AF: push    di
142B0: mov     di, offset unk_2A718
142B3: push    ds
142B4: push    di
142B5: mov     ax, 0FFh
142B8: push    ax
142B9: call    @$basg$qm6Stringt14Byte; Store string
142BE: mov     di, offset unk_29618
142C1: push    ds
142C2: push    di
142C3: mov     di, offset unk_2A818
142C6: push    ds
142C7: push    di
142C8: mov     ax, 0FFh
142CB: push    ax
142CC: call    @$basg$qm6Stringt14Byte; Store string
142D1: mov     di, offset unk_29718
142D4: push    ds
142D5: push    di
142D6: mov     di, offset unk_2A918
142D9: push    ds
142DA: push    di
142DB: mov     ax, 0FFh
142DE: push    ax
142DF: call    @$basg$qm6Stringt14Byte; Store string
142E4: mov     di, offset unk_29818
142E7: push    ds
142E8: push    di
142E9: mov     di, offset unk_2AA18
142EC: push    ds
142ED: push    di
142EE: mov     ax, 0FFh
142F1: push    ax
142F2: call    @$basg$qm6Stringt14Byte; Store string
142F7: mov     di, offset unk_29918
142FA: push    ds
142FB: push    di
142FC: mov     di, offset unk_2AB18
142FF: push    ds
14300: push    di
14301: mov     ax, 0FFh
14304: push    ax
14305: call    @$basg$qm6Stringt14Byte; Store string
1430A: mov     di, offset unk_29A18
1430D: push    ds
1430E: push    di
1430F: mov     di, offset unk_2AC18
14312: push    ds
14313: push    di
14314: mov     ax, 0FFh
14317: push    ax
14318: call    @$basg$qm6Stringt14Byte; Store string
1431D: mov     di, offset unk_29B18
14320: push    ds
14321: push    di
14322: mov     di, offset unk_2AD18
14325: push    ds
14326: push    di
14327: mov     ax, 0FFh
1432A: push    ax
1432B: call    @$basg$qm6Stringt14Byte; Store string
14330: call    sub_1C620
14335: mov     ax, word_27E24
14338: mov     word_27EDE, ax
1433B: mov     ax, word_27E28
1433E: mov     word_27EE2, ax
14341: mov     ax, word_27E26
14344: mov     word_27EE0, ax
14347: mov     ax, word_27E2A
1434A: mov     word_27EE6, ax
1434D: mov     ax, word_27E3A
14350: mov     word_27EF6, ax
14353: mov     ax, word_27E3C
14356: mov     word_27EE8, ax
14359: mov     ax, word_27E2C
1435C: mov     word_27EE4, ax
1435F: mov     ax, word_27E2E
14362: mov     word_27EEA, ax
14365: mov     ax, word_27E30
14368: mov     word_27EEC, ax
1436B: mov     ax, word_27E32
1436E: mov     word_27EEE, ax
14371: mov     ax, word_27E34
14374: mov     word_27EF0, ax
14377: mov     ax, word_27E36
1437A: mov     word_27EF2, ax
1437D: mov     ax, word_27E38
14380: mov     word_27EF4, ax
14383: mov     di, offset unk_29018
14386: push    ds
14387: push    di
14388: mov     di, offset unk_2A318
1438B: push    ds
1438C: push    di
1438D: mov     ax, 0FFh
14390: push    ax
14391: call    @$basg$qm6Stringt14Byte; Store string
14396: mov     di, offset unk_29018
14399: push    ds
1439A: push    di
1439B: mov     di, offset unk_2A518
1439E: push    ds
1439F: push    di
143A0: mov     ax, 0FFh
143A3: push    ax
143A4: call    @$basg$qm6Stringt14Byte; Store string
143A9: mov     di, offset unk_29118
143AC: push    ds
143AD: push    di
143AE: mov     di, offset unk_2A418
143B1: push    ds
143B2: push    di
143B3: mov     ax, 0FFh
143B6: push    ax
143B7: call    @$basg$qm6Stringt14Byte; Store string
143BC: mov     di, offset unk_29418
143BF: push    ds
143C0: push    di
143C1: mov     di, offset unk_2A618
143C4: push    ds
143C5: push    di
143C6: mov     ax, 0FFh
143C9: push    ax
143CA: call    @$basg$qm6Stringt14Byte; Store string
143CF: mov     di, offset unk_29318
143D2: push    ds
143D3: push    di
143D4: mov     di, offset unk_2AE18
143D7: push    ds
143D8: push    di
143D9: mov     ax, 0FFh
143DC: push    ax
143DD: call    @$basg$qm6Stringt14Byte; Store string
143E2: mov     di, offset unk_29518
143E5: push    ds
143E6: push    di
143E7: mov     di, offset unk_2AF18
143EA: push    ds
143EB: push    di
143EC: mov     ax, 0FFh
143EF: push    ax
143F0: call    @$basg$qm6Stringt14Byte; Store string
143F5: mov     di, offset unk_29218
143F8: push    ds
143F9: push    di
143FA: mov     di, offset unk_2A718
143FD: push    ds
143FE: push    di
143FF: mov     ax, 0FFh
14402: push    ax
14403: call    @$basg$qm6Stringt14Byte; Store string
14408: mov     di, offset unk_29618
1440B: push    ds
1440C: push    di
1440D: mov     di, offset unk_2A818
14410: push    ds
14411: push    di
14412: mov     ax, 0FFh
14415: push    ax
14416: call    @$basg$qm6Stringt14Byte; Store string
1441B: mov     di, offset unk_29718
1441E: push    ds
1441F: push    di
14420: mov     di, offset unk_2A918
14423: push    ds
14424: push    di
14425: mov     ax, 0FFh
14428: push    ax
14429: call    @$basg$qm6Stringt14Byte; Store string
1442E: mov     di, offset unk_29818
14431: push    ds
14432: push    di
14433: mov     di, offset unk_2AA18
14436: push    ds
14437: push    di
14438: mov     ax, 0FFh
1443B: push    ax
1443C: call    @$basg$qm6Stringt14Byte; Store string
14441: mov     di, offset unk_29918
14444: push    ds
14445: push    di
14446: mov     di, offset unk_2AB18
14449: push    ds
1444A: push    di
1444B: mov     ax, 0FFh
1444E: push    ax
1444F: call    @$basg$qm6Stringt14Byte; Store string
14454: mov     di, offset unk_29A18
14457: push    ds
14458: push    di
14459: mov     di, offset unk_2AC18
1445C: push    ds
1445D: push    di
1445E: mov     ax, 0FFh
14461: push    ax
14462: call    @$basg$qm6Stringt14Byte; Store string
14467: mov     di, offset unk_29B18
1446A: push    ds
1446B: push    di
1446C: mov     di, offset unk_2AD18
1446F: push    ds
14470: push    di
14471: mov     ax, 0FFh
14474: push    ax
14475: call    @$basg$qm6Stringt14Byte; Store string
1447A: call    sub_1C620
1447F: mov     ax, word_27E24
14482: mov     word_27EF8, ax
14485: mov     ax, word_27E28
14488: mov     word_27EFC, ax
1448B: mov     ax, word_27E26
1448E: mov     word_27EFA, ax
14491: mov     ax, word_27E2A
14494: mov     word_27F00, ax
14497: mov     ax, word_27E3A
1449A: mov     word_27F10, ax
1449D: mov     ax, word_27E3C
144A0: mov     word_27F02, ax
144A3: mov     ax, word_27E2C
144A6: mov     word_27EFE, ax
144A9: mov     ax, word_27E2E
144AC: mov     word_27F04, ax
144AF: mov     ax, word_27E30
144B2: mov     word_27F06, ax
144B5: mov     ax, word_27E32
144B8: mov     word_27F08, ax
144BB: mov     ax, word_27E34
144BE: mov     word_27F0A, ax
144C1: mov     ax, word_27E36
144C4: mov     word_27F0C, ax
144C7: mov     ax, word_27E38
144CA: mov     word_27F0E, ax
144CD: mov     di, offset unk_2F60A
144D0: push    ds
144D1: push    di
144D2: mov     di, offset aGrahaPositions; "GRAHA  POSITIONS  IN  SHAD  VARGA"
144D5: push    cs
144D6: push    di
144D7: xor     ax, ax
144D9: push    ax
144DA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
144DF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
144E4: mov     di, offset unk_2F60A
144E7: push    ds
144E8: push    di
144E9: call    @WriteLn$qm4Text; WriteLn(var f: Text)
144EE: mov     di, offset unk_2F60A
144F1: push    ds
144F2: push    di
144F3: mov     di, offset aGrhayaRashiNav_0; "GRHAYA        RASHI  NAVAMSAKA HORA DES"...
144F6: push    cs
144F7: push    di
144F8: xor     ax, ax
144FA: push    ax
144FB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14500: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14505: mov     di, offset unk_2F60A
14508: push    ds
14509: push    di
1450A: mov     di, offset asc_10556; "---------------------------------------"...
1450D: push    cs
1450E: push    di
1450F: xor     ax, ax
14511: push    ax
14512: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14517: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1451C: mov     di, offset unk_2F60A
1451F: push    ds
14520: push    di
14521: mov     di, offset aChandra; "Chandra     |  "
14524: push    cs
14525: push    di
14526: xor     ax, ax
14528: push    ax
14529: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1452E: mov     ax, word_27E40
14531: cwd
14532: push    dx
14533: push    ax
14534: mov     ax, 2
14537: push    ax
14538: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1453D: mov     di, offset asc_105A8; "      "
14540: push    cs
14541: push    di
14542: xor     ax, ax
14544: push    ax
14545: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1454A: mov     ax, word_27E5A
1454D: cwd
1454E: push    dx
1454F: push    ax
14550: mov     ax, 2
14553: push    ax
14554: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14559: mov     di, offset asc_105A8; "      "
1455C: push    cs
1455D: push    di
1455E: xor     ax, ax
14560: push    ax
14561: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14566: mov     ax, word_27E7A
14569: cwd
1456A: push    dx
1456B: push    ax
1456C: mov     ax, 2
1456F: push    ax
14570: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14575: mov     di, offset asc_105A8; "      "
14578: push    cs
14579: push    di
1457A: xor     ax, ax
1457C: push    ax
1457D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14582: mov     ax, word_27E94
14585: cwd
14586: push    dx
14587: push    ax
14588: mov     ax, 2
1458B: push    ax
1458C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14591: mov     di, offset asc_105A8; "      "
14594: push    cs
14595: push    di
14596: xor     ax, ax
14598: push    ax
14599: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1459E: mov     ax, word_27EAE
145A1: cwd
145A2: push    dx
145A3: push    ax
145A4: mov     ax, 2
145A7: push    ax
145A8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
145AD: mov     di, offset asc_105A8; "      "
145B0: push    cs
145B1: push    di
145B2: xor     ax, ax
145B4: push    ax
145B5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
145BA: mov     ax, word_27EC8
145BD: cwd
145BE: push    dx
145BF: push    ax
145C0: mov     ax, 2
145C3: push    ax
145C4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
145C9: call    @WriteLn$qm4Text; WriteLn(var f: Text)
145CE: mov     di, offset unk_2F60A
145D1: push    ds
145D2: push    di
145D3: mov     di, offset aRavi_0; "Ravi        |  "
145D6: push    cs
145D7: push    di
145D8: xor     ax, ax
145DA: push    ax
145DB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
145E0: mov     ax, word_27E42
145E3: cwd
145E4: push    dx
145E5: push    ax
145E6: mov     ax, 2
145E9: push    ax
145EA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
145EF: mov     di, offset asc_105A8; "      "
145F2: push    cs
145F3: push    di
145F4: xor     ax, ax
145F6: push    ax
145F7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
145FC: mov     ax, word_27E5C
145FF: cwd
14600: push    dx
14601: push    ax
14602: mov     ax, 2
14605: push    ax
14606: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1460B: mov     di, offset asc_105A8; "      "
1460E: push    cs
1460F: push    di
14610: xor     ax, ax
14612: push    ax
14613: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14618: mov     ax, word_27E78
1461B: cwd
1461C: push    dx
1461D: push    ax
1461E: mov     ax, 2
14621: push    ax
14622: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14627: mov     di, offset asc_105A8; "      "
1462A: push    cs
1462B: push    di
1462C: xor     ax, ax
1462E: push    ax
1462F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14634: mov     ax, word_27E92
14637: cwd
14638: push    dx
14639: push    ax
1463A: mov     ax, 2
1463D: push    ax
1463E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14643: mov     di, offset asc_105A8; "      "
14646: push    cs
14647: push    di
14648: xor     ax, ax
1464A: push    ax
1464B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14650: mov     ax, word_27EAC
14653: cwd
14654: push    dx
14655: push    ax
14656: mov     ax, 2
14659: push    ax
1465A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1465F: mov     di, offset asc_105A8; "      "
14662: push    cs
14663: push    di
14664: xor     ax, ax
14666: push    ax
14667: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1466C: mov     ax, word_27EC6
1466F: cwd
14670: push    dx
14671: push    ax
14672: mov     ax, 2
14675: push    ax
14676: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1467B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14680: mov     di, offset unk_2F60A
14683: push    ds
14684: push    di
14685: mov     di, offset aBudha; "Budha       |  "
14688: push    cs
14689: push    di
1468A: xor     ax, ax
1468C: push    ax
1468D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14692: mov     ax, word_27E44
14695: cwd
14696: push    dx
14697: push    ax
14698: mov     ax, 2
1469B: push    ax
1469C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
146A1: mov     di, offset asc_105A8; "      "
146A4: push    cs
146A5: push    di
146A6: xor     ax, ax
146A8: push    ax
146A9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
146AE: mov     ax, word_27E5E
146B1: cwd
146B2: push    dx
146B3: push    ax
146B4: mov     ax, 2
146B7: push    ax
146B8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
146BD: mov     di, offset asc_105A8; "      "
146C0: push    cs
146C1: push    di
146C2: xor     ax, ax
146C4: push    ax
146C5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
146CA: mov     ax, word_27E7C
146CD: cwd
146CE: push    dx
146CF: push    ax
146D0: mov     ax, 2
146D3: push    ax
146D4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
146D9: mov     di, offset asc_105A8; "      "
146DC: push    cs
146DD: push    di
146DE: xor     ax, ax
146E0: push    ax
146E1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
146E6: mov     ax, word_27E96
146E9: cwd
146EA: push    dx
146EB: push    ax
146EC: mov     ax, 2
146EF: push    ax
146F0: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
146F5: mov     di, offset asc_105A8; "      "
146F8: push    cs
146F9: push    di
146FA: xor     ax, ax
146FC: push    ax
146FD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14702: mov     ax, word_27EB0
14705: cwd
14706: push    dx
14707: push    ax
14708: mov     ax, 2
1470B: push    ax
1470C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14711: mov     di, offset asc_105A8; "      "
14714: push    cs
14715: push    di
14716: xor     ax, ax
14718: push    ax
14719: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1471E: mov     ax, word_27ECA
14721: cwd
14722: push    dx
14723: push    ax
14724: mov     ax, 2
14727: push    ax
14728: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1472D: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14732: mov     di, offset unk_2F60A
14735: push    ds
14736: push    di
14737: mov     di, offset aSikuru; "Sikuru      |  "
1473A: push    cs
1473B: push    di
1473C: xor     ax, ax
1473E: push    ax
1473F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14744: mov     ax, word_27E46
14747: cwd
14748: push    dx
14749: push    ax
1474A: mov     ax, 2
1474D: push    ax
1474E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14753: mov     di, offset asc_105A8; "      "
14756: push    cs
14757: push    di
14758: xor     ax, ax
1475A: push    ax
1475B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14760: mov     ax, word_27E60
14763: cwd
14764: push    dx
14765: push    ax
14766: mov     ax, 2
14769: push    ax
1476A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1476F: mov     di, offset asc_105A8; "      "
14772: push    cs
14773: push    di
14774: xor     ax, ax
14776: push    ax
14777: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1477C: mov     ax, word_27E8E
1477F: cwd
14780: push    dx
14781: push    ax
14782: mov     ax, 2
14785: push    ax
14786: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1478B: mov     di, offset asc_105A8; "      "
1478E: push    cs
1478F: push    di
14790: xor     ax, ax
14792: push    ax
14793: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14798: mov     ax, word_27EA8
1479B: cwd
1479C: push    dx
1479D: push    ax
1479E: mov     ax, 2
147A1: push    ax
147A2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
147A7: mov     di, offset asc_105A8; "      "
147AA: push    cs
147AB: push    di
147AC: xor     ax, ax
147AE: push    ax
147AF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
147B4: mov     ax, word_27EC2
147B7: cwd
147B8: push    dx
147B9: push    ax
147BA: mov     ax, 2
147BD: push    ax
147BE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
147C3: mov     di, offset asc_105A8; "      "
147C6: push    cs
147C7: push    di
147C8: xor     ax, ax
147CA: push    ax
147CB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
147D0: mov     ax, word_27EDC
147D3: cwd
147D4: push    dx
147D5: push    ax
147D6: mov     ax, 2
147D9: push    ax
147DA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
147DF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
147E4: mov     di, offset unk_2F60A
147E7: push    ds
147E8: push    di
147E9: mov     di, offset aGuru; "Guru        |  "
147EC: push    cs
147ED: push    di
147EE: xor     ax, ax
147F0: push    ax
147F1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
147F6: mov     ax, word_27E4A
147F9: cwd
147FA: push    dx
147FB: push    ax
147FC: mov     ax, 2
147FF: push    ax
14800: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14805: mov     di, offset asc_105A8; "      "
14808: push    cs
14809: push    di
1480A: xor     ax, ax
1480C: push    ax
1480D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14812: mov     ax, word_27E64
14815: cwd
14816: push    dx
14817: push    ax
14818: mov     ax, 2
1481B: push    ax
1481C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14821: mov     di, offset asc_105A8; "      "
14824: push    cs
14825: push    di
14826: xor     ax, ax
14828: push    ax
14829: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1482E: mov     ax, word_27E80
14831: cwd
14832: push    dx
14833: push    ax
14834: mov     ax, 2
14837: push    ax
14838: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1483D: mov     di, offset asc_105A8; "      "
14840: push    cs
14841: push    di
14842: xor     ax, ax
14844: push    ax
14845: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1484A: mov     ax, word_27E9A
1484D: cwd
1484E: push    dx
1484F: push    ax
14850: mov     ax, 2
14853: push    ax
14854: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14859: mov     di, offset asc_105A8; "      "
1485C: push    cs
1485D: push    di
1485E: xor     ax, ax
14860: push    ax
14861: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14866: mov     ax, word_27EB4
14869: cwd
1486A: push    dx
1486B: push    ax
1486C: mov     ax, 2
1486F: push    ax
14870: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14875: mov     di, offset asc_105A8; "      "
14878: push    cs
14879: push    di
1487A: xor     ax, ax
1487C: push    ax
1487D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14882: mov     ax, word_27ECE
14885: cwd
14886: push    dx
14887: push    ax
14888: mov     ax, 2
1488B: push    ax
1488C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14891: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14896: mov     di, offset unk_2F60A
14899: push    ds
1489A: push    di
1489B: mov     di, offset aKuja; "Kuja        |  "
1489E: push    cs
1489F: push    di
148A0: xor     ax, ax
148A2: push    ax
148A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
148A8: mov     ax, word_27E48
148AB: cwd
148AC: push    dx
148AD: push    ax
148AE: mov     ax, 2
148B1: push    ax
148B2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
148B7: mov     di, offset asc_105A8; "      "
148BA: push    cs
148BB: push    di
148BC: xor     ax, ax
148BE: push    ax
148BF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
148C4: mov     ax, word_27E62
148C7: cwd
148C8: push    dx
148C9: push    ax
148CA: mov     ax, 2
148CD: push    ax
148CE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
148D3: mov     di, offset asc_105A8; "      "
148D6: push    cs
148D7: push    di
148D8: xor     ax, ax
148DA: push    ax
148DB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
148E0: mov     ax, word_27E7E
148E3: cwd
148E4: push    dx
148E5: push    ax
148E6: mov     ax, 2
148E9: push    ax
148EA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
148EF: mov     di, offset asc_105A8; "      "
148F2: push    cs
148F3: push    di
148F4: xor     ax, ax
148F6: push    ax
148F7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
148FC: mov     ax, word_27E98
148FF: cwd
14900: push    dx
14901: push    ax
14902: mov     ax, 2
14905: push    ax
14906: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1490B: mov     di, offset asc_105A8; "      "
1490E: push    cs
1490F: push    di
14910: xor     ax, ax
14912: push    ax
14913: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14918: mov     ax, word_27EB2
1491B: cwd
1491C: push    dx
1491D: push    ax
1491E: mov     ax, 2
14921: push    ax
14922: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14927: mov     di, offset asc_105A8; "      "
1492A: push    cs
1492B: push    di
1492C: xor     ax, ax
1492E: push    ax
1492F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14934: mov     ax, word_27ECC
14937: cwd
14938: push    dx
14939: push    ax
1493A: mov     ax, 2
1493D: push    ax
1493E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14943: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14948: mov     di, offset unk_2F60A
1494B: push    ds
1494C: push    di
1494D: mov     di, offset aShani; "Shani       |  "
14950: push    cs
14951: push    di
14952: xor     ax, ax
14954: push    ax
14955: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1495A: mov     ax, word_27E4C
1495D: cwd
1495E: push    dx
1495F: push    ax
14960: mov     ax, 2
14963: push    ax
14964: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14969: mov     di, offset asc_105A8; "      "
1496C: push    cs
1496D: push    di
1496E: xor     ax, ax
14970: push    ax
14971: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14976: mov     ax, word_27E66
14979: cwd
1497A: push    dx
1497B: push    ax
1497C: mov     ax, 2
1497F: push    ax
14980: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14985: mov     di, offset asc_105A8; "      "
14988: push    cs
14989: push    di
1498A: xor     ax, ax
1498C: push    ax
1498D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14992: mov     ax, word_27E82
14995: cwd
14996: push    dx
14997: push    ax
14998: mov     ax, 2
1499B: push    ax
1499C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
149A1: mov     di, offset asc_105A8; "      "
149A4: push    cs
149A5: push    di
149A6: xor     ax, ax
149A8: push    ax
149A9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
149AE: mov     ax, word_27E9C
149B1: cwd
149B2: push    dx
149B3: push    ax
149B4: mov     ax, 2
149B7: push    ax
149B8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
149BD: mov     di, offset asc_105A8; "      "
149C0: push    cs
149C1: push    di
149C2: xor     ax, ax
149C4: push    ax
149C5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
149CA: mov     ax, word_27EB6
149CD: cwd
149CE: push    dx
149CF: push    ax
149D0: mov     ax, 2
149D3: push    ax
149D4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
149D9: mov     di, offset asc_105A8; "      "
149DC: push    cs
149DD: push    di
149DE: xor     ax, ax
149E0: push    ax
149E1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
149E6: mov     ax, word_27ED0
149E9: cwd
149EA: push    dx
149EB: push    ax
149EC: mov     ax, 2
149EF: push    ax
149F0: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
149F5: call    @WriteLn$qm4Text; WriteLn(var f: Text)
149FA: mov     di, offset unk_2F60A
149FD: push    ds
149FE: push    di
149FF: mov     di, offset aRaahu; "Raahu       |  "
14A02: push    cs
14A03: push    di
14A04: xor     ax, ax
14A06: push    ax
14A07: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A0C: mov     ax, word_27E4E
14A0F: cwd
14A10: push    dx
14A11: push    ax
14A12: mov     ax, 2
14A15: push    ax
14A16: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14A1B: mov     di, offset asc_105A8; "      "
14A1E: push    cs
14A1F: push    di
14A20: xor     ax, ax
14A22: push    ax
14A23: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A28: mov     ax, word_27E68
14A2B: cwd
14A2C: push    dx
14A2D: push    ax
14A2E: mov     ax, 2
14A31: push    ax
14A32: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14A37: mov     di, offset asc_105A8; "      "
14A3A: push    cs
14A3B: push    di
14A3C: xor     ax, ax
14A3E: push    ax
14A3F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A44: mov     ax, word_27E84
14A47: cwd
14A48: push    dx
14A49: push    ax
14A4A: mov     ax, 2
14A4D: push    ax
14A4E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14A53: mov     di, offset asc_105A8; "      "
14A56: push    cs
14A57: push    di
14A58: xor     ax, ax
14A5A: push    ax
14A5B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A60: mov     ax, word_27E9E
14A63: cwd
14A64: push    dx
14A65: push    ax
14A66: mov     ax, 2
14A69: push    ax
14A6A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14A6F: mov     di, offset asc_105A8; "      "
14A72: push    cs
14A73: push    di
14A74: xor     ax, ax
14A76: push    ax
14A77: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A7C: mov     ax, word_27EB8
14A7F: cwd
14A80: push    dx
14A81: push    ax
14A82: mov     ax, 2
14A85: push    ax
14A86: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14A8B: mov     di, offset asc_105A8; "      "
14A8E: push    cs
14A8F: push    di
14A90: xor     ax, ax
14A92: push    ax
14A93: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14A98: mov     ax, word_27ED2
14A9B: cwd
14A9C: push    dx
14A9D: push    ax
14A9E: mov     ax, 2
14AA1: push    ax
14AA2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14AA7: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14AAC: mov     di, offset unk_2F60A
14AAF: push    ds
14AB0: push    di
14AB1: mov     di, offset aKethu; "Kethu       |  "
14AB4: push    cs
14AB5: push    di
14AB6: xor     ax, ax
14AB8: push    ax
14AB9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14ABE: mov     ax, word_27E50
14AC1: cwd
14AC2: push    dx
14AC3: push    ax
14AC4: mov     ax, 2
14AC7: push    ax
14AC8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14ACD: mov     di, offset asc_105A8; "      "
14AD0: push    cs
14AD1: push    di
14AD2: xor     ax, ax
14AD4: push    ax
14AD5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14ADA: mov     ax, word_27E6A
14ADD: cwd
14ADE: push    dx
14ADF: push    ax
14AE0: mov     ax, 2
14AE3: push    ax
14AE4: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14AE9: mov     di, offset asc_105A8; "      "
14AEC: push    cs
14AED: push    di
14AEE: xor     ax, ax
14AF0: push    ax
14AF1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14AF6: mov     ax, word_27E86
14AF9: cwd
14AFA: push    dx
14AFB: push    ax
14AFC: mov     ax, 2
14AFF: push    ax
14B00: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B05: mov     di, offset asc_105A8; "      "
14B08: push    cs
14B09: push    di
14B0A: xor     ax, ax
14B0C: push    ax
14B0D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14B12: mov     ax, word_27EA0
14B15: cwd
14B16: push    dx
14B17: push    ax
14B18: mov     ax, 2
14B1B: push    ax
14B1C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B21: mov     di, offset asc_105A8; "      "
14B24: push    cs
14B25: push    di
14B26: xor     ax, ax
14B28: push    ax
14B29: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14B2E: mov     ax, word_27EBA
14B31: cwd
14B32: push    dx
14B33: push    ax
14B34: mov     ax, 2
14B37: push    ax
14B38: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B3D: mov     di, offset asc_105A8; "      "
14B40: push    cs
14B41: push    di
14B42: xor     ax, ax
14B44: push    ax
14B45: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14B4A: mov     ax, word_27ED4
14B4D: cwd
14B4E: push    dx
14B4F: push    ax
14B50: mov     ax, 2
14B53: push    ax
14B54: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B59: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14B5E: mov     di, offset unk_2F60A
14B61: push    ds
14B62: push    di
14B63: mov     di, offset aUrenus; "Urenus      |  "
14B66: push    cs
14B67: push    di
14B68: xor     ax, ax
14B6A: push    ax
14B6B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14B70: mov     ax, word_27E52
14B73: cwd
14B74: push    dx
14B75: push    ax
14B76: mov     ax, 2
14B79: push    ax
14B7A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B7F: mov     di, offset asc_105A8; "      "
14B82: push    cs
14B83: push    di
14B84: xor     ax, ax
14B86: push    ax
14B87: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14B8C: mov     ax, word_27E6C
14B8F: cwd
14B90: push    dx
14B91: push    ax
14B92: mov     ax, 2
14B95: push    ax
14B96: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14B9B: mov     di, offset asc_105A8; "      "
14B9E: push    cs
14B9F: push    di
14BA0: xor     ax, ax
14BA2: push    ax
14BA3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14BA8: mov     ax, word_27E88
14BAB: cwd
14BAC: push    dx
14BAD: push    ax
14BAE: mov     ax, 2
14BB1: push    ax
14BB2: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14BB7: mov     di, offset asc_105A8; "      "
14BBA: push    cs
14BBB: push    di
14BBC: xor     ax, ax
14BBE: push    ax
14BBF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14BC4: mov     ax, word_27EA2
14BC7: cwd
14BC8: push    dx
14BC9: push    ax
14BCA: mov     ax, 2
14BCD: push    ax
14BCE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14BD3: mov     di, offset asc_105A8; "      "
14BD6: push    cs
14BD7: push    di
14BD8: xor     ax, ax
14BDA: push    ax
14BDB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14BE0: mov     ax, word_27EBC
14BE3: cwd
14BE4: push    dx
14BE5: push    ax
14BE6: mov     ax, 2
14BE9: push    ax
14BEA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14BEF: mov     di, offset asc_105A8; "      "
14BF2: push    cs
14BF3: push    di
14BF4: xor     ax, ax
14BF6: push    ax
14BF7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14BFC: mov     ax, word_27ED6
14BFF: cwd
14C00: push    dx
14C01: push    ax
14C02: mov     ax, 2
14C05: push    ax
14C06: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14C0B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14C10: mov     di, offset unk_2F60A
14C13: push    ds
14C14: push    di
14C15: mov     di, offset aNeptune; "Neptune     |  "
14C18: push    cs
14C19: push    di
14C1A: xor     ax, ax
14C1C: push    ax
14C1D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14C22: mov     ax, word_27E54
14C25: cwd
14C26: push    dx
14C27: push    ax
14C28: mov     ax, 2
14C2B: push    ax
14C2C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14C31: mov     di, offset asc_105A8; "      "
14C34: push    cs
14C35: push    di
14C36: xor     ax, ax
14C38: push    ax
14C39: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14C3E: mov     ax, word_27E6E
14C41: cwd
14C42: push    dx
14C43: push    ax
14C44: mov     ax, 2
14C47: push    ax
14C48: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14C4D: mov     di, offset asc_105A8; "      "
14C50: push    cs
14C51: push    di
14C52: xor     ax, ax
14C54: push    ax
14C55: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14C5A: mov     ax, word_27E8A
14C5D: cwd
14C5E: push    dx
14C5F: push    ax
14C60: mov     ax, 2
14C63: push    ax
14C64: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14C69: mov     di, offset asc_105A8; "      "
14C6C: push    cs
14C6D: push    di
14C6E: xor     ax, ax
14C70: push    ax
14C71: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14C76: mov     ax, word_27EA4
14C79: cwd
14C7A: push    dx
14C7B: push    ax
14C7C: mov     ax, 2
14C7F: push    ax
14C80: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14C85: mov     di, offset asc_105A8; "      "
14C88: push    cs
14C89: push    di
14C8A: xor     ax, ax
14C8C: push    ax
14C8D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14C92: mov     ax, word_27EBE
14C95: cwd
14C96: push    dx
14C97: push    ax
14C98: mov     ax, 2
14C9B: push    ax
14C9C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14CA1: mov     di, offset asc_105A8; "      "
14CA4: push    cs
14CA5: push    di
14CA6: xor     ax, ax
14CA8: push    ax
14CA9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14CAE: mov     ax, word_27ED8
14CB1: cwd
14CB2: push    dx
14CB3: push    ax
14CB4: mov     ax, 2
14CB7: push    ax
14CB8: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14CBD: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14CC2: mov     di, offset unk_2F60A
14CC5: push    ds
14CC6: push    di
14CC7: mov     di, offset aPluuto; "Pluuto      |  "
14CCA: push    cs
14CCB: push    di
14CCC: xor     ax, ax
14CCE: push    ax
14CCF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14CD4: mov     ax, word_27E56
14CD7: cwd
14CD8: push    dx
14CD9: push    ax
14CDA: mov     ax, 2
14CDD: push    ax
14CDE: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14CE3: mov     di, offset asc_105A8; "      "
14CE6: push    cs
14CE7: push    di
14CE8: xor     ax, ax
14CEA: push    ax
14CEB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14CF0: mov     ax, word_27E70
14CF3: cwd
14CF4: push    dx
14CF5: push    ax
14CF6: mov     ax, 2
14CF9: push    ax
14CFA: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14CFF: mov     di, offset asc_105A8; "      "
14D02: push    cs
14D03: push    di
14D04: xor     ax, ax
14D06: push    ax
14D07: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14D0C: mov     ax, word_27E8C
14D0F: cwd
14D10: push    dx
14D11: push    ax
14D12: mov     ax, 2
14D15: push    ax
14D16: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14D1B: mov     di, offset asc_105A8; "      "
14D1E: push    cs
14D1F: push    di
14D20: xor     ax, ax
14D22: push    ax
14D23: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14D28: mov     ax, word_27EA6
14D2B: cwd
14D2C: push    dx
14D2D: push    ax
14D2E: mov     ax, 2
14D31: push    ax
14D32: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14D37: mov     di, offset asc_105A8; "      "
14D3A: push    cs
14D3B: push    di
14D3C: xor     ax, ax
14D3E: push    ax
14D3F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14D44: mov     ax, word_27EC0
14D47: cwd
14D48: push    dx
14D49: push    ax
14D4A: mov     ax, 2
14D4D: push    ax
14D4E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14D53: mov     di, offset asc_105A8; "      "
14D56: push    cs
14D57: push    di
14D58: xor     ax, ax
14D5A: push    ax
14D5B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
14D60: mov     ax, word_27EDA
14D63: cwd
14D64: push    dx
14D65: push    ax
14D66: mov     ax, 2
14D69: push    ax
14D6A: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
14D6F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
14D74: mov     di, offset unk_2F50A
14D77: push    ds
14D78: push    di
14D79: call    @ReadLn$qm4Text; ReadLn(var f: Text)
14D7E: call    @CLRSCR$qv; CLRSCR(void)
14D83: mov     di, offset asc_1065F; " "
14D86: push    cs
14D87: push    di
14D88: mov     di, offset unk_2B018
14D8B: push    ds
14D8C: push    di
14D8D: mov     ax, 0FFh
14D90: push    ax
14D91: call    @$basg$qm6Stringt14Byte; Store string
14D96: mov     di, offset asc_1065F; " "
14D99: push    cs
14D9A: push    di
14D9B: mov     di, offset unk_2B118
14D9E: push    ds
14D9F: push    di
14DA0: mov     ax, 0FFh
14DA3: push    ax
14DA4: call    @$basg$qm6Stringt14Byte; Store string
14DA9: mov     di, offset unk_28F18
14DAC: push    ds
14DAD: push    di
14DAE: mov     di, offset unk_27942
14DB1: push    ds
14DB2: push    di
14DB3: mov     ax, 0FFh
14DB6: push    ax
14DB7: call    @$basg$qm6Stringt14Byte; Store string
14DBC: mov     di, offset unk_28218
14DBF: push    ds
14DC0: push    di
14DC1: mov     di, offset unk_27A42
14DC4: push    ds
14DC5: push    di
14DC6: mov     ax, 0FFh
14DC9: push    ax
14DCA: call    @$basg$qm6Stringt14Byte; Store string
14DCF: call    sub_1CBB2
14DD4: mov     di, offset aLagna_1; "LAGNA"
14DD7: push    cs
14DD8: push    di
14DD9: mov     di, offset unk_2B018
14DDC: push    ds
14DDD: push    di
14DDE: mov     ax, 0FFh
14DE1: push    ax
14DE2: call    @$basg$qm6Stringt14Byte; Store string
14DE7: mov     di, offset aLagnaKendrayaN; "            LAGNA   KENDRAYA           "...
14DEA: push    cs
14DEB: push    di
14DEC: mov     di, offset unk_2B218
14DEF: push    ds
14DF0: push    di
14DF1: mov     ax, 0FFh
14DF4: push    ax
14DF5: call    @$basg$qm6Stringt14Byte; Store string
14DFA: mov     di, offset aNavamsaka; "NAVAMSAKA"
14DFD: push    cs
14DFE: push    di
14DFF: mov     di, offset unk_2B118
14E02: push    ds
14E03: push    di
14E04: mov     ax, 0FFh
14E07: push    ax
14E08: call    @$basg$qm6Stringt14Byte; Store string
14E0D: call    sub_1D989
14E12: mov     di, offset unk_2F50A
14E15: push    ds
14E16: push    di
14E17: call    @ReadLn$qm4Text; ReadLn(var f: Text)
14E1C: call    @CLRSCR$qv; CLRSCR(void)
14E21: call    sub_1CBB2
14E26: mov     ax, word_27E78
14E29: mov     word_27E42, ax
14E2C: mov     ax, word_27E7A
14E2F: mov     word_27E40, ax
14E32: mov     ax, word_27E7E
14E35: mov     word_27E48, ax
14E38: mov     ax, word_27E7C
14E3B: mov     word_27E44, ax
14E3E: mov     ax, word_27E80
14E41: mov     word_27E4A, ax
14E44: mov     ax, word_27E82
14E47: mov     word_27E4C, ax
14E4A: mov     ax, word_27E8E
14E4D: mov     word_27E46, ax
14E50: mov     ax, word_27E84
14E53: mov     word_27E4E, ax
14E56: mov     ax, word_27E86
14E59: mov     word_27E50, ax
14E5C: mov     ax, word_27E92
14E5F: mov     word_27E5C, ax
14E62: mov     ax, word_27E94
14E65: mov     word_27E5A, ax
14E68: mov     ax, word_27E98
14E6B: mov     word_27E62, ax
14E6E: mov     ax, word_27E96
14E71: mov     word_27E5E, ax
14E74: mov     ax, word_27E9A
14E77: mov     word_27E64, ax
14E7A: mov     ax, word_27E9C
14E7D: mov     word_27E66, ax
14E80: mov     ax, word_27EA8
14E83: mov     word_27E60, ax
14E86: mov     ax, word_27E9E
14E89: mov     word_27E68, ax
14E8C: mov     ax, word_27EA0
14E8F: mov     word_27E6A, ax
14E92: mov     di, offset unk_2B518
14E95: push    ds
14E96: push    di
14E97: mov     di, offset unk_28F18
14E9A: push    ds
14E9B: push    di
14E9C: mov     ax, 0FFh
14E9F: push    ax
14EA0: call    @$basg$qm6Stringt14Byte; Store string
14EA5: mov     di, offset aHora; "HORA"
14EA8: push    cs
14EA9: push    di
14EAA: mov     di, offset unk_2B018
14EAD: push    ds
14EAE: push    di
14EAF: mov     ax, 0FFh
14EB2: push    ax
14EB3: call    @$basg$qm6Stringt14Byte; Store string
14EB8: mov     di, offset aHoraKendrayaDe; "            HORA   KENDRAYA            "...
14EBB: push    cs
14EBC: push    di
14EBD: mov     di, offset unk_2B218
14EC0: push    ds
14EC1: push    di
14EC2: mov     ax, 0FFh
14EC5: push    ax
14EC6: call    @$basg$qm6Stringt14Byte; Store string
14ECB: mov     di, offset unk_2C318
14ECE: push    ds
14ECF: push    di
14ED0: mov     di, offset unk_28218
14ED3: push    ds
14ED4: push    di
14ED5: mov     ax, 0FFh
14ED8: push    ax
14ED9: call    @$basg$qm6Stringt14Byte; Store string
14EDE: mov     di, offset aDeshkana; "DESHKANA"
14EE1: push    cs
14EE2: push    di
14EE3: mov     di, offset unk_2B118
14EE6: push    ds
14EE7: push    di
14EE8: mov     ax, 0FFh
14EEB: push    ax
14EEC: call    @$basg$qm6Stringt14Byte; Store string
14EF1: call    sub_1D989
14EF6: mov     di, offset unk_2F50A
14EF9: push    ds
14EFA: push    di
14EFB: call    @ReadLn$qm4Text; ReadLn(var f: Text)
14F00: call    @CLRSCR$qv; CLRSCR(void)
14F05: call    @CLRSCR$qv; CLRSCR(void)
14F0A: call    sub_1CBB2
14F0F: mov     ax, word_27EAC
14F12: mov     word_27E42, ax
14F15: mov     ax, word_27EAE
14F18: mov     word_27E40, ax
14F1B: mov     ax, word_27EB2
14F1E: mov     word_27E48, ax
14F21: mov     ax, word_27EB0
14F24: mov     word_27E44, ax
14F27: mov     ax, word_27EB4
14F2A: mov     word_27E4A, ax
14F2D: mov     ax, word_27EB6
14F30: mov     word_27E4C, ax
14F33: mov     ax, word_27EC2
14F36: mov     word_27E46, ax
14F39: mov     ax, word_27EB8
14F3C: mov     word_27E4E, ax
14F3F: mov     ax, word_27EBA
14F42: mov     word_27E50, ax
14F45: mov     ax, word_27EC6
14F48: mov     word_27E5C, ax
14F4B: mov     ax, word_27EC8
14F4E: mov     word_27E5A, ax
14F51: mov     ax, word_27ECC
14F54: mov     word_27E62, ax
14F57: mov     ax, word_27ECA
14F5A: mov     word_27E5E, ax
14F5D: mov     ax, word_27ECE
14F60: mov     word_27E64, ax
14F63: mov     ax, word_27ED0
14F66: mov     word_27E66, ax
14F69: mov     ax, word_27EDC
14F6C: mov     word_27E60, ax
14F6F: mov     ax, word_27ED2
14F72: mov     word_27E68, ax
14F75: mov     ax, word_27ED4
14F78: mov     word_27E6A, ax
14F7B: mov     di, offset unk_2D118
14F7E: push    ds
14F7F: push    di
14F80: mov     di, offset unk_28F18
14F83: push    ds
14F84: push    di
14F85: mov     ax, 0FFh
14F88: push    ax
14F89: call    @$basg$qm6Stringt14Byte; Store string
14F8E: mov     di, offset aDvadasansa; "DVADASANSA"
14F91: push    cs
14F92: push    di
14F93: mov     di, offset unk_2B018
14F96: push    ds
14F97: push    di
14F98: mov     ax, 0FFh
14F9B: push    ax
14F9C: call    @$basg$qm6Stringt14Byte; Store string
14FA1: mov     di, offset aDvadashansakaK; "        DVADASHANSAKA   KENDRAYA       "...
14FA4: push    cs
14FA5: push    di
14FA6: mov     di, offset unk_2B218
14FA9: push    ds
14FAA: push    di
14FAB: mov     ax, 0FFh
14FAE: push    ax
14FAF: call    @$basg$qm6Stringt14Byte; Store string
14FB4: mov     di, offset unk_2DF18
14FB7: push    ds
14FB8: push    di
14FB9: mov     di, offset unk_28218
14FBC: push    ds
14FBD: push    di
14FBE: mov     ax, 0FFh
14FC1: push    ax
14FC2: call    @$basg$qm6Stringt14Byte; Store string
14FC7: mov     di, offset aTrisansaka; "TRISANSAKA"
14FCA: push    cs
14FCB: push    di
14FCC: mov     di, offset unk_2B118
14FCF: push    ds
14FD0: push    di
14FD1: mov     ax, 0FFh
14FD4: push    ax
14FD5: call    @$basg$qm6Stringt14Byte; Store string
14FDA: call    sub_1D989
14FDF: mov     di, offset unk_2F50A
14FE2: push    ds
14FE3: push    di
14FE4: call    @ReadLn$qm4Text; ReadLn(var f: Text)
14FE9: call    @CLRSCR$qv; CLRSCR(void)
14FEE: call    sub_1CBB2
14FF3: mov     ax, word_27EE0
14FF6: mov     word_27E42, ax
14FF9: mov     ax, word_27EE2
14FFC: mov     word_27E40, ax
14FFF: mov     ax, word_27EE6
15002: mov     word_27E48, ax
15005: mov     ax, word_27EE4
15008: mov     word_27E44, ax
1500B: mov     ax, word_27EE8
1500E: mov     word_27E4A, ax
15011: mov     ax, word_27EEA
15014: mov     word_27E4C, ax
15017: mov     ax, word_27EF6
1501A: mov     word_27E46, ax
1501D: mov     ax, word_27EEC
15020: mov     word_27E4E, ax
15023: mov     ax, word_27EEE
15026: mov     word_27E50, ax
15029: mov     ax, word_27EFA
1502C: mov     word_27E5C, ax
1502F: mov     ax, word_27EFC
15032: mov     word_27E5A, ax
15035: mov     ax, word_27F00
15038: mov     word_27E62, ax
1503B: mov     ax, word_27EFE
1503E: mov     word_27E5E, ax
15041: mov     ax, word_27F02
15044: mov     word_27E64, ax
15047: mov     ax, word_27F04
1504A: mov     word_27E66, ax
1504D: mov     ax, word_27F10
15050: mov     word_27E60, ax
15053: mov     ax, word_27F06
15056: mov     word_27E68, ax
15059: mov     ax, word_27F08
1505C: mov     word_27E6A, ax
1505F: mov     di, offset unk_29118
15062: push    ds
15063: push    di
15064: mov     di, offset unk_28F18
15067: push    ds
15068: push    di
15069: mov     ax, 0FFh
1506C: push    ax
1506D: call    @$basg$qm6Stringt14Byte; Store string
15072: mov     di, offset aSooryarasi; "SOORYARASI"
15075: push    cs
15076: push    di
15077: mov     di, offset unk_2B018
1507A: push    ds
1507B: push    di
1507C: mov     ax, 0FFh
1507F: push    ax
15080: call    @$basg$qm6Stringt14Byte; Store string
15085: mov     di, offset aSooryaKendraya; "            SOORYA   KENDRAYA          "...
15088: push    cs
15089: push    di
1508A: mov     di, offset unk_2B218
1508D: push    ds
1508E: push    di
1508F: mov     ax, 0FFh
15092: push    ax
15093: call    @$basg$qm6Stringt14Byte; Store string
15098: mov     di, offset unk_29018
1509B: push    ds
1509C: push    di
1509D: mov     di, offset unk_28218
150A0: push    ds
150A1: push    di
150A2: mov     ax, 0FFh
150A5: push    ax
150A6: call    @$basg$qm6Stringt14Byte; Store string
150AB: mov     di, offset aSandurasi; "SANDURASI"
150AE: push    cs
150AF: push    di
150B0: mov     di, offset unk_2B118
150B3: push    ds
150B4: push    di
150B5: mov     ax, 0FFh
150B8: push    ax
150B9: call    @$basg$qm6Stringt14Byte; Store string
150BE: call    sub_1D989
150C3: mov     di, offset unk_2F50A
150C6: push    ds
150C7: push    di
150C8: call    @ReadLn$qm4Text; ReadLn(var f: Text)
150CD: call    @CLRSCR$qv; CLRSCR(void)
150D2: mov     di, offset unk_2F60A
150D5: push    ds
150D6: push    di
150D7: mov     di, offset aName_0; "NAME  : "
150DA: push    cs
150DB: push    di
150DC: xor     ax, ax
150DE: push    ax
150DF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
150E4: mov     di, offset unk_2B418
150E7: push    ds
150E8: push    di
150E9: xor     ax, ax
150EB: push    ax
150EC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
150F1: call    @Write$qm4Text; Write(var f: Text)
150F6: mov     di, offset unk_2F60A
150F9: push    ds
150FA: push    di
150FB: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15100: mov     di, offset unk_2F60A
15103: push    ds
15104: push    di
15105: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1510A: mov     di, offset unk_2F60A
1510D: push    ds
1510E: push    di
1510F: mov     di, offset aDateOfBirth; "DATE OF BIRTH: "
15112: push    cs
15113: push    di
15114: xor     ax, ax
15116: push    ax
15117: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1511C: mov     ax, word_27DEE
1511F: cwd
15120: push    dx
15121: push    ax
15122: xor     ax, ax
15124: push    ax
15125: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1512A: mov     al, 2Dh ; '-'
1512C: push    ax
1512D: xor     ax, ax
1512F: push    ax
15130: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
15135: mov     ax, word_27DF0
15138: cwd
15139: push    dx
1513A: push    ax
1513B: xor     ax, ax
1513D: push    ax
1513E: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15143: mov     al, 2Dh ; '-'
15145: push    ax
15146: xor     ax, ax
15148: push    ax
15149: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1514E: mov     ax, word_27DF2
15151: cwd
15152: push    dx
15153: push    ax
15154: xor     ax, ax
15156: push    ax
15157: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
1515C: mov     di, offset aAtLatitude; " at Latitude "
1515F: push    cs
15160: push    di
15161: xor     ax, ax
15163: push    ax
15164: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15169: mov     ax, word_2793A
1516C: cwd
1516D: push    dx
1516E: push    ax
1516F: mov     ax, 2
15172: push    ax
15173: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15178: mov     al, 20h ; ' '
1517A: push    ax
1517B: xor     ax, ax
1517D: push    ax
1517E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
15183: mov     ax, word_2793C
15186: cwd
15187: push    dx
15188: push    ax
15189: mov     ax, 2
1518C: push    ax
1518D: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15192: mov     di, offset aNLongitude; " N Longitude "
15195: push    cs
15196: push    di
15197: xor     ax, ax
15199: push    ax
1519A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1519F: mov     ax, word_2793E
151A2: cwd
151A3: push    dx
151A4: push    ax
151A5: mov     ax, 2
151A8: push    ax
151A9: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
151AE: mov     al, 20h ; ' '
151B0: push    ax
151B1: xor     ax, ax
151B3: push    ax
151B4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
151B9: mov     ax, word_27940
151BC: cwd
151BD: push    dx
151BE: push    ax
151BF: mov     ax, 2
151C2: push    ax
151C3: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
151C8: mov     di, offset aEGeocentric; " E (Geocentric)"
151CB: push    cs
151CC: push    di
151CD: xor     ax, ax
151CF: push    ax
151D0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
151D5: call    @Write$qm4Text; Write(var f: Text)
151DA: mov     di, offset unk_2F60A
151DD: push    ds
151DE: push    di
151DF: call    @WriteLn$qm4Text; WriteLn(var f: Text)
151E4: mov     di, offset unk_2F60A
151E7: push    ds
151E8: push    di
151E9: mov     di, offset aJulianDate; "JULIAN DATE  : "
151EC: push    cs
151ED: push    di
151EE: xor     ax, ax
151F0: push    ax
151F1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
151F6: push    word_27BE4
151FA: push    word_27BE2
151FE: push    word_27BE0
15202: mov     ax, 0Ah
15205: push    ax
15206: mov     ax, 3
15209: push    ax
1520A: call    @Write$qm4Text4Real4Wordt3; Write(var f; v: Real; width, decimals: Word)
1520F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15214: mov     ax, word_27D24
15217: mov     bx, word_27D26
1521B: mov     dx, word_27D28
1521F: xor     cx, cx
15221: xor     si, si
15223: xor     di, di
15225: call    @__Cmp$q4Realt1; Compare two reals
1522A: jbe     short loc_1525C
1522C: mov     ax, word_27D24
1522F: mov     bx, word_27D26
15233: mov     dx, word_27D28
15237: mov     cx, 85h
1523A: xor     si, si
1523C: mov     di, 7000h
1523F: call    @__Cmp$q4Realt1; Compare two reals
15244: ja      short loc_1525C
15246: mov     ax, word_27D24
15249: mov     bx, word_27D26
1524D: mov     dx, word_27D28
15251: mov     word_27DE4, ax
15254: mov     word_27DE6, bx
15258: mov     word_27DE8, dx
1525C: mov     ax, word_27D24
1525F: mov     bx, word_27D26
15263: mov     dx, word_27D28
15267: mov     cx, 85h
1526A: xor     si, si
1526C: mov     di, 7000h
1526F: call    @__Cmp$q4Realt1; Compare two reals
15274: jbe     short loc_152B3
15276: mov     ax, word_27D24
15279: mov     bx, word_27D26
1527D: mov     dx, word_27D28
15281: mov     cx, 86h
15284: xor     si, si
15286: mov     di, 7000h
15289: call    @__Cmp$q4Realt1; Compare two reals
1528E: ja      short loc_152B3
15290: mov     ax, word_27D24
15293: mov     bx, word_27D26
15297: mov     dx, word_27D28
1529B: mov     cx, 85h
1529E: xor     si, si
152A0: mov     di, 7000h
152A3: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
152A8: mov     word_27DE4, ax
152AB: mov     word_27DE6, bx
152AF: mov     word_27DE8, dx
152B3: mov     ax, word_27D24
152B6: mov     bx, word_27D26
152BA: mov     dx, word_27D28
152BE: mov     cx, 86h
152C1: xor     si, si
152C3: mov     di, 7000h
152C6: call    @__Cmp$q4Realt1; Compare two reals
152CB: jbe     short loc_1530A
152CD: mov     ax, word_27D24
152D0: mov     bx, word_27D26
152D4: mov     dx, word_27D28
152D8: mov     cx, 87h
152DB: xor     si, si
152DD: mov     di, 3400h
152E0: call    @__Cmp$q4Realt1; Compare two reals
152E5: ja      short loc_1530A
152E7: mov     ax, word_27D24
152EA: mov     bx, word_27D26
152EE: mov     dx, word_27D28
152F2: mov     cx, 86h
152F5: xor     si, si
152F7: mov     di, 7000h
152FA: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
152FF: mov     word_27DE4, ax
15302: mov     word_27DE6, bx
15306: mov     word_27DE8, dx
1530A: mov     ax, word_27D24
1530D: mov     bx, word_27D26
15311: mov     dx, word_27D28
15315: mov     cx, 87h
15318: xor     si, si
1531A: mov     di, 3400h
1531D: call    @__Cmp$q4Realt1; Compare two reals
15322: jbe     short loc_15361
15324: mov     ax, word_27D24
15327: mov     bx, word_27D26
1532B: mov     dx, word_27D28
1532F: mov     cx, 87h
15332: xor     si, si
15334: mov     di, 7000h
15337: call    @__Cmp$q4Realt1; Compare two reals
1533C: ja      short loc_15361
1533E: mov     ax, word_27D24
15341: mov     bx, word_27D26
15345: mov     dx, word_27D28
15349: mov     cx, 87h
1534C: xor     si, si
1534E: mov     di, 3400h
15351: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15356: mov     word_27DE4, ax
15359: mov     word_27DE6, bx
1535D: mov     word_27DE8, dx
15361: mov     ax, word_27D24
15364: mov     bx, word_27D26
15368: mov     dx, word_27D28
1536C: mov     cx, 87h
1536F: xor     si, si
15371: mov     di, 7000h
15374: call    @__Cmp$q4Realt1; Compare two reals
15379: jbe     short loc_153B8
1537B: mov     ax, word_27D24
1537E: mov     bx, word_27D26
15382: mov     dx, word_27D28
15386: mov     cx, 88h
15389: xor     si, si
1538B: mov     di, 1600h
1538E: call    @__Cmp$q4Realt1; Compare two reals
15393: ja      short loc_153B8
15395: mov     ax, word_27D24
15398: mov     bx, word_27D26
1539C: mov     dx, word_27D28
153A0: mov     cx, 87h
153A3: xor     si, si
153A5: mov     di, 7000h
153A8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
153AD: mov     word_27DE4, ax
153B0: mov     word_27DE6, bx
153B4: mov     word_27DE8, dx
153B8: mov     ax, word_27D24
153BB: mov     bx, word_27D26
153BF: mov     dx, word_27D28
153C3: mov     cx, 88h
153C6: xor     si, si
153C8: mov     di, 1600h
153CB: call    @__Cmp$q4Realt1; Compare two reals
153D0: jbe     short loc_1540F
153D2: mov     ax, word_27D24
153D5: mov     bx, word_27D26
153D9: mov     dx, word_27D28
153DD: mov     cx, 88h
153E0: xor     si, si
153E2: mov     di, 3400h
153E5: call    @__Cmp$q4Realt1; Compare two reals
153EA: ja      short loc_1540F
153EC: mov     ax, word_27D24
153EF: mov     bx, word_27D26
153F3: mov     dx, word_27D28
153F7: mov     cx, 88h
153FA: xor     si, si
153FC: mov     di, 1600h
153FF: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15404: mov     word_27DE4, ax
15407: mov     word_27DE6, bx
1540B: mov     word_27DE8, dx
1540F: mov     ax, word_27D24
15412: mov     bx, word_27D26
15416: mov     dx, word_27D28
1541A: mov     cx, 88h
1541D: xor     si, si
1541F: mov     di, 3400h
15422: call    @__Cmp$q4Realt1; Compare two reals
15427: jbe     short loc_15466
15429: mov     ax, word_27D24
1542C: mov     bx, word_27D26
15430: mov     dx, word_27D28
15434: mov     cx, 88h
15437: xor     si, si
15439: mov     di, 5200h
1543C: call    @__Cmp$q4Realt1; Compare two reals
15441: ja      short loc_15466
15443: mov     ax, word_27D24
15446: mov     bx, word_27D26
1544A: mov     dx, word_27D28
1544E: mov     cx, 88h
15451: xor     si, si
15453: mov     di, 3400h
15456: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1545B: mov     word_27DE4, ax
1545E: mov     word_27DE6, bx
15462: mov     word_27DE8, dx
15466: mov     ax, word_27D24
15469: mov     bx, word_27D26
1546D: mov     dx, word_27D28
15471: mov     cx, 88h
15474: xor     si, si
15476: mov     di, 5200h
15479: call    @__Cmp$q4Realt1; Compare two reals
1547E: jbe     short loc_154BD
15480: mov     ax, word_27D24
15483: mov     bx, word_27D26
15487: mov     dx, word_27D28
1548B: mov     cx, 88h
1548E: xor     si, si
15490: mov     di, 7000h
15493: call    @__Cmp$q4Realt1; Compare two reals
15498: ja      short loc_154BD
1549A: mov     ax, word_27D24
1549D: mov     bx, word_27D26
154A1: mov     dx, word_27D28
154A5: mov     cx, 88h
154A8: xor     si, si
154AA: mov     di, 5200h
154AD: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
154B2: mov     word_27DE4, ax
154B5: mov     word_27DE6, bx
154B9: mov     word_27DE8, dx
154BD: mov     ax, word_27D24
154C0: mov     bx, word_27D26
154C4: mov     dx, word_27D28
154C8: mov     cx, 88h
154CB: xor     si, si
154CD: mov     di, 7000h
154D0: call    @__Cmp$q4Realt1; Compare two reals
154D5: jbe     short loc_15514
154D7: mov     ax, word_27D24
154DA: mov     bx, word_27D26
154DE: mov     dx, word_27D28
154E2: mov     cx, 89h
154E5: xor     si, si
154E7: mov     di, 700h
154EA: call    @__Cmp$q4Realt1; Compare two reals
154EF: ja      short loc_15514
154F1: mov     ax, word_27D24
154F4: mov     bx, word_27D26
154F8: mov     dx, word_27D28
154FC: mov     cx, 88h
154FF: xor     si, si
15501: mov     di, 7000h
15504: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15509: mov     word_27DE4, ax
1550C: mov     word_27DE6, bx
15510: mov     word_27DE8, dx
15514: mov     ax, word_27D24
15517: mov     bx, word_27D26
1551B: mov     dx, word_27D28
1551F: mov     cx, 89h
15522: xor     si, si
15524: mov     di, 700h
15527: call    @__Cmp$q4Realt1; Compare two reals
1552C: jbe     short loc_1556B
1552E: mov     ax, word_27D24
15531: mov     bx, word_27D26
15535: mov     dx, word_27D28
15539: mov     cx, 89h
1553C: xor     si, si
1553E: mov     di, 1600h
15541: call    @__Cmp$q4Realt1; Compare two reals
15546: ja      short loc_1556B
15548: mov     ax, word_27D24
1554B: mov     bx, word_27D26
1554F: mov     dx, word_27D28
15553: mov     cx, 89h
15556: xor     si, si
15558: mov     di, 700h
1555B: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15560: mov     word_27DE4, ax
15563: mov     word_27DE6, bx
15567: mov     word_27DE8, dx
1556B: mov     ax, word_27D24
1556E: mov     bx, word_27D26
15572: mov     dx, word_27D28
15576: mov     cx, 89h
15579: xor     si, si
1557B: mov     di, 1600h
1557E: call    @__Cmp$q4Realt1; Compare two reals
15583: jbe     short loc_155C2
15585: mov     ax, word_27D24
15588: mov     bx, word_27D26
1558C: mov     dx, word_27D28
15590: mov     cx, 89h
15593: xor     si, si
15595: mov     di, 2500h
15598: call    @__Cmp$q4Realt1; Compare two reals
1559D: ja      short loc_155C2
1559F: mov     ax, word_27D24
155A2: mov     bx, word_27D26
155A6: mov     dx, word_27D28
155AA: mov     cx, 89h
155AD: xor     si, si
155AF: mov     di, 1600h
155B2: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
155B7: mov     word_27DE4, ax
155BA: mov     word_27DE6, bx
155BE: mov     word_27DE8, dx
155C2: mov     ax, word_27D24
155C5: mov     bx, word_27D26
155C9: mov     dx, word_27D28
155CD: mov     cx, 89h
155D0: xor     si, si
155D2: mov     di, 2500h
155D5: call    @__Cmp$q4Realt1; Compare two reals
155DA: jbe     short loc_15619
155DC: mov     ax, word_27D24
155DF: mov     bx, word_27D26
155E3: mov     dx, word_27D28
155E7: mov     cx, 89h
155EA: xor     si, si
155EC: mov     di, 3400h
155EF: call    @__Cmp$q4Realt1; Compare two reals
155F4: ja      short loc_15619
155F6: mov     ax, word_27D24
155F9: mov     bx, word_27D26
155FD: mov     dx, word_27D28
15601: mov     cx, 89h
15604: xor     si, si
15606: mov     di, 2500h
15609: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
1560E: mov     word_27DE4, ax
15611: mov     word_27DE6, bx
15615: mov     word_27DE8, dx
15619: mov     di, offset unk_2F60A
1561C: push    ds
1561D: push    di
1561E: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15623: mov     di, offset unk_2F60A
15626: push    ds
15627: push    di
15628: mov     di, offset aLagna_2; "LAGNA : "
1562B: push    cs
1562C: push    di
1562D: xor     ax, ax
1562F: push    ax
15630: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15635: mov     di, offset unk_27942
15638: push    ds
15639: push    di
1563A: xor     ax, ax
1563C: push    ax
1563D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15642: mov     al, 28h ; '('
15644: push    ax
15645: xor     ax, ax
15647: push    ax
15648: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1564D: call    @Write$qm4Text; Write(var f: Text)
15652: mov     ax, word_27DE4
15655: mov     bx, word_27DE6
15659: mov     dx, word_27DE8
1565D: mov     word_27B6E, ax
15660: mov     word_27B70, bx
15664: mov     word_27B72, dx
15668: call    sub_21EE1
1566D: mov     di, offset unk_2F60A
15670: push    ds
15671: push    di
15672: mov     di, offset asc_10825; ") "
15675: push    cs
15676: push    di
15677: xor     ax, ax
15679: push    ax
1567A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1567F: mov     di, offset aNavamsaka_0; "       NAVAMSAKA  : "
15682: push    cs
15683: push    di
15684: xor     ax, ax
15686: push    ax
15687: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1568C: mov     di, offset unk_27A42
1568F: push    ds
15690: push    di
15691: xor     ax, ax
15693: push    ax
15694: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15699: call    @Write$qm4Text; Write(var f: Text)
1569E: mov     di, offset unk_2F60A
156A1: push    ds
156A2: push    di
156A3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
156A8: mov     di, offset unk_2F60A
156AB: push    ds
156AC: push    di
156AD: call    @WriteLn$qm4Text; WriteLn(var f: Text)
156B2: mov     di, offset unk_2F60A
156B5: push    ds
156B6: push    di
156B7: mov     di, offset aPanchangaya; "PANCHANGAYA"
156BA: push    cs
156BB: push    di
156BC: xor     ax, ax
156BE: push    ax
156BF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
156C4: call    @WriteLn$qm4Text; WriteLn(var f: Text)
156C9: call    sub_17FFE
156CE: mov     ax, 9A85h
156D1: mov     bx, 9999h
156D4: mov     dx, 3B99h
156D7: mov     cx, word_27C52
156DB: mov     si, word_27C54
156DF: mov     di, word_27C56
156E3: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
156E8: call    far ptr @Sin$q4Real; Sin(x: Real): Real
156ED: push    dx
156EE: push    bx
156EF: push    ax
156F0: mov     ax, word_27C0A
156F3: mov     bx, word_27C0C
156F7: mov     dx, word_27C0E
156FB: mov     cx, word_27C52
156FF: mov     si, word_27C54
15703: mov     di, word_27C56
15707: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1570C: call    @Cos$q4Real; Cos(x: Real): Real
15711: pop     cx
15712: pop     si
15713: pop     di
15714: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15719: push    dx
1571A: push    bx
1571B: push    ax
1571C: mov     ax, word_27D2A
1571F: mov     bx, word_27D2C
15723: mov     dx, word_27D2E
15727: mov     cx, word_27C52
1572B: mov     si, word_27C54
1572F: mov     di, word_27C56
15733: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
15738: call    @Cos$q4Real; Cos(x: Real): Real
1573D: push    dx
1573E: push    bx
1573F: push    ax
15740: mov     ax, 9A85h
15743: mov     bx, 9999h
15746: mov     dx, 3B99h
15749: mov     cx, word_27C52
1574D: mov     si, word_27C54
15751: mov     di, word_27C56
15755: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1575A: call    @Cos$q4Real; Cos(x: Real): Real
1575F: push    dx
15760: push    bx
15761: push    ax
15762: mov     ax, word_27C0A
15765: mov     bx, word_27C0C
15769: mov     dx, word_27C0E
1576D: mov     cx, word_27C52
15771: mov     si, word_27C54
15775: mov     di, word_27C56
15779: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
1577E: call    far ptr @Sin$q4Real; Sin(x: Real): Real
15783: pop     cx
15784: pop     si
15785: pop     di
15786: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
1578B: pop     cx
1578C: pop     si
1578D: pop     di
1578E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15793: pop     cx
15794: pop     si
15795: pop     di
15796: call    @$brplu$q4Realt1; Real(AX:BX:DX)+=Real(CX:SI:DI)
1579B: push    dx
1579C: push    bx
1579D: push    ax
1579E: call    sub_260ED
157A3: push    dx
157A4: push    bx
157A5: push    ax
157A6: call    sub_25F7D
157AB: mov     word_27D96, ax
157AE: mov     word_27D98, bx
157B2: mov     word_27D9A, dx
157B6: mov     di, offset unk_29D18
157B9: push    ds
157BA: push    di
157BB: mov     di, offset unk_2ED34
157BE: push    ds
157BF: push    di
157C0: call    @$bsub$qm6Stringt1; Compare two strings
157C5: jz      short loc_157E9
157C7: mov     di, offset unk_29D18
157CA: push    ds
157CB: push    di
157CC: mov     di, offset unk_2EDA9
157CF: push    ds
157D0: push    di
157D1: call    @$bsub$qm6Stringt1; Compare two strings
157D6: jz      short loc_157E9
157D8: mov     di, offset unk_29D18
157DB: push    ds
157DC: push    di
157DD: mov     di, offset unk_2EE1E
157E0: push    ds
157E1: push    di
157E2: call    @$bsub$qm6Stringt1; Compare two strings
157E7: jnz     short loc_1580E
157E9: mov     di, offset unk_2EF08
157EC: push    ds
157ED: push    di
157EE: mov     di, offset unk_2A218
157F1: push    ds
157F2: push    di
157F3: mov     ax, 0FFh
157F6: push    ax
157F7: call    @$basg$qm6Stringt14Byte; Store string
157FC: mov     word_27DA2, 83h
15802: mov     word_27DA4, 0
15808: mov     word_27DA6, 4000h
1580E: mov     di, offset unk_29D18
15811: push    ds
15812: push    di
15813: mov     di, offset unk_2ED41
15816: push    ds
15817: push    di
15818: call    @$bsub$qm6Stringt1; Compare two strings
1581D: jz      short loc_15841
1581F: mov     di, offset unk_29D18
15822: push    ds
15823: push    di
15824: mov     di, offset unk_2EDB6
15827: push    ds
15828: push    di
15829: call    @$bsub$qm6Stringt1; Compare two strings
1582E: jz      short loc_15841
15830: mov     di, offset unk_29D18
15833: push    ds
15834: push    di
15835: mov     di, offset unk_2EE2B
15838: push    ds
15839: push    di
1583A: call    @$bsub$qm6Stringt1; Compare two strings
1583F: jnz     short loc_15866
15841: mov     di, offset unk_2EEFE
15844: push    ds
15845: push    di
15846: mov     di, offset unk_2A218
15849: push    ds
1584A: push    di
1584B: mov     ax, 0FFh
1584E: push    ax
1584F: call    @$basg$qm6Stringt14Byte; Store string
15854: mov     word_27DA2, 84h
1585A: mov     word_27DA4, 0
15860: mov     word_27DA6, 2000h
15866: mov     di, offset unk_29D18
15869: push    ds
1586A: push    di
1586B: mov     di, offset unk_2ED4E
1586E: push    ds
1586F: push    di
15870: call    @$bsub$qm6Stringt1; Compare two strings
15875: jz      short loc_15899
15877: mov     di, offset unk_29D18
1587A: push    ds
1587B: push    di
1587C: mov     di, offset unk_2EDC3
1587F: push    ds
15880: push    di
15881: call    @$bsub$qm6Stringt1; Compare two strings
15886: jz      short loc_15899
15888: mov     di, offset unk_29D18
1588B: push    ds
1588C: push    di
1588D: mov     di, offset unk_2EE38
15890: push    ds
15891: push    di
15892: call    @$bsub$qm6Stringt1; Compare two strings
15897: jnz     short loc_158BE
15899: mov     di, offset unk_2EF26
1589C: push    ds
1589D: push    di
1589E: mov     di, offset unk_2A218
158A1: push    ds
158A2: push    di
158A3: mov     ax, 0FFh
158A6: push    ax
158A7: call    @$basg$qm6Stringt14Byte; Store string
158AC: mov     word_27DA2, 83h
158B2: mov     word_27DA4, 0
158B8: mov     word_27DA6, 6000h
158BE: mov     di, offset unk_29D18
158C1: push    ds
158C2: push    di
158C3: mov     di, offset unk_2ED5B
158C6: push    ds
158C7: push    di
158C8: call    @$bsub$qm6Stringt1; Compare two strings
158CD: jz      short loc_158F1
158CF: mov     di, offset unk_29D18
158D2: push    ds
158D3: push    di
158D4: mov     di, offset unk_2EDD0
158D7: push    ds
158D8: push    di
158D9: call    @$bsub$qm6Stringt1; Compare two strings
158DE: jz      short loc_158F1
158E0: mov     di, offset unk_29D18
158E3: push    ds
158E4: push    di
158E5: mov     di, offset unk_2EE45
158E8: push    ds
158E9: push    di
158EA: call    @$bsub$qm6Stringt1; Compare two strings
158EF: jnz     short loc_15916
158F1: mov     di, offset unk_2EF44
158F4: push    ds
158F5: push    di
158F6: mov     di, offset unk_2A218
158F9: push    ds
158FA: push    di
158FB: mov     ax, 0FFh
158FE: push    ax
158FF: call    @$basg$qm6Stringt14Byte; Store string
15904: mov     word_27DA2, 85h
1590A: mov     word_27DA4, 0
15910: mov     word_27DA6, 1000h
15916: mov     di, offset unk_29D18
15919: push    ds
1591A: push    di
1591B: mov     di, offset unk_2ED68
1591E: push    ds
1591F: push    di
15920: call    @$bsub$qm6Stringt1; Compare two strings
15925: jz      short loc_15949
15927: mov     di, offset unk_29D18
1592A: push    ds
1592B: push    di
1592C: mov     di, offset unk_2EDDD
1592F: push    ds
15930: push    di
15931: call    @$bsub$qm6Stringt1; Compare two strings
15936: jz      short loc_15949
15938: mov     di, offset unk_29D18
1593B: push    ds
1593C: push    di
1593D: mov     di, offset unk_2EE52
15940: push    ds
15941: push    di
15942: call    @$bsub$qm6Stringt1; Compare two strings
15947: jnz     short loc_1596E
15949: mov     di, offset unk_2EF30
1594C: push    ds
1594D: push    di
1594E: mov     di, offset unk_2A218
15951: push    ds
15952: push    di
15953: mov     ax, 0FFh
15956: push    ax
15957: call    @$basg$qm6Stringt14Byte; Store string
1595C: mov     word_27DA2, 85h
15962: mov     word_27DA4, 0
15968: mov     word_27DA6, 0
1596E: mov     di, offset unk_29D18
15971: push    ds
15972: push    di
15973: mov     di, offset unk_2ED75
15976: push    ds
15977: push    di
15978: call    @$bsub$qm6Stringt1; Compare two strings
1597D: jz      short loc_159A1
1597F: mov     di, offset unk_29D18
15982: push    ds
15983: push    di
15984: mov     di, offset unk_2EDEA
15987: push    ds
15988: push    di
15989: call    @$bsub$qm6Stringt1; Compare two strings
1598E: jz      short loc_159A1
15990: mov     di, offset unk_29D18
15993: push    ds
15994: push    di
15995: mov     di, offset unk_2EE5F
15998: push    ds
15999: push    di
1599A: call    @$bsub$qm6Stringt1; Compare two strings
1599F: jnz     short loc_159C6
159A1: mov     di, offset unk_2EF3A
159A4: push    ds
159A5: push    di
159A6: mov     di, offset unk_2A218
159A9: push    ds
159AA: push    di
159AB: mov     ax, 0FFh
159AE: push    ax
159AF: call    @$basg$qm6Stringt14Byte; Store string
159B4: mov     word_27DA2, 85h
159BA: mov     word_27DA4, 0
159C0: mov     word_27DA6, 1800h
159C6: mov     di, offset unk_29D18
159C9: push    ds
159CA: push    di
159CB: mov     di, offset unk_2EDF7
159CE: push    ds
159CF: push    di
159D0: call    @$bsub$qm6Stringt1; Compare two strings
159D5: jz      short loc_159F9
159D7: mov     di, offset unk_29D18
159DA: push    ds
159DB: push    di
159DC: mov     di, offset unk_2ED82
159DF: push    ds
159E0: push    di
159E1: call    @$bsub$qm6Stringt1; Compare two strings
159E6: jz      short loc_159F9
159E8: mov     di, offset unk_29D18
159EB: push    ds
159EC: push    di
159ED: mov     di, offset unk_2EE6C
159F0: push    ds
159F1: push    di
159F2: call    @$bsub$qm6Stringt1; Compare two strings
159F7: jnz     short loc_15A1E
159F9: mov     di, offset unk_2EF12
159FC: push    ds
159FD: push    di
159FE: mov     di, offset unk_2A218
15A01: push    ds
15A02: push    di
15A03: mov     ax, 0FFh
15A06: push    ax
15A07: call    @$basg$qm6Stringt14Byte; Store string
15A0C: mov     word_27DA2, 85h
15A12: mov     word_27DA4, 0
15A18: mov     word_27DA6, 800h
15A1E: mov     di, offset unk_29D18
15A21: push    ds
15A22: push    di
15A23: mov     di, offset unk_2ED1A
15A26: push    ds
15A27: push    di
15A28: call    @$bsub$qm6Stringt1; Compare two strings
15A2D: jz      short loc_15A51
15A2F: mov     di, offset unk_29D18
15A32: push    ds
15A33: push    di
15A34: mov     di, offset unk_2ED8F
15A37: push    ds
15A38: push    di
15A39: call    @$bsub$qm6Stringt1; Compare two strings
15A3E: jz      short loc_15A51
15A40: mov     di, offset unk_29D18
15A43: push    ds
15A44: push    di
15A45: mov     di, offset unk_2EE04
15A48: push    ds
15A49: push    di
15A4A: call    @$bsub$qm6Stringt1; Compare two strings
15A4F: jnz     short loc_15A76
15A51: mov     di, offset unk_2EF4E
15A54: push    ds
15A55: push    di
15A56: mov     di, offset unk_2A218
15A59: push    ds
15A5A: push    di
15A5B: mov     ax, 0FFh
15A5E: push    ax
15A5F: call    @$basg$qm6Stringt14Byte; Store string
15A64: mov     word_27DA2, 83h
15A6A: mov     word_27DA4, 0
15A70: mov     word_27DA6, 6000h
15A76: mov     di, offset unk_29D18
15A79: push    ds
15A7A: push    di
15A7B: mov     di, offset unk_2ED9C
15A7E: push    ds
15A7F: push    di
15A80: call    @$bsub$qm6Stringt1; Compare two strings
15A85: jz      short loc_15AA9
15A87: mov     di, offset unk_29D18
15A8A: push    ds
15A8B: push    di
15A8C: mov     di, offset unk_2EE11
15A8F: push    ds
15A90: push    di
15A91: call    @$bsub$qm6Stringt1; Compare two strings
15A96: jz      short loc_15AA9
15A98: mov     di, offset unk_29D18
15A9B: push    ds
15A9C: push    di
15A9D: mov     di, offset unk_2ED27
15AA0: push    ds
15AA1: push    di
15AA2: call    @$bsub$qm6Stringt1; Compare two strings
15AA7: jnz     short loc_15ACE
15AA9: mov     di, offset unk_2EF1C
15AAC: push    ds
15AAD: push    di
15AAE: mov     di, offset unk_2A218
15AB1: push    ds
15AB2: push    di
15AB3: mov     ax, 0FFh
15AB6: push    ax
15AB7: call    @$basg$qm6Stringt14Byte; Store string
15ABC: mov     word_27DA2, 85h
15AC2: mov     word_27DA4, 0
15AC8: mov     word_27DA6, 2000h
15ACE: mov     ax, word_27D8A
15AD1: mov     bx, word_27D8C
15AD5: mov     dx, word_27D8E
15AD9: mov     cx, word_27D9C
15ADD: mov     si, word_27D9E
15AE1: mov     di, word_27DA0
15AE5: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15AEA: mov     cx, word_27D8A
15AEE: mov     si, word_27D8C
15AF2: mov     di, word_27D8E
15AF6: call    @$brdiv$q4Realt1; Real(AX:BX:DX)/=Real(CX:SI:DI)
15AFB: mov     word_27D9C, ax
15AFE: mov     word_27D9E, bx
15B02: mov     word_27DA0, dx
15B06: mov     ax, word_27D9C
15B09: mov     bx, word_27D9E
15B0D: mov     dx, word_27DA0
15B11: mov     cx, word_27DA2
15B15: mov     si, word_27DA4
15B19: mov     di, word_27DA6
15B1D: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15B22: mov     word_27D9C, ax
15B25: mov     word_27D9E, bx
15B29: mov     word_27DA0, dx
15B2D: mov     ax, word_27D9C
15B30: mov     bx, word_27D9E
15B34: mov     dx, word_27DA0
15B38: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
15B3D: mov     word_27E10, ax
15B40: mov     ax, word_27D9C
15B43: mov     bx, word_27D9E
15B47: mov     dx, word_27DA0
15B4B: call    @Int$q4Real; Int(x: Real): Real
15B50: push    dx
15B51: push    bx
15B52: push    ax
15B53: mov     ax, word_27D9C
15B56: mov     bx, word_27D9E
15B5A: mov     dx, word_27DA0
15B5E: pop     cx
15B5F: pop     si
15B60: pop     di
15B61: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15B66: mov     cx, 84h
15B69: xor     si, si
15B6B: mov     di, 4000h
15B6E: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15B73: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
15B78: mov     word_27E12, ax
15B7B: mov     ax, word_27E12
15B7E: cwd
15B7F: call    @Real$q7Longint; Real(x: Longint{DX:AX}): Real
15B84: push    dx
15B85: push    bx
15B86: push    ax
15B87: mov     ax, word_27D9C
15B8A: mov     bx, word_27D9E
15B8E: mov     dx, word_27DA0
15B92: call    @Int$q4Real; Int(x: Real): Real
15B97: push    dx
15B98: push    bx
15B99: push    ax
15B9A: mov     ax, word_27D9C
15B9D: mov     bx, word_27D9E
15BA1: mov     dx, word_27DA0
15BA5: pop     cx
15BA6: pop     si
15BA7: pop     di
15BA8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15BAD: mov     cx, 84h
15BB0: xor     si, si
15BB2: mov     di, 4000h
15BB5: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15BBA: pop     cx
15BBB: pop     si
15BBC: pop     di
15BBD: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15BC2: mov     cx, 85h
15BC5: xor     si, si
15BC7: mov     di, 7000h
15BCA: call    @$brmul$q4Realt1; Real(AX:BX:DX)*=Real(CX:SI:DI)
15BCF: call    @Trunc$q4Real; Trunc(x: Real): Longint{DX:AX}
15BD4: mov     word_27E14, ax
15BD7: mov     di, offset unk_2F60A
15BDA: push    ds
15BDB: push    di
15BDC: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15BE1: mov     di, offset unk_2F60A
15BE4: push    ds
15BE5: push    di
15BE6: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15BEB: mov     di, offset unk_2F60A
15BEE: push    ds
15BEF: push    di
15BF0: mov     di, offset aTimes; "TIMES"
15BF3: push    cs
15BF4: push    di
15BF5: xor     ax, ax
15BF7: push    ax
15BF8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15BFD: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15C02: mov     di, offset unk_2F60A
15C05: push    ds
15C06: push    di
15C07: mov     di, offset aHrsMinSec; "                                   Hrs "...
15C0A: push    cs
15C0B: push    di
15C0C: xor     ax, ax
15C0E: push    ax
15C0F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15C14: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15C19: mov     di, offset unk_2F60A
15C1C: push    ds
15C1D: push    di
15C1E: mov     di, offset aBirthTime; "Birth   time                  - "
15C21: push    cs
15C22: push    di
15C23: xor     ax, ax
15C25: push    ax
15C26: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15C2B: call    @Write$qm4Text; Write(var f: Text)
15C30: mov     ax, word_27BFE
15C33: mov     bx, word_27C00
15C37: mov     dx, word_27C02
15C3B: mov     word_27B6E, ax
15C3E: mov     word_27B70, bx
15C42: mov     word_27B72, dx
15C46: call    sub_21EE1
15C4B: mov     di, offset unk_2F60A
15C4E: push    ds
15C4F: push    di
15C50: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15C55: mov     di, offset unk_2F60A
15C58: push    ds
15C59: push    di
15C5A: mov     di, offset aSinhalaTime; "Sinhala time                  - "
15C5D: push    cs
15C5E: push    di
15C5F: xor     ax, ax
15C61: push    ax
15C62: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15C67: call    @Write$qm4Text; Write(var f: Text)
15C6C: mov     ax, word_27DD2
15C6F: mov     bx, word_27DD4
15C73: mov     dx, word_27DD6
15C77: mov     word_27B6E, ax
15C7A: mov     word_27B70, bx
15C7E: mov     word_27B72, dx
15C82: call    sub_21EE1
15C87: mov     di, offset unk_2F60A
15C8A: push    ds
15C8B: push    di
15C8C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15C91: mov     di, offset unk_2F60A
15C94: push    ds
15C95: push    di
15C96: mov     di, offset aTrueLocalMeanT; "True local mean time          - "
15C99: push    cs
15C9A: push    di
15C9B: xor     ax, ax
15C9D: push    ax
15C9E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15CA3: call    @Write$qm4Text; Write(var f: Text)
15CA8: mov     ax, word_27D7E
15CAB: mov     bx, word_27D80
15CAF: mov     dx, word_27D82
15CB3: mov     word_27B6E, ax
15CB6: mov     word_27B70, bx
15CBA: mov     word_27B72, dx
15CBE: call    sub_21EE1
15CC3: mov     di, offset unk_2F60A
15CC6: push    ds
15CC7: push    di
15CC8: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15CCD: mov     di, offset unk_2F60A
15CD0: push    ds
15CD1: push    di
15CD2: mov     di, offset aUniversalTime; "Universal  time               - "
15CD5: push    cs
15CD6: push    di
15CD7: xor     ax, ax
15CD9: push    ax
15CDA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15CDF: call    @Write$qm4Text; Write(var f: Text)
15CE4: mov     ax, word_27DDE
15CE7: mov     bx, word_27DE0
15CEB: mov     dx, word_27DE2
15CEF: mov     word_27B6E, ax
15CF2: mov     word_27B70, bx
15CF6: mov     word_27B72, dx
15CFA: call    sub_21EE1
15CFF: mov     di, offset unk_2F60A
15D02: push    ds
15D03: push    di
15D04: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15D09: mov     di, offset unk_2F60A
15D0C: push    ds
15D0D: push    di
15D0E: mov     di, offset aUniversalSider; "Universal  Siderial     time  - "
15D11: push    cs
15D12: push    di
15D13: xor     ax, ax
15D15: push    ax
15D16: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15D1B: call    @Write$qm4Text; Write(var f: Text)
15D20: mov     ax, word_27B42
15D23: mov     bx, word_27B44
15D27: mov     dx, word_27B46
15D2B: mov     word_27B6E, ax
15D2E: mov     word_27B70, bx
15D32: mov     word_27B72, dx
15D36: call    sub_21EE1
15D3B: mov     di, offset unk_2F60A
15D3E: push    ds
15D3F: push    di
15D40: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15D45: mov     di, offset unk_2F60A
15D48: push    ds
15D49: push    di
15D4A: mov     di, offset aLocalMeanSider; "Local  mean   siderial   time - "
15D4D: push    cs
15D4E: push    di
15D4F: xor     ax, ax
15D51: push    ax
15D52: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15D57: call    @Write$qm4Text; Write(var f: Text)
15D5C: mov     ax, word_27BF8
15D5F: mov     bx, word_27BFA
15D63: mov     dx, word_27BFC
15D67: mov     word_27B6E, ax
15D6A: mov     word_27B70, bx
15D6E: mov     word_27B72, dx
15D72: call    sub_21EE1
15D77: mov     di, offset unk_2F60A
15D7A: push    ds
15D7B: push    di
15D7C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15D81: mov     di, offset unk_2F60A
15D84: push    ds
15D85: push    di
15D86: mov     di, offset aSunRiseTime; "Sun rise time                 - "
15D89: push    cs
15D8A: push    di
15D8B: xor     ax, ax
15D8D: push    ax
15D8E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15D93: call    @Write$qm4Text; Write(var f: Text)
15D98: mov     ax, word_27DBA
15D9B: mov     bx, word_27DBC
15D9F: mov     dx, word_27DBE
15DA3: mov     word_27B6E, ax
15DA6: mov     word_27B70, bx
15DAA: mov     word_27B72, dx
15DAE: call    sub_21EE1
15DB3: mov     di, offset unk_2F60A
15DB6: push    ds
15DB7: push    di
15DB8: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15DBD: mov     di, offset unk_2F60A
15DC0: push    ds
15DC1: push    di
15DC2: mov     di, offset aSunSetTime; "Sun set time                  - "
15DC5: push    cs
15DC6: push    di
15DC7: xor     ax, ax
15DC9: push    ax
15DCA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15DCF: call    @Write$qm4Text; Write(var f: Text)
15DD4: mov     ax, 84h
15DD7: xor     bx, bx
15DD9: mov     dx, 4000h
15DDC: mov     cx, word_27DBA
15DE0: mov     si, word_27DBC
15DE4: mov     di, word_27DBE
15DE8: call    @$brmin$q4Realt1; Real(AX:BX:DX)-=Real(CX:SI:DI)
15DED: mov     word_27B6E, ax
15DF0: mov     word_27B70, bx
15DF4: mov     word_27B72, dx
15DF8: call    sub_21EE1
15DFD: mov     di, offset unk_2F60A
15E00: push    ds
15E01: push    di
15E02: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15E07: mov     di, offset unk_2F60A
15E0A: push    ds
15E0B: push    di
15E0C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15E11: mov     di, offset unk_2F60A
15E14: push    ds
15E15: push    di
15E16: mov     di, offset aDasaBalance; "DASA BALANCE     :   "
15E19: push    cs
15E1A: push    di
15E1B: xor     ax, ax
15E1D: push    ax
15E1E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E23: mov     di, offset unk_2A218
15E26: push    ds
15E27: push    di
15E28: xor     ax, ax
15E2A: push    ax
15E2B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E30: mov     al, 20h ; ' '
15E32: push    ax
15E33: xor     ax, ax
15E35: push    ax
15E36: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
15E3B: mov     ax, word_27E10
15E3E: cwd
15E3F: push    dx
15E40: push    ax
15E41: xor     ax, ax
15E43: push    ax
15E44: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15E49: mov     di, offset aYears; " Years"
15E4C: push    cs
15E4D: push    di
15E4E: xor     ax, ax
15E50: push    ax
15E51: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E56: mov     di, offset asc_10426; "  "
15E59: push    cs
15E5A: push    di
15E5B: xor     ax, ax
15E5D: push    ax
15E5E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E63: mov     ax, word_27E12
15E66: cwd
15E67: push    dx
15E68: push    ax
15E69: xor     ax, ax
15E6B: push    ax
15E6C: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15E71: mov     di, offset aMonths; " Months"
15E74: push    cs
15E75: push    di
15E76: xor     ax, ax
15E78: push    ax
15E79: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E7E: mov     di, offset asc_10426; "  "
15E81: push    cs
15E82: push    di
15E83: xor     ax, ax
15E85: push    ax
15E86: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15E8B: mov     ax, word_27E14
15E8E: cwd
15E8F: push    dx
15E90: push    ax
15E91: xor     ax, ax
15E93: push    ax
15E94: call    @Write$qm4Text7Longint4Word; Write(var f; v: Longint; width: Word)
15E99: mov     di, offset aDaysFromBirthO; " Days  From Birth Onwards"
15E9C: push    cs
15E9D: push    di
15E9E: xor     ax, ax
15EA0: push    ax
15EA1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15EA6: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15EAB: mov     di, offset unk_2F60A
15EAE: push    ds
15EAF: push    di
15EB0: mov     di, offset aAyanamsaArcRay; "AYANAMSA(Arc-Ray):"
15EB3: push    cs
15EB4: push    di
15EB5: xor     ax, ax
15EB7: push    ax
15EB8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15EBD: call    @Write$qm4Text; Write(var f: Text)
15EC2: mov     ax, word_27C76
15EC5: mov     bx, word_27C78
15EC9: mov     dx, word_27C7A
15ECD: mov     word_27B6E, ax
15ED0: mov     word_27B70, bx
15ED4: mov     word_27B72, dx
15ED8: call    sub_21EE1
15EDD: mov     di, offset unk_2F50A
15EE0: push    ds
15EE1: push    di
15EE2: call    @ReadLn$qm4Text; ReadLn(var f: Text)
15EE7: call    @CLRSCR$qv; CLRSCR(void)
15EEC: call    sub_1AE29
15EF1: mov     di, offset unk_2F60A
15EF4: push    ds
15EF5: push    di
15EF6: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15EFB: call    sub_1B689
15F00: mov     di, offset unk_2F60A
15F03: push    ds
15F04: push    di
15F05: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15F0A: mov     di, offset unk_2F60A
15F0D: push    ds
15F0E: push    di
15F0F: mov     di, offset asc_109DC; "                  "
15F12: push    cs
15F13: push    di
15F14: xor     ax, ax
15F16: push    ax
15F17: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15F1C: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15F21: mov     di, offset unk_2F60A
15F24: push    ds
15F25: push    di
15F26: mov     di, offset asc_109EF; "                                "
15F29: push    cs
15F2A: push    di
15F2B: xor     ax, ax
15F2D: push    ax
15F2E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15F33: call    @WriteLn$qm4Text; WriteLn(var f: Text)
15F38: mov     di, offset unk_2F50A
15F3B: push    ds
15F3C: push    di
15F3D: call    @ReadLn$qm4Text; ReadLn(var f: Text)
15F42: call    sub_1633A
15F47: call    @CLRSCR$qv; CLRSCR(void)
15F4C: mov     al, 1
15F4E: push    ax
15F4F: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
15F54: mov     al, 1Eh
15F56: push    ax
15F57: mov     al, 0Fh
15F59: push    ax
15F5A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
15F5F: mov     di, offset unk_2F60A
15F62: push    ds
15F63: push    di
15F64: mov     di, offset aGoodLuckWithYo; "Good Luck With Your Stars!"
15F67: push    cs
15F68: push    di
15F69: xor     ax, ax
15F6B: push    ax
15F6C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15F71: call    @Write$qm4Text; Write(var f: Text)
15F76: mov     al, 1
15F78: push    ax
15F79: mov     al, 19h
15F7B: push    ax
15F7C: mov     al, 1
15F7E: push    ax
15F7F: mov     al, 14h
15F81: push    ax
15F82: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
15F87: mov     al, 0
15F89: push    ax
15F8A: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
15F8F: mov     al, 1
15F91: push    ax
15F92: mov     al, 19h
15F94: push    ax
15F95: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
15F9A: mov     di, offset unk_2F60A
15F9D: push    ds
15F9E: push    di
15F9F: mov     di, offset aPressEnter; "Press  Enter  "
15FA2: push    cs
15FA3: push    di
15FA4: xor     ax, ax
15FA6: push    ax
15FA7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
15FAC: call    @Write$qm4Text; Write(var f: Text)
15FB1: mov     al, 0Fh
15FB3: push    ax
15FB4: call    @TEXTCOLOR$q4BYTE; TEXTCOLOR(BYTE)
15FB9: mov     di, offset unk_2F50A
15FBC: push    ds
15FBD: push    di
15FBE: call    @ReadLn$qm4Text; ReadLn(var f: Text)
15FC3: mov     al, 0
15FC5: push    ax
15FC6: call    @TEXTBACKGROUND$q4BYTE; TEXTBACKGROUND(BYTE)
15FCB: mov     al, 1
15FCD: push    ax
15FCE: mov     al, 1
15FD0: push    ax
15FD1: mov     al, 50h ; 'P'
15FD3: push    ax
15FD4: mov     al, 19h
15FD6: push    ax
15FD7: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
15FDC: call    @CLRSCR$qv; CLRSCR(void)
15FE1: mov     sp, bp
15FE3: pop     bp
15FE4: xor     ax, ax
15FE6: call    @Halt$q4Word; Halt(Word)
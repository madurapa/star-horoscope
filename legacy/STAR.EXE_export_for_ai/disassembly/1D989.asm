/*
 * func-name: sub_1D989
 * func-address: 0x1d989
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x25a92, 0x25b25, 0x263ee, 0x263fc, 0x26424, 0x27681, 0x276c5, 0x2772a
 * fallback-reason: too many instructions (>3000, limit 3000)
 */

1D989: push    bp
1D98A: mov     bp, sp
1D98C: mov     ax, 2
1D98F: call    @__StackCheck$q4Word; Stack overflow check (AX)
1D994: sub     sp, 2
1D997: xor     ax, ax
1D999: mov     [bp+var_2], ax
1D99C: cmp     word_27E50, 1
1D9A1: jnz     short loc_1D9CF
1D9A3: mov     al, 10h
1D9A5: push    ax
1D9A6: mov     al, 7
1D9A8: push    ax
1D9A9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D9AE: mov     di, offset unk_2F60A
1D9B1: push    ds
1D9B2: push    di
1D9B3: mov     di, offset aKe; "Ke"
1D9B6: push    cs
1D9B7: push    di
1D9B8: xor     ax, ax
1D9BA: push    ax
1D9BB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D9C0: call    @Write$qm4Text; Write(var f: Text)
1D9C5: call    @__IOCheck$qv; Exit if error
1D9CA: mov     [bp+var_2], 1
1D9CF: cmp     word_27E4A, 1
1D9D4: jnz     short loc_1DA02
1D9D6: mov     al, 16h
1D9D8: push    ax
1D9D9: mov     al, 3
1D9DB: push    ax
1D9DC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D9E1: mov     di, offset unk_2F60A
1D9E4: push    ds
1D9E5: push    di
1D9E6: mov     di, offset aGu; "Gu"
1D9E9: push    cs
1D9EA: push    di
1D9EB: xor     ax, ax
1D9ED: push    ax
1D9EE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D9F3: call    @Write$qm4Text; Write(var f: Text)
1D9F8: call    @__IOCheck$qv; Exit if error
1D9FD: mov     [bp+var_2], 1
1DA02: cmp     word_27E42, 1
1DA07: jnz     short loc_1DA35
1DA09: mov     al, 16h
1DA0B: push    ax
1DA0C: mov     al, 4
1DA0E: push    ax
1DA0F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DA14: mov     di, offset unk_2F60A
1DA17: push    ds
1DA18: push    di
1DA19: mov     di, offset aRv; "Rv"
1DA1C: push    cs
1DA1D: push    di
1DA1E: xor     ax, ax
1DA20: push    ax
1DA21: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DA26: call    @Write$qm4Text; Write(var f: Text)
1DA2B: call    @__IOCheck$qv; Exit if error
1DA30: mov     [bp+var_2], 1
1DA35: cmp     word_27E4C, 1
1DA3A: jnz     short loc_1DA68
1DA3C: mov     al, 10h
1DA3E: push    ax
1DA3F: mov     al, 4
1DA41: push    ax
1DA42: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DA47: mov     di, offset unk_2F60A
1DA4A: push    ds
1DA4B: push    di
1DA4C: mov     di, offset aSh; "Sh"
1DA4F: push    cs
1DA50: push    di
1DA51: xor     ax, ax
1DA53: push    ax
1DA54: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DA59: call    @Write$qm4Text; Write(var f: Text)
1DA5E: call    @__IOCheck$qv; Exit if error
1DA63: mov     [bp+var_2], 1
1DA68: cmp     word_27E48, 1
1DA6D: jnz     short loc_1DA9B
1DA6F: mov     al, 10h
1DA71: push    ax
1DA72: mov     al, 3
1DA74: push    ax
1DA75: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DA7A: mov     di, offset unk_2F60A
1DA7D: push    ds
1DA7E: push    di
1DA7F: mov     di, offset aKu; "Ku"
1DA82: push    cs
1DA83: push    di
1DA84: xor     ax, ax
1DA86: push    ax
1DA87: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DA8C: call    @Write$qm4Text; Write(var f: Text)
1DA91: call    @__IOCheck$qv; Exit if error
1DA96: mov     [bp+var_2], 1
1DA9B: cmp     word_27E44, 1
1DAA0: jnz     short loc_1DACE
1DAA2: mov     al, 16h
1DAA4: push    ax
1DAA5: mov     al, 5
1DAA7: push    ax
1DAA8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DAAD: mov     di, offset unk_2F60A
1DAB0: push    ds
1DAB1: push    di
1DAB2: mov     di, offset aBu; "Bu"
1DAB5: push    cs
1DAB6: push    di
1DAB7: xor     ax, ax
1DAB9: push    ax
1DABA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DABF: call    @Write$qm4Text; Write(var f: Text)
1DAC4: call    @__IOCheck$qv; Exit if error
1DAC9: mov     [bp+var_2], 1
1DACE: cmp     word_27E40, 1
1DAD3: jnz     short loc_1DB01
1DAD5: mov     al, 16h
1DAD7: push    ax
1DAD8: mov     al, 6
1DADA: push    ax
1DADB: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DAE0: mov     di, offset unk_2F60A
1DAE3: push    ds
1DAE4: push    di
1DAE5: mov     di, offset aCh; "Ch"
1DAE8: push    cs
1DAE9: push    di
1DAEA: xor     ax, ax
1DAEC: push    ax
1DAED: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DAF2: call    @Write$qm4Text; Write(var f: Text)
1DAF7: call    @__IOCheck$qv; Exit if error
1DAFC: mov     [bp+var_2], 1
1DB01: cmp     word_27E46, 1
1DB06: jnz     short loc_1DB34
1DB08: mov     al, 10h
1DB0A: push    ax
1DB0B: mov     al, 5
1DB0D: push    ax
1DB0E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DB13: mov     di, offset unk_2F60A
1DB16: push    ds
1DB17: push    di
1DB18: mov     di, offset aSi; "Si"
1DB1B: push    cs
1DB1C: push    di
1DB1D: xor     ax, ax
1DB1F: push    ax
1DB20: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DB25: call    @Write$qm4Text; Write(var f: Text)
1DB2A: call    @__IOCheck$qv; Exit if error
1DB2F: mov     [bp+var_2], 1
1DB34: cmp     word_27E4E, 1
1DB39: jnz     short loc_1DB67
1DB3B: mov     al, 10h
1DB3D: push    ax
1DB3E: mov     al, 6
1DB40: push    ax
1DB41: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DB46: mov     di, offset unk_2F60A
1DB49: push    ds
1DB4A: push    di
1DB4B: mov     di, offset aRa; "Ra"
1DB4E: push    cs
1DB4F: push    di
1DB50: xor     ax, ax
1DB52: push    ax
1DB53: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DB58: call    @Write$qm4Text; Write(var f: Text)
1DB5D: call    @__IOCheck$qv; Exit if error
1DB62: mov     [bp+var_2], 1
1DB67: cmp     [bp+var_2], 1
1DB6B: jz      short loc_1DB92
1DB6D: mov     al, 14h
1DB6F: push    ax
1DB70: mov     al, 5
1DB72: push    ax
1DB73: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DB78: mov     di, offset unk_2F60A
1DB7B: push    ds
1DB7C: push    di
1DB7D: mov     al, 31h ; '1'
1DB7F: push    ax
1DB80: xor     ax, ax
1DB82: push    ax
1DB83: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1DB88: call    @Write$qm4Text; Write(var f: Text)
1DB8D: call    @__IOCheck$qv; Exit if error
1DB92: xor     ax, ax
1DB94: mov     [bp+var_2], ax
1DB97: cmp     word_27E50, 2
1DB9C: jnz     short loc_1DBCA
1DB9E: mov     al, 0Ah
1DBA0: push    ax
1DBA1: mov     al, 2
1DBA3: push    ax
1DBA4: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DBA9: mov     di, offset unk_2F60A
1DBAC: push    ds
1DBAD: push    di
1DBAE: mov     di, offset aKe; "Ke"
1DBB1: push    cs
1DBB2: push    di
1DBB3: xor     ax, ax
1DBB5: push    ax
1DBB6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DBBB: call    @Write$qm4Text; Write(var f: Text)
1DBC0: call    @__IOCheck$qv; Exit if error
1DBC5: mov     [bp+var_2], 1
1DBCA: cmp     word_27E4A, 2
1DBCF: jnz     short loc_1DBFD
1DBD1: mov     al, 7
1DBD3: push    ax
1DBD4: mov     al, 2
1DBD6: push    ax
1DBD7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DBDC: mov     di, offset unk_2F60A
1DBDF: push    ds
1DBE0: push    di
1DBE1: mov     di, offset aGu; "Gu"
1DBE4: push    cs
1DBE5: push    di
1DBE6: xor     ax, ax
1DBE8: push    ax
1DBE9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DBEE: call    @Write$qm4Text; Write(var f: Text)
1DBF3: call    @__IOCheck$qv; Exit if error
1DBF8: mov     [bp+var_2], 1
1DBFD: cmp     word_27E42, 2
1DC02: jnz     short loc_1DC30
1DC04: mov     al, 0Dh
1DC06: push    ax
1DC07: mov     al, 2
1DC09: push    ax
1DC0A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DC0F: mov     di, offset unk_2F60A
1DC12: push    ds
1DC13: push    di
1DC14: mov     di, offset aRv; "Rv"
1DC17: push    cs
1DC18: push    di
1DC19: xor     ax, ax
1DC1B: push    ax
1DC1C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DC21: call    @Write$qm4Text; Write(var f: Text)
1DC26: call    @__IOCheck$qv; Exit if error
1DC2B: mov     [bp+var_2], 1
1DC30: cmp     word_27E4C, 2
1DC35: jnz     short loc_1DC63
1DC37: mov     al, 7
1DC39: push    ax
1DC3A: mov     al, 3
1DC3C: push    ax
1DC3D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DC42: mov     di, offset unk_2F60A
1DC45: push    ds
1DC46: push    di
1DC47: mov     di, offset aSh; "Sh"
1DC4A: push    cs
1DC4B: push    di
1DC4C: xor     ax, ax
1DC4E: push    ax
1DC4F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DC54: call    @Write$qm4Text; Write(var f: Text)
1DC59: call    @__IOCheck$qv; Exit if error
1DC5E: mov     [bp+var_2], 1
1DC63: cmp     word_27E48, 2
1DC68: jnz     short loc_1DC96
1DC6A: mov     al, 0Ch
1DC6C: push    ax
1DC6D: mov     al, 3
1DC6F: push    ax
1DC70: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DC75: mov     di, offset unk_2F60A
1DC78: push    ds
1DC79: push    di
1DC7A: mov     di, offset aKu; "Ku"
1DC7D: push    cs
1DC7E: push    di
1DC7F: xor     ax, ax
1DC81: push    ax
1DC82: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DC87: call    @Write$qm4Text; Write(var f: Text)
1DC8C: call    @__IOCheck$qv; Exit if error
1DC91: mov     [bp+var_2], 1
1DC96: cmp     word_27E44, 2
1DC9B: jnz     short loc_1DCC9
1DC9D: mov     al, 0Ch
1DC9F: push    ax
1DCA0: mov     al, 4
1DCA2: push    ax
1DCA3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DCA8: mov     di, offset unk_2F60A
1DCAB: push    ds
1DCAC: push    di
1DCAD: mov     di, offset aBu; "Bu"
1DCB0: push    cs
1DCB1: push    di
1DCB2: xor     ax, ax
1DCB4: push    ax
1DCB5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DCBA: call    @Write$qm4Text; Write(var f: Text)
1DCBF: call    @__IOCheck$qv; Exit if error
1DCC4: mov     [bp+var_2], 1
1DCC9: cmp     word_27E40, 2
1DCCE: jnz     short loc_1DCFC
1DCD0: mov     al, 0Bh
1DCD2: push    ax
1DCD3: mov     al, 5
1DCD5: push    ax
1DCD6: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DCDB: mov     di, offset unk_2F60A
1DCDE: push    ds
1DCDF: push    di
1DCE0: mov     di, offset aCh; "Ch"
1DCE3: push    cs
1DCE4: push    di
1DCE5: xor     ax, ax
1DCE7: push    ax
1DCE8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DCED: call    @Write$qm4Text; Write(var f: Text)
1DCF2: call    @__IOCheck$qv; Exit if error
1DCF7: mov     [bp+var_2], 1
1DCFC: cmp     word_27E46, 2
1DD01: jnz     short loc_1DD2F
1DD03: mov     al, 8
1DD05: push    ax
1DD06: mov     al, 4
1DD08: push    ax
1DD09: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DD0E: mov     di, offset unk_2F60A
1DD11: push    ds
1DD12: push    di
1DD13: mov     di, offset aSi; "Si"
1DD16: push    cs
1DD17: push    di
1DD18: xor     ax, ax
1DD1A: push    ax
1DD1B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DD20: call    @Write$qm4Text; Write(var f: Text)
1DD25: call    @__IOCheck$qv; Exit if error
1DD2A: mov     [bp+var_2], 1
1DD2F: cmp     word_27E4E, 2
1DD34: jnz     short loc_1DD62
1DD36: mov     al, 0Ch
1DD38: push    ax
1DD39: mov     al, 6
1DD3B: push    ax
1DD3C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DD41: mov     di, offset unk_2F60A
1DD44: push    ds
1DD45: push    di
1DD46: mov     di, offset aRa; "Ra"
1DD49: push    cs
1DD4A: push    di
1DD4B: xor     ax, ax
1DD4D: push    ax
1DD4E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DD53: call    @Write$qm4Text; Write(var f: Text)
1DD58: call    @__IOCheck$qv; Exit if error
1DD5D: mov     [bp+var_2], 1
1DD62: cmp     [bp+var_2], 1
1DD66: jz      short loc_1DD8D
1DD68: mov     al, 0Ah
1DD6A: push    ax
1DD6B: mov     al, 4
1DD6D: push    ax
1DD6E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DD73: mov     di, offset unk_2F60A
1DD76: push    ds
1DD77: push    di
1DD78: mov     al, 32h ; '2'
1DD7A: push    ax
1DD7B: xor     ax, ax
1DD7D: push    ax
1DD7E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1DD83: call    @Write$qm4Text; Write(var f: Text)
1DD88: call    @__IOCheck$qv; Exit if error
1DD8D: xor     ax, ax
1DD8F: mov     [bp+var_2], ax
1DD92: cmp     word_27E50, 3
1DD97: jnz     short loc_1DDC5
1DD99: mov     al, 2
1DD9B: push    ax
1DD9C: mov     al, 3
1DD9E: push    ax
1DD9F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DDA4: mov     di, offset unk_2F60A
1DDA7: push    ds
1DDA8: push    di
1DDA9: mov     di, offset aKe; "Ke"
1DDAC: push    cs
1DDAD: push    di
1DDAE: xor     ax, ax
1DDB0: push    ax
1DDB1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DDB6: call    @Write$qm4Text; Write(var f: Text)
1DDBB: call    @__IOCheck$qv; Exit if error
1DDC0: mov     [bp+var_2], 1
1DDC5: cmp     word_27E4A, 3
1DDCA: jnz     short loc_1DDF8
1DDCC: mov     al, 3
1DDCE: push    ax
1DDCF: mov     al, 4
1DDD1: push    ax
1DDD2: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DDD7: mov     di, offset unk_2F60A
1DDDA: push    ds
1DDDB: push    di
1DDDC: mov     di, offset aGu; "Gu"
1DDDF: push    cs
1DDE0: push    di
1DDE1: xor     ax, ax
1DDE3: push    ax
1DDE4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DDE9: call    @Write$qm4Text; Write(var f: Text)
1DDEE: call    @__IOCheck$qv; Exit if error
1DDF3: mov     [bp+var_2], 1
1DDF8: cmp     word_27E42, 3
1DDFD: jnz     short loc_1DE2B
1DDFF: mov     al, 2
1DE01: push    ax
1DE02: mov     al, 5
1DE04: push    ax
1DE05: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DE0A: mov     di, offset unk_2F60A
1DE0D: push    ds
1DE0E: push    di
1DE0F: mov     di, offset aRv; "Rv"
1DE12: push    cs
1DE13: push    di
1DE14: xor     ax, ax
1DE16: push    ax
1DE17: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DE1C: call    @Write$qm4Text; Write(var f: Text)
1DE21: call    @__IOCheck$qv; Exit if error
1DE26: mov     [bp+var_2], 1
1DE2B: cmp     word_27E4C, 3
1DE30: jnz     short loc_1DE5E
1DE32: mov     al, 6
1DE34: push    ax
1DE35: mov     al, 5
1DE37: push    ax
1DE38: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DE3D: mov     di, offset unk_2F60A
1DE40: push    ds
1DE41: push    di
1DE42: mov     di, offset aSh; "Sh"
1DE45: push    cs
1DE46: push    di
1DE47: xor     ax, ax
1DE49: push    ax
1DE4A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DE4F: call    @Write$qm4Text; Write(var f: Text)
1DE54: call    @__IOCheck$qv; Exit if error
1DE59: mov     [bp+var_2], 1
1DE5E: cmp     word_27E48, 3
1DE63: jnz     short loc_1DE91
1DE65: mov     al, 2
1DE67: push    ax
1DE68: mov     al, 6
1DE6A: push    ax
1DE6B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DE70: mov     di, offset unk_2F60A
1DE73: push    ds
1DE74: push    di
1DE75: mov     di, offset aKu; "Ku"
1DE78: push    cs
1DE79: push    di
1DE7A: xor     ax, ax
1DE7C: push    ax
1DE7D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DE82: call    @Write$qm4Text; Write(var f: Text)
1DE87: call    @__IOCheck$qv; Exit if error
1DE8C: mov     [bp+var_2], 1
1DE91: cmp     word_27E44, 3
1DE96: jnz     short loc_1DEC4
1DE98: mov     al, 6
1DE9A: push    ax
1DE9B: mov     al, 6
1DE9D: push    ax
1DE9E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DEA3: mov     di, offset unk_2F60A
1DEA6: push    ds
1DEA7: push    di
1DEA8: mov     di, offset aBu; "Bu"
1DEAB: push    cs
1DEAC: push    di
1DEAD: xor     ax, ax
1DEAF: push    ax
1DEB0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DEB5: call    @Write$qm4Text; Write(var f: Text)
1DEBA: call    @__IOCheck$qv; Exit if error
1DEBF: mov     [bp+var_2], 1
1DEC4: cmp     word_27E40, 3
1DEC9: jnz     short loc_1DEF7
1DECB: mov     al, 2
1DECD: push    ax
1DECE: mov     al, 7
1DED0: push    ax
1DED1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DED6: mov     di, offset unk_2F60A
1DED9: push    ds
1DEDA: push    di
1DEDB: mov     di, offset aCh; "Ch"
1DEDE: push    cs
1DEDF: push    di
1DEE0: xor     ax, ax
1DEE2: push    ax
1DEE3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DEE8: call    @Write$qm4Text; Write(var f: Text)
1DEED: call    @__IOCheck$qv; Exit if error
1DEF2: mov     [bp+var_2], 1
1DEF7: cmp     word_27E46, 3
1DEFC: jnz     short loc_1DF2A
1DEFE: mov     al, 6
1DF00: push    ax
1DF01: mov     al, 7
1DF03: push    ax
1DF04: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DF09: mov     di, offset unk_2F60A
1DF0C: push    ds
1DF0D: push    di
1DF0E: mov     di, offset aSi; "Si"
1DF11: push    cs
1DF12: push    di
1DF13: xor     ax, ax
1DF15: push    ax
1DF16: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DF1B: call    @Write$qm4Text; Write(var f: Text)
1DF20: call    @__IOCheck$qv; Exit if error
1DF25: mov     [bp+var_2], 1
1DF2A: cmp     word_27E4E, 3
1DF2F: jnz     short loc_1DF5D
1DF31: mov     al, 0Ah
1DF33: push    ax
1DF34: mov     al, 7
1DF36: push    ax
1DF37: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DF3C: mov     di, offset unk_2F60A
1DF3F: push    ds
1DF40: push    di
1DF41: mov     di, offset aRa; "Ra"
1DF44: push    cs
1DF45: push    di
1DF46: xor     ax, ax
1DF48: push    ax
1DF49: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DF4E: call    @Write$qm4Text; Write(var f: Text)
1DF53: call    @__IOCheck$qv; Exit if error
1DF58: mov     [bp+var_2], 1
1DF5D: cmp     [bp+var_2], 1
1DF61: jz      short loc_1DF88
1DF63: mov     al, 5
1DF65: push    ax
1DF66: mov     al, 6
1DF68: push    ax
1DF69: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DF6E: mov     di, offset unk_2F60A
1DF71: push    ds
1DF72: push    di
1DF73: mov     al, 33h ; '3'
1DF75: push    ax
1DF76: xor     ax, ax
1DF78: push    ax
1DF79: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1DF7E: call    @Write$qm4Text; Write(var f: Text)
1DF83: call    @__IOCheck$qv; Exit if error
1DF88: xor     ax, ax
1DF8A: mov     [bp+var_2], ax
1DF8D: cmp     word_27E50, 4
1DF92: jnz     short loc_1DFC0
1DF94: mov     al, 4
1DF96: push    ax
1DF97: mov     al, 9
1DF99: push    ax
1DF9A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DF9F: mov     di, offset unk_2F60A
1DFA2: push    ds
1DFA3: push    di
1DFA4: mov     di, offset aKe; "Ke"
1DFA7: push    cs
1DFA8: push    di
1DFA9: xor     ax, ax
1DFAB: push    ax
1DFAC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DFB1: call    @Write$qm4Text; Write(var f: Text)
1DFB6: call    @__IOCheck$qv; Exit if error
1DFBB: mov     [bp+var_2], 1
1DFC0: cmp     word_27E4A, 4
1DFC5: jnz     short loc_1DFF3
1DFC7: mov     al, 4
1DFC9: push    ax
1DFCA: mov     al, 0Dh
1DFCC: push    ax
1DFCD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1DFD2: mov     di, offset unk_2F60A
1DFD5: push    ds
1DFD6: push    di
1DFD7: mov     di, offset aGu; "Gu"
1DFDA: push    cs
1DFDB: push    di
1DFDC: xor     ax, ax
1DFDE: push    ax
1DFDF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1DFE4: call    @Write$qm4Text; Write(var f: Text)
1DFE9: call    @__IOCheck$qv; Exit if error
1DFEE: mov     [bp+var_2], 1
1DFF3: cmp     word_27E42, 4
1DFF8: jnz     short loc_1E026
1DFFA: mov     al, 4
1DFFC: push    ax
1DFFD: mov     al, 0Ah
1DFFF: push    ax
1E000: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E005: mov     di, offset unk_2F60A
1E008: push    ds
1E009: push    di
1E00A: mov     di, offset aRv; "Rv"
1E00D: push    cs
1E00E: push    di
1E00F: xor     ax, ax
1E011: push    ax
1E012: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E017: call    @Write$qm4Text; Write(var f: Text)
1E01C: call    @__IOCheck$qv; Exit if error
1E021: mov     [bp+var_2], 1
1E026: cmp     word_27E4C, 4
1E02B: jnz     short loc_1E059
1E02D: mov     al, 8
1E02F: push    ax
1E030: mov     al, 0Dh
1E032: push    ax
1E033: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E038: mov     di, offset unk_2F60A
1E03B: push    ds
1E03C: push    di
1E03D: mov     di, offset aSh; "Sh"
1E040: push    cs
1E041: push    di
1E042: xor     ax, ax
1E044: push    ax
1E045: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E04A: call    @Write$qm4Text; Write(var f: Text)
1E04F: call    @__IOCheck$qv; Exit if error
1E054: mov     [bp+var_2], 1
1E059: cmp     word_27E48, 4
1E05E: jnz     short loc_1E08C
1E060: mov     al, 8
1E062: push    ax
1E063: mov     al, 0Ch
1E065: push    ax
1E066: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E06B: mov     di, offset unk_2F60A
1E06E: push    ds
1E06F: push    di
1E070: mov     di, offset aKu; "Ku"
1E073: push    cs
1E074: push    di
1E075: xor     ax, ax
1E077: push    ax
1E078: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E07D: call    @Write$qm4Text; Write(var f: Text)
1E082: call    @__IOCheck$qv; Exit if error
1E087: mov     [bp+var_2], 1
1E08C: cmp     word_27E44, 4
1E091: jnz     short loc_1E0BF
1E093: mov     al, 4
1E095: push    ax
1E096: mov     al, 0Ch
1E098: push    ax
1E099: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E09E: mov     di, offset unk_2F60A
1E0A1: push    ds
1E0A2: push    di
1E0A3: mov     di, offset aBu; "Bu"
1E0A6: push    cs
1E0A7: push    di
1E0A8: xor     ax, ax
1E0AA: push    ax
1E0AB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E0B0: call    @Write$qm4Text; Write(var f: Text)
1E0B5: call    @__IOCheck$qv; Exit if error
1E0BA: mov     [bp+var_2], 1
1E0BF: cmp     word_27E40, 4
1E0C4: jnz     short loc_1E0F2
1E0C6: mov     al, 8
1E0C8: push    ax
1E0C9: mov     al, 0Bh
1E0CB: push    ax
1E0CC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E0D1: mov     di, offset unk_2F60A
1E0D4: push    ds
1E0D5: push    di
1E0D6: mov     di, offset aCh; "Ch"
1E0D9: push    cs
1E0DA: push    di
1E0DB: xor     ax, ax
1E0DD: push    ax
1E0DE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E0E3: call    @Write$qm4Text; Write(var f: Text)
1E0E8: call    @__IOCheck$qv; Exit if error
1E0ED: mov     [bp+var_2], 1
1E0F2: cmp     word_27E46, 4
1E0F7: jnz     short loc_1E125
1E0F9: mov     al, 8
1E0FB: push    ax
1E0FC: mov     al, 0Ah
1E0FE: push    ax
1E0FF: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E104: mov     di, offset unk_2F60A
1E107: push    ds
1E108: push    di
1E109: mov     di, offset aSi; "Si"
1E10C: push    cs
1E10D: push    di
1E10E: xor     ax, ax
1E110: push    ax
1E111: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E116: call    @Write$qm4Text; Write(var f: Text)
1E11B: call    @__IOCheck$qv; Exit if error
1E120: mov     [bp+var_2], 1
1E125: cmp     word_27E4E, 4
1E12A: jnz     short loc_1E158
1E12C: mov     al, 4
1E12E: push    ax
1E12F: mov     al, 0Bh
1E131: push    ax
1E132: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E137: mov     di, offset unk_2F60A
1E13A: push    ds
1E13B: push    di
1E13C: mov     di, offset aRa; "Ra"
1E13F: push    cs
1E140: push    di
1E141: xor     ax, ax
1E143: push    ax
1E144: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E149: call    @Write$qm4Text; Write(var f: Text)
1E14E: call    @__IOCheck$qv; Exit if error
1E153: mov     [bp+var_2], 1
1E158: cmp     [bp+var_2], 1
1E15C: jz      short loc_1E183
1E15E: mov     al, 8
1E160: push    ax
1E161: mov     al, 0Bh
1E163: push    ax
1E164: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E169: mov     di, offset unk_2F60A
1E16C: push    ds
1E16D: push    di
1E16E: mov     al, 34h ; '4'
1E170: push    ax
1E171: xor     ax, ax
1E173: push    ax
1E174: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1E179: call    @Write$qm4Text; Write(var f: Text)
1E17E: call    @__IOCheck$qv; Exit if error
1E183: xor     ax, ax
1E185: mov     [bp+var_2], ax
1E188: cmp     word_27E50, 5
1E18D: jnz     short loc_1E1BB
1E18F: mov     al, 3
1E191: push    ax
1E192: mov     al, 13h
1E194: push    ax
1E195: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E19A: mov     di, offset unk_2F60A
1E19D: push    ds
1E19E: push    di
1E19F: mov     di, offset aKe; "Ke"
1E1A2: push    cs
1E1A3: push    di
1E1A4: xor     ax, ax
1E1A6: push    ax
1E1A7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E1AC: call    @Write$qm4Text; Write(var f: Text)
1E1B1: call    @__IOCheck$qv; Exit if error
1E1B6: mov     [bp+var_2], 1
1E1BB: cmp     word_27E4A, 5
1E1C0: jnz     short loc_1E1EE
1E1C2: mov     al, 3
1E1C4: push    ax
1E1C5: mov     al, 0Fh
1E1C7: push    ax
1E1C8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E1CD: mov     di, offset unk_2F60A
1E1D0: push    ds
1E1D1: push    di
1E1D2: mov     di, offset aGu; "Gu"
1E1D5: push    cs
1E1D6: push    di
1E1D7: xor     ax, ax
1E1D9: push    ax
1E1DA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E1DF: call    @Write$qm4Text; Write(var f: Text)
1E1E4: call    @__IOCheck$qv; Exit if error
1E1E9: mov     [bp+var_2], 1
1E1EE: cmp     word_27E42, 5
1E1F3: jnz     short loc_1E221
1E1F5: mov     al, 7
1E1F7: push    ax
1E1F8: mov     al, 0Fh
1E1FA: push    ax
1E1FB: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E200: mov     di, offset unk_2F60A
1E203: push    ds
1E204: push    di
1E205: mov     di, offset aRv; "Rv"
1E208: push    cs
1E209: push    di
1E20A: xor     ax, ax
1E20C: push    ax
1E20D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E212: call    @Write$qm4Text; Write(var f: Text)
1E217: call    @__IOCheck$qv; Exit if error
1E21C: mov     [bp+var_2], 1
1E221: cmp     word_27E4C, 5
1E226: jnz     short loc_1E254
1E228: mov     al, 0Bh
1E22A: push    ax
1E22B: mov     al, 0Fh
1E22D: push    ax
1E22E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E233: mov     di, offset unk_2F60A
1E236: push    ds
1E237: push    di
1E238: mov     di, offset aSh; "Sh"
1E23B: push    cs
1E23C: push    di
1E23D: xor     ax, ax
1E23F: push    ax
1E240: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E245: call    @Write$qm4Text; Write(var f: Text)
1E24A: call    @__IOCheck$qv; Exit if error
1E24F: mov     [bp+var_2], 1
1E254: cmp     word_27E48, 5
1E259: jnz     short loc_1E287
1E25B: mov     al, 3
1E25D: push    ax
1E25E: mov     al, 10h
1E260: push    ax
1E261: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E266: mov     di, offset unk_2F60A
1E269: push    ds
1E26A: push    di
1E26B: mov     di, offset aKu; "Ku"
1E26E: push    cs
1E26F: push    di
1E270: xor     ax, ax
1E272: push    ax
1E273: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E278: call    @Write$qm4Text; Write(var f: Text)
1E27D: call    @__IOCheck$qv; Exit if error
1E282: mov     [bp+var_2], 1
1E287: cmp     word_27E44, 5
1E28C: jnz     short loc_1E2BA
1E28E: mov     al, 7
1E290: push    ax
1E291: mov     al, 10h
1E293: push    ax
1E294: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E299: mov     di, offset unk_2F60A
1E29C: push    ds
1E29D: push    di
1E29E: mov     di, offset aBu; "Bu"
1E2A1: push    cs
1E2A2: push    di
1E2A3: xor     ax, ax
1E2A5: push    ax
1E2A6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E2AB: call    @Write$qm4Text; Write(var f: Text)
1E2B0: call    @__IOCheck$qv; Exit if error
1E2B5: mov     [bp+var_2], 1
1E2BA: cmp     word_27E40, 5
1E2BF: jnz     short loc_1E2ED
1E2C1: mov     al, 3
1E2C3: push    ax
1E2C4: mov     al, 12h
1E2C6: push    ax
1E2C7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E2CC: mov     di, offset unk_2F60A
1E2CF: push    ds
1E2D0: push    di
1E2D1: mov     di, offset aCh; "Ch"
1E2D4: push    cs
1E2D5: push    di
1E2D6: xor     ax, ax
1E2D8: push    ax
1E2D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E2DE: call    @Write$qm4Text; Write(var f: Text)
1E2E3: call    @__IOCheck$qv; Exit if error
1E2E8: mov     [bp+var_2], 1
1E2ED: cmp     word_27E46, 5
1E2F2: jnz     short loc_1E320
1E2F4: mov     al, 3
1E2F6: push    ax
1E2F7: mov     al, 11h
1E2F9: push    ax
1E2FA: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E2FF: mov     di, offset unk_2F60A
1E302: push    ds
1E303: push    di
1E304: mov     di, offset aSi; "Si"
1E307: push    cs
1E308: push    di
1E309: xor     ax, ax
1E30B: push    ax
1E30C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E311: call    @Write$qm4Text; Write(var f: Text)
1E316: call    @__IOCheck$qv; Exit if error
1E31B: mov     [bp+var_2], 1
1E320: cmp     word_27E4E, 5
1E325: jnz     short loc_1E353
1E327: mov     al, 7
1E329: push    ax
1E32A: mov     al, 11h
1E32C: push    ax
1E32D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E332: mov     di, offset unk_2F60A
1E335: push    ds
1E336: push    di
1E337: mov     di, offset aRa; "Ra"
1E33A: push    cs
1E33B: push    di
1E33C: xor     ax, ax
1E33E: push    ax
1E33F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E344: call    @Write$qm4Text; Write(var f: Text)
1E349: call    @__IOCheck$qv; Exit if error
1E34E: mov     [bp+var_2], 1
1E353: cmp     [bp+var_2], 1
1E357: jz      short loc_1E37E
1E359: mov     al, 4
1E35B: push    ax
1E35C: mov     al, 11h
1E35E: push    ax
1E35F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E364: mov     di, offset unk_2F60A
1E367: push    ds
1E368: push    di
1E369: mov     al, 35h ; '5'
1E36B: push    ax
1E36C: xor     ax, ax
1E36E: push    ax
1E36F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1E374: call    @Write$qm4Text; Write(var f: Text)
1E379: call    @__IOCheck$qv; Exit if error
1E37E: xor     ax, ax
1E380: mov     [bp+var_2], ax
1E383: cmp     word_27E50, 6
1E388: jnz     short loc_1E3B6
1E38A: mov     al, 0Dh
1E38C: push    ax
1E38D: mov     al, 10h
1E38F: push    ax
1E390: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E395: mov     di, offset unk_2F60A
1E398: push    ds
1E399: push    di
1E39A: mov     di, offset aKe; "Ke"
1E39D: push    cs
1E39E: push    di
1E39F: xor     ax, ax
1E3A1: push    ax
1E3A2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E3A7: call    @Write$qm4Text; Write(var f: Text)
1E3AC: call    @__IOCheck$qv; Exit if error
1E3B1: mov     [bp+var_2], 1
1E3B6: cmp     word_27E4A, 6
1E3BB: jnz     short loc_1E3E9
1E3BD: mov     al, 0Ch
1E3BF: push    ax
1E3C0: mov     al, 11h
1E3C2: push    ax
1E3C3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E3C8: mov     di, offset unk_2F60A
1E3CB: push    ds
1E3CC: push    di
1E3CD: mov     di, offset aGu; "Gu"
1E3D0: push    cs
1E3D1: push    di
1E3D2: xor     ax, ax
1E3D4: push    ax
1E3D5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E3DA: call    @Write$qm4Text; Write(var f: Text)
1E3DF: call    @__IOCheck$qv; Exit if error
1E3E4: mov     [bp+var_2], 1
1E3E9: cmp     word_27E42, 6
1E3EE: jnz     short loc_1E41C
1E3F0: mov     al, 0Ch
1E3F2: push    ax
1E3F3: mov     al, 13h
1E3F5: push    ax
1E3F6: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E3FB: mov     di, offset unk_2F60A
1E3FE: push    ds
1E3FF: push    di
1E400: mov     di, offset aRv; "Rv"
1E403: push    cs
1E404: push    di
1E405: xor     ax, ax
1E407: push    ax
1E408: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E40D: call    @Write$qm4Text; Write(var f: Text)
1E412: call    @__IOCheck$qv; Exit if error
1E417: mov     [bp+var_2], 1
1E41C: cmp     word_27E4C, 6
1E421: jnz     short loc_1E44F
1E423: mov     al, 8
1E425: push    ax
1E426: mov     al, 13h
1E428: push    ax
1E429: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E42E: mov     di, offset unk_2F60A
1E431: push    ds
1E432: push    di
1E433: mov     di, offset aSh; "Sh"
1E436: push    cs
1E437: push    di
1E438: xor     ax, ax
1E43A: push    ax
1E43B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E440: call    @Write$qm4Text; Write(var f: Text)
1E445: call    @__IOCheck$qv; Exit if error
1E44A: mov     [bp+var_2], 1
1E44F: cmp     word_27E48, 6
1E454: jnz     short loc_1E482
1E456: mov     al, 8
1E458: push    ax
1E459: mov     al, 14h
1E45B: push    ax
1E45C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E461: mov     di, offset unk_2F60A
1E464: push    ds
1E465: push    di
1E466: mov     di, offset aKu; "Ku"
1E469: push    cs
1E46A: push    di
1E46B: xor     ax, ax
1E46D: push    ax
1E46E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E473: call    @Write$qm4Text; Write(var f: Text)
1E478: call    @__IOCheck$qv; Exit if error
1E47D: mov     [bp+var_2], 1
1E482: cmp     word_27E44, 6
1E487: jnz     short loc_1E4B5
1E489: mov     al, 5
1E48B: push    ax
1E48C: mov     al, 14h
1E48E: push    ax
1E48F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E494: mov     di, offset unk_2F60A
1E497: push    ds
1E498: push    di
1E499: mov     di, offset aBu; "Bu"
1E49C: push    cs
1E49D: push    di
1E49E: xor     ax, ax
1E4A0: push    ax
1E4A1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E4A6: call    @Write$qm4Text; Write(var f: Text)
1E4AB: call    @__IOCheck$qv; Exit if error
1E4B0: mov     [bp+var_2], 1
1E4B5: cmp     word_27E40, 6
1E4BA: jnz     short loc_1E4E8
1E4BC: mov     al, 0Ch
1E4BE: push    ax
1E4BF: mov     al, 14h
1E4C1: push    ax
1E4C2: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E4C7: mov     di, offset unk_2F60A
1E4CA: push    ds
1E4CB: push    di
1E4CC: mov     di, offset aCh; "Ch"
1E4CF: push    cs
1E4D0: push    di
1E4D1: xor     ax, ax
1E4D3: push    ax
1E4D4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E4D9: call    @Write$qm4Text; Write(var f: Text)
1E4DE: call    @__IOCheck$qv; Exit if error
1E4E3: mov     [bp+var_2], 1
1E4E8: cmp     word_27E46, 6
1E4ED: jnz     short loc_1E51B
1E4EF: mov     al, 0Ch
1E4F1: push    ax
1E4F2: mov     al, 12h
1E4F4: push    ax
1E4F5: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E4FA: mov     di, offset unk_2F60A
1E4FD: push    ds
1E4FE: push    di
1E4FF: mov     di, offset aSi; "Si"
1E502: push    cs
1E503: push    di
1E504: xor     ax, ax
1E506: push    ax
1E507: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E50C: call    @Write$qm4Text; Write(var f: Text)
1E511: call    @__IOCheck$qv; Exit if error
1E516: mov     [bp+var_2], 1
1E51B: cmp     word_27E4E, 6
1E520: jnz     short loc_1E54E
1E522: mov     al, 9
1E524: push    ax
1E525: mov     al, 12h
1E527: push    ax
1E528: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E52D: mov     di, offset unk_2F60A
1E530: push    ds
1E531: push    di
1E532: mov     di, offset aRa; "Ra"
1E535: push    cs
1E536: push    di
1E537: xor     ax, ax
1E539: push    ax
1E53A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E53F: call    @Write$qm4Text; Write(var f: Text)
1E544: call    @__IOCheck$qv; Exit if error
1E549: mov     [bp+var_2], 1
1E54E: cmp     [bp+var_2], 1
1E552: jz      short loc_1E579
1E554: mov     al, 0Bh
1E556: push    ax
1E557: mov     al, 13h
1E559: push    ax
1E55A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E55F: mov     di, offset unk_2F60A
1E562: push    ds
1E563: push    di
1E564: mov     al, 36h ; '6'
1E566: push    ax
1E567: xor     ax, ax
1E569: push    ax
1E56A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1E56F: call    @Write$qm4Text; Write(var f: Text)
1E574: call    @__IOCheck$qv; Exit if error
1E579: xor     ax, ax
1E57B: mov     [bp+var_2], ax
1E57E: cmp     word_27E50, 7
1E583: jnz     short loc_1E5B1
1E585: mov     al, 13h
1E587: push    ax
1E588: mov     al, 0Fh
1E58A: push    ax
1E58B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E590: mov     di, offset unk_2F60A
1E593: push    ds
1E594: push    di
1E595: mov     di, offset aKe; "Ke"
1E598: push    cs
1E599: push    di
1E59A: xor     ax, ax
1E59C: push    ax
1E59D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E5A2: call    @Write$qm4Text; Write(var f: Text)
1E5A7: call    @__IOCheck$qv; Exit if error
1E5AC: mov     [bp+var_2], 1
1E5B1: cmp     word_27E4A, 7
1E5B6: jnz     short loc_1E5E4
1E5B8: mov     al, 10h
1E5BA: push    ax
1E5BB: mov     al, 10h
1E5BD: push    ax
1E5BE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E5C3: mov     di, offset unk_2F60A
1E5C6: push    ds
1E5C7: push    di
1E5C8: mov     di, offset aGu; "Gu"
1E5CB: push    cs
1E5CC: push    di
1E5CD: xor     ax, ax
1E5CF: push    ax
1E5D0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E5D5: call    @Write$qm4Text; Write(var f: Text)
1E5DA: call    @__IOCheck$qv; Exit if error
1E5DF: mov     [bp+var_2], 1
1E5E4: cmp     word_27E42, 7
1E5E9: jnz     short loc_1E617
1E5EB: mov     al, 16h
1E5ED: push    ax
1E5EE: mov     al, 11h
1E5F0: push    ax
1E5F1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E5F6: mov     di, offset unk_2F60A
1E5F9: push    ds
1E5FA: push    di
1E5FB: mov     di, offset aRv; "Rv"
1E5FE: push    cs
1E5FF: push    di
1E600: xor     ax, ax
1E602: push    ax
1E603: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E608: call    @Write$qm4Text; Write(var f: Text)
1E60D: call    @__IOCheck$qv; Exit if error
1E612: mov     [bp+var_2], 1
1E617: cmp     word_27E4C, 7
1E61C: jnz     short loc_1E64A
1E61E: mov     al, 10h
1E620: push    ax
1E621: mov     al, 11h
1E623: push    ax
1E624: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E629: mov     di, offset unk_2F60A
1E62C: push    ds
1E62D: push    di
1E62E: mov     di, offset aSh; "Sh"
1E631: push    cs
1E632: push    di
1E633: xor     ax, ax
1E635: push    ax
1E636: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E63B: call    @Write$qm4Text; Write(var f: Text)
1E640: call    @__IOCheck$qv; Exit if error
1E645: mov     [bp+var_2], 1
1E64A: cmp     word_27E48, 7
1E64F: jnz     short loc_1E67D
1E651: mov     al, 16h
1E653: push    ax
1E654: mov     al, 12h
1E656: push    ax
1E657: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E65C: mov     di, offset unk_2F60A
1E65F: push    ds
1E660: push    di
1E661: mov     di, offset aKu; "Ku"
1E664: push    cs
1E665: push    di
1E666: xor     ax, ax
1E668: push    ax
1E669: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E66E: call    @Write$qm4Text; Write(var f: Text)
1E673: call    @__IOCheck$qv; Exit if error
1E678: mov     [bp+var_2], 1
1E67D: cmp     word_27E44, 7
1E682: jnz     short loc_1E6B0
1E684: mov     al, 16h
1E686: push    ax
1E687: mov     al, 10h
1E689: push    ax
1E68A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E68F: mov     di, offset unk_2F60A
1E692: push    ds
1E693: push    di
1E694: mov     di, offset aBu; "Bu"
1E697: push    cs
1E698: push    di
1E699: xor     ax, ax
1E69B: push    ax
1E69C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E6A1: call    @Write$qm4Text; Write(var f: Text)
1E6A6: call    @__IOCheck$qv; Exit if error
1E6AB: mov     [bp+var_2], 1
1E6B0: cmp     word_27E40, 7
1E6B5: jnz     short loc_1E6E3
1E6B7: mov     al, 16h
1E6B9: push    ax
1E6BA: mov     al, 13h
1E6BC: push    ax
1E6BD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E6C2: mov     di, offset unk_2F60A
1E6C5: push    ds
1E6C6: push    di
1E6C7: mov     di, offset aCh; "Ch"
1E6CA: push    cs
1E6CB: push    di
1E6CC: xor     ax, ax
1E6CE: push    ax
1E6CF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E6D4: call    @Write$qm4Text; Write(var f: Text)
1E6D9: call    @__IOCheck$qv; Exit if error
1E6DE: mov     [bp+var_2], 1
1E6E3: cmp     word_27E46, 7
1E6E8: jnz     short loc_1E716
1E6EA: mov     al, 10h
1E6EC: push    ax
1E6ED: mov     al, 12h
1E6EF: push    ax
1E6F0: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E6F5: mov     di, offset unk_2F60A
1E6F8: push    ds
1E6F9: push    di
1E6FA: mov     di, offset aSi; "Si"
1E6FD: push    cs
1E6FE: push    di
1E6FF: xor     ax, ax
1E701: push    ax
1E702: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E707: call    @Write$qm4Text; Write(var f: Text)
1E70C: call    @__IOCheck$qv; Exit if error
1E711: mov     [bp+var_2], 1
1E716: cmp     word_27E4E, 7
1E71B: jnz     short loc_1E749
1E71D: mov     al, 10h
1E71F: push    ax
1E720: mov     al, 13h
1E722: push    ax
1E723: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E728: mov     di, offset unk_2F60A
1E72B: push    ds
1E72C: push    di
1E72D: mov     di, offset aRa; "Ra"
1E730: push    cs
1E731: push    di
1E732: xor     ax, ax
1E734: push    ax
1E735: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E73A: call    @Write$qm4Text; Write(var f: Text)
1E73F: call    @__IOCheck$qv; Exit if error
1E744: mov     [bp+var_2], 1
1E749: cmp     [bp+var_2], 1
1E74D: jz      short loc_1E774
1E74F: mov     al, 14h
1E751: push    ax
1E752: mov     al, 12h
1E754: push    ax
1E755: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E75A: mov     di, offset unk_2F60A
1E75D: push    ds
1E75E: push    di
1E75F: mov     al, 37h ; '7'
1E761: push    ax
1E762: xor     ax, ax
1E764: push    ax
1E765: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1E76A: call    @Write$qm4Text; Write(var f: Text)
1E76F: call    @__IOCheck$qv; Exit if error
1E774: xor     ax, ax
1E776: mov     [bp+var_2], ax
1E779: cmp     word_27E50, 8
1E77E: jnz     short loc_1E7AC
1E780: mov     al, 1Bh
1E782: push    ax
1E783: mov     al, 10h
1E785: push    ax
1E786: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E78B: mov     di, offset unk_2F60A
1E78E: push    ds
1E78F: push    di
1E790: mov     di, offset aKe; "Ke"
1E793: push    cs
1E794: push    di
1E795: xor     ax, ax
1E797: push    ax
1E798: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E79D: call    @Write$qm4Text; Write(var f: Text)
1E7A2: call    @__IOCheck$qv; Exit if error
1E7A7: mov     [bp+var_2], 1
1E7AC: cmp     word_27E4A, 8
1E7B1: jnz     short loc_1E7DF
1E7B3: mov     al, 1Bh
1E7B5: push    ax
1E7B6: mov     al, 11h
1E7B8: push    ax
1E7B9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E7BE: mov     di, offset unk_2F60A
1E7C1: push    ds
1E7C2: push    di
1E7C3: mov     di, offset aGu; "Gu"
1E7C6: push    cs
1E7C7: push    di
1E7C8: xor     ax, ax
1E7CA: push    ax
1E7CB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E7D0: call    @Write$qm4Text; Write(var f: Text)
1E7D5: call    @__IOCheck$qv; Exit if error
1E7DA: mov     [bp+var_2], 1
1E7DF: cmp     word_27E42, 8
1E7E4: jnz     short loc_1E812
1E7E6: mov     al, 1Eh
1E7E8: push    ax
1E7E9: mov     al, 13h
1E7EB: push    ax
1E7EC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E7F1: mov     di, offset unk_2F60A
1E7F4: push    ds
1E7F5: push    di
1E7F6: mov     di, offset aRv; "Rv"
1E7F9: push    cs
1E7FA: push    di
1E7FB: xor     ax, ax
1E7FD: push    ax
1E7FE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E803: call    @Write$qm4Text; Write(var f: Text)
1E808: call    @__IOCheck$qv; Exit if error
1E80D: mov     [bp+var_2], 1
1E812: cmp     word_27E4C, 8
1E817: jnz     short loc_1E845
1E819: mov     al, 22h ; '"'
1E81B: push    ax
1E81C: mov     al, 13h
1E81E: push    ax
1E81F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E824: mov     di, offset unk_2F60A
1E827: push    ds
1E828: push    di
1E829: mov     di, offset aSh; "Sh"
1E82C: push    cs
1E82D: push    di
1E82E: xor     ax, ax
1E830: push    ax
1E831: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E836: call    @Write$qm4Text; Write(var f: Text)
1E83B: call    @__IOCheck$qv; Exit if error
1E840: mov     [bp+var_2], 1
1E845: cmp     word_27E48, 8
1E84A: jnz     short loc_1E878
1E84C: mov     al, 23h ; '#'
1E84E: push    ax
1E84F: mov     al, 14h
1E851: push    ax
1E852: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E857: mov     di, offset unk_2F60A
1E85A: push    ds
1E85B: push    di
1E85C: mov     di, offset aKu; "Ku"
1E85F: push    cs
1E860: push    di
1E861: xor     ax, ax
1E863: push    ax
1E864: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E869: call    @Write$qm4Text; Write(var f: Text)
1E86E: call    @__IOCheck$qv; Exit if error
1E873: mov     [bp+var_2], 1
1E878: cmp     word_27E44, 8
1E87D: jnz     short loc_1E8AB
1E87F: mov     al, 1Bh
1E881: push    ax
1E882: mov     al, 13h
1E884: push    ax
1E885: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E88A: mov     di, offset unk_2F60A
1E88D: push    ds
1E88E: push    di
1E88F: mov     di, offset aBu; "Bu"
1E892: push    cs
1E893: push    di
1E894: xor     ax, ax
1E896: push    ax
1E897: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E89C: call    @Write$qm4Text; Write(var f: Text)
1E8A1: call    @__IOCheck$qv; Exit if error
1E8A6: mov     [bp+var_2], 1
1E8AB: cmp     word_27E40, 8
1E8B0: jnz     short loc_1E8DE
1E8B2: mov     al, 1Bh
1E8B4: push    ax
1E8B5: mov     al, 14h
1E8B7: push    ax
1E8B8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E8BD: mov     di, offset unk_2F60A
1E8C0: push    ds
1E8C1: push    di
1E8C2: mov     di, offset aCh; "Ch"
1E8C5: push    cs
1E8C6: push    di
1E8C7: xor     ax, ax
1E8C9: push    ax
1E8CA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E8CF: call    @Write$qm4Text; Write(var f: Text)
1E8D4: call    @__IOCheck$qv; Exit if error
1E8D9: mov     [bp+var_2], 1
1E8DE: cmp     word_27E46, 8
1E8E3: jnz     short loc_1E911
1E8E5: mov     al, 1Bh
1E8E7: push    ax
1E8E8: mov     al, 12h
1E8EA: push    ax
1E8EB: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E8F0: mov     di, offset unk_2F60A
1E8F3: push    ds
1E8F4: push    di
1E8F5: mov     di, offset aSi; "Si"
1E8F8: push    cs
1E8F9: push    di
1E8FA: xor     ax, ax
1E8FC: push    ax
1E8FD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E902: call    @Write$qm4Text; Write(var f: Text)
1E907: call    @__IOCheck$qv; Exit if error
1E90C: mov     [bp+var_2], 1
1E911: cmp     word_27E4E, 8
1E916: jnz     short loc_1E944
1E918: mov     al, 1Fh
1E91A: push    ax
1E91B: mov     al, 14h
1E91D: push    ax
1E91E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E923: mov     di, offset unk_2F60A
1E926: push    ds
1E927: push    di
1E928: mov     di, offset aRa; "Ra"
1E92B: push    cs
1E92C: push    di
1E92D: xor     ax, ax
1E92F: push    ax
1E930: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E935: call    @Write$qm4Text; Write(var f: Text)
1E93A: call    @__IOCheck$qv; Exit if error
1E93F: mov     [bp+var_2], 1
1E944: cmp     [bp+var_2], 1
1E948: jz      short loc_1E96F
1E94A: mov     al, 1Fh
1E94C: push    ax
1E94D: mov     al, 13h
1E94F: push    ax
1E950: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E955: mov     di, offset unk_2F60A
1E958: push    ds
1E959: push    di
1E95A: mov     al, 38h ; '8'
1E95C: push    ax
1E95D: xor     ax, ax
1E95F: push    ax
1E960: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1E965: call    @Write$qm4Text; Write(var f: Text)
1E96A: call    @__IOCheck$qv; Exit if error
1E96F: xor     ax, ax
1E971: mov     [bp+var_2], ax
1E974: cmp     word_27E50, 9
1E979: jnz     short loc_1E9A7
1E97B: mov     al, 25h ; '%'
1E97D: push    ax
1E97E: mov     al, 0Fh
1E980: push    ax
1E981: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E986: mov     di, offset unk_2F60A
1E989: push    ds
1E98A: push    di
1E98B: mov     di, offset aKe; "Ke"
1E98E: push    cs
1E98F: push    di
1E990: xor     ax, ax
1E992: push    ax
1E993: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E998: call    @Write$qm4Text; Write(var f: Text)
1E99D: call    @__IOCheck$qv; Exit if error
1E9A2: mov     [bp+var_2], 1
1E9A7: cmp     word_27E4A, 9
1E9AC: jnz     short loc_1E9DA
1E9AE: mov     al, 1Fh
1E9B0: push    ax
1E9B1: mov     al, 10h
1E9B3: push    ax
1E9B4: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E9B9: mov     di, offset unk_2F60A
1E9BC: push    ds
1E9BD: push    di
1E9BE: mov     di, offset aGu; "Gu"
1E9C1: push    cs
1E9C2: push    di
1E9C3: xor     ax, ax
1E9C5: push    ax
1E9C6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E9CB: call    @Write$qm4Text; Write(var f: Text)
1E9D0: call    @__IOCheck$qv; Exit if error
1E9D5: mov     [bp+var_2], 1
1E9DA: cmp     word_27E42, 9
1E9DF: jnz     short loc_1EA0D
1E9E1: mov     al, 22h ; '"'
1E9E3: push    ax
1E9E4: mov     al, 10h
1E9E6: push    ax
1E9E7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1E9EC: mov     di, offset unk_2F60A
1E9EF: push    ds
1E9F0: push    di
1E9F1: mov     di, offset aRv; "Rv"
1E9F4: push    cs
1E9F5: push    di
1E9F6: xor     ax, ax
1E9F8: push    ax
1E9F9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1E9FE: call    @Write$qm4Text; Write(var f: Text)
1EA03: call    @__IOCheck$qv; Exit if error
1EA08: mov     [bp+var_2], 1
1EA0D: cmp     word_27E4C, 9
1EA12: jnz     short loc_1EA40
1EA14: mov     al, 26h ; '&'
1EA16: push    ax
1EA17: mov     al, 10h
1EA19: push    ax
1EA1A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EA1F: mov     di, offset unk_2F60A
1EA22: push    ds
1EA23: push    di
1EA24: mov     di, offset aSh; "Sh"
1EA27: push    cs
1EA28: push    di
1EA29: xor     ax, ax
1EA2B: push    ax
1EA2C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EA31: call    @Write$qm4Text; Write(var f: Text)
1EA36: call    @__IOCheck$qv; Exit if error
1EA3B: mov     [bp+var_2], 1
1EA40: cmp     word_27E48, 9
1EA45: jnz     short loc_1EA73
1EA47: mov     al, 22h ; '"'
1EA49: push    ax
1EA4A: mov     al, 11h
1EA4C: push    ax
1EA4D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EA52: mov     di, offset unk_2F60A
1EA55: push    ds
1EA56: push    di
1EA57: mov     di, offset aKu; "Ku"
1EA5A: push    cs
1EA5B: push    di
1EA5C: xor     ax, ax
1EA5E: push    ax
1EA5F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EA64: call    @Write$qm4Text; Write(var f: Text)
1EA69: call    @__IOCheck$qv; Exit if error
1EA6E: mov     [bp+var_2], 1
1EA73: cmp     word_27E44, 9
1EA78: jnz     short loc_1EAA6
1EA7A: mov     al, 26h ; '&'
1EA7C: push    ax
1EA7D: mov     al, 11h
1EA7F: push    ax
1EA80: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EA85: mov     di, offset unk_2F60A
1EA88: push    ds
1EA89: push    di
1EA8A: mov     di, offset aBu; "Bu"
1EA8D: push    cs
1EA8E: push    di
1EA8F: xor     ax, ax
1EA91: push    ax
1EA92: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EA97: call    @Write$qm4Text; Write(var f: Text)
1EA9C: call    @__IOCheck$qv; Exit if error
1EAA1: mov     [bp+var_2], 1
1EAA6: cmp     word_27E40, 9
1EAAB: jnz     short loc_1EAD9
1EAAD: mov     al, 25h ; '%'
1EAAF: push    ax
1EAB0: mov     al, 13h
1EAB2: push    ax
1EAB3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EAB8: mov     di, offset unk_2F60A
1EABB: push    ds
1EABC: push    di
1EABD: mov     di, offset aCh; "Ch"
1EAC0: push    cs
1EAC1: push    di
1EAC2: xor     ax, ax
1EAC4: push    ax
1EAC5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EACA: call    @Write$qm4Text; Write(var f: Text)
1EACF: call    @__IOCheck$qv; Exit if error
1EAD4: mov     [bp+var_2], 1
1EAD9: cmp     word_27E46, 9
1EADE: jnz     short loc_1EB0C
1EAE0: mov     al, 23h ; '#'
1EAE2: push    ax
1EAE3: mov     al, 12h
1EAE5: push    ax
1EAE6: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EAEB: mov     di, offset unk_2F60A
1EAEE: push    ds
1EAEF: push    di
1EAF0: mov     di, offset aSi; "Si"
1EAF3: push    cs
1EAF4: push    di
1EAF5: xor     ax, ax
1EAF7: push    ax
1EAF8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EAFD: call    @Write$qm4Text; Write(var f: Text)
1EB02: call    @__IOCheck$qv; Exit if error
1EB07: mov     [bp+var_2], 1
1EB0C: cmp     word_27E4E, 9
1EB11: jnz     short loc_1EB3F
1EB13: mov     al, 26h ; '&'
1EB15: push    ax
1EB16: mov     al, 12h
1EB18: push    ax
1EB19: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EB1E: mov     di, offset unk_2F60A
1EB21: push    ds
1EB22: push    di
1EB23: mov     di, offset aRa; "Ra"
1EB26: push    cs
1EB27: push    di
1EB28: xor     ax, ax
1EB2A: push    ax
1EB2B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EB30: call    @Write$qm4Text; Write(var f: Text)
1EB35: call    @__IOCheck$qv; Exit if error
1EB3A: mov     [bp+var_2], 1
1EB3F: cmp     [bp+var_2], 1
1EB43: jz      short loc_1EB6A
1EB45: mov     al, 23h ; '#'
1EB47: push    ax
1EB48: mov     al, 11h
1EB4A: push    ax
1EB4B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EB50: mov     di, offset unk_2F60A
1EB53: push    ds
1EB54: push    di
1EB55: mov     al, 39h ; '9'
1EB57: push    ax
1EB58: xor     ax, ax
1EB5A: push    ax
1EB5B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1EB60: call    @Write$qm4Text; Write(var f: Text)
1EB65: call    @__IOCheck$qv; Exit if error
1EB6A: xor     ax, ax
1EB6C: mov     [bp+var_2], ax
1EB6F: cmp     word_27E50, 0Ah
1EB74: jnz     short loc_1EBA2
1EB76: mov     al, 1Ch
1EB78: push    ax
1EB79: mov     al, 9
1EB7B: push    ax
1EB7C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EB81: mov     di, offset unk_2F60A
1EB84: push    ds
1EB85: push    di
1EB86: mov     di, offset aKe; "Ke"
1EB89: push    cs
1EB8A: push    di
1EB8B: xor     ax, ax
1EB8D: push    ax
1EB8E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EB93: call    @Write$qm4Text; Write(var f: Text)
1EB98: call    @__IOCheck$qv; Exit if error
1EB9D: mov     [bp+var_2], 1
1EBA2: cmp     word_27E4A, 0Ah
1EBA7: jnz     short loc_1EBD5
1EBA9: mov     al, 1Ch
1EBAB: push    ax
1EBAC: mov     al, 0Dh
1EBAE: push    ax
1EBAF: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EBB4: mov     di, offset unk_2F60A
1EBB7: push    ds
1EBB8: push    di
1EBB9: mov     di, offset aGu; "Gu"
1EBBC: push    cs
1EBBD: push    di
1EBBE: xor     ax, ax
1EBC0: push    ax
1EBC1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EBC6: call    @Write$qm4Text; Write(var f: Text)
1EBCB: call    @__IOCheck$qv; Exit if error
1EBD0: mov     [bp+var_2], 1
1EBD5: cmp     word_27E42, 0Ah
1EBDA: jnz     short loc_1EC08
1EBDC: mov     al, 1Ch
1EBDE: push    ax
1EBDF: mov     al, 0Ah
1EBE1: push    ax
1EBE2: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EBE7: mov     di, offset unk_2F60A
1EBEA: push    ds
1EBEB: push    di
1EBEC: mov     di, offset aRv; "Rv"
1EBEF: push    cs
1EBF0: push    di
1EBF1: xor     ax, ax
1EBF3: push    ax
1EBF4: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EBF9: call    @Write$qm4Text; Write(var f: Text)
1EBFE: call    @__IOCheck$qv; Exit if error
1EC03: mov     [bp+var_2], 1
1EC08: cmp     word_27E4C, 0Ah
1EC0D: jnz     short loc_1EC3B
1EC0F: mov     al, 21h ; '!'
1EC11: push    ax
1EC12: mov     al, 0Dh
1EC14: push    ax
1EC15: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EC1A: mov     di, offset unk_2F60A
1EC1D: push    ds
1EC1E: push    di
1EC1F: mov     di, offset aSh; "Sh"
1EC22: push    cs
1EC23: push    di
1EC24: xor     ax, ax
1EC26: push    ax
1EC27: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EC2C: call    @Write$qm4Text; Write(var f: Text)
1EC31: call    @__IOCheck$qv; Exit if error
1EC36: mov     [bp+var_2], 1
1EC3B: cmp     word_27E48, 0Ah
1EC40: jnz     short loc_1EC6E
1EC42: mov     al, 21h ; '!'
1EC44: push    ax
1EC45: mov     al, 0Ch
1EC47: push    ax
1EC48: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EC4D: mov     di, offset unk_2F60A
1EC50: push    ds
1EC51: push    di
1EC52: mov     di, offset aKu; "Ku"
1EC55: push    cs
1EC56: push    di
1EC57: xor     ax, ax
1EC59: push    ax
1EC5A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EC5F: call    @Write$qm4Text; Write(var f: Text)
1EC64: call    @__IOCheck$qv; Exit if error
1EC69: mov     [bp+var_2], 1
1EC6E: cmp     word_27E44, 0Ah
1EC73: jnz     short loc_1ECA1
1EC75: mov     al, 1Ch
1EC77: push    ax
1EC78: mov     al, 0Ch
1EC7A: push    ax
1EC7B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EC80: mov     di, offset unk_2F60A
1EC83: push    ds
1EC84: push    di
1EC85: mov     di, offset aBu; "Bu"
1EC88: push    cs
1EC89: push    di
1EC8A: xor     ax, ax
1EC8C: push    ax
1EC8D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EC92: call    @Write$qm4Text; Write(var f: Text)
1EC97: call    @__IOCheck$qv; Exit if error
1EC9C: mov     [bp+var_2], 1
1ECA1: cmp     word_27E40, 0Ah
1ECA6: jnz     short loc_1ECD4
1ECA8: mov     al, 21h ; '!'
1ECAA: push    ax
1ECAB: mov     al, 0Bh
1ECAD: push    ax
1ECAE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1ECB3: mov     di, offset unk_2F60A
1ECB6: push    ds
1ECB7: push    di
1ECB8: mov     di, offset aCh; "Ch"
1ECBB: push    cs
1ECBC: push    di
1ECBD: xor     ax, ax
1ECBF: push    ax
1ECC0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ECC5: call    @Write$qm4Text; Write(var f: Text)
1ECCA: call    @__IOCheck$qv; Exit if error
1ECCF: mov     [bp+var_2], 1
1ECD4: cmp     word_27E46, 0Ah
1ECD9: jnz     short loc_1ED07
1ECDB: mov     al, 21h ; '!'
1ECDD: push    ax
1ECDE: mov     al, 0Ah
1ECE0: push    ax
1ECE1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1ECE6: mov     di, offset unk_2F60A
1ECE9: push    ds
1ECEA: push    di
1ECEB: mov     di, offset aSi; "Si"
1ECEE: push    cs
1ECEF: push    di
1ECF0: xor     ax, ax
1ECF2: push    ax
1ECF3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ECF8: call    @Write$qm4Text; Write(var f: Text)
1ECFD: call    @__IOCheck$qv; Exit if error
1ED02: mov     [bp+var_2], 1
1ED07: cmp     word_27E4E, 0Ah
1ED0C: jnz     short loc_1ED3A
1ED0E: mov     al, 1Ch
1ED10: push    ax
1ED11: mov     al, 0Bh
1ED13: push    ax
1ED14: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1ED19: mov     di, offset unk_2F60A
1ED1C: push    ds
1ED1D: push    di
1ED1E: mov     di, offset aRa; "Ra"
1ED21: push    cs
1ED22: push    di
1ED23: xor     ax, ax
1ED25: push    ax
1ED26: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ED2B: call    @Write$qm4Text; Write(var f: Text)
1ED30: call    @__IOCheck$qv; Exit if error
1ED35: mov     [bp+var_2], 1
1ED3A: cmp     [bp+var_2], 1
1ED3E: jz      short loc_1ED67
1ED40: mov     al, 21h ; '!'
1ED42: push    ax
1ED43: mov     al, 0Bh
1ED45: push    ax
1ED46: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1ED4B: mov     di, offset unk_2F60A
1ED4E: push    ds
1ED4F: push    di
1ED50: mov     di, offset a10; "10"
1ED53: push    cs
1ED54: push    di
1ED55: xor     ax, ax
1ED57: push    ax
1ED58: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ED5D: call    @Write$qm4Text; Write(var f: Text)
1ED62: call    @__IOCheck$qv; Exit if error
1ED67: xor     ax, ax
1ED69: mov     [bp+var_2], ax
1ED6C: cmp     word_27E50, 0Bh
1ED71: jnz     short loc_1ED9F
1ED73: mov     al, 24h ; '$'
1ED75: push    ax
1ED76: mov     al, 4
1ED78: push    ax
1ED79: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1ED7E: mov     di, offset unk_2F60A
1ED81: push    ds
1ED82: push    di
1ED83: mov     di, offset aKe; "Ke"
1ED86: push    cs
1ED87: push    di
1ED88: xor     ax, ax
1ED8A: push    ax
1ED8B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1ED90: call    @Write$qm4Text; Write(var f: Text)
1ED95: call    @__IOCheck$qv; Exit if error
1ED9A: mov     [bp+var_2], 1
1ED9F: cmp     word_27E4A, 0Bh
1EDA4: jnz     short loc_1EDD2
1EDA6: mov     al, 25h ; '%'
1EDA8: push    ax
1EDA9: mov     al, 3
1EDAB: push    ax
1EDAC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EDB1: mov     di, offset unk_2F60A
1EDB4: push    ds
1EDB5: push    di
1EDB6: mov     di, offset aGu; "Gu"
1EDB9: push    cs
1EDBA: push    di
1EDBB: xor     ax, ax
1EDBD: push    ax
1EDBE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EDC3: call    @Write$qm4Text; Write(var f: Text)
1EDC8: call    @__IOCheck$qv; Exit if error
1EDCD: mov     [bp+var_2], 1
1EDD2: cmp     word_27E42, 0Bh
1EDD7: jnz     short loc_1EE05
1EDD9: mov     al, 21h ; '!'
1EDDB: push    ax
1EDDC: mov     al, 5
1EDDE: push    ax
1EDDF: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EDE4: mov     di, offset unk_2F60A
1EDE7: push    ds
1EDE8: push    di
1EDE9: mov     di, offset aRv; "Rv"
1EDEC: push    cs
1EDED: push    di
1EDEE: xor     ax, ax
1EDF0: push    ax
1EDF1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EDF6: call    @Write$qm4Text; Write(var f: Text)
1EDFB: call    @__IOCheck$qv; Exit if error
1EE00: mov     [bp+var_2], 1
1EE05: cmp     word_27E4C, 0Bh
1EE0A: jnz     short loc_1EE38
1EE0C: mov     al, 25h ; '%'
1EE0E: push    ax
1EE0F: mov     al, 5
1EE11: push    ax
1EE12: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EE17: mov     di, offset unk_2F60A
1EE1A: push    ds
1EE1B: push    di
1EE1C: mov     di, offset aSh; "Sh"
1EE1F: push    cs
1EE20: push    di
1EE21: xor     ax, ax
1EE23: push    ax
1EE24: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EE29: call    @Write$qm4Text; Write(var f: Text)
1EE2E: call    @__IOCheck$qv; Exit if error
1EE33: mov     [bp+var_2], 1
1EE38: cmp     word_27E48, 0Bh
1EE3D: jnz     short loc_1EE6B
1EE3F: mov     al, 20h ; ' '
1EE41: push    ax
1EE42: mov     al, 6
1EE44: push    ax
1EE45: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EE4A: mov     di, offset unk_2F60A
1EE4D: push    ds
1EE4E: push    di
1EE4F: mov     di, offset aKu; "Ku"
1EE52: push    cs
1EE53: push    di
1EE54: xor     ax, ax
1EE56: push    ax
1EE57: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EE5C: call    @Write$qm4Text; Write(var f: Text)
1EE61: call    @__IOCheck$qv; Exit if error
1EE66: mov     [bp+var_2], 1
1EE6B: cmp     word_27E44, 0Bh
1EE70: jnz     short loc_1EE9E
1EE72: mov     al, 1Dh
1EE74: push    ax
1EE75: mov     al, 7
1EE77: push    ax
1EE78: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EE7D: mov     di, offset unk_2F60A
1EE80: push    ds
1EE81: push    di
1EE82: mov     di, offset aBu; "Bu"
1EE85: push    cs
1EE86: push    di
1EE87: xor     ax, ax
1EE89: push    ax
1EE8A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EE8F: call    @Write$qm4Text; Write(var f: Text)
1EE94: call    @__IOCheck$qv; Exit if error
1EE99: mov     [bp+var_2], 1
1EE9E: cmp     word_27E40, 0Bh
1EEA3: jnz     short loc_1EED1
1EEA5: mov     al, 21h ; '!'
1EEA7: push    ax
1EEA8: mov     al, 7
1EEAA: push    ax
1EEAB: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EEB0: mov     di, offset unk_2F60A
1EEB3: push    ds
1EEB4: push    di
1EEB5: mov     di, offset aCh; "Ch"
1EEB8: push    cs
1EEB9: push    di
1EEBA: xor     ax, ax
1EEBC: push    ax
1EEBD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EEC2: call    @Write$qm4Text; Write(var f: Text)
1EEC7: call    @__IOCheck$qv; Exit if error
1EECC: mov     [bp+var_2], 1
1EED1: cmp     word_27E46, 0Bh
1EED6: jnz     short loc_1EF04
1EED8: mov     al, 25h ; '%'
1EEDA: push    ax
1EEDB: mov     al, 7
1EEDD: push    ax
1EEDE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EEE3: mov     di, offset unk_2F60A
1EEE6: push    ds
1EEE7: push    di
1EEE8: mov     di, offset aSi; "Si"
1EEEB: push    cs
1EEEC: push    di
1EEED: xor     ax, ax
1EEEF: push    ax
1EEF0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EEF5: call    @Write$qm4Text; Write(var f: Text)
1EEFA: call    @__IOCheck$qv; Exit if error
1EEFF: mov     [bp+var_2], 1
1EF04: cmp     word_27E4E, 0Bh
1EF09: jnz     short loc_1EF37
1EF0B: mov     al, 24h ; '$'
1EF0D: push    ax
1EF0E: mov     al, 6
1EF10: push    ax
1EF11: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EF16: mov     di, offset unk_2F60A
1EF19: push    ds
1EF1A: push    di
1EF1B: mov     di, offset aRa; "Ra"
1EF1E: push    cs
1EF1F: push    di
1EF20: xor     ax, ax
1EF22: push    ax
1EF23: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EF28: call    @Write$qm4Text; Write(var f: Text)
1EF2D: call    @__IOCheck$qv; Exit if error
1EF32: mov     [bp+var_2], 1
1EF37: cmp     [bp+var_2], 1
1EF3B: jz      short loc_1EF64
1EF3D: mov     al, 22h ; '"'
1EF3F: push    ax
1EF40: mov     al, 6
1EF42: push    ax
1EF43: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EF48: mov     di, offset unk_2F60A
1EF4B: push    ds
1EF4C: push    di
1EF4D: mov     di, offset a11; "11"
1EF50: push    cs
1EF51: push    di
1EF52: xor     ax, ax
1EF54: push    ax
1EF55: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EF5A: call    @Write$qm4Text; Write(var f: Text)
1EF5F: call    @__IOCheck$qv; Exit if error
1EF64: xor     ax, ax
1EF66: mov     [bp+var_2], ax
1EF69: cmp     word_27E50, 0Ch
1EF6E: jnz     short loc_1EF9C
1EF70: mov     al, 1Fh
1EF72: push    ax
1EF73: mov     al, 2
1EF75: push    ax
1EF76: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EF7B: mov     di, offset unk_2F60A
1EF7E: push    ds
1EF7F: push    di
1EF80: mov     di, offset aKe; "Ke"
1EF83: push    cs
1EF84: push    di
1EF85: xor     ax, ax
1EF87: push    ax
1EF88: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EF8D: call    @Write$qm4Text; Write(var f: Text)
1EF92: call    @__IOCheck$qv; Exit if error
1EF97: mov     [bp+var_2], 1
1EF9C: cmp     word_27E4A, 0Ch
1EFA1: jnz     short loc_1EFCF
1EFA3: mov     al, 1Bh
1EFA5: push    ax
1EFA6: mov     al, 2
1EFA8: push    ax
1EFA9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EFAE: mov     di, offset unk_2F60A
1EFB1: push    ds
1EFB2: push    di
1EFB3: mov     di, offset aGu; "Gu"
1EFB6: push    cs
1EFB7: push    di
1EFB8: xor     ax, ax
1EFBA: push    ax
1EFBB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EFC0: call    @Write$qm4Text; Write(var f: Text)
1EFC5: call    @__IOCheck$qv; Exit if error
1EFCA: mov     [bp+var_2], 1
1EFCF: cmp     word_27E42, 0Ch
1EFD4: jnz     short loc_1F002
1EFD6: mov     al, 23h ; '#'
1EFD8: push    ax
1EFD9: mov     al, 2
1EFDB: push    ax
1EFDC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1EFE1: mov     di, offset unk_2F60A
1EFE4: push    ds
1EFE5: push    di
1EFE6: mov     di, offset aRv; "Rv"
1EFE9: push    cs
1EFEA: push    di
1EFEB: xor     ax, ax
1EFED: push    ax
1EFEE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1EFF3: call    @Write$qm4Text; Write(var f: Text)
1EFF8: call    @__IOCheck$qv; Exit if error
1EFFD: mov     [bp+var_2], 1
1F002: cmp     word_27E4C, 0Ch
1F007: jnz     short loc_1F035
1F009: mov     al, 1Bh
1F00B: push    ax
1F00C: mov     al, 3
1F00E: push    ax
1F00F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F014: mov     di, offset unk_2F60A
1F017: push    ds
1F018: push    di
1F019: mov     di, offset aSh; "Sh"
1F01C: push    cs
1F01D: push    di
1F01E: xor     ax, ax
1F020: push    ax
1F021: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F026: call    @Write$qm4Text; Write(var f: Text)
1F02B: call    @__IOCheck$qv; Exit if error
1F030: mov     [bp+var_2], 1
1F035: cmp     word_27E48, 0Ch
1F03A: jnz     short loc_1F068
1F03C: mov     al, 20h ; ' '
1F03E: push    ax
1F03F: mov     al, 3
1F041: push    ax
1F042: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F047: mov     di, offset unk_2F60A
1F04A: push    ds
1F04B: push    di
1F04C: mov     di, offset aKu; "Ku"
1F04F: push    cs
1F050: push    di
1F051: xor     ax, ax
1F053: push    ax
1F054: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F059: call    @Write$qm4Text; Write(var f: Text)
1F05E: call    @__IOCheck$qv; Exit if error
1F063: mov     [bp+var_2], 1
1F068: cmp     word_27E44, 0Ch
1F06D: jnz     short loc_1F09B
1F06F: mov     al, 1Fh
1F071: push    ax
1F072: mov     al, 4
1F074: push    ax
1F075: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F07A: mov     di, offset unk_2F60A
1F07D: push    ds
1F07E: push    di
1F07F: mov     di, offset aBu; "Bu"
1F082: push    cs
1F083: push    di
1F084: xor     ax, ax
1F086: push    ax
1F087: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F08C: call    @Write$qm4Text; Write(var f: Text)
1F091: call    @__IOCheck$qv; Exit if error
1F096: mov     [bp+var_2], 1
1F09B: cmp     word_27E40, 0Ch
1F0A0: jnz     short loc_1F0CE
1F0A2: mov     al, 1Ch
1F0A4: push    ax
1F0A5: mov     al, 5
1F0A7: push    ax
1F0A8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F0AD: mov     di, offset unk_2F60A
1F0B0: push    ds
1F0B1: push    di
1F0B2: mov     di, offset aCh; "Ch"
1F0B5: push    cs
1F0B6: push    di
1F0B7: xor     ax, ax
1F0B9: push    ax
1F0BA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F0BF: call    @Write$qm4Text; Write(var f: Text)
1F0C4: call    @__IOCheck$qv; Exit if error
1F0C9: mov     [bp+var_2], 1
1F0CE: cmp     word_27E46, 0Ch
1F0D3: jnz     short loc_1F101
1F0D5: mov     al, 1Bh
1F0D7: push    ax
1F0D8: mov     al, 4
1F0DA: push    ax
1F0DB: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F0E0: mov     di, offset unk_2F60A
1F0E3: push    ds
1F0E4: push    di
1F0E5: mov     di, offset aSi; "Si"
1F0E8: push    cs
1F0E9: push    di
1F0EA: xor     ax, ax
1F0EC: push    ax
1F0ED: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F0F2: call    @Write$qm4Text; Write(var f: Text)
1F0F7: call    @__IOCheck$qv; Exit if error
1F0FC: mov     [bp+var_2], 1
1F101: cmp     word_27E4E, 0Ch
1F106: jnz     short loc_1F134
1F108: mov     al, 1Bh
1F10A: push    ax
1F10B: mov     al, 6
1F10D: push    ax
1F10E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F113: mov     di, offset unk_2F60A
1F116: push    ds
1F117: push    di
1F118: mov     di, offset aRa; "Ra"
1F11B: push    cs
1F11C: push    di
1F11D: xor     ax, ax
1F11F: push    ax
1F120: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F125: call    @Write$qm4Text; Write(var f: Text)
1F12A: call    @__IOCheck$qv; Exit if error
1F12F: mov     [bp+var_2], 1
1F134: cmp     [bp+var_2], 1
1F138: jz      short loc_1F161
1F13A: mov     al, 1Ch
1F13C: push    ax
1F13D: mov     al, 3
1F13F: push    ax
1F140: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F145: mov     di, offset unk_2F60A
1F148: push    ds
1F149: push    di
1F14A: mov     di, offset a12; "12"
1F14D: push    cs
1F14E: push    di
1F14F: xor     ax, ax
1F151: push    ax
1F152: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F157: call    @Write$qm4Text; Write(var f: Text)
1F15C: call    @__IOCheck$qv; Exit if error
1F161: xor     ax, ax
1F163: mov     [bp+var_2], ax
1F166: mov     al, 10h
1F168: push    ax
1F169: mov     al, 0Ch
1F16B: push    ax
1F16C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F171: mov     di, offset unk_2F60A
1F174: push    ds
1F175: push    di
1F176: mov     di, offset unk_2B018
1F179: push    ds
1F17A: push    di
1F17B: xor     ax, ax
1F17D: push    ax
1F17E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F183: call    @Write$qm4Text; Write(var f: Text)
1F188: call    @__IOCheck$qv; Exit if error
1F18D: mov     al, 10h
1F18F: push    ax
1F190: mov     al, 0Bh
1F192: push    ax
1F193: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F198: mov     di, offset unk_2F60A
1F19B: push    ds
1F19C: push    di
1F19D: mov     di, offset unk_28F18
1F1A0: push    ds
1F1A1: push    di
1F1A2: xor     ax, ax
1F1A4: push    ax
1F1A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F1AA: call    @Write$qm4Text; Write(var f: Text)
1F1AF: call    @__IOCheck$qv; Exit if error
1F1B4: mov     word_27E72, 27h ; '''
1F1BA: xor     ax, ax
1F1BC: mov     [bp+var_2], ax
1F1BF: cmp     word_27E6A, 1
1F1C4: jnz     short loc_1F1FF
1F1C6: mov     ax, word_27E72
1F1C9: add     ax, 10h
1F1CC: cwd
1F1CD: mov     di, 1371h
1F1D0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F1D5: push    ax
1F1D6: mov     al, 7
1F1D8: push    ax
1F1D9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F1DE: mov     di, offset unk_2F60A
1F1E1: push    ds
1F1E2: push    di
1F1E3: mov     di, offset aKe; "Ke"
1F1E6: push    cs
1F1E7: push    di
1F1E8: xor     ax, ax
1F1EA: push    ax
1F1EB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F1F0: call    @Write$qm4Text; Write(var f: Text)
1F1F5: call    @__IOCheck$qv; Exit if error
1F1FA: mov     [bp+var_2], 1
1F1FF: cmp     word_27E64, 1
1F204: jnz     short loc_1F23F
1F206: mov     ax, word_27E72
1F209: add     ax, 16h
1F20C: cwd
1F20D: mov     di, 1371h
1F210: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F215: push    ax
1F216: mov     al, 3
1F218: push    ax
1F219: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F21E: mov     di, offset unk_2F60A
1F221: push    ds
1F222: push    di
1F223: mov     di, offset aGu; "Gu"
1F226: push    cs
1F227: push    di
1F228: xor     ax, ax
1F22A: push    ax
1F22B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F230: call    @Write$qm4Text; Write(var f: Text)
1F235: call    @__IOCheck$qv; Exit if error
1F23A: mov     [bp+var_2], 1
1F23F: cmp     word_27E5C, 1
1F244: jnz     short loc_1F27F
1F246: mov     ax, word_27E72
1F249: add     ax, 16h
1F24C: cwd
1F24D: mov     di, 1371h
1F250: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F255: push    ax
1F256: mov     al, 4
1F258: push    ax
1F259: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F25E: mov     di, offset unk_2F60A
1F261: push    ds
1F262: push    di
1F263: mov     di, offset aRv; "Rv"
1F266: push    cs
1F267: push    di
1F268: xor     ax, ax
1F26A: push    ax
1F26B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F270: call    @Write$qm4Text; Write(var f: Text)
1F275: call    @__IOCheck$qv; Exit if error
1F27A: mov     [bp+var_2], 1
1F27F: cmp     word_27E66, 1
1F284: jnz     short loc_1F2BF
1F286: mov     ax, word_27E72
1F289: add     ax, 10h
1F28C: cwd
1F28D: mov     di, 1371h
1F290: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F295: push    ax
1F296: mov     al, 4
1F298: push    ax
1F299: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F29E: mov     di, offset unk_2F60A
1F2A1: push    ds
1F2A2: push    di
1F2A3: mov     di, offset aSh; "Sh"
1F2A6: push    cs
1F2A7: push    di
1F2A8: xor     ax, ax
1F2AA: push    ax
1F2AB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F2B0: call    @Write$qm4Text; Write(var f: Text)
1F2B5: call    @__IOCheck$qv; Exit if error
1F2BA: mov     [bp+var_2], 1
1F2BF: cmp     word_27E62, 1
1F2C4: jnz     short loc_1F2FF
1F2C6: mov     ax, word_27E72
1F2C9: add     ax, 10h
1F2CC: cwd
1F2CD: mov     di, 1371h
1F2D0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F2D5: push    ax
1F2D6: mov     al, 3
1F2D8: push    ax
1F2D9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F2DE: mov     di, offset unk_2F60A
1F2E1: push    ds
1F2E2: push    di
1F2E3: mov     di, offset aKu; "Ku"
1F2E6: push    cs
1F2E7: push    di
1F2E8: xor     ax, ax
1F2EA: push    ax
1F2EB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F2F0: call    @Write$qm4Text; Write(var f: Text)
1F2F5: call    @__IOCheck$qv; Exit if error
1F2FA: mov     [bp+var_2], 1
1F2FF: cmp     word_27E5E, 1
1F304: jnz     short loc_1F33F
1F306: mov     ax, word_27E72
1F309: add     ax, 16h
1F30C: cwd
1F30D: mov     di, 1371h
1F310: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F315: push    ax
1F316: mov     al, 5
1F318: push    ax
1F319: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F31E: mov     di, offset unk_2F60A
1F321: push    ds
1F322: push    di
1F323: mov     di, offset aBu; "Bu"
1F326: push    cs
1F327: push    di
1F328: xor     ax, ax
1F32A: push    ax
1F32B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F330: call    @Write$qm4Text; Write(var f: Text)
1F335: call    @__IOCheck$qv; Exit if error
1F33A: mov     [bp+var_2], 1
1F33F: cmp     word_27E5A, 1
1F344: jnz     short loc_1F37F
1F346: mov     ax, word_27E72
1F349: add     ax, 16h
1F34C: cwd
1F34D: mov     di, 1371h
1F350: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F355: push    ax
1F356: mov     al, 6
1F358: push    ax
1F359: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F35E: mov     di, offset unk_2F60A
1F361: push    ds
1F362: push    di
1F363: mov     di, offset aCh; "Ch"
1F366: push    cs
1F367: push    di
1F368: xor     ax, ax
1F36A: push    ax
1F36B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F370: call    @Write$qm4Text; Write(var f: Text)
1F375: call    @__IOCheck$qv; Exit if error
1F37A: mov     [bp+var_2], 1
1F37F: cmp     word_27E60, 1
1F384: jnz     short loc_1F3BF
1F386: mov     ax, word_27E72
1F389: add     ax, 10h
1F38C: cwd
1F38D: mov     di, 1371h
1F390: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F395: push    ax
1F396: mov     al, 5
1F398: push    ax
1F399: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F39E: mov     di, offset unk_2F60A
1F3A1: push    ds
1F3A2: push    di
1F3A3: mov     di, offset aSi; "Si"
1F3A6: push    cs
1F3A7: push    di
1F3A8: xor     ax, ax
1F3AA: push    ax
1F3AB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F3B0: call    @Write$qm4Text; Write(var f: Text)
1F3B5: call    @__IOCheck$qv; Exit if error
1F3BA: mov     [bp+var_2], 1
1F3BF: cmp     word_27E68, 1
1F3C4: jnz     short loc_1F3FF
1F3C6: mov     ax, word_27E72
1F3C9: add     ax, 10h
1F3CC: cwd
1F3CD: mov     di, 1371h
1F3D0: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F3D5: push    ax
1F3D6: mov     al, 6
1F3D8: push    ax
1F3D9: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F3DE: mov     di, offset unk_2F60A
1F3E1: push    ds
1F3E2: push    di
1F3E3: mov     di, offset aRa; "Ra"
1F3E6: push    cs
1F3E7: push    di
1F3E8: xor     ax, ax
1F3EA: push    ax
1F3EB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F3F0: call    @Write$qm4Text; Write(var f: Text)
1F3F5: call    @__IOCheck$qv; Exit if error
1F3FA: mov     [bp+var_2], 1
1F3FF: cmp     [bp+var_2], 1
1F403: jz      short loc_1F437
1F405: mov     ax, word_27E72
1F408: add     ax, 14h
1F40B: cwd
1F40C: mov     di, 1371h
1F40F: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F414: push    ax
1F415: mov     al, 5
1F417: push    ax
1F418: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F41D: mov     di, offset unk_2F60A
1F420: push    ds
1F421: push    di
1F422: mov     al, 31h ; '1'
1F424: push    ax
1F425: xor     ax, ax
1F427: push    ax
1F428: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1F42D: call    @Write$qm4Text; Write(var f: Text)
1F432: call    @__IOCheck$qv; Exit if error
1F437: xor     ax, ax
1F439: mov     [bp+var_2], ax
1F43C: cmp     word_27E6A, 2
1F441: jnz     short loc_1F47C
1F443: mov     ax, word_27E72
1F446: add     ax, 0Ah
1F449: cwd
1F44A: mov     di, 1371h
1F44D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F452: push    ax
1F453: mov     al, 2
1F455: push    ax
1F456: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F45B: mov     di, offset unk_2F60A
1F45E: push    ds
1F45F: push    di
1F460: mov     di, offset aKe; "Ke"
1F463: push    cs
1F464: push    di
1F465: xor     ax, ax
1F467: push    ax
1F468: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F46D: call    @Write$qm4Text; Write(var f: Text)
1F472: call    @__IOCheck$qv; Exit if error
1F477: mov     [bp+var_2], 1
1F47C: cmp     word_27E64, 2
1F481: jnz     short loc_1F4BC
1F483: mov     ax, word_27E72
1F486: add     ax, 7
1F489: cwd
1F48A: mov     di, 1371h
1F48D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F492: push    ax
1F493: mov     al, 2
1F495: push    ax
1F496: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F49B: mov     di, offset unk_2F60A
1F49E: push    ds
1F49F: push    di
1F4A0: mov     di, offset aGu; "Gu"
1F4A3: push    cs
1F4A4: push    di
1F4A5: xor     ax, ax
1F4A7: push    ax
1F4A8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F4AD: call    @Write$qm4Text; Write(var f: Text)
1F4B2: call    @__IOCheck$qv; Exit if error
1F4B7: mov     [bp+var_2], 1
1F4BC: cmp     word_27E5C, 2
1F4C1: jnz     short loc_1F4FC
1F4C3: mov     ax, word_27E72
1F4C6: add     ax, 0Dh
1F4C9: cwd
1F4CA: mov     di, 1371h
1F4CD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F4D2: push    ax
1F4D3: mov     al, 2
1F4D5: push    ax
1F4D6: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F4DB: mov     di, offset unk_2F60A
1F4DE: push    ds
1F4DF: push    di
1F4E0: mov     di, offset aRv; "Rv"
1F4E3: push    cs
1F4E4: push    di
1F4E5: xor     ax, ax
1F4E7: push    ax
1F4E8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F4ED: call    @Write$qm4Text; Write(var f: Text)
1F4F2: call    @__IOCheck$qv; Exit if error
1F4F7: mov     [bp+var_2], 1
1F4FC: cmp     word_27E66, 2
1F501: jnz     short loc_1F53C
1F503: mov     ax, word_27E72
1F506: add     ax, 7
1F509: cwd
1F50A: mov     di, 1371h
1F50D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F512: push    ax
1F513: mov     al, 3
1F515: push    ax
1F516: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F51B: mov     di, offset unk_2F60A
1F51E: push    ds
1F51F: push    di
1F520: mov     di, offset aSh; "Sh"
1F523: push    cs
1F524: push    di
1F525: xor     ax, ax
1F527: push    ax
1F528: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F52D: call    @Write$qm4Text; Write(var f: Text)
1F532: call    @__IOCheck$qv; Exit if error
1F537: mov     [bp+var_2], 1
1F53C: cmp     word_27E62, 2
1F541: jnz     short loc_1F57C
1F543: mov     ax, word_27E72
1F546: add     ax, 0Ch
1F549: cwd
1F54A: mov     di, 1371h
1F54D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F552: push    ax
1F553: mov     al, 3
1F555: push    ax
1F556: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F55B: mov     di, offset unk_2F60A
1F55E: push    ds
1F55F: push    di
1F560: mov     di, offset aKu; "Ku"
1F563: push    cs
1F564: push    di
1F565: xor     ax, ax
1F567: push    ax
1F568: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F56D: call    @Write$qm4Text; Write(var f: Text)
1F572: call    @__IOCheck$qv; Exit if error
1F577: mov     [bp+var_2], 1
1F57C: cmp     word_27E5E, 2
1F581: jnz     short loc_1F5BC
1F583: mov     ax, word_27E72
1F586: add     ax, 0Ch
1F589: cwd
1F58A: mov     di, 1371h
1F58D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F592: push    ax
1F593: mov     al, 4
1F595: push    ax
1F596: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F59B: mov     di, offset unk_2F60A
1F59E: push    ds
1F59F: push    di
1F5A0: mov     di, offset aBu; "Bu"
1F5A3: push    cs
1F5A4: push    di
1F5A5: xor     ax, ax
1F5A7: push    ax
1F5A8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F5AD: call    @Write$qm4Text; Write(var f: Text)
1F5B2: call    @__IOCheck$qv; Exit if error
1F5B7: mov     [bp+var_2], 1
1F5BC: cmp     word_27E5A, 2
1F5C1: jnz     short loc_1F5FC
1F5C3: mov     ax, word_27E72
1F5C6: add     ax, 0Bh
1F5C9: cwd
1F5CA: mov     di, 1371h
1F5CD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F5D2: push    ax
1F5D3: mov     al, 5
1F5D5: push    ax
1F5D6: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F5DB: mov     di, offset unk_2F60A
1F5DE: push    ds
1F5DF: push    di
1F5E0: mov     di, offset aCh; "Ch"
1F5E3: push    cs
1F5E4: push    di
1F5E5: xor     ax, ax
1F5E7: push    ax
1F5E8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F5ED: call    @Write$qm4Text; Write(var f: Text)
1F5F2: call    @__IOCheck$qv; Exit if error
1F5F7: mov     [bp+var_2], 1
1F5FC: cmp     word_27E60, 2
1F601: jnz     short loc_1F63C
1F603: mov     ax, word_27E72
1F606: add     ax, 8
1F609: cwd
1F60A: mov     di, 1371h
1F60D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F612: push    ax
1F613: mov     al, 4
1F615: push    ax
1F616: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F61B: mov     di, offset unk_2F60A
1F61E: push    ds
1F61F: push    di
1F620: mov     di, offset aSi; "Si"
1F623: push    cs
1F624: push    di
1F625: xor     ax, ax
1F627: push    ax
1F628: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F62D: call    @Write$qm4Text; Write(var f: Text)
1F632: call    @__IOCheck$qv; Exit if error
1F637: mov     [bp+var_2], 1
1F63C: cmp     word_27E68, 2
1F641: jnz     short loc_1F67C
1F643: mov     ax, word_27E72
1F646: add     ax, 0Ch
1F649: cwd
1F64A: mov     di, 1371h
1F64D: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F652: push    ax
1F653: mov     al, 6
1F655: push    ax
1F656: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F65B: mov     di, offset unk_2F60A
1F65E: push    ds
1F65F: push    di
1F660: mov     di, offset aRa; "Ra"
1F663: push    cs
1F664: push    di
1F665: xor     ax, ax
1F667: push    ax
1F668: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F66D: call    @Write$qm4Text; Write(var f: Text)
1F672: call    @__IOCheck$qv; Exit if error
1F677: mov     [bp+var_2], 1
1F67C: cmp     [bp+var_2], 1
1F680: jz      short loc_1F6B4
1F682: mov     ax, word_27E72
1F685: add     ax, 0Ah
1F688: cwd
1F689: mov     di, 1371h
1F68C: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F691: push    ax
1F692: mov     al, 4
1F694: push    ax
1F695: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F69A: mov     di, offset unk_2F60A
1F69D: push    ds
1F69E: push    di
1F69F: mov     al, 32h ; '2'
1F6A1: push    ax
1F6A2: xor     ax, ax
1F6A4: push    ax
1F6A5: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1F6AA: call    @Write$qm4Text; Write(var f: Text)
1F6AF: call    @__IOCheck$qv; Exit if error
1F6B4: xor     ax, ax
1F6B6: mov     [bp+var_2], ax
1F6B9: cmp     word_27E6A, 3
1F6BE: jnz     short loc_1F6F9
1F6C0: mov     ax, word_27E72
1F6C3: add     ax, 2
1F6C6: cwd
1F6C7: mov     di, 1371h
1F6CA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F6CF: push    ax
1F6D0: mov     al, 3
1F6D2: push    ax
1F6D3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F6D8: mov     di, offset unk_2F60A
1F6DB: push    ds
1F6DC: push    di
1F6DD: mov     di, offset aKe; "Ke"
1F6E0: push    cs
1F6E1: push    di
1F6E2: xor     ax, ax
1F6E4: push    ax
1F6E5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F6EA: call    @Write$qm4Text; Write(var f: Text)
1F6EF: call    @__IOCheck$qv; Exit if error
1F6F4: mov     [bp+var_2], 1
1F6F9: cmp     word_27E64, 3
1F6FE: jnz     short loc_1F739
1F700: mov     ax, word_27E72
1F703: add     ax, 3
1F706: cwd
1F707: mov     di, 1371h
1F70A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F70F: push    ax
1F710: mov     al, 4
1F712: push    ax
1F713: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F718: mov     di, offset unk_2F60A
1F71B: push    ds
1F71C: push    di
1F71D: mov     di, offset aGu; "Gu"
1F720: push    cs
1F721: push    di
1F722: xor     ax, ax
1F724: push    ax
1F725: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F72A: call    @Write$qm4Text; Write(var f: Text)
1F72F: call    @__IOCheck$qv; Exit if error
1F734: mov     [bp+var_2], 1
1F739: cmp     word_27E5C, 3
1F73E: jnz     short loc_1F779
1F740: mov     ax, word_27E72
1F743: add     ax, 2
1F746: cwd
1F747: mov     di, 1371h
1F74A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F74F: push    ax
1F750: mov     al, 5
1F752: push    ax
1F753: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F758: mov     di, offset unk_2F60A
1F75B: push    ds
1F75C: push    di
1F75D: mov     di, offset aRv; "Rv"
1F760: push    cs
1F761: push    di
1F762: xor     ax, ax
1F764: push    ax
1F765: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F76A: call    @Write$qm4Text; Write(var f: Text)
1F76F: call    @__IOCheck$qv; Exit if error
1F774: mov     [bp+var_2], 1
1F779: cmp     word_27E66, 3
1F77E: jnz     short loc_1F7B9
1F780: mov     ax, word_27E72
1F783: add     ax, 6
1F786: cwd
1F787: mov     di, 1371h
1F78A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F78F: push    ax
1F790: mov     al, 5
1F792: push    ax
1F793: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F798: mov     di, offset unk_2F60A
1F79B: push    ds
1F79C: push    di
1F79D: mov     di, offset aSh; "Sh"
1F7A0: push    cs
1F7A1: push    di
1F7A2: xor     ax, ax
1F7A4: push    ax
1F7A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F7AA: call    @Write$qm4Text; Write(var f: Text)
1F7AF: call    @__IOCheck$qv; Exit if error
1F7B4: mov     [bp+var_2], 1
1F7B9: cmp     word_27E62, 3
1F7BE: jnz     short loc_1F7F9
1F7C0: mov     ax, word_27E72
1F7C3: add     ax, 2
1F7C6: cwd
1F7C7: mov     di, 1371h
1F7CA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F7CF: push    ax
1F7D0: mov     al, 6
1F7D2: push    ax
1F7D3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F7D8: mov     di, offset unk_2F60A
1F7DB: push    ds
1F7DC: push    di
1F7DD: mov     di, offset aKu; "Ku"
1F7E0: push    cs
1F7E1: push    di
1F7E2: xor     ax, ax
1F7E4: push    ax
1F7E5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F7EA: call    @Write$qm4Text; Write(var f: Text)
1F7EF: call    @__IOCheck$qv; Exit if error
1F7F4: mov     [bp+var_2], 1
1F7F9: cmp     word_27E5E, 3
1F7FE: jnz     short loc_1F839
1F800: mov     ax, word_27E72
1F803: add     ax, 6
1F806: cwd
1F807: mov     di, 1371h
1F80A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F80F: push    ax
1F810: mov     al, 6
1F812: push    ax
1F813: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F818: mov     di, offset unk_2F60A
1F81B: push    ds
1F81C: push    di
1F81D: mov     di, offset aBu; "Bu"
1F820: push    cs
1F821: push    di
1F822: xor     ax, ax
1F824: push    ax
1F825: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F82A: call    @Write$qm4Text; Write(var f: Text)
1F82F: call    @__IOCheck$qv; Exit if error
1F834: mov     [bp+var_2], 1
1F839: cmp     word_27E5A, 3
1F83E: jnz     short loc_1F879
1F840: mov     ax, word_27E72
1F843: add     ax, 2
1F846: cwd
1F847: mov     di, 1371h
1F84A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F84F: push    ax
1F850: mov     al, 7
1F852: push    ax
1F853: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F858: mov     di, offset unk_2F60A
1F85B: push    ds
1F85C: push    di
1F85D: mov     di, offset aCh; "Ch"
1F860: push    cs
1F861: push    di
1F862: xor     ax, ax
1F864: push    ax
1F865: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F86A: call    @Write$qm4Text; Write(var f: Text)
1F86F: call    @__IOCheck$qv; Exit if error
1F874: mov     [bp+var_2], 1
1F879: cmp     word_27E60, 3
1F87E: jnz     short loc_1F8B9
1F880: mov     ax, word_27E72
1F883: add     ax, 6
1F886: cwd
1F887: mov     di, 1371h
1F88A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F88F: push    ax
1F890: mov     al, 7
1F892: push    ax
1F893: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F898: mov     di, offset unk_2F60A
1F89B: push    ds
1F89C: push    di
1F89D: mov     di, offset aSi; "Si"
1F8A0: push    cs
1F8A1: push    di
1F8A2: xor     ax, ax
1F8A4: push    ax
1F8A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F8AA: call    @Write$qm4Text; Write(var f: Text)
1F8AF: call    @__IOCheck$qv; Exit if error
1F8B4: mov     [bp+var_2], 1
1F8B9: cmp     word_27E68, 3
1F8BE: jnz     short loc_1F8F9
1F8C0: mov     ax, word_27E72
1F8C3: add     ax, 0Ah
1F8C6: cwd
1F8C7: mov     di, 1371h
1F8CA: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F8CF: push    ax
1F8D0: mov     al, 7
1F8D2: push    ax
1F8D3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F8D8: mov     di, offset unk_2F60A
1F8DB: push    ds
1F8DC: push    di
1F8DD: mov     di, offset aRa; "Ra"
1F8E0: push    cs
1F8E1: push    di
1F8E2: xor     ax, ax
1F8E4: push    ax
1F8E5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F8EA: call    @Write$qm4Text; Write(var f: Text)
1F8EF: call    @__IOCheck$qv; Exit if error
1F8F4: mov     [bp+var_2], 1
1F8F9: cmp     [bp+var_2], 1
1F8FD: jz      short loc_1F931
1F8FF: mov     ax, word_27E72
1F902: add     ax, 5
1F905: cwd
1F906: mov     di, 1371h
1F909: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F90E: push    ax
1F90F: mov     al, 6
1F911: push    ax
1F912: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F917: mov     di, offset unk_2F60A
1F91A: push    ds
1F91B: push    di
1F91C: mov     al, 33h ; '3'
1F91E: push    ax
1F91F: xor     ax, ax
1F921: push    ax
1F922: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1F927: call    @Write$qm4Text; Write(var f: Text)
1F92C: call    @__IOCheck$qv; Exit if error
1F931: xor     ax, ax
1F933: mov     [bp+var_2], ax
1F936: cmp     word_27E6A, 4
1F93B: jnz     short loc_1F976
1F93D: mov     ax, word_27E72
1F940: add     ax, 4
1F943: cwd
1F944: mov     di, 1371h
1F947: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F94C: push    ax
1F94D: mov     al, 9
1F94F: push    ax
1F950: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F955: mov     di, offset unk_2F60A
1F958: push    ds
1F959: push    di
1F95A: mov     di, offset aKe; "Ke"
1F95D: push    cs
1F95E: push    di
1F95F: xor     ax, ax
1F961: push    ax
1F962: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F967: call    @Write$qm4Text; Write(var f: Text)
1F96C: call    @__IOCheck$qv; Exit if error
1F971: mov     [bp+var_2], 1
1F976: cmp     word_27E64, 4
1F97B: jnz     short loc_1F9B6
1F97D: mov     ax, word_27E72
1F980: add     ax, 4
1F983: cwd
1F984: mov     di, 1371h
1F987: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F98C: push    ax
1F98D: mov     al, 0Dh
1F98F: push    ax
1F990: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F995: mov     di, offset unk_2F60A
1F998: push    ds
1F999: push    di
1F99A: mov     di, offset aGu; "Gu"
1F99D: push    cs
1F99E: push    di
1F99F: xor     ax, ax
1F9A1: push    ax
1F9A2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F9A7: call    @Write$qm4Text; Write(var f: Text)
1F9AC: call    @__IOCheck$qv; Exit if error
1F9B1: mov     [bp+var_2], 1
1F9B6: cmp     word_27E5C, 4
1F9BB: jnz     short loc_1F9F6
1F9BD: mov     ax, word_27E72
1F9C0: add     ax, 4
1F9C3: cwd
1F9C4: mov     di, 1371h
1F9C7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1F9CC: push    ax
1F9CD: mov     al, 0Ah
1F9CF: push    ax
1F9D0: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1F9D5: mov     di, offset unk_2F60A
1F9D8: push    ds
1F9D9: push    di
1F9DA: mov     di, offset aRv; "Rv"
1F9DD: push    cs
1F9DE: push    di
1F9DF: xor     ax, ax
1F9E1: push    ax
1F9E2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1F9E7: call    @Write$qm4Text; Write(var f: Text)
1F9EC: call    @__IOCheck$qv; Exit if error
1F9F1: mov     [bp+var_2], 1
1F9F6: cmp     word_27E66, 4
1F9FB: jnz     short loc_1FA36
1F9FD: mov     ax, word_27E72
1FA00: add     ax, 8
1FA03: cwd
1FA04: mov     di, 1371h
1FA07: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FA0C: push    ax
1FA0D: mov     al, 0Dh
1FA0F: push    ax
1FA10: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FA15: mov     di, offset unk_2F60A
1FA18: push    ds
1FA19: push    di
1FA1A: mov     di, offset aSh; "Sh"
1FA1D: push    cs
1FA1E: push    di
1FA1F: xor     ax, ax
1FA21: push    ax
1FA22: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FA27: call    @Write$qm4Text; Write(var f: Text)
1FA2C: call    @__IOCheck$qv; Exit if error
1FA31: mov     [bp+var_2], 1
1FA36: cmp     word_27E62, 4
1FA3B: jnz     short loc_1FA76
1FA3D: mov     ax, word_27E72
1FA40: add     ax, 8
1FA43: cwd
1FA44: mov     di, 1371h
1FA47: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FA4C: push    ax
1FA4D: mov     al, 0Ch
1FA4F: push    ax
1FA50: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FA55: mov     di, offset unk_2F60A
1FA58: push    ds
1FA59: push    di
1FA5A: mov     di, offset aKu; "Ku"
1FA5D: push    cs
1FA5E: push    di
1FA5F: xor     ax, ax
1FA61: push    ax
1FA62: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FA67: call    @Write$qm4Text; Write(var f: Text)
1FA6C: call    @__IOCheck$qv; Exit if error
1FA71: mov     [bp+var_2], 1
1FA76: cmp     word_27E5E, 4
1FA7B: jnz     short loc_1FAB6
1FA7D: mov     ax, word_27E72
1FA80: add     ax, 4
1FA83: cwd
1FA84: mov     di, 1371h
1FA87: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FA8C: push    ax
1FA8D: mov     al, 0Ch
1FA8F: push    ax
1FA90: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FA95: mov     di, offset unk_2F60A
1FA98: push    ds
1FA99: push    di
1FA9A: mov     di, offset aBu; "Bu"
1FA9D: push    cs
1FA9E: push    di
1FA9F: xor     ax, ax
1FAA1: push    ax
1FAA2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FAA7: call    @Write$qm4Text; Write(var f: Text)
1FAAC: call    @__IOCheck$qv; Exit if error
1FAB1: mov     [bp+var_2], 1
1FAB6: cmp     word_27E5A, 4
1FABB: jnz     short loc_1FAF6
1FABD: mov     ax, word_27E72
1FAC0: add     ax, 8
1FAC3: cwd
1FAC4: mov     di, 1371h
1FAC7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FACC: push    ax
1FACD: mov     al, 0Bh
1FACF: push    ax
1FAD0: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FAD5: mov     di, offset unk_2F60A
1FAD8: push    ds
1FAD9: push    di
1FADA: mov     di, offset aCh; "Ch"
1FADD: push    cs
1FADE: push    di
1FADF: xor     ax, ax
1FAE1: push    ax
1FAE2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FAE7: call    @Write$qm4Text; Write(var f: Text)
1FAEC: call    @__IOCheck$qv; Exit if error
1FAF1: mov     [bp+var_2], 1
1FAF6: cmp     word_27E60, 4
1FAFB: jnz     short loc_1FB36
1FAFD: mov     ax, word_27E72
1FB00: add     ax, 8
1FB03: cwd
1FB04: mov     di, 1371h
1FB07: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FB0C: push    ax
1FB0D: mov     al, 0Ah
1FB0F: push    ax
1FB10: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FB15: mov     di, offset unk_2F60A
1FB18: push    ds
1FB19: push    di
1FB1A: mov     di, offset aSi; "Si"
1FB1D: push    cs
1FB1E: push    di
1FB1F: xor     ax, ax
1FB21: push    ax
1FB22: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FB27: call    @Write$qm4Text; Write(var f: Text)
1FB2C: call    @__IOCheck$qv; Exit if error
1FB31: mov     [bp+var_2], 1
1FB36: cmp     word_27E68, 4
1FB3B: jnz     short loc_1FB76
1FB3D: mov     ax, word_27E72
1FB40: add     ax, 4
1FB43: cwd
1FB44: mov     di, 1371h
1FB47: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FB4C: push    ax
1FB4D: mov     al, 0Bh
1FB4F: push    ax
1FB50: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FB55: mov     di, offset unk_2F60A
1FB58: push    ds
1FB59: push    di
1FB5A: mov     di, offset aRa; "Ra"
1FB5D: push    cs
1FB5E: push    di
1FB5F: xor     ax, ax
1FB61: push    ax
1FB62: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FB67: call    @Write$qm4Text; Write(var f: Text)
1FB6C: call    @__IOCheck$qv; Exit if error
1FB71: mov     [bp+var_2], 1
1FB76: cmp     [bp+var_2], 1
1FB7A: jz      short loc_1FBAE
1FB7C: mov     ax, word_27E72
1FB7F: add     ax, 8
1FB82: cwd
1FB83: mov     di, 1371h
1FB86: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FB8B: push    ax
1FB8C: mov     al, 0Bh
1FB8E: push    ax
1FB8F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FB94: mov     di, offset unk_2F60A
1FB97: push    ds
1FB98: push    di
1FB99: mov     al, 34h ; '4'
1FB9B: push    ax
1FB9C: xor     ax, ax
1FB9E: push    ax
1FB9F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1FBA4: call    @Write$qm4Text; Write(var f: Text)
1FBA9: call    @__IOCheck$qv; Exit if error
1FBAE: xor     ax, ax
1FBB0: mov     [bp+var_2], ax
1FBB3: cmp     word_27E6A, 5
1FBB8: jnz     short loc_1FBF3
1FBBA: mov     ax, word_27E72
1FBBD: add     ax, 3
1FBC0: cwd
1FBC1: mov     di, 1371h
1FBC4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FBC9: push    ax
1FBCA: mov     al, 13h
1FBCC: push    ax
1FBCD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FBD2: mov     di, offset unk_2F60A
1FBD5: push    ds
1FBD6: push    di
1FBD7: mov     di, offset aKe; "Ke"
1FBDA: push    cs
1FBDB: push    di
1FBDC: xor     ax, ax
1FBDE: push    ax
1FBDF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FBE4: call    @Write$qm4Text; Write(var f: Text)
1FBE9: call    @__IOCheck$qv; Exit if error
1FBEE: mov     [bp+var_2], 1
1FBF3: cmp     word_27E64, 5
1FBF8: jnz     short loc_1FC33
1FBFA: mov     ax, word_27E72
1FBFD: add     ax, 3
1FC00: cwd
1FC01: mov     di, 1371h
1FC04: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FC09: push    ax
1FC0A: mov     al, 0Fh
1FC0C: push    ax
1FC0D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FC12: mov     di, offset unk_2F60A
1FC15: push    ds
1FC16: push    di
1FC17: mov     di, offset aGu; "Gu"
1FC1A: push    cs
1FC1B: push    di
1FC1C: xor     ax, ax
1FC1E: push    ax
1FC1F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FC24: call    @Write$qm4Text; Write(var f: Text)
1FC29: call    @__IOCheck$qv; Exit if error
1FC2E: mov     [bp+var_2], 1
1FC33: cmp     word_27E5C, 5
1FC38: jnz     short loc_1FC73
1FC3A: mov     ax, word_27E72
1FC3D: add     ax, 7
1FC40: cwd
1FC41: mov     di, 1371h
1FC44: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FC49: push    ax
1FC4A: mov     al, 0Fh
1FC4C: push    ax
1FC4D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FC52: mov     di, offset unk_2F60A
1FC55: push    ds
1FC56: push    di
1FC57: mov     di, offset aRv; "Rv"
1FC5A: push    cs
1FC5B: push    di
1FC5C: xor     ax, ax
1FC5E: push    ax
1FC5F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FC64: call    @Write$qm4Text; Write(var f: Text)
1FC69: call    @__IOCheck$qv; Exit if error
1FC6E: mov     [bp+var_2], 1
1FC73: cmp     word_27E66, 5
1FC78: jnz     short loc_1FCB3
1FC7A: mov     ax, word_27E72
1FC7D: add     ax, 0Bh
1FC80: cwd
1FC81: mov     di, 1371h
1FC84: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FC89: push    ax
1FC8A: mov     al, 0Fh
1FC8C: push    ax
1FC8D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FC92: mov     di, offset unk_2F60A
1FC95: push    ds
1FC96: push    di
1FC97: mov     di, offset aSh; "Sh"
1FC9A: push    cs
1FC9B: push    di
1FC9C: xor     ax, ax
1FC9E: push    ax
1FC9F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FCA4: call    @Write$qm4Text; Write(var f: Text)
1FCA9: call    @__IOCheck$qv; Exit if error
1FCAE: mov     [bp+var_2], 1
1FCB3: cmp     word_27E62, 5
1FCB8: jnz     short loc_1FCF3
1FCBA: mov     ax, word_27E72
1FCBD: add     ax, 3
1FCC0: cwd
1FCC1: mov     di, 1371h
1FCC4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FCC9: push    ax
1FCCA: mov     al, 10h
1FCCC: push    ax
1FCCD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FCD2: mov     di, offset unk_2F60A
1FCD5: push    ds
1FCD6: push    di
1FCD7: mov     di, offset aKu; "Ku"
1FCDA: push    cs
1FCDB: push    di
1FCDC: xor     ax, ax
1FCDE: push    ax
1FCDF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FCE4: call    @Write$qm4Text; Write(var f: Text)
1FCE9: call    @__IOCheck$qv; Exit if error
1FCEE: mov     [bp+var_2], 1
1FCF3: cmp     word_27E5E, 5
1FCF8: jnz     short loc_1FD33
1FCFA: mov     ax, word_27E72
1FCFD: add     ax, 7
1FD00: cwd
1FD01: mov     di, 1371h
1FD04: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FD09: push    ax
1FD0A: mov     al, 10h
1FD0C: push    ax
1FD0D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FD12: mov     di, offset unk_2F60A
1FD15: push    ds
1FD16: push    di
1FD17: mov     di, offset aBu; "Bu"
1FD1A: push    cs
1FD1B: push    di
1FD1C: xor     ax, ax
1FD1E: push    ax
1FD1F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FD24: call    @Write$qm4Text; Write(var f: Text)
1FD29: call    @__IOCheck$qv; Exit if error
1FD2E: mov     [bp+var_2], 1
1FD33: cmp     word_27E5A, 5
1FD38: jnz     short loc_1FD73
1FD3A: mov     ax, word_27E72
1FD3D: add     ax, 3
1FD40: cwd
1FD41: mov     di, 1371h
1FD44: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FD49: push    ax
1FD4A: mov     al, 12h
1FD4C: push    ax
1FD4D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FD52: mov     di, offset unk_2F60A
1FD55: push    ds
1FD56: push    di
1FD57: mov     di, offset aCh; "Ch"
1FD5A: push    cs
1FD5B: push    di
1FD5C: xor     ax, ax
1FD5E: push    ax
1FD5F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FD64: call    @Write$qm4Text; Write(var f: Text)
1FD69: call    @__IOCheck$qv; Exit if error
1FD6E: mov     [bp+var_2], 1
1FD73: cmp     word_27E60, 5
1FD78: jnz     short loc_1FDB3
1FD7A: mov     ax, word_27E72
1FD7D: add     ax, 3
1FD80: cwd
1FD81: mov     di, 1371h
1FD84: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FD89: push    ax
1FD8A: mov     al, 11h
1FD8C: push    ax
1FD8D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FD92: mov     di, offset unk_2F60A
1FD95: push    ds
1FD96: push    di
1FD97: mov     di, offset aSi; "Si"
1FD9A: push    cs
1FD9B: push    di
1FD9C: xor     ax, ax
1FD9E: push    ax
1FD9F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FDA4: call    @Write$qm4Text; Write(var f: Text)
1FDA9: call    @__IOCheck$qv; Exit if error
1FDAE: mov     [bp+var_2], 1
1FDB3: cmp     word_27E68, 5
1FDB8: jnz     short loc_1FDF3
1FDBA: mov     ax, word_27E72
1FDBD: add     ax, 7
1FDC0: cwd
1FDC1: mov     di, 1371h
1FDC4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FDC9: push    ax
1FDCA: mov     al, 11h
1FDCC: push    ax
1FDCD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FDD2: mov     di, offset unk_2F60A
1FDD5: push    ds
1FDD6: push    di
1FDD7: mov     di, offset aRa; "Ra"
1FDDA: push    cs
1FDDB: push    di
1FDDC: xor     ax, ax
1FDDE: push    ax
1FDDF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FDE4: call    @Write$qm4Text; Write(var f: Text)
1FDE9: call    @__IOCheck$qv; Exit if error
1FDEE: mov     [bp+var_2], 1
1FDF3: cmp     [bp+var_2], 1
1FDF7: jz      short loc_1FE2B
1FDF9: mov     ax, word_27E72
1FDFC: add     ax, 4
1FDFF: cwd
1FE00: mov     di, 1371h
1FE03: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FE08: push    ax
1FE09: mov     al, 11h
1FE0B: push    ax
1FE0C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FE11: mov     di, offset unk_2F60A
1FE14: push    ds
1FE15: push    di
1FE16: mov     al, 35h ; '5'
1FE18: push    ax
1FE19: xor     ax, ax
1FE1B: push    ax
1FE1C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1FE21: call    @Write$qm4Text; Write(var f: Text)
1FE26: call    @__IOCheck$qv; Exit if error
1FE2B: xor     ax, ax
1FE2D: mov     [bp+var_2], ax
1FE30: cmp     word_27E6A, 6
1FE35: jnz     short loc_1FE70
1FE37: mov     ax, word_27E72
1FE3A: add     ax, 0Dh
1FE3D: cwd
1FE3E: mov     di, 1371h
1FE41: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FE46: push    ax
1FE47: mov     al, 10h
1FE49: push    ax
1FE4A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FE4F: mov     di, offset unk_2F60A
1FE52: push    ds
1FE53: push    di
1FE54: mov     di, offset aKe; "Ke"
1FE57: push    cs
1FE58: push    di
1FE59: xor     ax, ax
1FE5B: push    ax
1FE5C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FE61: call    @Write$qm4Text; Write(var f: Text)
1FE66: call    @__IOCheck$qv; Exit if error
1FE6B: mov     [bp+var_2], 1
1FE70: cmp     word_27E64, 6
1FE75: jnz     short loc_1FEB0
1FE77: mov     ax, word_27E72
1FE7A: add     ax, 0Ch
1FE7D: cwd
1FE7E: mov     di, 1371h
1FE81: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FE86: push    ax
1FE87: mov     al, 11h
1FE89: push    ax
1FE8A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FE8F: mov     di, offset unk_2F60A
1FE92: push    ds
1FE93: push    di
1FE94: mov     di, offset aGu; "Gu"
1FE97: push    cs
1FE98: push    di
1FE99: xor     ax, ax
1FE9B: push    ax
1FE9C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FEA1: call    @Write$qm4Text; Write(var f: Text)
1FEA6: call    @__IOCheck$qv; Exit if error
1FEAB: mov     [bp+var_2], 1
1FEB0: cmp     word_27E5C, 6
1FEB5: jnz     short loc_1FEF0
1FEB7: mov     ax, word_27E72
1FEBA: add     ax, 0Ch
1FEBD: cwd
1FEBE: mov     di, 1371h
1FEC1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FEC6: push    ax
1FEC7: mov     al, 13h
1FEC9: push    ax
1FECA: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FECF: mov     di, offset unk_2F60A
1FED2: push    ds
1FED3: push    di
1FED4: mov     di, offset aRv; "Rv"
1FED7: push    cs
1FED8: push    di
1FED9: xor     ax, ax
1FEDB: push    ax
1FEDC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FEE1: call    @Write$qm4Text; Write(var f: Text)
1FEE6: call    @__IOCheck$qv; Exit if error
1FEEB: mov     [bp+var_2], 1
1FEF0: cmp     word_27E66, 6
1FEF5: jnz     short loc_1FF30
1FEF7: mov     ax, word_27E72
1FEFA: add     ax, 8
1FEFD: cwd
1FEFE: mov     di, 1371h
1FF01: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FF06: push    ax
1FF07: mov     al, 13h
1FF09: push    ax
1FF0A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FF0F: mov     di, offset unk_2F60A
1FF12: push    ds
1FF13: push    di
1FF14: mov     di, offset aSh; "Sh"
1FF17: push    cs
1FF18: push    di
1FF19: xor     ax, ax
1FF1B: push    ax
1FF1C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FF21: call    @Write$qm4Text; Write(var f: Text)
1FF26: call    @__IOCheck$qv; Exit if error
1FF2B: mov     [bp+var_2], 1
1FF30: cmp     word_27E62, 6
1FF35: jnz     short loc_1FF70
1FF37: mov     ax, word_27E72
1FF3A: add     ax, 8
1FF3D: cwd
1FF3E: mov     di, 1371h
1FF41: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FF46: push    ax
1FF47: mov     al, 14h
1FF49: push    ax
1FF4A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FF4F: mov     di, offset unk_2F60A
1FF52: push    ds
1FF53: push    di
1FF54: mov     di, offset aKu; "Ku"
1FF57: push    cs
1FF58: push    di
1FF59: xor     ax, ax
1FF5B: push    ax
1FF5C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FF61: call    @Write$qm4Text; Write(var f: Text)
1FF66: call    @__IOCheck$qv; Exit if error
1FF6B: mov     [bp+var_2], 1
1FF70: cmp     word_27E5E, 6
1FF75: jnz     short loc_1FFB0
1FF77: mov     ax, word_27E72
1FF7A: add     ax, 5
1FF7D: cwd
1FF7E: mov     di, 1371h
1FF81: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FF86: push    ax
1FF87: mov     al, 14h
1FF89: push    ax
1FF8A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FF8F: mov     di, offset unk_2F60A
1FF92: push    ds
1FF93: push    di
1FF94: mov     di, offset aBu; "Bu"
1FF97: push    cs
1FF98: push    di
1FF99: xor     ax, ax
1FF9B: push    ax
1FF9C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FFA1: call    @Write$qm4Text; Write(var f: Text)
1FFA6: call    @__IOCheck$qv; Exit if error
1FFAB: mov     [bp+var_2], 1
1FFB0: cmp     word_27E5A, 6
1FFB5: jnz     short loc_1FFF0
1FFB7: mov     ax, word_27E72
1FFBA: add     ax, 0Ch
1FFBD: cwd
1FFBE: mov     di, 1371h
1FFC1: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1FFC6: push    ax
1FFC7: mov     al, 14h
1FFC9: push    ax
1FFCA: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1FFCF: mov     di, offset unk_2F60A
1FFD2: push    ds
1FFD3: push    di
1FFD4: mov     di, offset aCh; "Ch"
1FFD7: push    cs
1FFD8: push    di
1FFD9: xor     ax, ax
1FFDB: push    ax
1FFDC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1FFE1: call    @Write$qm4Text; Write(var f: Text)
1FFE6: call    @__IOCheck$qv; Exit if error
1FFEB: mov     [bp+var_2], 1
1FFF0: cmp     word_27E60, 6
1FFF5: jnz     short loc_20030
1FFF7: mov     ax, word_27E72
1FFFA: add     ax, 0Ch
1FFFD: cwd
1FFFE: mov     di, 1371h
20001: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20006: push    ax
20007: mov     al, 12h
20009: push    ax
2000A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2000F: mov     di, offset unk_2F60A
20012: push    ds
20013: push    di
20014: mov     di, offset aSi; "Si"
20017: push    cs
20018: push    di
20019: xor     ax, ax
2001B: push    ax
2001C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20021: call    @Write$qm4Text; Write(var f: Text)
20026: call    @__IOCheck$qv; Exit if error
2002B: mov     [bp+var_2], 1
20030: cmp     word_27E68, 6
20035: jnz     short loc_20070
20037: mov     ax, word_27E72
2003A: add     ax, 9
2003D: cwd
2003E: mov     di, 1371h
20041: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20046: push    ax
20047: mov     al, 12h
20049: push    ax
2004A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2004F: mov     di, offset unk_2F60A
20052: push    ds
20053: push    di
20054: mov     di, offset aRa; "Ra"
20057: push    cs
20058: push    di
20059: xor     ax, ax
2005B: push    ax
2005C: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20061: call    @Write$qm4Text; Write(var f: Text)
20066: call    @__IOCheck$qv; Exit if error
2006B: mov     [bp+var_2], 1
20070: cmp     [bp+var_2], 1
20074: jz      short loc_200A8
20076: mov     ax, word_27E72
20079: add     ax, 0Bh
2007C: cwd
2007D: mov     di, 1371h
20080: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20085: push    ax
20086: mov     al, 13h
20088: push    ax
20089: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2008E: mov     di, offset unk_2F60A
20091: push    ds
20092: push    di
20093: mov     al, 36h ; '6'
20095: push    ax
20096: xor     ax, ax
20098: push    ax
20099: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
2009E: call    @Write$qm4Text; Write(var f: Text)
200A3: call    @__IOCheck$qv; Exit if error
200A8: xor     ax, ax
200AA: mov     [bp+var_2], ax
200AD: cmp     word_27E6A, 7
200B2: jnz     short loc_200ED
200B4: mov     ax, word_27E72
200B7: add     ax, 13h
200BA: cwd
200BB: mov     di, 1371h
200BE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
200C3: push    ax
200C4: mov     al, 0Fh
200C6: push    ax
200C7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
200CC: mov     di, offset unk_2F60A
200CF: push    ds
200D0: push    di
200D1: mov     di, offset aKe; "Ke"
200D4: push    cs
200D5: push    di
200D6: xor     ax, ax
200D8: push    ax
200D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
200DE: call    @Write$qm4Text; Write(var f: Text)
200E3: call    @__IOCheck$qv; Exit if error
200E8: mov     [bp+var_2], 1
200ED: cmp     word_27E64, 7
200F2: jnz     short loc_2012D
200F4: mov     ax, word_27E72
200F7: add     ax, 10h
200FA: cwd
200FB: mov     di, 1371h
200FE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20103: push    ax
20104: mov     al, 10h
20106: push    ax
20107: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2010C: mov     di, offset unk_2F60A
2010F: push    ds
20110: push    di
20111: mov     di, offset aGu; "Gu"
20114: push    cs
20115: push    di
20116: xor     ax, ax
20118: push    ax
20119: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2011E: call    @Write$qm4Text; Write(var f: Text)
20123: call    @__IOCheck$qv; Exit if error
20128: mov     [bp+var_2], 1
2012D: cmp     word_27E5C, 7
20132: jnz     short loc_2016D
20134: mov     ax, word_27E72
20137: add     ax, 16h
2013A: cwd
2013B: mov     di, 1371h
2013E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20143: push    ax
20144: mov     al, 11h
20146: push    ax
20147: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2014C: mov     di, offset unk_2F60A
2014F: push    ds
20150: push    di
20151: mov     di, offset aRv; "Rv"
20154: push    cs
20155: push    di
20156: xor     ax, ax
20158: push    ax
20159: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2015E: call    @Write$qm4Text; Write(var f: Text)
20163: call    @__IOCheck$qv; Exit if error
20168: mov     [bp+var_2], 1
2016D: cmp     word_27E66, 7
20172: jnz     short loc_201AD
20174: mov     ax, word_27E72
20177: add     ax, 10h
2017A: cwd
2017B: mov     di, 1371h
2017E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20183: push    ax
20184: mov     al, 11h
20186: push    ax
20187: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2018C: mov     di, offset unk_2F60A
2018F: push    ds
20190: push    di
20191: mov     di, offset aSh; "Sh"
20194: push    cs
20195: push    di
20196: xor     ax, ax
20198: push    ax
20199: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2019E: call    @Write$qm4Text; Write(var f: Text)
201A3: call    @__IOCheck$qv; Exit if error
201A8: mov     [bp+var_2], 1
201AD: cmp     word_27E62, 7
201B2: jnz     short loc_201ED
201B4: mov     ax, word_27E72
201B7: add     ax, 16h
201BA: cwd
201BB: mov     di, 1371h
201BE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
201C3: push    ax
201C4: mov     al, 12h
201C6: push    ax
201C7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
201CC: mov     di, offset unk_2F60A
201CF: push    ds
201D0: push    di
201D1: mov     di, offset aKu; "Ku"
201D4: push    cs
201D5: push    di
201D6: xor     ax, ax
201D8: push    ax
201D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
201DE: call    @Write$qm4Text; Write(var f: Text)
201E3: call    @__IOCheck$qv; Exit if error
201E8: mov     [bp+var_2], 1
201ED: cmp     word_27E5E, 7
201F2: jnz     short loc_2022D
201F4: mov     ax, word_27E72
201F7: add     ax, 16h
201FA: cwd
201FB: mov     di, 1371h
201FE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20203: push    ax
20204: mov     al, 10h
20206: push    ax
20207: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2020C: mov     di, offset unk_2F60A
2020F: push    ds
20210: push    di
20211: mov     di, offset aBu; "Bu"
20214: push    cs
20215: push    di
20216: xor     ax, ax
20218: push    ax
20219: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2021E: call    @Write$qm4Text; Write(var f: Text)
20223: call    @__IOCheck$qv; Exit if error
20228: mov     [bp+var_2], 1
2022D: cmp     word_27E5A, 7
20232: jnz     short loc_2026D
20234: mov     ax, word_27E72
20237: add     ax, 16h
2023A: cwd
2023B: mov     di, 1371h
2023E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20243: push    ax
20244: mov     al, 13h
20246: push    ax
20247: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2024C: mov     di, offset unk_2F60A
2024F: push    ds
20250: push    di
20251: mov     di, offset aCh; "Ch"
20254: push    cs
20255: push    di
20256: xor     ax, ax
20258: push    ax
20259: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2025E: call    @Write$qm4Text; Write(var f: Text)
20263: call    @__IOCheck$qv; Exit if error
20268: mov     [bp+var_2], 1
2026D: cmp     word_27E60, 7
20272: jnz     short loc_202AD
20274: mov     ax, word_27E72
20277: add     ax, 10h
2027A: cwd
2027B: mov     di, 1371h
2027E: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20283: push    ax
20284: mov     al, 12h
20286: push    ax
20287: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2028C: mov     di, offset unk_2F60A
2028F: push    ds
20290: push    di
20291: mov     di, offset aSi; "Si"
20294: push    cs
20295: push    di
20296: xor     ax, ax
20298: push    ax
20299: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2029E: call    @Write$qm4Text; Write(var f: Text)
202A3: call    @__IOCheck$qv; Exit if error
202A8: mov     [bp+var_2], 1
202AD: cmp     word_27E68, 7
202B2: jnz     short loc_202ED
202B4: mov     ax, word_27E72
202B7: add     ax, 10h
202BA: cwd
202BB: mov     di, 1371h
202BE: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
202C3: push    ax
202C4: mov     al, 13h
202C6: push    ax
202C7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
202CC: mov     di, offset unk_2F60A
202CF: push    ds
202D0: push    di
202D1: mov     di, offset aRa; "Ra"
202D4: push    cs
202D5: push    di
202D6: xor     ax, ax
202D8: push    ax
202D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
202DE: call    @Write$qm4Text; Write(var f: Text)
202E3: call    @__IOCheck$qv; Exit if error
202E8: mov     [bp+var_2], 1
202ED: cmp     [bp+var_2], 1
202F1: jz      short loc_20325
202F3: mov     ax, word_27E72
202F6: add     ax, 14h
202F9: cwd
202FA: mov     di, 1371h
202FD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20302: push    ax
20303: mov     al, 12h
20305: push    ax
20306: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2030B: mov     di, offset unk_2F60A
2030E: push    ds
2030F: push    di
20310: mov     al, 37h ; '7'
20312: push    ax
20313: xor     ax, ax
20315: push    ax
20316: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
2031B: call    @Write$qm4Text; Write(var f: Text)
20320: call    @__IOCheck$qv; Exit if error
20325: xor     ax, ax
20327: mov     [bp+var_2], ax
2032A: cmp     word_27E6A, 8
2032F: jnz     short loc_2036A
20331: mov     ax, word_27E72
20334: add     ax, 1Bh
20337: cwd
20338: mov     di, 1371h
2033B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20340: push    ax
20341: mov     al, 10h
20343: push    ax
20344: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20349: mov     di, offset unk_2F60A
2034C: push    ds
2034D: push    di
2034E: mov     di, offset aKe; "Ke"
20351: push    cs
20352: push    di
20353: xor     ax, ax
20355: push    ax
20356: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2035B: call    @Write$qm4Text; Write(var f: Text)
20360: call    @__IOCheck$qv; Exit if error
20365: mov     [bp+var_2], 1
2036A: cmp     word_27E64, 8
2036F: jnz     short loc_203AA
20371: mov     ax, word_27E72
20374: add     ax, 1Bh
20377: cwd
20378: mov     di, 1371h
2037B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20380: push    ax
20381: mov     al, 11h
20383: push    ax
20384: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20389: mov     di, offset unk_2F60A
2038C: push    ds
2038D: push    di
2038E: mov     di, offset aGu; "Gu"
20391: push    cs
20392: push    di
20393: xor     ax, ax
20395: push    ax
20396: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2039B: call    @Write$qm4Text; Write(var f: Text)
203A0: call    @__IOCheck$qv; Exit if error
203A5: mov     [bp+var_2], 1
203AA: cmp     word_27E5C, 8
203AF: jnz     short loc_203EA
203B1: mov     ax, word_27E72
203B4: add     ax, 1Eh
203B7: cwd
203B8: mov     di, 1371h
203BB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
203C0: push    ax
203C1: mov     al, 13h
203C3: push    ax
203C4: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
203C9: mov     di, offset unk_2F60A
203CC: push    ds
203CD: push    di
203CE: mov     di, offset aRv; "Rv"
203D1: push    cs
203D2: push    di
203D3: xor     ax, ax
203D5: push    ax
203D6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
203DB: call    @Write$qm4Text; Write(var f: Text)
203E0: call    @__IOCheck$qv; Exit if error
203E5: mov     [bp+var_2], 1
203EA: cmp     word_27E66, 8
203EF: jnz     short loc_2042A
203F1: mov     ax, word_27E72
203F4: add     ax, 22h ; '"'
203F7: cwd
203F8: mov     di, 1371h
203FB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20400: push    ax
20401: mov     al, 13h
20403: push    ax
20404: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20409: mov     di, offset unk_2F60A
2040C: push    ds
2040D: push    di
2040E: mov     di, offset aSh; "Sh"
20411: push    cs
20412: push    di
20413: xor     ax, ax
20415: push    ax
20416: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2041B: call    @Write$qm4Text; Write(var f: Text)
20420: call    @__IOCheck$qv; Exit if error
20425: mov     [bp+var_2], 1
2042A: cmp     word_27E62, 8
2042F: jnz     short loc_2046A
20431: mov     ax, word_27E72
20434: add     ax, 23h ; '#'
20437: cwd
20438: mov     di, 1371h
2043B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20440: push    ax
20441: mov     al, 14h
20443: push    ax
20444: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20449: mov     di, offset unk_2F60A
2044C: push    ds
2044D: push    di
2044E: mov     di, offset aKu; "Ku"
20451: push    cs
20452: push    di
20453: xor     ax, ax
20455: push    ax
20456: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2045B: call    @Write$qm4Text; Write(var f: Text)
20460: call    @__IOCheck$qv; Exit if error
20465: mov     [bp+var_2], 1
2046A: cmp     word_27E5E, 8
2046F: jnz     short loc_204AA
20471: mov     ax, word_27E72
20474: add     ax, 1Bh
20477: cwd
20478: mov     di, 1371h
2047B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20480: push    ax
20481: mov     al, 13h
20483: push    ax
20484: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20489: mov     di, offset unk_2F60A
2048C: push    ds
2048D: push    di
2048E: mov     di, offset aBu; "Bu"
20491: push    cs
20492: push    di
20493: xor     ax, ax
20495: push    ax
20496: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2049B: call    @Write$qm4Text; Write(var f: Text)
204A0: call    @__IOCheck$qv; Exit if error
204A5: mov     [bp+var_2], 1
204AA: cmp     word_27E5A, 8
204AF: jnz     short loc_204EA
204B1: mov     ax, word_27E72
204B4: add     ax, 1Bh
204B7: cwd
204B8: mov     di, 1371h
204BB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
204C0: push    ax
204C1: mov     al, 14h
204C3: push    ax
204C4: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
204C9: mov     di, offset unk_2F60A
204CC: push    ds
204CD: push    di
204CE: mov     di, offset aCh; "Ch"
204D1: push    cs
204D2: push    di
204D3: xor     ax, ax
204D5: push    ax
204D6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
204DB: call    @Write$qm4Text; Write(var f: Text)
204E0: call    @__IOCheck$qv; Exit if error
204E5: mov     [bp+var_2], 1
204EA: cmp     word_27E60, 8
204EF: jnz     short loc_2052A
204F1: mov     ax, word_27E72
204F4: add     ax, 1Bh
204F7: cwd
204F8: mov     di, 1371h
204FB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20500: push    ax
20501: mov     al, 12h
20503: push    ax
20504: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20509: mov     di, offset unk_2F60A
2050C: push    ds
2050D: push    di
2050E: mov     di, offset aSi; "Si"
20511: push    cs
20512: push    di
20513: xor     ax, ax
20515: push    ax
20516: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2051B: call    @Write$qm4Text; Write(var f: Text)
20520: call    @__IOCheck$qv; Exit if error
20525: mov     [bp+var_2], 1
2052A: cmp     word_27E68, 8
2052F: jnz     short loc_2056A
20531: mov     ax, word_27E72
20534: add     ax, 1Fh
20537: cwd
20538: mov     di, 1371h
2053B: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20540: push    ax
20541: mov     al, 14h
20543: push    ax
20544: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20549: mov     di, offset unk_2F60A
2054C: push    ds
2054D: push    di
2054E: mov     di, offset aRa; "Ra"
20551: push    cs
20552: push    di
20553: xor     ax, ax
20555: push    ax
20556: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
2055B: call    @Write$qm4Text; Write(var f: Text)
20560: call    @__IOCheck$qv; Exit if error
20565: mov     [bp+var_2], 1
2056A: cmp     [bp+var_2], 1
2056E: jz      short loc_205A2
20570: mov     ax, word_27E72
20573: add     ax, 1Fh
20576: cwd
20577: mov     di, 1371h
2057A: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2057F: push    ax
20580: mov     al, 13h
20582: push    ax
20583: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20588: mov     di, offset unk_2F60A
2058B: push    ds
2058C: push    di
2058D: mov     al, 38h ; '8'
2058F: push    ax
20590: xor     ax, ax
20592: push    ax
20593: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
20598: call    @Write$qm4Text; Write(var f: Text)
2059D: call    @__IOCheck$qv; Exit if error
205A2: xor     ax, ax
205A4: mov     [bp+var_2], ax
205A7: cmp     word_27E6A, 9
205AC: jnz     short loc_205E7
205AE: mov     ax, word_27E72
205B1: add     ax, 25h ; '%'
205B4: cwd
205B5: mov     di, 1371h
205B8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
205BD: push    ax
205BE: mov     al, 0Fh
205C0: push    ax
205C1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
205C6: mov     di, offset unk_2F60A
205C9: push    ds
205CA: push    di
205CB: mov     di, offset aKe; "Ke"
205CE: push    cs
205CF: push    di
205D0: xor     ax, ax
205D2: push    ax
205D3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
205D8: call    @Write$qm4Text; Write(var f: Text)
205DD: call    @__IOCheck$qv; Exit if error
205E2: mov     [bp+var_2], 1
205E7: cmp     word_27E64, 9
205EC: jnz     short loc_20627
205EE: mov     ax, word_27E72
205F1: add     ax, 1Fh
205F4: cwd
205F5: mov     di, 1371h
205F8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
205FD: push    ax
205FE: mov     al, 10h
20600: push    ax
20601: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20606: mov     di, offset unk_2F60A
20609: push    ds
2060A: push    di
2060B: mov     di, offset aGu; "Gu"
2060E: push    cs
2060F: push    di
20610: xor     ax, ax
20612: push    ax
20613: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20618: call    @Write$qm4Text; Write(var f: Text)
2061D: call    @__IOCheck$qv; Exit if error
20622: mov     [bp+var_2], 1
20627: cmp     word_27E5C, 9
2062C: jnz     short loc_20667
2062E: mov     ax, word_27E72
20631: add     ax, 22h ; '"'
20634: cwd
20635: mov     di, 1371h
20638: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2063D: push    ax
2063E: mov     al, 10h
20640: push    ax
20641: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20646: mov     di, offset unk_2F60A
20649: push    ds
2064A: push    di
2064B: mov     di, offset aRv; "Rv"
2064E: push    cs
2064F: push    di
20650: xor     ax, ax
20652: push    ax
20653: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20658: call    @Write$qm4Text; Write(var f: Text)
2065D: call    @__IOCheck$qv; Exit if error
20662: mov     [bp+var_2], 1
20667: cmp     word_27E66, 9
2066C: jnz     short loc_206A7
2066E: mov     ax, word_27E72
20671: add     ax, 26h ; '&'
20674: cwd
20675: mov     di, 1371h
20678: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2067D: push    ax
2067E: mov     al, 10h
20680: push    ax
20681: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20686: mov     di, offset unk_2F60A
20689: push    ds
2068A: push    di
2068B: mov     di, offset aSh; "Sh"
2068E: push    cs
2068F: push    di
20690: xor     ax, ax
20692: push    ax
20693: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20698: call    @Write$qm4Text; Write(var f: Text)
2069D: call    @__IOCheck$qv; Exit if error
206A2: mov     [bp+var_2], 1
206A7: cmp     word_27E62, 9
206AC: jnz     short loc_206E7
206AE: mov     ax, word_27E72
206B1: add     ax, 22h ; '"'
206B4: cwd
206B5: mov     di, 1371h
206B8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
206BD: push    ax
206BE: mov     al, 11h
206C0: push    ax
206C1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
206C6: mov     di, offset unk_2F60A
206C9: push    ds
206CA: push    di
206CB: mov     di, offset aKu; "Ku"
206CE: push    cs
206CF: push    di
206D0: xor     ax, ax
206D2: push    ax
206D3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
206D8: call    @Write$qm4Text; Write(var f: Text)
206DD: call    @__IOCheck$qv; Exit if error
206E2: mov     [bp+var_2], 1
206E7: cmp     word_27E5E, 9
206EC: jnz     short loc_20727
206EE: mov     ax, word_27E72
206F1: add     ax, 26h ; '&'
206F4: cwd
206F5: mov     di, 1371h
206F8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
206FD: push    ax
206FE: mov     al, 11h
20700: push    ax
20701: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20706: mov     di, offset unk_2F60A
20709: push    ds
2070A: push    di
2070B: mov     di, offset aBu; "Bu"
2070E: push    cs
2070F: push    di
20710: xor     ax, ax
20712: push    ax
20713: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20718: call    @Write$qm4Text; Write(var f: Text)
2071D: call    @__IOCheck$qv; Exit if error
20722: mov     [bp+var_2], 1
20727: cmp     word_27E5A, 9
2072C: jnz     short loc_20767
2072E: mov     ax, word_27E72
20731: add     ax, 25h ; '%'
20734: cwd
20735: mov     di, 1371h
20738: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2073D: push    ax
2073E: mov     al, 13h
20740: push    ax
20741: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20746: mov     di, offset unk_2F60A
20749: push    ds
2074A: push    di
2074B: mov     di, offset aCh; "Ch"
2074E: push    cs
2074F: push    di
20750: xor     ax, ax
20752: push    ax
20753: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20758: call    @Write$qm4Text; Write(var f: Text)
2075D: call    @__IOCheck$qv; Exit if error
20762: mov     [bp+var_2], 1
20767: cmp     word_27E60, 9
2076C: jnz     short loc_207A7
2076E: mov     ax, word_27E72
20771: add     ax, 23h ; '#'
20774: cwd
20775: mov     di, 1371h
20778: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2077D: push    ax
2077E: mov     al, 12h
20780: push    ax
20781: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20786: mov     di, offset unk_2F60A
20789: push    ds
2078A: push    di
2078B: mov     di, offset aSi; "Si"
2078E: push    cs
2078F: push    di
20790: xor     ax, ax
20792: push    ax
20793: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20798: call    @Write$qm4Text; Write(var f: Text)
2079D: call    @__IOCheck$qv; Exit if error
207A2: mov     [bp+var_2], 1
207A7: cmp     word_27E68, 9
207AC: jnz     short loc_207E7
207AE: mov     ax, word_27E72
207B1: add     ax, 26h ; '&'
207B4: cwd
207B5: mov     di, 1371h
207B8: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
207BD: push    ax
207BE: mov     al, 12h
207C0: push    ax
207C1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
207C6: mov     di, offset unk_2F60A
207C9: push    ds
207CA: push    di
207CB: mov     di, offset aRa; "Ra"
207CE: push    cs
207CF: push    di
207D0: xor     ax, ax
207D2: push    ax
207D3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
207D8: call    @Write$qm4Text; Write(var f: Text)
207DD: call    @__IOCheck$qv; Exit if error
207E2: mov     [bp+var_2], 1
207E7: cmp     [bp+var_2], 1
207EB: jz      short loc_2081F
207ED: mov     ax, word_27E72
207F0: add     ax, 23h ; '#'
207F3: cwd
207F4: mov     di, 1371h
207F7: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
207FC: push    ax
207FD: mov     al, 11h
207FF: push    ax
20800: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20805: mov     di, offset unk_2F60A
20808: push    ds
20809: push    di
2080A: mov     al, 39h ; '9'
2080C: push    ax
2080D: xor     ax, ax
2080F: push    ax
20810: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
20815: call    @Write$qm4Text; Write(var f: Text)
2081A: call    @__IOCheck$qv; Exit if error
2081F: xor     ax, ax
20821: mov     [bp+var_2], ax
20824: cmp     word_27E6A, 0Ah
20829: jnz     short loc_20864
2082B: mov     ax, word_27E72
2082E: add     ax, 1Ch
20831: cwd
20832: mov     di, 1371h
20835: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2083A: push    ax
2083B: mov     al, 9
2083D: push    ax
2083E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20843: mov     di, offset unk_2F60A
20846: push    ds
20847: push    di
20848: mov     di, offset aKe; "Ke"
2084B: push    cs
2084C: push    di
2084D: xor     ax, ax
2084F: push    ax
20850: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20855: call    @Write$qm4Text; Write(var f: Text)
2085A: call    @__IOCheck$qv; Exit if error
2085F: mov     [bp+var_2], 1
20864: cmp     word_27E64, 0Ah
20869: jnz     short loc_208A4
2086B: mov     ax, word_27E72
2086E: add     ax, 1Ch
20871: cwd
20872: mov     di, 1371h
20875: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2087A: push    ax
2087B: mov     al, 0Dh
2087D: push    ax
2087E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20883: mov     di, offset unk_2F60A
20886: push    ds
20887: push    di
20888: mov     di, offset aGu; "Gu"
2088B: push    cs
2088C: push    di
2088D: xor     ax, ax
2088F: push    ax
20890: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20895: call    @Write$qm4Text; Write(var f: Text)
2089A: call    @__IOCheck$qv; Exit if error
2089F: mov     [bp+var_2], 1
208A4: cmp     word_27E5C, 0Ah
208A9: jnz     short loc_208E4
208AB: mov     ax, word_27E72
208AE: add     ax, 1Ch
208B1: cwd
208B2: mov     di, 1371h
208B5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
208BA: push    ax
208BB: mov     al, 0Ah
208BD: push    ax
208BE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
208C3: mov     di, offset unk_2F60A
208C6: push    ds
208C7: push    di
208C8: mov     di, offset aRv; "Rv"
208CB: push    cs
208CC: push    di
208CD: xor     ax, ax
208CF: push    ax
208D0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
208D5: call    @Write$qm4Text; Write(var f: Text)
208DA: call    @__IOCheck$qv; Exit if error
208DF: mov     [bp+var_2], 1
208E4: cmp     word_27E66, 0Ah
208E9: jnz     short loc_20924
208EB: mov     ax, word_27E72
208EE: add     ax, 21h ; '!'
208F1: cwd
208F2: mov     di, 1371h
208F5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
208FA: push    ax
208FB: mov     al, 0Dh
208FD: push    ax
208FE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20903: mov     di, offset unk_2F60A
20906: push    ds
20907: push    di
20908: mov     di, offset aSh; "Sh"
2090B: push    cs
2090C: push    di
2090D: xor     ax, ax
2090F: push    ax
20910: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20915: call    @Write$qm4Text; Write(var f: Text)
2091A: call    @__IOCheck$qv; Exit if error
2091F: mov     [bp+var_2], 1
20924: cmp     word_27E62, 0Ah
20929: jnz     short loc_20964
2092B: mov     ax, word_27E72
2092E: add     ax, 21h ; '!'
20931: cwd
20932: mov     di, 1371h
20935: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2093A: push    ax
2093B: mov     al, 0Ch
2093D: push    ax
2093E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20943: mov     di, offset unk_2F60A
20946: push    ds
20947: push    di
20948: mov     di, offset aKu; "Ku"
2094B: push    cs
2094C: push    di
2094D: xor     ax, ax
2094F: push    ax
20950: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20955: call    @Write$qm4Text; Write(var f: Text)
2095A: call    @__IOCheck$qv; Exit if error
2095F: mov     [bp+var_2], 1
20964: cmp     word_27E5E, 0Ah
20969: jnz     short loc_209A4
2096B: mov     ax, word_27E72
2096E: add     ax, 1Ch
20971: cwd
20972: mov     di, 1371h
20975: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
2097A: push    ax
2097B: mov     al, 0Ch
2097D: push    ax
2097E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20983: mov     di, offset unk_2F60A
20986: push    ds
20987: push    di
20988: mov     di, offset aBu; "Bu"
2098B: push    cs
2098C: push    di
2098D: xor     ax, ax
2098F: push    ax
20990: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20995: call    @Write$qm4Text; Write(var f: Text)
2099A: call    @__IOCheck$qv; Exit if error
2099F: mov     [bp+var_2], 1
209A4: cmp     word_27E5A, 0Ah
209A9: jnz     short loc_209E4
209AB: mov     ax, word_27E72
209AE: add     ax, 21h ; '!'
209B1: cwd
209B2: mov     di, 1371h
209B5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
209BA: push    ax
209BB: mov     al, 0Bh
209BD: push    ax
209BE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
209C3: mov     di, offset unk_2F60A
209C6: push    ds
209C7: push    di
209C8: mov     di, offset aCh; "Ch"
209CB: push    cs
209CC: push    di
209CD: xor     ax, ax
209CF: push    ax
209D0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
209D5: call    @Write$qm4Text; Write(var f: Text)
209DA: call    @__IOCheck$qv; Exit if error
209DF: mov     [bp+var_2], 1
209E4: cmp     word_27E60, 0Ah
209E9: jnz     short loc_20A24
209EB: mov     ax, word_27E72
209EE: add     ax, 21h ; '!'
209F1: cwd
209F2: mov     di, 1371h
209F5: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
209FA: push    ax
209FB: mov     al, 0Ah
209FD: push    ax
209FE: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20A03: mov     di, offset unk_2F60A
20A06: push    ds
20A07: push    di
20A08: mov     di, offset aSi; "Si"
20A0B: push    cs
20A0C: push    di
20A0D: xor     ax, ax
20A0F: push    ax
20A10: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20A15: call    @Write$qm4Text; Write(var f: Text)
20A1A: call    @__IOCheck$qv; Exit if error
20A1F: mov     [bp+var_2], 1
20A24: cmp     word_27E68, 0Ah
20A29: jnz     short loc_20A64
20A2B: mov     ax, word_27E72
20A2E: add     ax, 1Ch
20A31: cwd
20A32: mov     di, 1371h
20A35: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20A3A: push    ax
20A3B: mov     al, 0Bh
20A3D: push    ax
20A3E: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20A43: mov     di, offset unk_2F60A
20A46: push    ds
20A47: push    di
20A48: mov     di, offset aRa; "Ra"
20A4B: push    cs
20A4C: push    di
20A4D: xor     ax, ax
20A4F: push    ax
20A50: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20A55: call    @Write$qm4Text; Write(var f: Text)
20A5A: call    @__IOCheck$qv; Exit if error
20A5F: mov     [bp+var_2], 1
20A64: cmp     [bp+var_2], 1
20A68: jz      short loc_20A9E
20A6A: mov     ax, word_27E72
20A6D: add     ax, 21h ; '!'
20A70: cwd
20A71: mov     di, 1371h
20A74: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20A79: push    ax
20A7A: mov     al, 0Bh
20A7C: push    ax
20A7D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20A82: mov     di, offset unk_2F60A
20A85: push    ds
20A86: push    di
20A87: mov     di, offset a10; "10"
20A8A: push    cs
20A8B: push    di
20A8C: xor     ax, ax
20A8E: push    ax
20A8F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20A94: call    @Write$qm4Text; Write(var f: Text)
20A99: call    @__IOCheck$qv; Exit if error
20A9E: xor     ax, ax
20AA0: mov     [bp+var_2], ax
20AA3: cmp     word_27E6A, 0Bh
20AA8: jnz     short loc_20AE3
20AAA: mov     ax, word_27E72
20AAD: add     ax, 24h ; '$'
20AB0: cwd
20AB1: mov     di, 1371h
20AB4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20AB9: push    ax
20ABA: mov     al, 4
20ABC: push    ax
20ABD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20AC2: mov     di, offset unk_2F60A
20AC5: push    ds
20AC6: push    di
20AC7: mov     di, offset aKe; "Ke"
20ACA: push    cs
20ACB: push    di
20ACC: xor     ax, ax
20ACE: push    ax
20ACF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20AD4: call    @Write$qm4Text; Write(var f: Text)
20AD9: call    @__IOCheck$qv; Exit if error
20ADE: mov     [bp+var_2], 1
20AE3: cmp     word_27E64, 0Bh
20AE8: jnz     short loc_20B23
20AEA: mov     ax, word_27E72
20AED: add     ax, 25h ; '%'
20AF0: cwd
20AF1: mov     di, 1371h
20AF4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20AF9: push    ax
20AFA: mov     al, 3
20AFC: push    ax
20AFD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20B02: mov     di, offset unk_2F60A
20B05: push    ds
20B06: push    di
20B07: mov     di, offset aGu; "Gu"
20B0A: push    cs
20B0B: push    di
20B0C: xor     ax, ax
20B0E: push    ax
20B0F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20B14: call    @Write$qm4Text; Write(var f: Text)
20B19: call    @__IOCheck$qv; Exit if error
20B1E: mov     [bp+var_2], 1
20B23: cmp     word_27E5C, 0Bh
20B28: jnz     short loc_20B63
20B2A: mov     ax, word_27E72
20B2D: add     ax, 21h ; '!'
20B30: cwd
20B31: mov     di, 1371h
20B34: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20B39: push    ax
20B3A: mov     al, 5
20B3C: push    ax
20B3D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20B42: mov     di, offset unk_2F60A
20B45: push    ds
20B46: push    di
20B47: mov     di, offset aRv; "Rv"
20B4A: push    cs
20B4B: push    di
20B4C: xor     ax, ax
20B4E: push    ax
20B4F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20B54: call    @Write$qm4Text; Write(var f: Text)
20B59: call    @__IOCheck$qv; Exit if error
20B5E: mov     [bp+var_2], 1
20B63: cmp     word_27E66, 0Bh
20B68: jnz     short loc_20BA3
20B6A: mov     ax, word_27E72
20B6D: add     ax, 25h ; '%'
20B70: cwd
20B71: mov     di, 1371h
20B74: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20B79: push    ax
20B7A: mov     al, 5
20B7C: push    ax
20B7D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20B82: mov     di, offset unk_2F60A
20B85: push    ds
20B86: push    di
20B87: mov     di, offset aSh; "Sh"
20B8A: push    cs
20B8B: push    di
20B8C: xor     ax, ax
20B8E: push    ax
20B8F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20B94: call    @Write$qm4Text; Write(var f: Text)
20B99: call    @__IOCheck$qv; Exit if error
20B9E: mov     [bp+var_2], 1
20BA3: cmp     word_27E62, 0Bh
20BA8: jnz     short loc_20BE3
20BAA: mov     ax, word_27E72
20BAD: add     ax, 20h ; ' '
20BB0: cwd
20BB1: mov     di, 1371h
20BB4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20BB9: push    ax
20BBA: mov     al, 6
20BBC: push    ax
20BBD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20BC2: mov     di, offset unk_2F60A
20BC5: push    ds
20BC6: push    di
20BC7: mov     di, offset aKu; "Ku"
20BCA: push    cs
20BCB: push    di
20BCC: xor     ax, ax
20BCE: push    ax
20BCF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20BD4: call    @Write$qm4Text; Write(var f: Text)
20BD9: call    @__IOCheck$qv; Exit if error
20BDE: mov     [bp+var_2], 1
20BE3: cmp     word_27E5E, 0Bh
20BE8: jnz     short loc_20C23
20BEA: mov     ax, word_27E72
20BED: add     ax, 1Dh
20BF0: cwd
20BF1: mov     di, 1371h
20BF4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20BF9: push    ax
20BFA: mov     al, 7
20BFC: push    ax
20BFD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20C02: mov     di, offset unk_2F60A
20C05: push    ds
20C06: push    di
20C07: mov     di, offset aBu; "Bu"
20C0A: push    cs
20C0B: push    di
20C0C: xor     ax, ax
20C0E: push    ax
20C0F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20C14: call    @Write$qm4Text; Write(var f: Text)
20C19: call    @__IOCheck$qv; Exit if error
20C1E: mov     [bp+var_2], 1
20C23: cmp     word_27E5A, 0Bh
20C28: jnz     short loc_20C63
20C2A: mov     ax, word_27E72
20C2D: add     ax, 21h ; '!'
20C30: cwd
20C31: mov     di, 1371h
20C34: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20C39: push    ax
20C3A: mov     al, 7
20C3C: push    ax
20C3D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20C42: mov     di, offset unk_2F60A
20C45: push    ds
20C46: push    di
20C47: mov     di, offset aCh; "Ch"
20C4A: push    cs
20C4B: push    di
20C4C: xor     ax, ax
20C4E: push    ax
20C4F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20C54: call    @Write$qm4Text; Write(var f: Text)
20C59: call    @__IOCheck$qv; Exit if error
20C5E: mov     [bp+var_2], 1
20C63: cmp     word_27E60, 0Bh
20C68: jnz     short loc_20CA3
20C6A: mov     ax, word_27E72
20C6D: add     ax, 25h ; '%'
20C70: cwd
20C71: mov     di, 1371h
20C74: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20C79: push    ax
20C7A: mov     al, 7
20C7C: push    ax
20C7D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20C82: mov     di, offset unk_2F60A
20C85: push    ds
20C86: push    di
20C87: mov     di, offset aSi; "Si"
20C8A: push    cs
20C8B: push    di
20C8C: xor     ax, ax
20C8E: push    ax
20C8F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20C94: call    @Write$qm4Text; Write(var f: Text)
20C99: call    @__IOCheck$qv; Exit if error
20C9E: mov     [bp+var_2], 1
20CA3: cmp     word_27E68, 0Bh
20CA8: jnz     short loc_20CE3
20CAA: mov     ax, word_27E72
20CAD: add     ax, 24h ; '$'
20CB0: cwd
20CB1: mov     di, 1371h
20CB4: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20CB9: push    ax
20CBA: mov     al, 6
20CBC: push    ax
20CBD: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20CC2: mov     di, offset unk_2F60A
20CC5: push    ds
20CC6: push    di
20CC7: mov     di, offset aRa; "Ra"
20CCA: push    cs
20CCB: push    di
20CCC: xor     ax, ax
20CCE: push    ax
20CCF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20CD4: call    @Write$qm4Text; Write(var f: Text)
20CD9: call    @__IOCheck$qv; Exit if error
20CDE: mov     [bp+var_2], 1
20CE3: cmp     [bp+var_2], 1
20CE7: jz      short loc_20D1D
20CE9: mov     ax, word_27E72
20CEC: add     ax, 22h ; '"'
20CEF: cwd
20CF0: mov     di, 1371h
20CF3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20CF8: push    ax
20CF9: mov     al, 6
20CFB: push    ax
20CFC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20D01: mov     di, offset unk_2F60A
20D04: push    ds
20D05: push    di
20D06: mov     di, offset a11; "11"
20D09: push    cs
20D0A: push    di
20D0B: xor     ax, ax
20D0D: push    ax
20D0E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20D13: call    @Write$qm4Text; Write(var f: Text)
20D18: call    @__IOCheck$qv; Exit if error
20D1D: xor     ax, ax
20D1F: mov     [bp+var_2], ax
20D22: cmp     word_27E6A, 0Ch
20D27: jnz     short loc_20D62
20D29: mov     ax, word_27E72
20D2C: add     ax, 1Fh
20D2F: cwd
20D30: mov     di, 1371h
20D33: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20D38: push    ax
20D39: mov     al, 2
20D3B: push    ax
20D3C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20D41: mov     di, offset unk_2F60A
20D44: push    ds
20D45: push    di
20D46: mov     di, offset aKe; "Ke"
20D49: push    cs
20D4A: push    di
20D4B: xor     ax, ax
20D4D: push    ax
20D4E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20D53: call    @Write$qm4Text; Write(var f: Text)
20D58: call    @__IOCheck$qv; Exit if error
20D5D: mov     [bp+var_2], 1
20D62: cmp     word_27E64, 0Ch
20D67: jnz     short loc_20DA2
20D69: mov     ax, word_27E72
20D6C: add     ax, 1Bh
20D6F: cwd
20D70: mov     di, 1371h
20D73: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20D78: push    ax
20D79: mov     al, 2
20D7B: push    ax
20D7C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20D81: mov     di, offset unk_2F60A
20D84: push    ds
20D85: push    di
20D86: mov     di, offset aGu; "Gu"
20D89: push    cs
20D8A: push    di
20D8B: xor     ax, ax
20D8D: push    ax
20D8E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20D93: call    @Write$qm4Text; Write(var f: Text)
20D98: call    @__IOCheck$qv; Exit if error
20D9D: mov     [bp+var_2], 1
20DA2: cmp     word_27E5C, 0Ch
20DA7: jnz     short loc_20DE2
20DA9: mov     ax, word_27E72
20DAC: add     ax, 23h ; '#'
20DAF: cwd
20DB0: mov     di, 1371h
20DB3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20DB8: push    ax
20DB9: mov     al, 2
20DBB: push    ax
20DBC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20DC1: mov     di, offset unk_2F60A
20DC4: push    ds
20DC5: push    di
20DC6: mov     di, offset aRv; "Rv"
20DC9: push    cs
20DCA: push    di
20DCB: xor     ax, ax
20DCD: push    ax
20DCE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20DD3: call    @Write$qm4Text; Write(var f: Text)
20DD8: call    @__IOCheck$qv; Exit if error
20DDD: mov     [bp+var_2], 1
20DE2: cmp     word_27E66, 0Ch
20DE7: jnz     short loc_20E22
20DE9: mov     ax, word_27E72
20DEC: add     ax, 1Bh
20DEF: cwd
20DF0: mov     di, 1371h
20DF3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20DF8: push    ax
20DF9: mov     al, 3
20DFB: push    ax
20DFC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20E01: mov     di, offset unk_2F60A
20E04: push    ds
20E05: push    di
20E06: mov     di, offset aSh; "Sh"
20E09: push    cs
20E0A: push    di
20E0B: xor     ax, ax
20E0D: push    ax
20E0E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20E13: call    @Write$qm4Text; Write(var f: Text)
20E18: call    @__IOCheck$qv; Exit if error
20E1D: mov     [bp+var_2], 1
20E22: cmp     word_27E62, 0Ch
20E27: jnz     short loc_20E62
20E29: mov     ax, word_27E72
20E2C: add     ax, 20h ; ' '
20E2F: cwd
20E30: mov     di, 1371h
20E33: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20E38: push    ax
20E39: mov     al, 3
20E3B: push    ax
20E3C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20E41: mov     di, offset unk_2F60A
20E44: push    ds
20E45: push    di
20E46: mov     di, offset aKu; "Ku"
20E49: push    cs
20E4A: push    di
20E4B: xor     ax, ax
20E4D: push    ax
20E4E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20E53: call    @Write$qm4Text; Write(var f: Text)
20E58: call    @__IOCheck$qv; Exit if error
20E5D: mov     [bp+var_2], 1
20E62: cmp     word_27E5E, 0Ch
20E67: jnz     short loc_20EA2
20E69: mov     ax, word_27E72
20E6C: add     ax, 1Fh
20E6F: cwd
20E70: mov     di, 1371h
20E73: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20E78: push    ax
20E79: mov     al, 4
20E7B: push    ax
20E7C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20E81: mov     di, offset unk_2F60A
20E84: push    ds
20E85: push    di
20E86: mov     di, offset aBu; "Bu"
20E89: push    cs
20E8A: push    di
20E8B: xor     ax, ax
20E8D: push    ax
20E8E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20E93: call    @Write$qm4Text; Write(var f: Text)
20E98: call    @__IOCheck$qv; Exit if error
20E9D: mov     [bp+var_2], 1
20EA2: cmp     word_27E5A, 0Ch
20EA7: jnz     short loc_20EE2
20EA9: mov     ax, word_27E72
20EAC: add     ax, 1Ch
20EAF: cwd
20EB0: mov     di, 1371h
20EB3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20EB8: push    ax
20EB9: mov     al, 5
20EBB: push    ax
20EBC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20EC1: mov     di, offset unk_2F60A
20EC4: push    ds
20EC5: push    di
20EC6: mov     di, offset aCh; "Ch"
20EC9: push    cs
20ECA: push    di
20ECB: xor     ax, ax
20ECD: push    ax
20ECE: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20ED3: call    @Write$qm4Text; Write(var f: Text)
20ED8: call    @__IOCheck$qv; Exit if error
20EDD: mov     [bp+var_2], 1
20EE2: cmp     word_27E60, 0Ch
20EE7: jnz     short loc_20F22
20EE9: mov     ax, word_27E72
20EEC: add     ax, 1Bh
20EEF: cwd
20EF0: mov     di, 1371h
20EF3: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20EF8: push    ax
20EF9: mov     al, 4
20EFB: push    ax
20EFC: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20F01: mov     di, offset unk_2F60A
20F04: push    ds
20F05: push    di
20F06: mov     di, offset aSi; "Si"
20F09: push    cs
20F0A: push    di
20F0B: xor     ax, ax
20F0D: push    ax
20F0E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20F13: call    @Write$qm4Text; Write(var f: Text)
20F18: call    @__IOCheck$qv; Exit if error
20F1D: mov     [bp+var_2], 1
20F22: cmp     word_27E68, 0Ch
20F27: jnz     short loc_20F62
20F29: mov     ax, word_27E72
20F2C: add     ax, 1Bh
20F2F: cwd
20F30: mov     di, 1371h
20F33: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20F38: push    ax
20F39: mov     al, 6
20F3B: push    ax
20F3C: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20F41: mov     di, offset unk_2F60A
20F44: push    ds
20F45: push    di
20F46: mov     di, offset aRa; "Ra"
20F49: push    cs
20F4A: push    di
20F4B: xor     ax, ax
20F4D: push    ax
20F4E: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20F53: call    @Write$qm4Text; Write(var f: Text)
20F58: call    @__IOCheck$qv; Exit if error
20F5D: mov     [bp+var_2], 1
20F62: cmp     [bp+var_2], 1
20F66: jz      short loc_20F9C
20F68: mov     ax, word_27E72
20F6B: add     ax, 1Ch
20F6E: cwd
20F6F: mov     di, 1371h
20F72: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20F77: push    ax
20F78: mov     al, 3
20F7A: push    ax
20F7B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20F80: mov     di, offset unk_2F60A
20F83: push    ds
20F84: push    di
20F85: mov     di, offset a12; "12"
20F88: push    cs
20F89: push    di
20F8A: xor     ax, ax
20F8C: push    ax
20F8D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20F92: call    @Write$qm4Text; Write(var f: Text)
20F97: call    @__IOCheck$qv; Exit if error
20F9C: xor     ax, ax
20F9E: mov     [bp+var_2], ax
20FA1: mov     ax, word_27E72
20FA4: add     ax, 10h
20FA7: cwd
20FA8: mov     di, 1371h
20FAB: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20FB0: push    ax
20FB1: mov     al, 0Ch
20FB3: push    ax
20FB4: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20FB9: mov     di, offset unk_2F60A
20FBC: push    ds
20FBD: push    di
20FBE: mov     di, offset unk_2B118
20FC1: push    ds
20FC2: push    di
20FC3: xor     ax, ax
20FC5: push    ax
20FC6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20FCB: call    @Write$qm4Text; Write(var f: Text)
20FD0: call    @__IOCheck$qv; Exit if error
20FD5: mov     ax, word_27E72
20FD8: add     ax, 10h
20FDB: cwd
20FDC: mov     di, 1371h
20FDF: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
20FE4: push    ax
20FE5: mov     al, 0Bh
20FE7: push    ax
20FE8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
20FED: mov     di, offset unk_2F60A
20FF0: push    ds
20FF1: push    di
20FF2: mov     di, offset unk_28218
20FF5: push    ds
20FF6: push    di
20FF7: xor     ax, ax
20FF9: push    ax
20FFA: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
20FFF: call    @Write$qm4Text; Write(var f: Text)
21004: call    @__IOCheck$qv; Exit if error
21009: mov     al, 1
2100B: push    ax
2100C: mov     al, 17h
2100E: push    ax
2100F: mov     al, 50h ; 'P'
21011: push    ax
21012: mov     al, 19h
21014: push    ax
21015: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
2101A: mov     al, 1
2101C: push    ax
2101D: mov     al, 18h
2101F: push    ax
21020: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
21025: mov     di, offset unk_2F60A
21028: push    ds
21029: push    di
2102A: mov     di, offset unk_2B218
2102D: push    ds
2102E: push    di
2102F: xor     ax, ax
21031: push    ax
21032: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
21037: call    @Write$qm4Text; Write(var f: Text)
2103C: call    @__IOCheck$qv; Exit if error
21041: mov     al, 1
21043: push    ax
21044: mov     al, 1
21046: push    ax
21047: mov     al, 50h ; 'P'
21049: push    ax
2104A: mov     al, 19h
2104C: push    ax
2104D: call    @WINDOW$q4BYTEt1t1t1; WINDOW(BYTE,BYTE,BYTE,BYTE)
21052: mov     al, 1
21054: push    ax
21055: mov     al, 19h
21057: push    ax
21058: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
2105D: mov     sp, bp
2105F: pop     bp
21060: retf
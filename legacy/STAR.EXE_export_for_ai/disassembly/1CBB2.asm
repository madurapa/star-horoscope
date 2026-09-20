/*
 * func-name: sub_1CBB2
 * func-address: 0x1cbb2
 * export-type: disassembly-fallback
 * callers: 0x10a46
 * callees: 0x25b25, 0x263ee, 0x263fc, 0x26424, 0x264f1, 0x2650b, 0x2657e, 0x27662, 0x27681, 0x276c5, 0x2772a
 * fallback-reason: decompile returned None
 */

1CBB2: push    bp
1CBB3: mov     bp, sp
1CBB5: mov     ax, 500h
1CBB8: call    @__StackCheck$q4Word; Stack overflow check (AX)
1CBBD: sub     sp, 500h
1CBC1: mov     di, offset byte_1CB09
1CBC4: push    cs
1CBC5: push    di
1CBC6: lea     di, [bp+var_100]
1CBCA: push    ss
1CBCB: push    di
1CBCC: mov     ax, 0FFh
1CBCF: push    ax
1CBD0: call    @$basg$qm6Stringt14Byte; Store string
1CBD5: lea     di, [bp+var_500]
1CBD9: push    ss
1CBDA: push    di
1CBDB: lea     di, [bp+var_100]
1CBDF: push    ss
1CBE0: push    di
1CBE1: call    @$basg$qm6Stringt1; Load string
1CBE6: lea     di, [bp+var_100]
1CBEA: push    ss
1CBEB: push    di
1CBEC: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CBF1: lea     di, [bp+var_100]
1CBF5: push    ss
1CBF6: push    di
1CBF7: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CBFC: lea     di, [bp+var_100]
1CC00: push    ss
1CC01: push    di
1CC02: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC07: lea     di, [bp+var_100]
1CC0B: push    ss
1CC0C: push    di
1CC0D: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC12: lea     di, [bp+var_100]
1CC16: push    ss
1CC17: push    di
1CC18: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC1D: lea     di, [bp+var_100]
1CC21: push    ss
1CC22: push    di
1CC23: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC28: lea     di, [bp+var_100]
1CC2C: push    ss
1CC2D: push    di
1CC2E: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC33: lea     di, [bp+var_100]
1CC37: push    ss
1CC38: push    di
1CC39: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC3E: lea     di, [bp+var_100]
1CC42: push    ss
1CC43: push    di
1CC44: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC49: lea     di, [bp+var_100]
1CC4D: push    ss
1CC4E: push    di
1CC4F: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC54: lea     di, [bp+var_100]
1CC58: push    ss
1CC59: push    di
1CC5A: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC5F: lea     di, [bp+var_100]
1CC63: push    ss
1CC64: push    di
1CC65: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC6A: lea     di, [bp+var_200]
1CC6E: push    ss
1CC6F: push    di
1CC70: mov     ax, 0FFh
1CC73: push    ax
1CC74: call    @$basg$qm6Stringt14Byte; Store string
1CC79: lea     di, [bp+var_500]
1CC7D: push    ss
1CC7E: push    di
1CC7F: lea     di, [bp+var_100]
1CC83: push    ss
1CC84: push    di
1CC85: call    @$basg$qm6Stringt1; Load string
1CC8A: lea     di, [bp+var_100]
1CC8E: push    ss
1CC8F: push    di
1CC90: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CC95: lea     di, [bp+var_100]
1CC99: push    ss
1CC9A: push    di
1CC9B: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCA0: lea     di, [bp+var_100]
1CCA4: push    ss
1CCA5: push    di
1CCA6: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCAB: lea     di, [bp+var_100]
1CCAF: push    ss
1CCB0: push    di
1CCB1: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCB6: lea     di, [bp+var_100]
1CCBA: push    ss
1CCBB: push    di
1CCBC: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCC1: lea     di, [bp+var_100]
1CCC5: push    ss
1CCC6: push    di
1CCC7: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCCC: lea     di, [bp+var_100]
1CCD0: push    ss
1CCD1: push    di
1CCD2: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCD7: lea     di, [bp+var_100]
1CCDB: push    ss
1CCDC: push    di
1CCDD: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCE2: lea     di, [bp+var_100]
1CCE6: push    ss
1CCE7: push    di
1CCE8: call    @Concat$qm6Stringt1; Concat(dst, src: String): String
1CCED: lea     di, [bp+var_300]
1CCF1: push    ss
1CCF2: push    di
1CCF3: mov     ax, 0FFh
1CCF6: push    ax
1CCF7: call    @$basg$qm6Stringt14Byte; Store string
1CCFC: mov     al, 0
1CCFE: push    ax
1CCFF: mov     al, 1
1CD01: push    ax
1CD02: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1CD07: mov     di, offset unk_2F60A
1CD0A: push    ds
1CD0B: push    di
1CD0C: mov     al, 0DAh
1CD0E: push    ax
1CD0F: xor     ax, ax
1CD11: push    ax
1CD12: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CD17: call    @Write$qm4Text; Write(var f: Text)
1CD1C: call    @__IOCheck$qv; Exit if error
1CD21: mov     di, offset unk_2F60A
1CD24: push    ds
1CD25: push    di
1CD26: lea     di, [bp+var_200]
1CD2A: push    ss
1CD2B: push    di
1CD2C: xor     ax, ax
1CD2E: push    ax
1CD2F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CD34: mov     al, 0C2h
1CD36: push    ax
1CD37: xor     ax, ax
1CD39: push    ax
1CD3A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CD3F: lea     di, [bp+var_300]
1CD43: push    ss
1CD44: push    di
1CD45: xor     ax, ax
1CD47: push    ax
1CD48: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CD4D: mov     al, 0C2h
1CD4F: push    ax
1CD50: xor     ax, ax
1CD52: push    ax
1CD53: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CD58: lea     di, [bp+var_200]
1CD5C: push    ss
1CD5D: push    di
1CD5E: xor     ax, ax
1CD60: push    ax
1CD61: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CD66: mov     al, 0C2h
1CD68: push    ax
1CD69: xor     ax, ax
1CD6B: push    ax
1CD6C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CD71: lea     di, [bp+var_200]
1CD75: push    ss
1CD76: push    di
1CD77: xor     ax, ax
1CD79: push    ax
1CD7A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CD7F: mov     al, 0C2h
1CD81: push    ax
1CD82: xor     ax, ax
1CD84: push    ax
1CD85: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CD8A: lea     di, [bp+var_300]
1CD8E: push    ss
1CD8F: push    di
1CD90: xor     ax, ax
1CD92: push    ax
1CD93: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CD98: mov     al, 0C2h
1CD9A: push    ax
1CD9B: xor     ax, ax
1CD9D: push    ax
1CD9E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CDA3: lea     di, [bp+var_200]
1CDA7: push    ss
1CDA8: push    di
1CDA9: xor     ax, ax
1CDAB: push    ax
1CDAC: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CDB1: mov     al, 0BFh
1CDB3: push    ax
1CDB4: xor     ax, ax
1CDB6: push    ax
1CDB7: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CDBC: call    @Write$qm4Text; Write(var f: Text)
1CDC1: call    @__IOCheck$qv; Exit if error
1CDC6: mov     word_27E06, 1
1CDCC: jmp     short loc_1CDD2
1CDCE: inc     word_27E06
1CDD2: mov     al, 1
1CDD4: push    ax
1CDD5: mov     ax, word_27E06
1CDD8: inc     ax
1CDD9: cwd
1CDDA: mov     di, 4FBh
1CDDD: call    @__RangeCheck$q7Longintpa2$7Longint; Range check (DX:AX, CS:DI)
1CDE2: push    ax
1CDE3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1CDE8: mov     di, offset unk_2F60A
1CDEB: push    ds
1CDEC: push    di
1CDED: mov     al, 0B3h
1CDEF: push    ax
1CDF0: xor     ax, ax
1CDF2: push    ax
1CDF3: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CDF8: mov     di, offset asc_1CB13; "             "
1CDFB: push    cs
1CDFC: push    di
1CDFD: xor     ax, ax
1CDFF: push    ax
1CE00: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE05: mov     al, 0B3h
1CE07: push    ax
1CE08: xor     ax, ax
1CE0A: push    ax
1CE0B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE10: mov     di, offset asc_1CB21; "          "
1CE13: push    cs
1CE14: push    di
1CE15: xor     ax, ax
1CE17: push    ax
1CE18: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE1D: mov     al, 0B3h
1CE1F: push    ax
1CE20: xor     ax, ax
1CE22: push    ax
1CE23: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE28: mov     di, offset asc_1CB13; "             "
1CE2B: push    cs
1CE2C: push    di
1CE2D: xor     ax, ax
1CE2F: push    ax
1CE30: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE35: mov     al, 0B3h
1CE37: push    ax
1CE38: xor     ax, ax
1CE3A: push    ax
1CE3B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE40: mov     di, offset asc_1CB13; "             "
1CE43: push    cs
1CE44: push    di
1CE45: xor     ax, ax
1CE47: push    ax
1CE48: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE4D: mov     al, 0B3h
1CE4F: push    ax
1CE50: xor     ax, ax
1CE52: push    ax
1CE53: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE58: mov     di, offset asc_1CB21; "          "
1CE5B: push    cs
1CE5C: push    di
1CE5D: xor     ax, ax
1CE5F: push    ax
1CE60: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE65: mov     al, 0B3h
1CE67: push    ax
1CE68: xor     ax, ax
1CE6A: push    ax
1CE6B: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE70: mov     di, offset asc_1CB13; "             "
1CE73: push    cs
1CE74: push    di
1CE75: xor     ax, ax
1CE77: push    ax
1CE78: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CE7D: mov     al, 0B3h
1CE7F: push    ax
1CE80: xor     ax, ax
1CE82: push    ax
1CE83: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CE88: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1CE8D: call    @__IOCheck$qv; Exit if error
1CE92: cmp     word_27E06, 13h
1CE97: jz      short loc_1CE9C
1CE99: jmp     loc_1CDCE
1CE9C: mov     al, 1
1CE9E: push    ax
1CE9F: mov     al, 8
1CEA1: push    ax
1CEA2: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1CEA7: mov     di, offset unk_2F60A
1CEAA: push    ds
1CEAB: push    di
1CEAC: mov     al, 0C3h
1CEAE: push    ax
1CEAF: xor     ax, ax
1CEB1: push    ax
1CEB2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CEB7: lea     di, [bp+var_200]
1CEBB: push    ss
1CEBC: push    di
1CEBD: xor     ax, ax
1CEBF: push    ax
1CEC0: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CEC5: mov     al, 0C5h
1CEC7: push    ax
1CEC8: xor     ax, ax
1CECA: push    ax
1CECB: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CED0: lea     di, [bp+var_300]
1CED4: push    ss
1CED5: push    di
1CED6: xor     ax, ax
1CED8: push    ax
1CED9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CEDE: mov     al, 0C5h
1CEE0: push    ax
1CEE1: xor     ax, ax
1CEE3: push    ax
1CEE4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CEE9: lea     di, [bp+var_200]
1CEED: push    ss
1CEEE: push    di
1CEEF: xor     ax, ax
1CEF1: push    ax
1CEF2: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CEF7: mov     al, 0C5h
1CEF9: push    ax
1CEFA: xor     ax, ax
1CEFC: push    ax
1CEFD: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF02: lea     di, [bp+var_200]
1CF06: push    ss
1CF07: push    di
1CF08: xor     ax, ax
1CF0A: push    ax
1CF0B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CF10: mov     al, 0C5h
1CF12: push    ax
1CF13: xor     ax, ax
1CF15: push    ax
1CF16: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF1B: lea     di, [bp+var_300]
1CF1F: push    ss
1CF20: push    di
1CF21: xor     ax, ax
1CF23: push    ax
1CF24: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CF29: mov     al, 0C5h
1CF2B: push    ax
1CF2C: xor     ax, ax
1CF2E: push    ax
1CF2F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF34: lea     di, [bp+var_200]
1CF38: push    ss
1CF39: push    di
1CF3A: xor     ax, ax
1CF3C: push    ax
1CF3D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CF42: mov     al, 0B4h
1CF44: push    ax
1CF45: xor     ax, ax
1CF47: push    ax
1CF48: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF4D: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1CF52: call    @__IOCheck$qv; Exit if error
1CF57: mov     al, 1
1CF59: push    ax
1CF5A: mov     al, 0Eh
1CF5C: push    ax
1CF5D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1CF62: mov     di, offset unk_2F60A
1CF65: push    ds
1CF66: push    di
1CF67: mov     al, 0C3h
1CF69: push    ax
1CF6A: xor     ax, ax
1CF6C: push    ax
1CF6D: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF72: lea     di, [bp+var_200]
1CF76: push    ss
1CF77: push    di
1CF78: xor     ax, ax
1CF7A: push    ax
1CF7B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CF80: mov     al, 0C5h
1CF82: push    ax
1CF83: xor     ax, ax
1CF85: push    ax
1CF86: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CF8B: lea     di, [bp+var_300]
1CF8F: push    ss
1CF90: push    di
1CF91: xor     ax, ax
1CF93: push    ax
1CF94: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CF99: mov     al, 0C5h
1CF9B: push    ax
1CF9C: xor     ax, ax
1CF9E: push    ax
1CF9F: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CFA4: lea     di, [bp+var_200]
1CFA8: push    ss
1CFA9: push    di
1CFAA: xor     ax, ax
1CFAC: push    ax
1CFAD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CFB2: mov     al, 0C5h
1CFB4: push    ax
1CFB5: xor     ax, ax
1CFB7: push    ax
1CFB8: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CFBD: lea     di, [bp+var_200]
1CFC1: push    ss
1CFC2: push    di
1CFC3: xor     ax, ax
1CFC5: push    ax
1CFC6: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CFCB: mov     al, 0C5h
1CFCD: push    ax
1CFCE: xor     ax, ax
1CFD0: push    ax
1CFD1: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CFD6: lea     di, [bp+var_300]
1CFDA: push    ss
1CFDB: push    di
1CFDC: xor     ax, ax
1CFDE: push    ax
1CFDF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CFE4: mov     al, 0C5h
1CFE6: push    ax
1CFE7: xor     ax, ax
1CFE9: push    ax
1CFEA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1CFEF: lea     di, [bp+var_200]
1CFF3: push    ss
1CFF4: push    di
1CFF5: xor     ax, ax
1CFF7: push    ax
1CFF8: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1CFFD: mov     al, 0B4h
1CFFF: push    ax
1D000: xor     ax, ax
1D002: push    ax
1D003: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D008: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D00D: call    @__IOCheck$qv; Exit if error
1D012: mov     al, 1
1D014: push    ax
1D015: mov     al, 15h
1D017: push    ax
1D018: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D01D: mov     di, offset unk_2F60A
1D020: push    ds
1D021: push    di
1D022: mov     al, 0C0h
1D024: push    ax
1D025: xor     ax, ax
1D027: push    ax
1D028: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D02D: lea     di, [bp+var_200]
1D031: push    ss
1D032: push    di
1D033: xor     ax, ax
1D035: push    ax
1D036: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D03B: mov     al, 0C1h
1D03D: push    ax
1D03E: xor     ax, ax
1D040: push    ax
1D041: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D046: lea     di, [bp+var_300]
1D04A: push    ss
1D04B: push    di
1D04C: xor     ax, ax
1D04E: push    ax
1D04F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D054: mov     al, 0C1h
1D056: push    ax
1D057: xor     ax, ax
1D059: push    ax
1D05A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D05F: lea     di, [bp+var_200]
1D063: push    ss
1D064: push    di
1D065: xor     ax, ax
1D067: push    ax
1D068: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D06D: mov     al, 0C1h
1D06F: push    ax
1D070: xor     ax, ax
1D072: push    ax
1D073: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D078: lea     di, [bp+var_200]
1D07C: push    ss
1D07D: push    di
1D07E: xor     ax, ax
1D080: push    ax
1D081: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D086: mov     al, 0C1h
1D088: push    ax
1D089: xor     ax, ax
1D08B: push    ax
1D08C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D091: lea     di, [bp+var_300]
1D095: push    ss
1D096: push    di
1D097: xor     ax, ax
1D099: push    ax
1D09A: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D09F: mov     al, 0C1h
1D0A1: push    ax
1D0A2: xor     ax, ax
1D0A4: push    ax
1D0A5: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D0AA: lea     di, [bp+var_200]
1D0AE: push    ss
1D0AF: push    di
1D0B0: xor     ax, ax
1D0B2: push    ax
1D0B3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D0B8: mov     al, 0D9h
1D0BA: push    ax
1D0BB: xor     ax, ax
1D0BD: push    ax
1D0BE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D0C3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D0C8: call    @__IOCheck$qv; Exit if error
1D0CD: mov     al, 3
1D0CF: push    ax
1D0D0: mov     al, 2
1D0D2: push    ax
1D0D3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D0D8: mov     di, offset unk_2F60A
1D0DB: push    ds
1D0DC: push    di
1D0DD: mov     al, 2Eh ; '.'
1D0DF: push    ax
1D0E0: xor     ax, ax
1D0E2: push    ax
1D0E3: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D0E8: call    @Write$qm4Text; Write(var f: Text)
1D0ED: call    @__IOCheck$qv; Exit if error
1D0F2: mov     al, 5
1D0F4: push    ax
1D0F5: mov     al, 3
1D0F7: push    ax
1D0F8: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D0FD: mov     di, offset unk_2F60A
1D100: push    ds
1D101: push    di
1D102: mov     al, 2Eh ; '.'
1D104: push    ax
1D105: xor     ax, ax
1D107: push    ax
1D108: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D10D: call    @Write$qm4Text; Write(var f: Text)
1D112: call    @__IOCheck$qv; Exit if error
1D117: mov     al, 6
1D119: push    ax
1D11A: mov     al, 2
1D11C: push    ax
1D11D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D122: mov     di, offset unk_2F60A
1D125: push    ds
1D126: push    di
1D127: mov     di, offset asc_1CB2C; "         "
1D12A: push    cs
1D12B: push    di
1D12C: xor     ax, ax
1D12E: push    ax
1D12F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D134: mov     al, 0B3h
1D136: push    ax
1D137: xor     ax, ax
1D139: push    ax
1D13A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D13F: mov     di, offset asc_1CB21; "          "
1D142: push    cs
1D143: push    di
1D144: xor     ax, ax
1D146: push    ax
1D147: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D14C: mov     al, 0B3h
1D14E: push    ax
1D14F: xor     ax, ax
1D151: push    ax
1D152: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D157: mov     di, offset asc_1CB36; "           . "
1D15A: push    cs
1D15B: push    di
1D15C: xor     ax, ax
1D15E: push    ax
1D15F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D164: mov     al, 0B3h
1D166: push    ax
1D167: xor     ax, ax
1D169: push    ax
1D16A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D16F: mov     di, offset asc_1CB44; " .           "
1D172: push    cs
1D173: push    di
1D174: xor     ax, ax
1D176: push    ax
1D177: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D17C: mov     al, 0B3h
1D17E: push    ax
1D17F: xor     ax, ax
1D181: push    ax
1D182: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D187: mov     di, offset asc_1CB21; "          "
1D18A: push    cs
1D18B: push    di
1D18C: xor     ax, ax
1D18E: push    ax
1D18F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D194: mov     al, 0B3h
1D196: push    ax
1D197: xor     ax, ax
1D199: push    ax
1D19A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D19F: mov     di, offset asc_1CB36; "           . "
1D1A2: push    cs
1D1A3: push    di
1D1A4: xor     ax, ax
1D1A6: push    ax
1D1A7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D1AC: mov     al, 0B3h
1D1AE: push    ax
1D1AF: xor     ax, ax
1D1B1: push    ax
1D1B2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D1B7: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D1BC: call    @__IOCheck$qv; Exit if error
1D1C1: mov     al, 6
1D1C3: push    ax
1D1C4: mov     al, 3
1D1C6: push    ax
1D1C7: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D1CC: mov     di, offset unk_2F60A
1D1CF: push    ds
1D1D0: push    di
1D1D1: mov     di, offset asc_1CB2C; "         "
1D1D4: push    cs
1D1D5: push    di
1D1D6: xor     ax, ax
1D1D8: push    ax
1D1D9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D1DE: mov     al, 0B3h
1D1E0: push    ax
1D1E1: xor     ax, ax
1D1E3: push    ax
1D1E4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D1E9: mov     di, offset asc_1CB21; "          "
1D1EC: push    cs
1D1ED: push    di
1D1EE: xor     ax, ax
1D1F0: push    ax
1D1F1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D1F6: mov     al, 0B3h
1D1F8: push    ax
1D1F9: xor     ax, ax
1D1FB: push    ax
1D1FC: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D201: mov     di, offset asc_1CB52; "         .   "
1D204: push    cs
1D205: push    di
1D206: xor     ax, ax
1D208: push    ax
1D209: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D20E: mov     al, 0B3h
1D210: push    ax
1D211: xor     ax, ax
1D213: push    ax
1D214: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D219: mov     di, offset asc_1CB60; "   .         "
1D21C: push    cs
1D21D: push    di
1D21E: xor     ax, ax
1D220: push    ax
1D221: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D226: mov     al, 0B3h
1D228: push    ax
1D229: xor     ax, ax
1D22B: push    ax
1D22C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D231: mov     di, offset asc_1CB21; "          "
1D234: push    cs
1D235: push    di
1D236: xor     ax, ax
1D238: push    ax
1D239: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D23E: mov     al, 0B3h
1D240: push    ax
1D241: xor     ax, ax
1D243: push    ax
1D244: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D249: mov     di, offset asc_1CB52; "         .   "
1D24C: push    cs
1D24D: push    di
1D24E: xor     ax, ax
1D250: push    ax
1D251: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D256: mov     al, 0B3h
1D258: push    ax
1D259: xor     ax, ax
1D25B: push    ax
1D25C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D261: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D266: call    @__IOCheck$qv; Exit if error
1D26B: mov     al, 6
1D26D: push    ax
1D26E: mov     al, 4
1D270: push    ax
1D271: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D276: mov     di, offset unk_2F60A
1D279: push    ds
1D27A: push    di
1D27B: mov     di, offset asc_1CB6E; " .       "
1D27E: push    cs
1D27F: push    di
1D280: xor     ax, ax
1D282: push    ax
1D283: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D288: mov     al, 0B3h
1D28A: push    ax
1D28B: xor     ax, ax
1D28D: push    ax
1D28E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D293: mov     di, offset asc_1CB21; "          "
1D296: push    cs
1D297: push    di
1D298: xor     ax, ax
1D29A: push    ax
1D29B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D2A0: mov     al, 0B3h
1D2A2: push    ax
1D2A3: xor     ax, ax
1D2A5: push    ax
1D2A6: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D2AB: mov     di, offset asc_1CB78; "       .     "
1D2AE: push    cs
1D2AF: push    di
1D2B0: xor     ax, ax
1D2B2: push    ax
1D2B3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D2B8: mov     al, 0B3h
1D2BA: push    ax
1D2BB: xor     ax, ax
1D2BD: push    ax
1D2BE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D2C3: mov     di, offset asc_1CB86; "     .       "
1D2C6: push    cs
1D2C7: push    di
1D2C8: xor     ax, ax
1D2CA: push    ax
1D2CB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D2D0: mov     al, 0B3h
1D2D2: push    ax
1D2D3: xor     ax, ax
1D2D5: push    ax
1D2D6: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D2DB: mov     di, offset asc_1CB21; "          "
1D2DE: push    cs
1D2DF: push    di
1D2E0: xor     ax, ax
1D2E2: push    ax
1D2E3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D2E8: mov     al, 0B3h
1D2EA: push    ax
1D2EB: xor     ax, ax
1D2ED: push    ax
1D2EE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D2F3: mov     di, offset asc_1CB78; "       .     "
1D2F6: push    cs
1D2F7: push    di
1D2F8: xor     ax, ax
1D2FA: push    ax
1D2FB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D300: mov     al, 0B3h
1D302: push    ax
1D303: xor     ax, ax
1D305: push    ax
1D306: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D30B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D310: call    @__IOCheck$qv; Exit if error
1D315: mov     al, 6
1D317: push    ax
1D318: mov     al, 5
1D31A: push    ax
1D31B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D320: mov     di, offset unk_2F60A
1D323: push    ds
1D324: push    di
1D325: mov     di, offset asc_1CB94; "   .     "
1D328: push    cs
1D329: push    di
1D32A: xor     ax, ax
1D32C: push    ax
1D32D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D332: mov     al, 0B3h
1D334: push    ax
1D335: xor     ax, ax
1D337: push    ax
1D338: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D33D: mov     di, offset asc_1CB21; "          "
1D340: push    cs
1D341: push    di
1D342: xor     ax, ax
1D344: push    ax
1D345: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D34A: mov     al, 0B3h
1D34C: push    ax
1D34D: xor     ax, ax
1D34F: push    ax
1D350: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D355: mov     di, offset asc_1CB86; "     .       "
1D358: push    cs
1D359: push    di
1D35A: xor     ax, ax
1D35C: push    ax
1D35D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D362: mov     al, 0B3h
1D364: push    ax
1D365: xor     ax, ax
1D367: push    ax
1D368: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D36D: mov     di, offset asc_1CB78; "       .     "
1D370: push    cs
1D371: push    di
1D372: xor     ax, ax
1D374: push    ax
1D375: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D37A: mov     al, 0B3h
1D37C: push    ax
1D37D: xor     ax, ax
1D37F: push    ax
1D380: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D385: mov     di, offset asc_1CB21; "          "
1D388: push    cs
1D389: push    di
1D38A: xor     ax, ax
1D38C: push    ax
1D38D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D392: mov     al, 0B3h
1D394: push    ax
1D395: xor     ax, ax
1D397: push    ax
1D398: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D39D: mov     di, offset asc_1CB86; "     .       "
1D3A0: push    cs
1D3A1: push    di
1D3A2: xor     ax, ax
1D3A4: push    ax
1D3A5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D3AA: mov     al, 0B3h
1D3AC: push    ax
1D3AD: xor     ax, ax
1D3AF: push    ax
1D3B0: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D3B5: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D3BA: call    @__IOCheck$qv; Exit if error
1D3BF: mov     al, 6
1D3C1: push    ax
1D3C2: mov     al, 6
1D3C4: push    ax
1D3C5: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D3CA: mov     di, offset unk_2F60A
1D3CD: push    ds
1D3CE: push    di
1D3CF: mov     di, offset asc_1CB9E; "     .   "
1D3D2: push    cs
1D3D3: push    di
1D3D4: xor     ax, ax
1D3D6: push    ax
1D3D7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D3DC: mov     al, 0B3h
1D3DE: push    ax
1D3DF: xor     ax, ax
1D3E1: push    ax
1D3E2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D3E7: mov     di, offset asc_1CB21; "          "
1D3EA: push    cs
1D3EB: push    di
1D3EC: xor     ax, ax
1D3EE: push    ax
1D3EF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D3F4: mov     al, 0B3h
1D3F6: push    ax
1D3F7: xor     ax, ax
1D3F9: push    ax
1D3FA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D3FF: mov     di, offset asc_1CB60; "   .         "
1D402: push    cs
1D403: push    di
1D404: xor     ax, ax
1D406: push    ax
1D407: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D40C: mov     al, 0B3h
1D40E: push    ax
1D40F: xor     ax, ax
1D411: push    ax
1D412: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D417: mov     di, offset asc_1CB52; "         .   "
1D41A: push    cs
1D41B: push    di
1D41C: xor     ax, ax
1D41E: push    ax
1D41F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D424: mov     al, 0B3h
1D426: push    ax
1D427: xor     ax, ax
1D429: push    ax
1D42A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D42F: mov     di, offset asc_1CB21; "          "
1D432: push    cs
1D433: push    di
1D434: xor     ax, ax
1D436: push    ax
1D437: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D43C: mov     al, 0B3h
1D43E: push    ax
1D43F: xor     ax, ax
1D441: push    ax
1D442: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D447: mov     di, offset asc_1CB60; "   .         "
1D44A: push    cs
1D44B: push    di
1D44C: xor     ax, ax
1D44E: push    ax
1D44F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D454: mov     al, 0B3h
1D456: push    ax
1D457: xor     ax, ax
1D459: push    ax
1D45A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D45F: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D464: call    @__IOCheck$qv; Exit if error
1D469: mov     al, 6
1D46B: push    ax
1D46C: mov     al, 7
1D46E: push    ax
1D46F: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D474: mov     di, offset unk_2F60A
1D477: push    ds
1D478: push    di
1D479: mov     di, offset asc_1CBA8; "       . "
1D47C: push    cs
1D47D: push    di
1D47E: xor     ax, ax
1D480: push    ax
1D481: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D486: mov     al, 0B3h
1D488: push    ax
1D489: xor     ax, ax
1D48B: push    ax
1D48C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D491: mov     di, offset asc_1CB21; "          "
1D494: push    cs
1D495: push    di
1D496: xor     ax, ax
1D498: push    ax
1D499: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D49E: mov     al, 0B3h
1D4A0: push    ax
1D4A1: xor     ax, ax
1D4A3: push    ax
1D4A4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D4A9: mov     di, offset asc_1CB44; " .           "
1D4AC: push    cs
1D4AD: push    di
1D4AE: xor     ax, ax
1D4B0: push    ax
1D4B1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D4B6: mov     al, 0B3h
1D4B8: push    ax
1D4B9: xor     ax, ax
1D4BB: push    ax
1D4BC: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D4C1: mov     di, offset asc_1CB36; "           . "
1D4C4: push    cs
1D4C5: push    di
1D4C6: xor     ax, ax
1D4C8: push    ax
1D4C9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D4CE: mov     al, 0B3h
1D4D0: push    ax
1D4D1: xor     ax, ax
1D4D3: push    ax
1D4D4: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D4D9: mov     di, offset asc_1CB21; "          "
1D4DC: push    cs
1D4DD: push    di
1D4DE: xor     ax, ax
1D4E0: push    ax
1D4E1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D4E6: mov     al, 0B3h
1D4E8: push    ax
1D4E9: xor     ax, ax
1D4EB: push    ax
1D4EC: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D4F1: mov     di, offset asc_1CB44; " .           "
1D4F4: push    cs
1D4F5: push    di
1D4F6: xor     ax, ax
1D4F8: push    ax
1D4F9: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D4FE: mov     al, 0B3h
1D500: push    ax
1D501: xor     ax, ax
1D503: push    ax
1D504: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D509: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D50E: call    @__IOCheck$qv; Exit if error
1D513: mov     al, 6
1D515: push    ax
1D516: mov     al, 0Fh
1D518: push    ax
1D519: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D51E: mov     di, offset unk_2F60A
1D521: push    ds
1D522: push    di
1D523: mov     di, offset asc_1CBA8; "       . "
1D526: push    cs
1D527: push    di
1D528: xor     ax, ax
1D52A: push    ax
1D52B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D530: mov     al, 0B3h
1D532: push    ax
1D533: xor     ax, ax
1D535: push    ax
1D536: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D53B: mov     di, offset asc_1CB21; "          "
1D53E: push    cs
1D53F: push    di
1D540: xor     ax, ax
1D542: push    ax
1D543: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D548: mov     al, 0B3h
1D54A: push    ax
1D54B: xor     ax, ax
1D54D: push    ax
1D54E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D553: mov     di, offset asc_1CB44; " .           "
1D556: push    cs
1D557: push    di
1D558: xor     ax, ax
1D55A: push    ax
1D55B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D560: mov     al, 0B3h
1D562: push    ax
1D563: xor     ax, ax
1D565: push    ax
1D566: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D56B: mov     di, offset asc_1CB36; "           . "
1D56E: push    cs
1D56F: push    di
1D570: xor     ax, ax
1D572: push    ax
1D573: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D578: mov     al, 0B3h
1D57A: push    ax
1D57B: xor     ax, ax
1D57D: push    ax
1D57E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D583: mov     di, offset asc_1CB21; "          "
1D586: push    cs
1D587: push    di
1D588: xor     ax, ax
1D58A: push    ax
1D58B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D590: mov     al, 0B3h
1D592: push    ax
1D593: xor     ax, ax
1D595: push    ax
1D596: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D59B: mov     di, offset asc_1CB44; " .           "
1D59E: push    cs
1D59F: push    di
1D5A0: xor     ax, ax
1D5A2: push    ax
1D5A3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D5A8: mov     al, 0B3h
1D5AA: push    ax
1D5AB: xor     ax, ax
1D5AD: push    ax
1D5AE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D5B3: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D5B8: call    @__IOCheck$qv; Exit if error
1D5BD: mov     al, 6
1D5BF: push    ax
1D5C0: mov     al, 10h
1D5C2: push    ax
1D5C3: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D5C8: mov     di, offset unk_2F60A
1D5CB: push    ds
1D5CC: push    di
1D5CD: mov     di, offset asc_1CB9E; "     .   "
1D5D0: push    cs
1D5D1: push    di
1D5D2: xor     ax, ax
1D5D4: push    ax
1D5D5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D5DA: mov     al, 0B3h
1D5DC: push    ax
1D5DD: xor     ax, ax
1D5DF: push    ax
1D5E0: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D5E5: mov     di, offset asc_1CB21; "          "
1D5E8: push    cs
1D5E9: push    di
1D5EA: xor     ax, ax
1D5EC: push    ax
1D5ED: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D5F2: mov     al, 0B3h
1D5F4: push    ax
1D5F5: xor     ax, ax
1D5F7: push    ax
1D5F8: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D5FD: mov     di, offset asc_1CB60; "   .         "
1D600: push    cs
1D601: push    di
1D602: xor     ax, ax
1D604: push    ax
1D605: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D60A: mov     al, 0B3h
1D60C: push    ax
1D60D: xor     ax, ax
1D60F: push    ax
1D610: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D615: mov     di, offset asc_1CB52; "         .   "
1D618: push    cs
1D619: push    di
1D61A: xor     ax, ax
1D61C: push    ax
1D61D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D622: mov     al, 0B3h
1D624: push    ax
1D625: xor     ax, ax
1D627: push    ax
1D628: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D62D: mov     di, offset asc_1CB21; "          "
1D630: push    cs
1D631: push    di
1D632: xor     ax, ax
1D634: push    ax
1D635: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D63A: mov     al, 0B3h
1D63C: push    ax
1D63D: xor     ax, ax
1D63F: push    ax
1D640: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D645: mov     di, offset asc_1CB60; "   .         "
1D648: push    cs
1D649: push    di
1D64A: xor     ax, ax
1D64C: push    ax
1D64D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D652: mov     al, 0B3h
1D654: push    ax
1D655: xor     ax, ax
1D657: push    ax
1D658: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D65D: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D662: call    @__IOCheck$qv; Exit if error
1D667: mov     al, 6
1D669: push    ax
1D66A: mov     al, 11h
1D66C: push    ax
1D66D: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D672: mov     di, offset unk_2F60A
1D675: push    ds
1D676: push    di
1D677: mov     di, offset asc_1CB94; "   .     "
1D67A: push    cs
1D67B: push    di
1D67C: xor     ax, ax
1D67E: push    ax
1D67F: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D684: mov     al, 0B3h
1D686: push    ax
1D687: xor     ax, ax
1D689: push    ax
1D68A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D68F: mov     di, offset asc_1CB21; "          "
1D692: push    cs
1D693: push    di
1D694: xor     ax, ax
1D696: push    ax
1D697: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D69C: mov     al, 0B3h
1D69E: push    ax
1D69F: xor     ax, ax
1D6A1: push    ax
1D6A2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D6A7: mov     di, offset asc_1CB86; "     .       "
1D6AA: push    cs
1D6AB: push    di
1D6AC: xor     ax, ax
1D6AE: push    ax
1D6AF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D6B4: mov     al, 0B3h
1D6B6: push    ax
1D6B7: xor     ax, ax
1D6B9: push    ax
1D6BA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D6BF: mov     di, offset asc_1CB78; "       .     "
1D6C2: push    cs
1D6C3: push    di
1D6C4: xor     ax, ax
1D6C6: push    ax
1D6C7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D6CC: mov     al, 0B3h
1D6CE: push    ax
1D6CF: xor     ax, ax
1D6D1: push    ax
1D6D2: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D6D7: mov     di, offset asc_1CB21; "          "
1D6DA: push    cs
1D6DB: push    di
1D6DC: xor     ax, ax
1D6DE: push    ax
1D6DF: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D6E4: mov     al, 0B3h
1D6E6: push    ax
1D6E7: xor     ax, ax
1D6E9: push    ax
1D6EA: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D6EF: mov     di, offset asc_1CB86; "     .       "
1D6F2: push    cs
1D6F3: push    di
1D6F4: xor     ax, ax
1D6F6: push    ax
1D6F7: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D6FC: mov     al, 0B3h
1D6FE: push    ax
1D6FF: xor     ax, ax
1D701: push    ax
1D702: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D707: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D70C: call    @__IOCheck$qv; Exit if error
1D711: mov     al, 6
1D713: push    ax
1D714: mov     al, 12h
1D716: push    ax
1D717: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D71C: mov     di, offset unk_2F60A
1D71F: push    ds
1D720: push    di
1D721: mov     di, offset asc_1CB6E; " .       "
1D724: push    cs
1D725: push    di
1D726: xor     ax, ax
1D728: push    ax
1D729: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D72E: mov     al, 0B3h
1D730: push    ax
1D731: xor     ax, ax
1D733: push    ax
1D734: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D739: mov     di, offset asc_1CB21; "          "
1D73C: push    cs
1D73D: push    di
1D73E: xor     ax, ax
1D740: push    ax
1D741: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D746: mov     al, 0B3h
1D748: push    ax
1D749: xor     ax, ax
1D74B: push    ax
1D74C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D751: mov     di, offset asc_1CB78; "       .     "
1D754: push    cs
1D755: push    di
1D756: xor     ax, ax
1D758: push    ax
1D759: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D75E: mov     al, 0B3h
1D760: push    ax
1D761: xor     ax, ax
1D763: push    ax
1D764: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D769: mov     di, offset asc_1CB86; "     .       "
1D76C: push    cs
1D76D: push    di
1D76E: xor     ax, ax
1D770: push    ax
1D771: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D776: mov     al, 0B3h
1D778: push    ax
1D779: xor     ax, ax
1D77B: push    ax
1D77C: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D781: mov     di, offset asc_1CB21; "          "
1D784: push    cs
1D785: push    di
1D786: xor     ax, ax
1D788: push    ax
1D789: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D78E: mov     al, 0B3h
1D790: push    ax
1D791: xor     ax, ax
1D793: push    ax
1D794: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D799: mov     di, offset asc_1CB78; "       .     "
1D79C: push    cs
1D79D: push    di
1D79E: xor     ax, ax
1D7A0: push    ax
1D7A1: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D7A6: mov     al, 0B3h
1D7A8: push    ax
1D7A9: xor     ax, ax
1D7AB: push    ax
1D7AC: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D7B1: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D7B6: call    @__IOCheck$qv; Exit if error
1D7BB: mov     al, 6
1D7BD: push    ax
1D7BE: mov     al, 13h
1D7C0: push    ax
1D7C1: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D7C6: mov     di, offset unk_2F60A
1D7C9: push    ds
1D7CA: push    di
1D7CB: mov     di, offset asc_1CB2C; "         "
1D7CE: push    cs
1D7CF: push    di
1D7D0: xor     ax, ax
1D7D2: push    ax
1D7D3: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D7D8: mov     al, 0B3h
1D7DA: push    ax
1D7DB: xor     ax, ax
1D7DD: push    ax
1D7DE: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D7E3: mov     di, offset asc_1CB21; "          "
1D7E6: push    cs
1D7E7: push    di
1D7E8: xor     ax, ax
1D7EA: push    ax
1D7EB: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D7F0: mov     al, 0B3h
1D7F2: push    ax
1D7F3: xor     ax, ax
1D7F5: push    ax
1D7F6: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D7FB: mov     di, offset asc_1CB52; "         .   "
1D7FE: push    cs
1D7FF: push    di
1D800: xor     ax, ax
1D802: push    ax
1D803: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D808: mov     al, 0B3h
1D80A: push    ax
1D80B: xor     ax, ax
1D80D: push    ax
1D80E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D813: mov     di, offset asc_1CB60; "   .         "
1D816: push    cs
1D817: push    di
1D818: xor     ax, ax
1D81A: push    ax
1D81B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D820: mov     al, 0B3h
1D822: push    ax
1D823: xor     ax, ax
1D825: push    ax
1D826: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D82B: mov     di, offset asc_1CB21; "          "
1D82E: push    cs
1D82F: push    di
1D830: xor     ax, ax
1D832: push    ax
1D833: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D838: mov     al, 0B3h
1D83A: push    ax
1D83B: xor     ax, ax
1D83D: push    ax
1D83E: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D843: mov     di, offset asc_1CB52; "         .   "
1D846: push    cs
1D847: push    di
1D848: xor     ax, ax
1D84A: push    ax
1D84B: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D850: mov     al, 0B3h
1D852: push    ax
1D853: xor     ax, ax
1D855: push    ax
1D856: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D85B: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D860: call    @__IOCheck$qv; Exit if error
1D865: mov     al, 6
1D867: push    ax
1D868: mov     al, 14h
1D86A: push    ax
1D86B: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D870: mov     di, offset unk_2F60A
1D873: push    ds
1D874: push    di
1D875: mov     di, offset asc_1CB2C; "         "
1D878: push    cs
1D879: push    di
1D87A: xor     ax, ax
1D87C: push    ax
1D87D: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D882: mov     al, 0B3h
1D884: push    ax
1D885: xor     ax, ax
1D887: push    ax
1D888: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D88D: mov     di, offset asc_1CB21; "          "
1D890: push    cs
1D891: push    di
1D892: xor     ax, ax
1D894: push    ax
1D895: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D89A: mov     al, 0B3h
1D89C: push    ax
1D89D: xor     ax, ax
1D89F: push    ax
1D8A0: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D8A5: mov     di, offset asc_1CB36; "           . "
1D8A8: push    cs
1D8A9: push    di
1D8AA: xor     ax, ax
1D8AC: push    ax
1D8AD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D8B2: mov     al, 0B3h
1D8B4: push    ax
1D8B5: xor     ax, ax
1D8B7: push    ax
1D8B8: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D8BD: mov     di, offset asc_1CB44; " .           "
1D8C0: push    cs
1D8C1: push    di
1D8C2: xor     ax, ax
1D8C4: push    ax
1D8C5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D8CA: mov     al, 0B3h
1D8CC: push    ax
1D8CD: xor     ax, ax
1D8CF: push    ax
1D8D0: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D8D5: mov     di, offset asc_1CB21; "          "
1D8D8: push    cs
1D8D9: push    di
1D8DA: xor     ax, ax
1D8DC: push    ax
1D8DD: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D8E2: mov     al, 0B3h
1D8E4: push    ax
1D8E5: xor     ax, ax
1D8E7: push    ax
1D8E8: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D8ED: mov     di, offset asc_1CB36; "           . "
1D8F0: push    cs
1D8F1: push    di
1D8F2: xor     ax, ax
1D8F4: push    ax
1D8F5: call    @Write$qm4Textm6String4Word; Write(var f; s: String; width: Word)
1D8FA: mov     al, 0B3h
1D8FC: push    ax
1D8FD: xor     ax, ax
1D8FF: push    ax
1D900: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D905: call    @WriteLn$qm4Text; WriteLn(var f: Text)
1D90A: call    @__IOCheck$qv; Exit if error
1D90F: mov     al, 5
1D911: push    ax
1D912: mov     al, 13h
1D914: push    ax
1D915: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D91A: mov     di, offset unk_2F60A
1D91D: push    ds
1D91E: push    di
1D91F: mov     al, 2Eh ; '.'
1D921: push    ax
1D922: xor     ax, ax
1D924: push    ax
1D925: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D92A: call    @Write$qm4Text; Write(var f: Text)
1D92F: call    @__IOCheck$qv; Exit if error
1D934: mov     al, 3
1D936: push    ax
1D937: mov     al, 14h
1D939: push    ax
1D93A: call    @GOTOXY$q4BYTEt1; GOTOXY(BYTE,BYTE)
1D93F: mov     di, offset unk_2F60A
1D942: push    ds
1D943: push    di
1D944: mov     al, 2Eh ; '.'
1D946: push    ax
1D947: xor     ax, ax
1D949: push    ax
1D94A: call    @Write$qm4Text4Char4Word; Write(var f; c: Char; width: Word)
1D94F: call    @Write$qm4Text; Write(var f: Text)
1D954: call    @__IOCheck$qv; Exit if error
1D959: mov     sp, bp
1D95B: pop     bp
1D95C: retf
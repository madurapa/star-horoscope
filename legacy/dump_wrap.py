import idautils, idc
idc.auto_wait()
out = open("/tmp/wrap.txt", "w")
# near-call targets: caller + 3 + disp
for caller, disp in [(0x11FB9, 0x969), (0x22FC2, 0x969)]:
    tgt = caller + 3 + disp
    fn = idc.get_func_name(tgt)
    seg = idc.get_segm_name(tgt)
    out.write("caller %s -> tgt %s func=[%s] seg=[%s]\n" % (hex(caller), hex(tgt), fn, seg))
    fe = idc.find_func_end(tgt)
    out.write("  func end %s size %d\n" % (hex(fe), fe - tgt))
    c = tgt
    n = 0
    while c < fe and c != idc.BADADDR and n < 60:
        out.write("  %s: %s\n" % (hex(c), idc.generate_disasm_line(c, 0)))
        c = idc.next_head(c, fe)
        n += 1
out.close()
idc.qexit(0)

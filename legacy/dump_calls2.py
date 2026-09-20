import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets2.txt", "w")
addrs = [0x11FB9, 0x11FF8, 0x12055, 0x22F94, 0x22FC2, 0x23000, 0x12C5B]
for a in addrs:
    op = idc.print_operand(a, 0)
    typ = idc.get_operand_type(a, 0)
    tgt = idc.get_operand_value(a, 0)
    fn = idc.get_func_name(tgt) if tgt else "?"
    seg = idc.get_segm_name(tgt) if tgt else "?"
    out.write("%s op=[%s] type=%s val=%s func=%s seg=%s\n" % (hex(a), op, typ, hex(tgt), fn, seg))
out.close()
idc.qexit(0)

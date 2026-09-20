import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets.txt", "w")
addrs = [0x11FB9, 0x11FF8, 0x12055, 0x12C5B, 0x12CD7, 0x22D38, 0x22F94, 0x22FC2, 0x23000]
for a in addrs:
    tgt = idc.get_operand_value(a, 0)
    out.write("%s -> %s (%s)\n" % (hex(a), hex(tgt), idc.get_func_name(tgt)))
out.close()
idc.qexit(0)

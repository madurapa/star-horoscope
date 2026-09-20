import idautils, idc
idc.auto_wait()
out = open("/tmp/jcc.txt", "w")
import re
addrs = {}
for func_ea in idautils.Functions():
    if idc.get_func_name(func_ea) == "sub_18760":
        end = idc.find_func_end(func_ea)
        c = func_ea
        idx = 0
        while c < end and c != idc.BADADDR:
            addrs[c] = idx
            c = idc.next_head(c, end)
            idx += 1
        c = func_ea
        while c < end and c != idc.BADADDR:
            d = idc.generate_disasm_line(c, 0)
            if d and re.search(r'\bj[nb]?[aebczlgo]+\b|\bjmp\b|\bloop\b', d):
                tgt = idc.get_operand_value(c, 0)
                # resolve target to line idx by address
                tline = addrs.get(tgt, -1)
                out.write("line %d %s: %s -> tgt %s (line %d)\n" % (addrs[c], hex(c), d, hex(tgt), tline))
            c = idc.next_head(c, end)
out.close()
idc.qexit(0)

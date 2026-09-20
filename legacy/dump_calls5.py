import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets5.txt", "w")
import re
for func_ea in idautils.Functions():
    fn = idc.get_func_name(func_ea)
    if fn in ("sub_25F30", "sub_18760", "sub_220B3"):
        end = idc.find_func_end(func_ea)
        c = func_ea
        while c < end and c != idc.BADADDR:
            d = idc.generate_disasm_line(c, 0)
            if d and ('@Sin' in d or '@Cos' in d) and 'call' in d:
                tos = []
                for x in idautils.XrefsFrom(c):
                    tos.append("%s(%s)" % (hex(x.to), idc.get_func_name(x.to)))
                out.write("%s %s: %s -> %s\n" % (fn, hex(c), d.strip(), ", ".join(tos)))
            c = idc.next_head(c, end)
out.close()
idc.qexit(0)

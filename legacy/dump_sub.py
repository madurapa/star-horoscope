import idautils, idc
idc.auto_wait()
out = open("/tmp/sub260ed.txt", "w")
for func_ea in idautils.Functions():
    if idc.get_func_name(func_ea) == "sub_260ED":
        end = idc.find_func_end(func_ea)
        out.write("sub_260ED %s..%s size %d\n" % (hex(func_ea), hex(end), end - func_ea))
        c = func_ea
        n = 0
        while c < end and c != idc.BADADDR and n < 120:
            out.write("%s: %s\n" % (hex(c), idc.generate_disasm_line(c, 0)))
            c = idc.next_head(c, end)
            n += 1
out.close()
idc.qexit(0)

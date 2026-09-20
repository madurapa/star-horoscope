import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets4.txt", "w")
for nm in ["sub_25F30", "sub_25FC7", "sub_25F7D", "sub_26011"]:
    ea = idc.get_name_ea_simple(nm)
    out.write("== %s @ %s\n" % (nm, hex(ea)))
    end = idc.find_func_end(ea)
    c = ea
    while c < end and c != idc.BADADDR:
        d = idc.generate_disasm_line(c, 0)
        if d and ('call' in d and ('Sin' in d or 'Cos' in d or 'sub_' in d or '@' in d)):
            out.write("   %s: %s\n" % (hex(c), d.strip()))
            for x in idautils.XrefsFrom(c):
                out.write("      -> %s (%s)\n" % (hex(x.to), idc.get_func_name(x.to)))
        c = idc.next_head(c, end)
out.close()
idc.qexit(0)

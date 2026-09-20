import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets3.txt", "w")
for nm in ["@Cos$q4Real", "@Sin$q4Real", "@ArcTan$q4Real", "@Sqrt$q4Real"]:
    ea = idc.get_name_ea_simple(nm)
    out.write("name %s -> %s seg=%s func=%s\n" % (nm, hex(ea) if ea != idc.BADADDR else "BADADDR",
          idc.get_segm_name(ea) if ea != idc.BADADDR else "?",
          idc.get_func_name(ea) if ea != idc.BADADDR else "?"))
for a in [0x11FB9, 0x22F94, 0x22FC2]:
    out.write("xrefs from %s:\n" % hex(a))
    for x in idautils.XrefsFrom(a):
        out.write("   -> %s (func %s)\n" % (hex(x.to), idc.get_func_name(x.to)))
out.close()
idc.qexit(0)

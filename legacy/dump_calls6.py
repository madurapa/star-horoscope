import idautils, idc
idc.auto_wait()
out = open("/tmp/calltargets6.txt", "w")
for a in [0x11FB9, 0x11FF8, 0x12055, 0x12170, 0x121E1, 0x1220B]:
    for x in idautils.XrefsFrom(a):
        if x.to > 0x1000:
            out.write("%s -> %s (%s)\n" % (hex(a), hex(x.to), idc.get_func_name(x.to)))
out.close()
idc.qexit(0)

import idautils
import idc
import os

OUT = "/tmp/rt_sincos.txt"
if os.path.exists(OUT):
    os.remove(OUT)

idc.auto_wait()

want = ["@Sin$q4Real", "@Cos$q4Real", "@ArcTan$q4Real", "@Sqrt$q4Real",
        "@Exp$q4Real", "@Int$q4Real", "@Round$q4Real", "@Trunc$q4Real"]

with open(OUT, "w") as f:
    for func_ea in idautils.Functions():
        name = idc.get_func_name(func_ea)
        if name in want:
            end = idc.find_func_end(func_ea)
            f.write("===== %s start=%s end=%s size=%d\n" % (name, hex(func_ea), hex(end), end - func_ea))
            curr = func_ea
            n = 0
            while curr < end and curr != idc.BADADDR and n < 400:
                d = idc.generate_disasm_line(curr, 0)
                if d:
                    f.write("%s: %s\n" % (hex(curr), d))
                curr = idc.next_head(curr, func_ea if False else end)
                n += 1
    f.write("DONE\n")

idc.qexit(0)

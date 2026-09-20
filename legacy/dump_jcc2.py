import idautils, idc, re
idc.auto_wait()
out = open("/tmp/jcc2.txt", "w")
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
            if d:
                m = re.search(r'\b(j\w+|jmp|loop)\s+(short\s+)?(loc_[0-9A-F]+)', d)
                if m:
                    taddr = int(m.group(3)[4:], 16)
                    # loc names are offsets within segment; reconstruct linear:
                    # find linear addr with same low 16 bits? use seg base
                    segbase = idc.get_segm_start(func_ea)
                    # IDA linear = seg*16+off? for these, target linear = ?
                    # try: target = func linear base truncated + offset
                    cand = (func_ea & 0xFFFF0000) + taddr
                    tline = addrs.get(cand, -1)
                    if tline < 0:
                        # try direct
                        for a, li in addrs.items():
                            if (a & 0xFFFF) == taddr:
                                tline = li
                                cand = a
                                break
                    out.write("line %d %s: %s -> %s (line %d)\n" % (addrs[c], hex(c), d.strip(), hex(cand), tline))
            c = idc.next_head(c, end)
out.close()
idc.qexit(0)

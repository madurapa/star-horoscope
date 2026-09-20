import idautils
import idc
import ida_loader 
import json
import os

LOG_FILE = "/tmp/ida_agent_debug.log"

def log(msg):
    print(f"[DEBUG] {msg}")
    with open(LOG_FILE, "a") as lf:
        lf.write(msg + "\n")

# Clear the log from old runs
if os.path.exists(LOG_FILE):
    os.remove(LOG_FILE)

log("🚀 Script execution started inside IDA Pro.")

# 1. Force explicit wait for auto-analysis confirmation
log("⏳ Waiting for initial database auto-analysis subsystem to settle...")
idc.auto_wait()
log("✅ Auto-analysis complete.")

dump = {
    "strings": [],
    "functions": {}
}

# 2. Try Generating ASM File via explicit linear segments rather than BADADDR macro
# Outputs land in the CWD (pass absolute paths when re-running under IDA).
asm_output_path = "full_analysis_listing.asm"
log(f"📄 Attempting to generate ASM to {asm_output_path}...")
try:
    # idc.gen_file accepts a string path natively and handles file handles automatically.
    # Arguments: (OFILE_TYPE, output_path, start_ea, end_ea, flags)
    # OFILE_ASM = 0, flags = 0
    success = idc.gen_file(0, asm_output_path, 0x10000, 0x33760, 0)
    if success >= 0:
        log("✅ Master ASM listing built successfully.")
    else:
        log(f"❌ idc.gen_file returned failure code: {success}")
except Exception as e:
    log(f"❌ ASM generation raised exception: {str(e)}")


# 3. Extract Strings
log("📦 Parsing string table blocks...")
try:
    for s in idautils.Strings():
        str_val = str(s)
        if len(str_val.strip()) > 2:
            xrefs = [hex(x.frm) for x in idautils.XrefsTo(s.ea)]
            dump["strings"].append({"addr": hex(s.ea), "val": str_val, "refs": xrefs})
    log(f"✅ Extracted {len(dump['strings'])} strings.")
except Exception as e:
    log(f"❌ String extraction failure: {str(e)}")

# 4. Extract Functions
log("⚙️ Compiling logic function tables...")
try:
    func_count = 0
    for func_ea in idautils.Functions():
        func_name = idc.get_func_name(func_ea)
        seg_name = idc.get_segm_name(func_ea)
        
        if seg_name and not any(ext in seg_name for ext in ["seg011", "seg012", "seg013"]):
            dump["functions"][func_name] = []
            func_end = idc.find_func_end(func_ea)
            curr = func_ea
            while curr < func_end and curr != idc.BADADDR:
                disasm = idc.generate_disasm_line(curr, 0)
                if disasm:
                    dump["functions"][func_name].append(f"{hex(curr)}: {disasm}")
                curr = idc.next_head(curr, func_end)
            func_count += 1
    log(f"✅ Processed {func_count} custom functions.")
except Exception as e:
    log(f"❌ Function extraction failure: {str(e)}")

# 5. Save output data safely
output_file = "binary_blueprint.json"
log(f"💾 Writing JSON structural data to {output_file}...")
try:
    with open(output_file, "w") as f:
        json.dump(dump, f, indent=4)
    log("✅ JSON output exported cleanly.")
except Exception as e:
    log(f"❌ Writing JSON file failed: {str(e)}")

log("🏁 Terminating IDA Session.")
idc.qexit(0)


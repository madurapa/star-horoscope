"""D. East Indian Numerical Chart (e.g. Ashtakavarga).

Run:
    python3 examples/east_d_numerical.py
Output:
    ./output/east_numerical.svg
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jyotichart as chart

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(OUTPUT_DIR, exist_ok=True)

num = chart.EastNumericalChart("Ashtakavarga", "User")
num.set_ascendantsign("Libra")

# Values are placed at the centre of each fixed-sign compartment.
values = [2, 5, 8, 3, 1, 9, 4, 7, 6, 2, 8, 5]
for housenum in range(1, 13):
    status = num.set_house_value(housenum, values[housenum - 1])
    assert status == "Success", f"house {housenum}: {status}"

result = num.draw(OUTPUT_DIR + "/", "east_numerical", "svg")
print(f"D. East numerical -> {result}: {OUTPUT_DIR}/east_numerical.svg")

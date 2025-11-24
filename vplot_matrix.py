from collections import defaultdict
import sys

counter = defaultdict(lambda: defaultdict(lambda: 0))

for line in sys.stdin:
    data = line.strip().split("\t")

    #Center of Motif = Col4 - Col3
    motif_cntr = (float(data[3]) + float(data[2])) / 2

    #Center of Fragment = Column 10 - Column 9
    frag_cntr = (float(data[9]) + float(data[8])) / 2

    x = frag_cntr - motif_cntr
    y = float(data[11])

    #Counter
    counter[x][y] += 1

for x in sorted(counter.keys()):
    for y in sorted(counter[x].keys()):
        z = counter[x][y]
        print(f"{x:.0f}\t{y:.0f}\t{z}")
import re
import pprint

color = re.compile(r'#[a-f-A-F0-9]{6}')
infile = 'newernst.vim'
colors = {}

f = open(infile)
for l in f:
    matches = re.findall(color, l)
    for c in matches:
        try:
            colors[c] += 1
        except KeyError:
            colors[c] = 1
f.close()

pprint.pprint(colors)
print len(colors)

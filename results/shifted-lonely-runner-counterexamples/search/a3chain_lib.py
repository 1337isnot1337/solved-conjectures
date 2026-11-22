import glob, json
from fractions import Fraction as F
HERE = '/home/claude/slr_ideas'
def load_base(n):
    best = None
    for fn in glob.glob(HERE + '/achain_%d.json' % n) + glob.glob(HERE + '/scert_%d_*.json' % n) + glob.glob(HERE + '/hcert_%d_*.json' % n) + glob.glob(HERE + '/pcert_%d.json' % n):
        c = json.load(open(fn))[0]; g = F(c['gamma'])
        if best is None or g < best[0]: best = (g, c['speeds'], [x / c['shift_den'] for x in c['shift_num']])
    for c in json.load(open('/mnt/user-data/outputs/shifted-lonely-runner/certificates.json')):
        if c['n'] == n:
            g = F(c['gamma'])
            if best is None or g < best[0]: best = (g, c['speeds'], [x / c['shift_den'] for x in c['shift_num']])
    return best

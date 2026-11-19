"""Verify the finite cases in the elementary proof of OEIS A398581 using integers."""
import argparse
from pathlib import Path

def audit(k, prune):
    first = None
    best = None
    best_count = 0
    for x in range(k // 5 + 1, (3 * k - 1) // 5 + 1):
        h, b = 5 * x - k, k * x
        if prune and best is not None and b * (b + 1) < h * best[2]:
            continue
        # Strict inequalities 1/y < h/b < 2/y hold because z > y.
        for y in range(max(x + 1, b // h + 1), (2 * b - 1) // h + 1):
            z, remainder = divmod(b * y, h * y - b)
            if remainder == 0 and z > y:
                assert 5 * x * y * z == k * (y*z + x*z + x*y)
                if first is None:
                    first = (x,y,z)
                if best is None or z > best[2]:
                    best = (x,y,z)
                    best_count = 1
                elif z == best[2]:
                    best_count += 1
                if prune:
                    break  # z is strictly decreasing in y at this x.
    return first, best, best_count

def greedy(k):
    x = k//5 + 1
    h, b = 5*x-k, k*x
    y = b//h + 1
    z, rem = divmod(b*y,h*y-b)
    if rem or not x < y < z:
        return None
    return x,y,z

def verify(limit, published):
    exceptions = []
    for k in range(1,limit+1):
        result = audit(k, True)
        if k <= 150:
            assert result == audit(k, False)
        first, best, count = result
        if first is not None and first[2] != best[2]:
            exceptions.append(k)
        if k%5 != 1 and first is not None:
            assert first == best and count == 1
            assert first == greedy(k)
    if limit >= 11:
        assert exceptions[:1] == [11]
    else:
        assert not exceptions
    if published:
        wanted = [int(line.split()[1]) for line in published.read_text().splitlines()
                  if line.strip() and not line.lstrip().startswith('#')]
        assert limit == 1500 and exceptions == wanted
    print(f'Checked k = 1 through {limit}. {len(exceptions)} exceptions, all 1 modulo 5.')
    print(f'Independent unpruned enumeration agreed through {min(limit,150)}.')
    if published:
        print('The full exception list agrees with Batista’s 86-entry table.')

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--limit',type=int,default=1500)
    parser.add_argument('--published',type=Path)
    args = parser.parse_args()
    verify(args.limit,args.published)

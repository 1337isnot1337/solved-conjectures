"""Exact falsification probe for the full Jin--Nebel conjecture.

This finite computation cannot prove the conjecture. It records no solution.
"""

def add_shift(a, b, s):
    c = a[:] + [0] * max(0, len(b) + s - len(a))
    for j, x in enumerate(b):
        c[j + s] += x
    return c

def times_interval(a, length):
    c = [0] * (len(a) + length - 1)
    value = 0
    for j in range(len(c)):
        if j < len(a):
            value += a[j]
        if j >= length:
            value -= a[j-length]
        c[j] = value
    return c

def drops(a):
    return [(i, a[i-1], a[i]) for i in range(1,(len(a)+1)//2) if a[i] < a[i-1]]

def main():
    row = [[1]]
    count = 0
    for m in range(1, 101):
        old = row
        row = [[1]]
        for k in range(1, m):
            row.append(add_shift(old[k], old[k-1], m-k))
        row.append([1])
        for n in range(1, min(m, 60) + 1):
            p = add_shift(row[n-1], row[n-1], n)
            if n % 2:
                count += 1
                bad = drops(p)
                if bad:
                    print('COUNTEREXAMPLE odd', m, n, bad, flush=True)
                    return
            else:
                for j in range(2, 22, 2):
                    count += 1
                    bad = drops(times_interval(p, j))
                    if bad:
                        print('COUNTEREXAMPLE even', m, n, j, bad, flush=True)
                        return
    print('No counterexample in', count, 'finite parameter checks; not a proof.', flush=True)

if __name__ == '__main__':
    main()

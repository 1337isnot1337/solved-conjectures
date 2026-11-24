"""Integer checks for the fixed-weight Jacobi–Stirling obstruction."""
from functools import reduce
from math import comb, gcd


def add(a, b):
    return [(a[j] if j < len(a) else 0) + (b[j] if j < len(b) else 0)
            for j in range(max(len(a), len(b)))]


def D(a, L):
    if not a:
        return []
    b = [(j + 1) * (a[j] if j < len(a) else 0)
         + (L - j + 1) * (a[j-1] if j else 0) for j in range(len(a)+1)]
    while b and not b[-1]:
        b.pop()
    return b


def coeff(k, S):
    a, L = [1], 0
    for j in range(1, k+1):
        a = D(a, L)
        if j not in S:
            a = D(a, L+1)
        L += 2 + (j not in S)
    return a


def aggregate(k, i):
    previous = {0: [1]}
    for j in range(1, k+1):
        current = {}
        for r in range(min(j, i)+1):
            L = 3*j-2-r
            a, b = previous.get(r-1, []), previous.get(r, [])
            current[r] = D(add(a, D(b, L-1)), L)
        previous = current
    return previous.get(i, [])


def signs(a):
    return ''.join('+' if c > 0 else '-' if c < 0 else '0' for c in a)


def V(s):
    s = s.replace('0', '')
    return sum(x != y for x, y in zip(s, s[1:]))


def rem(a, b):
    a = a[:]
    while len(a) >= len(b):
        lc, lead, t = b[-1], a[-1], len(a)-len(b)
        c = abs(lc)
        a = [c*h-(lc//c)*lead*(b[j-t] if j >= t else 0) for j,h in enumerate(a)]
        while a and a[-1] == 0:
            a.pop()
        g = reduce(gcd, a, 0)
        if g:
            a = [x//g for x in a]
    return a


def sturm(a):
    seq = [a, [j*a[j] for j in range(1,len(a))]]
    while (r := rem(seq[-2], seq[-1])):
        seq.append([-x for x in r])
    return signs([b[-1]*(-1)**(len(b)-1) for b in seq]), signs([b[0] for b in seq]), len(seq[-1])-1


def shift(a):
    n = len(a)-1
    return [sum(a[k]*comb(k,j)*(-87)**(k-j)*10**(n-k+j) for k in range(j,n+1))
            for j in range(n+1)]


assert coeff(2,{1}) == [1,7,4] and coeff(2,{2}) == [1,5,2]
assert aggregate(2,1) == [2,12,6]
f, g = coeff(13,set(range(7,14))), coeff(13,set(range(1,8)))
assert len(f) == len(g) == 19
for a, expected in [(f,(3,15)), (g,(1,17))]:
    assert V(sturm(a)[0])-V(sturm(a)[1]) == 18 and sturm(a)[2] == 0
    b = shift(a)
    assert b[0] and (V(signs([(-1)**j*x for j,x in enumerate(b)])), V(signs(b))) == expected

p = [234*a+b for a,b in zip(f,g)]
q = aggregate(13,7)
assert len(q) == 19
for a, expected in [
    (p, ('+-+-+--+-+-+-+-+-+-','+++++++------------',0)),
    (add([10**5*x for x in p],q),('+-+-+-++-+-+-+-+-+-','+++++++------------',0)),
    (q,('+-+-+-+-+-+-+-+-+-+','+++++++++++++++++++',0)),
]:
    assert all(x > 0 for x in a)
    assert sturm(a) == expected, sturm(a)
print('PASS: both weighted mixtures have 16 simple negative roots; the equal sum has 18')

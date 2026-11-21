"""Exact diagnostics for the all-profile genus-asymptotic argument.

The theorem is proved by symbolic pole classification, not these finite checks.
Two independent constructions are compared: character sums with partition-lattice
inversion, and the source cut-and-join recursion. No floating point or Lean.
"""

from collections import Counter
from functools import lru_cache
from itertools import product
from math import comb, factorial, prod
import json
import sympy as sp
from sympy.polys.rings import ring
from sympy.polys.domains import QQ

P, t = ring('t', QQ)


@lru_cache(None)
def partitions(n, hi=None):
    if n == 0:
        return ((),)
    hi = min(n, n if hi is None else hi)
    return tuple((a, *tail) for a in range(hi, 0, -1)
                 for tail in partitions(n-a, a))


def cells(lam):
    return {(i, j) for i, a in enumerate(lam) for j in range(a)}


@lru_cache(None)
def rim_removals(lam, length):
    shape = cells(lam)
    ans = []
    for nu in partitions(sum(lam)-length):
        if len(nu) > len(lam) or any(a > b for a, b in zip(nu, lam)):
            continue
        strip = shape - cells(nu)
        if not strip:
            continue
        if any({(i, j), (i+1, j), (i, j+1), (i+1, j+1)} <= strip
               for i, j in strip):
            continue
        seen = {next(iter(strip))}
        stack = list(seen)
        while stack:
            i, j = stack.pop()
            for point in ((i-1,j), (i+1,j), (i,j-1), (i,j+1)):
                if point in strip and point not in seen:
                    seen.add(point)
                    stack.append(point)
        if seen == strip:
            ans.append((nu, (-1)**(len({i for i, _ in strip})-1)))
    return tuple(ans)


@lru_cache(None)
def character(lam, mu):
    if not mu:
        return int(not lam)
    return sum(sign * character(nu, mu[1:])
               for nu, sign in rim_removals(lam, mu[0]))


def dimension(lam):
    hooks = [lam[i]-j + sum(a > j for a in lam[i+1:]) for i, j in cells(lam)]
    return factorial(sum(lam)) // prod(hooks)


@lru_cache(None)
def cycle_partitions(mu):
    """Möbius coefficients grouped by multiset of block profiles."""
    states = [()]
    for part in mu:
        updated = []
        for blocks in states:
            updated.append((*blocks, (part,)))
            for i in range(len(blocks)):
                updated.append((*blocks[:i], (*blocks[i], part), *blocks[i+1:]))
        states = updated
    ans = Counter()
    for blocks in states:
        key = tuple(sorted((tuple(sorted(b, reverse=True)) for b in blocks),
                           reverse=True))
        ans[key] += (-1)**(len(blocks)-1) * factorial(len(blocks)-1)
    return tuple(ans.items())


def series_product(a, b, count):
    ans = [P.zero for _ in range(count)]
    for i in range(min(len(a), count)):
        for j in range(min(len(b), count-i)):
            ans[i+j] += a[i]*b[j]
    return tuple(ans)


@lru_cache(None)
def W_series(mu, count):
    d = sum(mu)
    ans = [P.zero for _ in range(count)]
    for lam in partitions(d):
        weight = QQ(dimension(lam)*character(lam, mu), factorial(d))
        if not weight:
            continue
        term = (P.one,)
        for i, j in cells(lam):
            c = j-i
            if c:
                factor = (P.one, *(t*c**r for r in range(1, count)))
                term = series_product(term, factor, count)
        for r, value in enumerate(term):
            ans[r] += weight * value
    return tuple(ans)


def connected_series(mu, count):
    ans = [P.zero for _ in range(count)]
    for blocks, weight in cycle_partitions(mu):
        term = (P.one,)
        for block in blocks:
            term = series_product(term, W_series(block, count), count)
        for r, value in enumerate(term):
            ans[r] += weight*value
    return ans


@lru_cache(None)
def splits(mu):
    counts = tuple(sorted(Counter(mu).items(), reverse=True))
    out = []
    for numbers in product(*(range(c+1) for _, c in counts)):
        left = tuple(v for (v, c), k in zip(counts, numbers) for _ in range(k))
        right = tuple(v for (v, c), k in zip(counts, numbers) for _ in range(c-k))
        out.append((left, right, prod(comb(c,k) for (_,c),k in zip(counts,numbers))))
    return tuple(out)


def H(genus, mu):
    if genus < 0 or not mu or min(mu) <= 0:
        return P.zero
    return _H(genus, tuple(sorted(mu, reverse=True)))


@lru_cache(None)
def _H(genus, mu):
    if mu == (1,):
        return P.one if genus == 0 else P.zero
    m, tail = mu[0], mu[1:]
    ans = P.zero
    for v, multiplicity in Counter(tail).items():
        rest = list(tail)
        rest.remove(v)
        ans += multiplicity*(m+v)*H(genus, (m+v, *rest))
    if m > 1:
        ans += (t-1)*(m-1)*H(genus, (m-1, *tail))
    for a in range(1, m):
        b = m-a
        bracket = H(genus-1, (a,b,*tail))
        for left, right, multiplicity in splits(tail):
            for g1 in range(genus+1):
                bracket += multiplicity*H(g1,(a,*left))*H(genus-g1,(b,*right))
        ans += a*b*bracket
    return ans / m


def term_pole(lam, pole):
    """Return order and residual value at u=1/pole for one content product."""
    order = 0
    out = P.one
    for i, j in cells(lam):
        c = j-i
        if c == pole:
            order += 1
            out *= t
        else:
            out *= (pole-c+c*t) / (pole-c)
    return order, out


@lru_cache(None)
def W_pole(mu, pole):
    regular = P.zero
    residue = P.zero
    d = sum(mu)
    for lam in partitions(d):
        weight = QQ(dimension(lam)*character(lam,mu), factorial(d))
        if not weight:
            continue
        order, value = term_pole(lam, pole)
        assert order <= 1
        if order:
            residue += weight*value
        else:
            regular += weight*value
    return regular, residue


def connected_residue(mu, pole):
    ans = P.zero
    for blocks, weight in cycle_partitions(mu):
        poles = [(regular,residue) for regular,residue in
                 (W_pole(block,pole) for block in blocks)]
        singular = [i for i, (_,residue) in enumerate(poles) if residue]
        assert len(singular) <= 1
        if singular:
            index = singular[0]
            term = poles[index][1]
            for i, (regular, _) in enumerate(poles):
                if i != index:
                    term *= regular
            ans += weight*term
    return ans


def L(d):
    return t*prod((d-1-j+j*t) for j in range(1,d-1))


def main():
    recurrence_checks = 0
    residue_checks = 0
    records = []
    for d in range(2, 7):
        # Character orthogonality and dimensions independently check the generator.
        for lam in partitions(d):
            assert character(lam,(1,)*d) == dimension(lam)
        for mu in partitions(d):
            count = d+2*3-2+len(mu)+1
            sequence = connected_series(mu,count)
            for genus in range(4):
                exponent = d+2*genus-2+len(mu)
                assert sequence[exponent] == prod(mu)*H(genus,mu), (genus,mu)
                recurrence_checks += 1
            if d >= 4:
                leading = connected_residue(mu,d-1)
                second = connected_residue(mu,d-2)
                assert leading == L(d)/factorial(d)/factorial(d-2), mu
                assert second == -(d-2+mu.count(1))*(1+t)*L(d-1)/factorial(d)/factorial(d-3), mu
                residue_checks += 2
                records.append({'profile':mu,'leading':str(leading),'second':str(second)})
        print(f'd={d}: exact character/recurrence and residue checks passed',flush=True)
    output = {'status':'passed','recurrence_comparisons':recurrence_checks,
              'exact_residue_comparisons':residue_checks,'profiles':records,
              'scope':'Finite diagnostics only; the manuscript supplies the general proof.'}
    with open('coulter_moskovsky_verification.json','w') as stream:
        json.dump(output,stream,indent=2)
        stream.write('\n')
    print(json.dumps({k:v for k,v in output.items() if k!='profiles'}),flush=True)


if __name__ == '__main__':
    main()

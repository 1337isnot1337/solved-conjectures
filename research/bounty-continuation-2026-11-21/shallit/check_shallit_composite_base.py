"""Exact checks for a composite-base obstruction; not a Shallit 14 solver."""
import json
from math import gcd
from pathlib import Path


def digits(n, base):
    assert n > 0
    out = []
    while n:
        n, d = divmod(n, base)
        out.append(d)
    return list(reversed(out))


def step(state, a, b):
    if state == 'dead':
        return 'dead'
    if state == 'start':
        return ('nonzero' if b else 'zero') if a == 1 else 'dead'
    return ('nonzero' if b else 'zero') if a == 0 else 'dead'


def run(A, B, base):
    aa, bb = digits(A, base), digits(B, base)
    length = max(len(aa), len(bb))
    aa = [0] * (length - len(aa)) + aa
    bb = [0] * (length - len(bb)) + bb
    state = 'start'
    for a, b in zip(aa, bb):
        state = step(state, a, b)
    return state == 'nonzero', aa, bb


A, B = 6**11, 2**11
accepted, aa, bb = run(A, B, 6)
q = A // B
assert accepted and A % B == 0
assert B > 6**4 and q > 6**4
assert aa[0] != 0 and bb[-1] != 0

smooth_count = 0
for a in range(31):
    for b in range(31):
        m = max(a, b)
        denominator = 2**(m-a) * 3**(m-b)
        ok, _, _ = run(6**m, denominator, 6)
        assert ok and denominator % 6 != 0
        assert 6**m // denominator == 2**a * 3**b
        smooth_count += 1

partition_checks = []
for base, U, V in [(6,2,3), (10,2,5), (12,4,3), (18,2,9), (30,6,5), (72,8,9)]:
    assert U * V == base and gcd(U, V) == 1
    t = 1
    while min(U**t, V**t) <= base**4:
        t += 1
    numerator, denominator = base**t, U**t
    ok, _, _ = run(numerator, denominator, base)
    assert ok and denominator % base != 0
    assert numerator // denominator == V**t
    partition_checks.append({'base':base,'U':U,'V':V,'t':t})

result = {
    'status':'passed',
    'dfa_state_count':4,
    'witness':{'base':6,'A':A,'B':B,'quotient':q,'bound':6**4,
               'numerator_digits': ''.join(map(str,aa)),
               'denominator_digits': ''.join(map(str,bb))},
    'smooth_number_witnesses_checked':smooth_count,
    'partition_checks':partition_checks,
    'scope':'counterexample to a universal bound; not a counterexample to existence of some small witness',
    'full_bounty_solutions':0,
}
Path(__file__).with_name('shallit-composite-base-check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))

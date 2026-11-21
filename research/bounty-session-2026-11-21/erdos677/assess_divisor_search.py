"""Assess an all-upper-offset LCM search against existing public screen caps.

This is a feasibility calculation, not a counterexample search or a proof of
Erdős 677. Every integer threshold is computed exactly.
"""
from math import comb, factorial, lcm, prod
import json
from pathlib import Path

from sympy import factorint, integer_nthroot


def prime_powers_of_block(n, k):
    factors = {}
    for x in range(n+1, n+k+1):
        for p, e in factorint(x).items():
            p, e = int(p), int(e)
            factors[p] = max(factors.get(p, 0), e)
    return factors


rows = []
for k, cap in [
    (5, 2000000), (6, 2000000), (7, 2000000), (10, 2000000),
    (20, 2000000), (40, 2000000), (41, 500000), (80, 500000),
    (81, 100000), (200, 100000), (201, 20000), (1000, 20000),
]:
    lam = lcm(*range(1, k+1))
    Q = lam//k
    target = comb(cap+1+k, k)
    lo, hi = 0, cap
    while lo < hi:
        mid = (lo+hi)//2
        if Q*comb(mid+k, k) >= target:
            hi = mid
        else:
            lo = mid+1
    assert Q*comb(lo+k, k) >= target
    assert lo == 0 or Q*comb(lo-1+k, k) < target
    rows.append({
        "length": k, "public_upper_offset_cap": cap,
        "lambda_over_k": str(Q),
        "least_lower_offset_not_excluded_for_m_above_cap_by_global_defect_bound": lo,
    })

samples = []
for k, n in [(5,2000000),(6,2000000),(10,2000000),(20,2000000),
             (40,2000000),(80,500000),(200,100000),(1000,20000)]:
    f = prime_powers_of_block(n,k)
    L = prod(p**e for p,e in f.items())
    divisor_count = prod(e+1 for e in f.values())
    root, _ = integer_nthroot(factorial(k-1)*L, k)
    upper = int(root)-1
    lower = n+k
    anchor = max(p**e for p,e in f.items())
    assert anchor > k
    intervals = []
    for t in range((lower+1+anchor-1)//anchor, (upper+k)//anchor+1):
        a, b = max(lower,t*anchor-k), min(upper,t*anchor-1)
        if a <= b:
            intervals.append([a,b])
    samples.append({
        "length":k,"lower_offset":n,
        "lcm_digits":len(str(L)),
        "divisor_count":str(divisor_count),
        "necessary_upper_offset_max":upper,
        "largest_prime_power":anchor,
        "anchor_candidate_intervals":intervals,
        "anchor_candidate_count":sum(b-a+1 for a,b in intervals),
    })

out = {
    "status":"feasibility assessment only; no full counterexample search",
    "prior_caps_source":"https://botnet.com/topics/f8de8aca-681d-4e09-9c05-43bd37ca5f87",
    "prior_caps_independently_reproduced":False,
    "thresholds":rows,
    "illustrative_fixed_lower_blocks":samples,
}
path = Path(__file__).with_name("feasibility.json")
path.write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps(out,indent=2))

# Parent and post-gap tests through ten billion

An online audit of Knuth's implementation of Gibbs's algorithm
reaches the published count of 739,778,038 Ulam numbers through
$10^{10}$. It records the parent of each accepted term, the targets
without a representation, and the Ulam counts in post-gap windows.
The implementation chooses the first valid candidate summand during
its search. At an accepted target that pair is unique.
[Knuth's source](https://www-cs-faculty.stanford.edu/~knuth/programs/ulam-gibbs.w) ·
[Gibbs and McCranie, Table 1](https://vixra.org/pdf/1711.0134v1.pdf)

## Parent deficits

The [parent-translation deficit](parent-translation.md) exceeds
$`2\sqrt p`$ at five genuine parent pairs with $`p\ge8192`$ in this range.
The first failure and the largest ratio are as follows.

| Target | $p$ | $q$ | $A(p)$ | $A(q)$ | $A(p+q)$ | Deficit |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 1,717,591,204 | 9,193 | 1,717,582,011 | 773 | 127,052,604 | 127,053,174 | 203 |
| 7,167,744,374 | 8,368 | 7,167,736,006 | 707 | 530,253,949 | 530,254,459 | 197 |

The largest ratio at this cutoff is $`197/\sqrt{8368}`$, below 3.
There are 27 failures with $`p\ge4096`$ and factor 2. Their largest
ratio is still $`143/\sqrt{4118}`$ from the independent billion-position
replay. A factor-3 bound for all future genuine pairs with
$`p\ge8192`$ would give positive lower density by the comparison proof.

## Response after long gaps

For each preceding gap of length $`g\ge300`$ ending at $u$, the audit
counts selected positions in $`[u,u+g)`$ whenever that interval is
wholly inside the computed prefix. The fraction with denominator equal
to the sum of the gap lengths is its length-weighted average density.

| Cutoff | Complete windows | Weighted density | Minimum density in one window | Target at the minimum |
| ---: | ---: | ---: | ---: | ---: |
| 1,000,000,000 | 1,527 | 46,276/509,393 | 15/315 | 33,312,639 |
| 3,000,000,000 | 4,641 | 139,880/1,538,554 | 10/315 | 2,086,244,884 |
| 4,000,000,000 | 6,094 | 183,630/2,018,796 | 7/337 | 3,159,250,539 |
| 10,000,000,000 | 15,382 | 464,001/5,097,323 | 7/337 | 3,159,250,539 |

The windows at 2,086,244,884 and 3,159,250,539 refute the earlier
uniform density threshold $1/21$ for gaps of length at least 300.
Continuing the independent bucket search from the verified prefix
through one billion also reproduces the first parent failure and
the window with 10 terms after the gap of length 315.
The [weighted criterion](phase-gap-limits.md) can tolerate these
windows. It requires a positive weighted average along unbounded
record-low density cutoffs of the genuine sequence.

## Missing representations

Among the integers from 3 through $10^{10}$ there are 1,862,292,408
with no representation as a sum of two distinct Ulam terms. The audit
finds zero consecutive pairs of such misses. Eventual absence of
adjacent misses would imply $`A(N)\gg\sqrt N`$ by the
[pair-count criterion](pair-counts.md).

## Replay

The [change file](knuth-online-audit.ch) records the summand found by
each of the original search branches. It indexes the settled membership
bits in blocks of 256 for exact prefix counts. The response counts are
differences of the running count at the two ends of each window. The
check preserves the original search decisions and returns failure if
the generator stops before the requested cutoff.

Run from a scratch directory with the absolute checkout path set in
`repo`. Use the same [source fingerprint](parent-translation.md) as
for the one-billion bit-vector replay.

```sh
curl -fsSLO https://www-cs-faculty.stanford.edu/~knuth/programs/ulam-gibbs.w
cp "$repo/research/ulam-sequence-density/knuth-online-audit.ch" .
ctangle -bp ulam-gibbs.w knuth-online-audit.ch
cc -std=gnu99 -O3 ulam-gibbs.c -lm -o ulam-audit
./ulam-audit m0 739800000
./ulam-audit p856371966 q350477575 m0 739800000
```

The second command uses Gibbs and McCranie's phase approximation. The
original default uses Knuth's approximation. Both use exact integer
residues to organize the search. The two audits give identical totals,
extrema, and witness values for membership, misses, parent deficits,
and minimum post-gap response. The weighted totals are from the second
replay. A quick replay through one billion
uses `ULAM_AUDIT_LIMIT=1000000000` and a term cap of `74000000`.

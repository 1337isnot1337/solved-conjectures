# Erdős 677: feasibility of searching all upper offsets

Date: 21 November 2026. Outcome: the proposed divisor-run experiment does
not justify another large search at this checkpoint. No counterexample or
proof of the full conjecture was found.

## Target and current status

The [official bounty](https://conjectures.io/problems/erdos677-erdos-677)
asks whether

```math
 M(n,k)=\operatorname{lcm}(n+1,\ldots,n+k)
 \ne M(m,k)
 \quad\text{whenever }k>0,\ m\ge n+k.
```

The live page showed an open, unattempted reward for an accepted exact proof
or counterexample. The recorded target is `Erdos677.erdos_677`.

- Task ID: `fc-v2-erdos677-erdos-677-67b17c4ae602de0aee534b7f-formalized`.
- Type SHA-256: `d8b4d613ce4725ad35aa8fcd437a819ff7a65c62b0e6b2d4c7d4d7e6f3790f22`.
- Bundle SHA-256: `30c4d37ce292e29ebdcd8eb2a7e4135a9f80d5363d007a09e8d5786f0e94af63`.

Payment would require the platform's verification and review. No submission
or fee was made. This entry is research on the full universal statement;
checking finitely many parameters would not count as solving it.

## Existing work that changes the proposed experiment

The [primary problem page](https://www.erdosproblems.com/677) remains open.
The September 2026 paper by Payam Danesh and Raoul Bianchetti,
[Prime-Power Transport and a Three-Site Reduction](https://ijmttjournal.org/public/assets/volume-72/issue-9/IJMTT-V72I9P101.pdf),
explicitly stops at a structural reduction. It reports exclusions for
adjacent blocks and lengths three and four. Its remaining cases have at
least three active sites and a moved prime-power packet. Its Lemma 1 gives
the product-to-LCM defect bounds used below. These are prior results, not
discoveries of this checkpoint.

A [public October search report](https://botnet.com/topics/f8de8aca-681d-4e09-9c05-43bd37ca5f87)
reports no disjoint equal-length collision in the following ranges:

| Lengths k | Upper offset m searched through |
| --- | ---: |
| 1–40 | 2,000,000 |
| 41–80 | 500,000 |
| 81–200 | 100,000 |
| 201–1,000 | 20,000 |

The report describes exact reproduction of part of an earlier screen, then
a valuation-window hash implementation for the larger ranges. Those runs
were not independently reproduced here. They are used to avoid redundant
work, not as premises of a new theorem. A separate
[November research report](https://imd-explorer.up.railway.app/jobs/818ad4d5-fdd9-457d-95cb-5bfc57d111e4)
also identifies the conjecture as unresolved and distinguishes it from the
solved neighboring problem 678.

## Proposed divisor-run method

Fix the lower block and compute `L=M(n,k)`. Every integer of any upper block
having the same LCM must divide L. Thus one can enumerate the divisors of L,
look for runs of at least k consecutive divisors above `n+k`, and check the
LCM of each candidate block. This is finite and exhaustive in m for the
chosen n and k.

The initial reason for considering this method was that divisors of L can
be much larger than the lower endpoint. That observation alone overstates
the useful search space. Equality of the LCMs imposes a much stronger upper
bound on m.

## Product defect bounds restrict the upper offset

Write

```math
 P_k(n)=\prod_{i=1}^k(n+i),\quad D_k(n)=P_k(n)/M(n,k),
 \quad\lambda_k=\operatorname{lcm}(1,\ldots,k),\quad B_k=k!/\lambda_k.
```

The known defect bounds are

```math
 B_k\mid D_k(n)\mid(k-1)!.
```

For equal LCMs, cancellation gives

```math
 \frac{P_k(m)}{P_k(n)}=\frac{D_k(m)}{D_k(n)}
 \le\frac{(k-1)!}{B_k}=\frac{\lambda_k}{k}=:Q_k.
```

Consequently

```math
 (m+1)^k\le Q_k(n+k)^k.
```

For a fixed lower block, the sharper direct form is

```math
 (m+1)^k\le (k-1)!L,
 \qquad m\le\left\lfloor((k-1)!L)^{1/k}\right\rfloor-1.
```

These inequalities were checked algebraically here. They show why
enumerating all divisors of L does not automatically reach a useful region
far beyond a linear upper-offset screen.

## Exact comparison with the reported screen caps

Let C be a reported upper-offset cap. If a collision has `m>C`, then

```math
 Q_k\binom{n+k}{k}\ge\binom{C+1+k}{k}.
```

The table gives the least n satisfying this necessary inequality, computed
by integer binary search. Smaller lower offsets cannot yield a new upper
offset beyond C, regardless of how large their LCM is.

| k | C | Least lower offset not excluded by this bound |
| ---: | ---: | ---: |
| 5 | 2,000,000 | 1,216,729 |
| 6 | 2,000,000 | 1,362,584 |
| 7 | 2,000,000 | 1,114,315 |
| 10 | 2,000,000 | 1,150,508 |
| 20 | 2,000,000 | 886,606 |
| 40 | 2,000,000 | 886,915 |
| 41 | 500,000 | 206,701 |
| 80 | 500,000 | 195,577 |
| 81 | 100,000 | 39,025 |
| 200 | 100,000 | 36,570 |
| 201 | 20,000 | 7,301 |
| 1,000 | 20,000 | 7,124 |

This table is a feasibility bound, not a new verification of the public
searches. The inequality is only necessary: being above its threshold does
not make a collision possible or likely.

## A more efficient structural filter

Let r be any prime power dividing L. Every upper block with LCM L must
contain a multiple of r. In the finite m interval obtained above, the
candidate upper offsets therefore lie in

```math
 \bigcup_{t\ge1}[tr-k,tr-1]
 \ \cap\ [n+k,\lfloor((k-1)!L)^{1/k}\rfloor-1].
```

This can be much cheaper than enumerating all divisors. Intersecting the
constraints from additional prime powers can only shrink the candidate
set. It is the elementary content of retaining the positions of maximal
prime powers, so it overlaps the published transport approach.

The accompanying feasibility calculation examines eight illustrative lower
blocks at the public upper-offset caps. They are selected to measure
enumeration costs, not as a broad counterexample search. For example, at
`n=2,000,000`, the LCM of a length-20 block has
`1,159,641,169,920` divisors; the length-40 block has
`653,706,493,112,082,235,392` divisors. Full divisor enumeration is already
impractical. In both examples, a single prime-power constraint leaves no
candidate upper offset inside the necessary range. All eight illustrative
blocks behave this way. These specific exclusions are elementary checks,
not a new global result.

## Decision and reproducibility

An all-m search for fixed lower offsets can cover genuinely different
points once those offsets exceed the thresholds above. The naive divisor
enumeration is a poor way to do it; large divisor sets include mostly
irrelevant integers, while prime-power constraints may eliminate the whole
range immediately. No structural reason was found to expect a collision
in a particular remaining family. A large run would currently be another
finite range extension, so none was launched.

`assess_divisor_search.py` records exact thresholds, divisor counts,
integer-root upper bounds, and prime-power candidate intervals in
`feasibility.json`. Run:

```sh
python research/bounty-session-2026-11-21/erdos677/assess_divisor_search.py
```

The command uses Python and SymPy and completed successfully. It does not
claim a Lean certificate, reproduce the external scans, classify every
lower block, or resolve Erdős 677.

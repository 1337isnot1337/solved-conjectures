# Erdős 517: target audit and the zero-persistence obstruction

21 November 2026. Research reservation:
[issue 223, comment 7069494775](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069494775).
The full problem is unresolved in this note. No formal submission, fee,
award acceptance, or payment has occurred.

## 1. The exact paid target

The live [Conjectures.io problem](https://conjectures.io/problems/erdos517-erdos-517)
asks whether every entire function

```math
f(z)=\sum_{k\geq0}a_kz^{n_k},\qquad
a_k\ne0,\qquad n_0\lt n_1<\cdots,\qquad
\frac{n_k}{k}\longrightarrow\infty
\tag{1}
```

takes every complex value infinitely often. This is the full function-class
question, not a finite case or a stronger gap assumption. The displayed
bounty was an estimated USD 2,702 on the check recorded here; earlier in
the same research session it was USD 2,544. Neither amount was locked.
The page displayed no proof or refutation attempts and no published
contributions.

| Pinned item | Value |
| --- | --- |
| Task | `fc-v2-erdos517-erdos-517-5b7e704464aa1fe19e91041d-formalized` |
| Source type SHA-256 | `f49614b72ab32a1ccd4fb7dbe54c86d23d11a3d4e52e0d9a690f4265fa1e8ed8` |
| Task commitment SHA-256 | `8168013e052ca2a1193a2f5170474bc5351ae2d68fd16584831b8a52fb9026ae` |
| Upstream source revision | `7d1a8c9912747679d0093f6d1216420c33ee5ffa` |

The [pinned statement](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/517.lean)
is the following proposition, with the platform's truth choice fixed to
`True` in the proof task:

**Lean excerpt**

```lean
True ↔
  ∀ {f : ℂ → ℂ} {n : ℕ → ℕ},
    HasFabryGaps n →
      ∀ {a : ℕ → ℂ},
        (∀ k, a k ≠ 0) →
        (∀ z, HasSum (fun k => a k * z ^ n k) (f z)) →
        ∀ z, {x | f x = z}.Infinite
```

I fetched the [definition at that same revision](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjecturesForMathlib/Analysis/HasGaps.lean),
whose file blob is `9e417ea87f7cc04b88e7e509d35db0f19eba90fb`:

**Lean excerpt**

```lean
def HasFabryGaps (n : ℕ → ℕ) : Prop :=
  StrictMono n ∧ Tendsto (fun k => n k / (k : ℝ)) atTop atTop
```

In particular, repeated exponents and coefficient cancellation do not
produce a formalization counterexample.

The [submission terms](https://conjectures.io/submission-terms) were v13,
effective 11 November 2026, with review policy v4. Exact pinned Lean
verification and separate review are required. A prior established proof
of the same problem disqualifies an independent rediscovery, even without
a prior formalization. Catalog amounts are estimates; the quote is locked
only on submission. Review requires original AI chat logs. This is a
solver-directed reward offer, conditional on those terms, and not evidence
that an award has been earned. No account, log upload, or financial action
is part of this research.

## 2. Primary statement and prior-art boundary

The original source is P. Erdős, *Some unsolved problems*, 1961,
printed page 250, section IV.8, in the
[Rényi scan](https://www.renyi.hu/~p_erdos/1961-22.pdf).
It states the Fejér–Pólya question and records the older summable-reciprocal
gap results. The initially considered filename `1961-09.pdf` is an
unrelated probability paper and is not evidence for this target.

The [current tracker](https://www.erdosproblems.com/517) remains marked
open. Its [history](https://www.erdosproblems.com/history/517) and
[discussion](https://www.erdosproblems.com/forum/thread/517) were checked.
The remark pointing to Murai does not claim a solution. The platform's
[pool-change page](https://conjectures.io/problems/changes) lists this
target under the 25 August 2026 additions, not under a solved batch.

The following distinctions prevent counting known results as completions.

- The hypothesis $`\sum_k1/n_k<\infty`$ is stronger than (1). Its
  value-distribution conclusion is prior work of Fejér and Biernacki,
  already recorded in Erdős's source.
- The finite-order case is prior. Y. Wang's
  [2001 primary paper](https://www.jstage.jst.go.jp/article/tmj/53/1/53_1_163/_pdf/-char/en),
  pages 164–165, also discusses results for finite lower order and the
  exception permitted by the infinite-order Julia-line theorem. None
  removes the exceptional value in the unrestricted class (1).
- T. Murai, *The deficiency of entire functions with Fejér gaps*,
  Annales de l'Institut Fourier 33 (1983), 39–58,
  [primary full text](https://www.numdam.org/item/10.5802/aif.930.pdf),
  proves a stronger deficiency theorem for Fejér gaps. Section 5 constructs
  a Fabry-gap function with deficiency one at zero. Deficiency one does
  not assert finitely many zeros.

Searches included the exact problem number and conjecture names, Fabry
gaps with Picard or exceptional values, zero-free lacunary entire
functions, sparse Taylor support, Murai's construction, and the cited
Clunie paper. The accessible primary texts and current records did not
produce a proof of the full target. This is a bounded literature search,
not a guarantee that no unlocated proof exists. Clunie's 1967 paper was
located at its [publisher record](https://academic.oup.com/jlms/article-abstract/s1-42/1/393/844099),
but its full proof was not available in that retrieval; no new theorem is
attributed to its inaccessible contents here.

The earlier [Erdős Problem a Day report](https://www.erdosproblemaday.com/report/517)
already identifies the polynomial-times-exponential reduction and the
failure of finite coefficient searches. Those reductions are not claimed
as new work below.

## 3. A general zero-persistence lemma

This elementary lemma makes the attempted adaptation of Murai's
construction precise. Counts in this section include multiplicity.

**Lemma.** Let nonzero polynomials $`p_j`$ converge locally uniformly on
$`\mathbb C`$ to a nonzero entire function $`F`$. Suppose there are radii
$`R_m>0`$ and integers $`d_m\to\infty`$ such that, for every fixed $`m`$,
all sufficiently large $`j`$ satisfy

```math
n(R_m,p_j)\geq d_m,
\tag{2}
```

where $`n(R,p)`$ counts zeros in the open disk of radius $`R`$. Then
$`F`$ has infinitely many distinct zeros.

**Proof.** Fix $`m`$. Since $`F`$ is nonzero, choose a radius
$`R>R_m`$ for which $`F`$ has no zero on $`|z|=R`$.
Uniform convergence on this circle and Rouché's theorem imply

```math
n(R,F)=n(R,p_j)\geq n(R_m,p_j)\geq d_m
\tag{3}
```

for all sufficiently large $`j`$. As $`d_m`$ is unbounded, the total
zero count of $`F`$ is infinite. Each zero of a nonzero entire function
has finite multiplicity, so there must be infinitely many distinct
zeros. This proves the lemma.

The radius $`R`$ in this proof is deliberately allowed to be slightly
larger than $`R_m`$. No nonvanishing of the limit on the original
preservation circles is assumed.

### Application to the proposed counterexample route

In Murai's notation, equations (28)–(34) use Taylor polynomials $`g_m`$
and multipliers $`\exp((z/r'_{m-1})^{q_m})`$. Equation (30) preserves
the zero counts on earlier circles; $`r'_m`$ contains every zero of
$`g_m`$. The polynomials converge locally uniformly and have constant
coefficient one. Their degrees tend to infinity: the nonnegative
coefficients prevent cancellation, and (28) retains a new term beyond
the preceding degree. Thus (2) holds with the degrees of these
polynomials. The limit has infinitely many distinct zeros by the lemma.

This is a deduction from the construction, not a claim that its
deficiency calculation was incomplete. It rules out a counterexample at
zero from any adaptation that retains unbounded polynomial degrees and
these fixed-disk zero-count preservation conditions.

## 4. The full unresolved obligation

For an entire function $`F`$, define its Taylor support by

```math
S(F)=\{n\geq0:[z^n]F\ne0\},\qquad
N_F(x)=|S(F)\cap[0,x]|.
\tag{4}
```

For infinite support, the Fabry condition in (1) is equivalent to
$`N_F(x)=o(x)`$. Changing the constant coefficient does not affect this
condition.

If a function in (1) takes a value $`a`$ only finitely often, factor those
zeros with multiplicity into a polynomial $`P`$. The quotient
$`(f-a)/P`$ is an entire function without zeros and therefore has an
entire logarithm. Consequently

```math
f-a=P\exp(g)
\tag{5}
```

for an entire $`g`$. Conversely, a transcendental function of the form
$`P\exp(g)`$ with $`N_{P\exp(g)}(x)=o(x)`$ would refute the target.
If one wants its series to have no constant term, subtract its value at
zero; the corresponding exceptional value changes, but the support
density and finite-preimage property do not.

The missing statement is therefore exactly

```math
P\exp(g)\text{ transcendental entire}
\quad\Longrightarrow\quad
\limsup_{x\to\infty}\frac{N_{P\exp(g)}(x)}x>0.
\tag{6}
```

Here $`P`$ is a nonzero polynomial and $`g`$ is arbitrary entire.
The polynomial-$`g`$ case is already covered by finite-order results.
No proof of (6) for transcendental $`g`$ is supplied.

I examined the construction direction by alternately imposing long zero
blocks on Taylor coefficients and taking exponential extensions of the
remaining finite jet. A finite jet can always be matched by the
exponential of a polynomial after normalizing its constant term. This
does not control the extensions on expanding disks. The logarithm of a
truncated polynomial is limited by that polynomial's nearest zero;
matching increasingly long jets does not supply a locally bounded
sequence of entire logarithms beyond that radius. Retaining the
zero-preservation conditions instead forces infinitely many zeros by
Section 3. Neither branch constructs the function required to refute
(6).

The proof direction likewise requires a uniform analytic estimate;
sparsity of each finite coefficient prefix is insufficient. No numerical
coefficient screen or finite formal verification is substituted for this
missing estimate. At this checkpoint, the target remains open and
contributes zero completed problems.

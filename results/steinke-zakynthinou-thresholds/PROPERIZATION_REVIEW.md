# Independent review of proper threshold conversion

Reviewed 21 November 2026:
[the properization lemma](PROOF.md).
Pinned source SHA256:
`eadb9c59a88f144ad800a5684da425c09e5d8700783a51b332a3c06c6a59a965`.
The complete lemma passes this review. It upgrades the same
threshold-learning result; it is not an additional solved problem.

## 1. The reference rank is defined even off the actual support

Let $`P`$ be the actual joint law of $`(T,Q,S)`$. The reference law
is


```math
R(dT,dQ,dS)=P(dT,dQ)\,2^{-n}
```


on each of the $`2^n`$ selectors. Because the actual selector is
uniform independently of $`T`$,


```math
D(P\Vert R)=I_P(Q;S\mid T).
```


The note defines $`K(Q,T,S)`$ for every reference triple, not only
for pairs of outputs and selectors that can occur under the learner.
This matters because a reference query may not name a selected feature.
The strict-successor list is still well defined for any real query
value. The closed-output code is always one, and the constant-zero
code is the first represented group in descending pool order.

For an open query with a list of length $`r`$, the no-successor
sentinel is $`r+1`$. If $`k=r`$, the tail event is the absence of
all $`r`$ groups. If $`k>r`$, that tail event is empty. This is
consistent with the claimed bound, including an empty list.

## 2. The geometric tail survives repeated features and paired dependence

Fix $`(Q,T)`$ under the reference law. If the first $`k`$ queried
feature groups contain both records of any pair, their simultaneous
absence from the selected sample is impossible. Otherwise each of
their pool records belongs to a different pair. The $`k`$ nonempty
groups contain at least $`k`$ records, so omitting them prescribes
at least $`k`$ independent fair selector bits. Consequently


```math
R(K>k\mid Q,T)\le2^{-k}.
```


The argument does not treat the individual pool records as independent
selection indicators. It uses their paired structure explicitly.
Labels and atoms do not affect it. The same argument applies to a
descending search for the selected maximum. The condition $`n\ge1`$
ensures that maximum exists.

Writing $`\lambda=(\log2)/2`$, the dominating geometric variable
on positive integers has exponential moment


```math
\sum_{k\ge1}2^{-k}e^{\lambda k}
 =\frac{e^\lambda}{2-e^\lambda}
 =1+\sqrt2=:Z.
```


This is also exactly $`\sum_{k\ge1}e^{-\lambda k}`$. The
choice of $`\lambda`$ makes the two normalizing constants equal;
no inequality between unmatched normalizers is being assumed.

## 3. Adaptive information is paid for, not ignored

The entropy variational inequality gives


```math
\lambda\mathbb E_P K
 \le D(P\Vert R)+\log\mathbb E_R e^{\lambda K}
 \le I_P(Q;S\mid T)+\log Z.
```


This is valid even though the actual query is arbitrarily adaptive.
It would not be valid to apply the reference geometric tail directly
to its actual law; the displayed relative entropy is precisely the
cost of changing those laws.

Comparison of the actual conditional rank law with the fixed mass
function $`e^{-\lambda k}/Z`$ gives


```math
H_P(K\mid Q,T)
 \le\lambda\mathbb E_P K+\log Z
 \le I_P(Q;S\mid T)+2\log Z.
```


Since the rank is a deterministic function of $`(Q,T,S)`$,


```math
I_P(Q,K;S\mid T)
 =I_P(Q;S\mid T)+H_P(K\mid Q,T)
 \le2I_P(Q;S\mid T)+2\log(1+\sqrt2).
```


All ranks are bounded by $`2n+1`$, so the entropy operations have
no integrability difficulty. No iid assumption on the pool was used;
only its independence from the original fair selector is needed.

## 4. The implemented output has the right predictions

The actual learner needs only its own selected sample and the original
output $`Q`$:

- A closed finite threshold is retained.
- An open threshold at $`w`$ is replaced by the closed threshold at
  the smallest selected feature strictly larger than $`w`$.
- If that successor does not exist, the finite threshold $`w+1`$
  predicts zero on the entire selected sample, just as the open
  threshold does.
- A constant-zero output is replaced by the finite threshold one
  above the selected maximum.

Each replacement preserves every empirical prediction, including at
an atom equal to $`w`$. Given the full pool, $`(Q,K)`$ determines
the chosen successor or maximum and therefore the proper output.
Conditional data processing proves the stated information bound.
The pool is an analysis device, not an input to the implemented learner.

The output parameter is always finite. Thus the conversion works both
for the source convention that allows an infinity threshold and for a
class parameterized only by real numbers. The empirical optimum is the
same under either convention on every finite nonempty sample.

## 5. Constants and scope of the resulting candidate

Combined with the independently reviewed shifted-tree proof, this
gives the claimed proper threshold information constant


```math
C_{\mathrm{proper}}
 =2C_I+2\log(1+\sqrt2)
```


without changing its samplewise empirical excess constant
$`C_L=256/\eta+8`$, where $`\eta=1-2^{-1/4}`$.

If the target is written with one common absolute constant, $`4096`$
is a valid simple choice. Indeed, $`\eta>1/8`$ gives
$`C_L<2056`$. Using $`e<3`$, $`\log2<1`$, and
$`1-2^{-1/2}>1/4`$ gives $`C_I<9`$; hence
$`C_{\mathrm{proper}}<22`$, well below $`4096`$. These are exact
coarse inequalities, not numerical-case evidence.

No mathematical correction is requested. This review does not check
priority or confirm that the publicly stated prize is still payable.
The proper and improper versions remain two versions of one target,
not two completed bounties.

The exact original drafts named by review hashes are preserved in [reviewed-sources.json](reviewed-sources.json). The consolidated [proof](PROOF.md) combines the checked construction and properization.

# Langford 2010: prior proof and the runtime distinction

21 November 2026. Independent source and mathematical audit. No new
solution, prize acceptance, or payment is claimed.

## The payable statement

Langford's [15 March 2010 sponsor post](https://hunch.net/?p=1253)
offers US$1,000. The
[COLT 2010 statement](https://www.learningtheory.org/colt2010/papers/OpenProblemLangford.pdf)
asks for a reduction from multiclass conditional-probability estimation
to bounded binary regression. Training and decoding must both take
$`O(\log k)`$ computational time. For every distribution and every
oracle, the required squared-loss regret ratio is bounded by one
universal constant. The alternative of proving that no deterministic
reduction has these properties is expressly allowed.

The multiclass error averages over the true label distribution, not
uniformly over labels:

```math
\mathbb E_{(X,Y)\sim D}
\bigl[\widehat p_Y(X)-p_Y(X)\bigr]^2.
```

The induced binary distribution first draws an original example and
then selects a uniformly random member of its produced training
sequence. This is not the distribution obtained by globally pooling
variable-length sequences. Testing is stateless; training may change
the oracle. The universal guarantee includes a Bayes oracle, so zero
binary regret requires zero multiclass error.

The [2016 sponsor slides](https://simons.berkeley.edu/sites/default/files/docs/6643/reductions.pdf),
pages 36–37, still present the logarithmic-time, constant-ratio problem
with the US$1,000 reward. They are historical corroboration, not evidence
of a current payment or acceptance decision.

## Public prior construction

The public `Pengbinghui/pipeline-math` repository lists a solution.
Its five-page
[proof at immutable commit `0804de2`](https://github.com/Pengbinghui/pipeline-math/blob/0804de278fdf1d355aea7b584ac5b67e0955f27b/papers/conditional-probability.pdf)
is present in a commit dated 20 July 2026. Downloading the file from
that commit and from the current branch produced identical bytes.
The repository-level contributor list does not identify an individual
author on the PDF, so this audit attributes the construction to the
repository rather than inventing individual authorship.

Theorem 1.2 proves a randomized reduction with regret factor eight,
$`\Theta(\log k)`$ oracle calls, and explicitly
$`\Theta(\log^2 k)`$ decoding time. Remark 1.1 distinguishes oracle
calls from computation and treats the intended convention as ambiguous.
The theorem and the original sponsor theorem were both inspected
visually. Consequently the public construction cannot be dismissed,
but its printed runtime does not literally meet the stronger reading
of the sponsor's statement.

## Independent check of the regret argument

The following check uses the construction's notation. Assign distinct
binary vectors $`u_y`$ of a common weight in dimension
$`d=O(\log k)`$ and let $`v_y=\mathbf1-u_y`$. Choose a prime
$`m=\Theta(d)`$ larger than $`d`$, and write
$`\omega=e^{2\pi i/m}`$. Then

```math
\langle u_y,v_y\rangle=0,
\qquad 0<\langle u_j,v_y\rangle\lt m\quad(j\ne y).
```

For fixed context, define
$`F(w)=\sum_jp_j\omega^{\langle u_j,w\rangle}`$ on
$`\mathbb Z_m^d`$. The proposed training rule emits exactly one
example, choosing a uniform point and one of its real/imaginary parts.
Thus its binary means reconstruct $`F`$ and there is no sequence-length
normalization discrepancy.

For an arbitrary oracle let $`\widehat F`$ be the reconstructed
complex prediction and $`\Delta=\widehat F-F`$. The elementary
two-part scaling gives

```math
\mathbb E_w|\Delta(w)|^2=8\mathop{\mathrm{reg}}_x(D',B).
```

Character orthogonality proves, for every starting point $`W`$,

```math
\omega^{-\langle u_y,W\rangle}
\frac1m\sum_{\lambda=0}^{m-1}F(W+\lambda v_y)=p_y.
```

Each $`W+\lambda v_y`$ is uniform when $`W`$ is uniform. Jensen's
inequality therefore bounds the expected squared decoding error by
$`\mathbb E_w|\Delta(w)|^2`$, even with arbitrary correlated errors
along a line. Averaging over contexts and true labels preserves the
factor eight. This verifies the main regret proof without assuming a
tree or restricting the binary predictor's behavior.

Two minor specifications should be explicit. Project the final real
estimate onto $`[0,1]`$; this only reduces squared error and is already
mentioned in the proof, although absent from its displayed decoder.
Also choose a prime bounded by a constant multiple of $`d`$, rather
than an unrestricted larger prime. Neither clarification is a new
solution.

## What remains unverified

The $`m`$ queries each specify a point with $`d`$ coordinates, accounting
for the stated $`O(md)=O(\log^2 k)`$ implementation. A faster
implementation needs an explicit representation and operation model.
Merely passing a lazy descriptor $`(W,v_y,\lambda)`$ changes the
feature space: an arbitrary oracle need not identify different
descriptions of the same point. The uniform-translation argument above
then no longer supplies the required binary-error marginal. A proposed
runtime improvement must address this issue rather than charge a whole
vector operation as free without stating that model.

The inspected sponsor material does not announce acceptance, withdrawal,
or payment. The prior proof settles the oracle-call formulation, subject
to the routine output specification above. This audit does not establish
that the strict total-runtime version remains payable, or that it has
been resolved. It also proves no impossibility result for arbitrary
adaptive reductions.

## Source fingerprints

| Source | Pages | Bytes | SHA256 |
|---|---:|---:|---|
| Original COLT statement | 2 | 85872 | `744fbcddee7d40dd3e0a2fd8a85f1f30e277ba7ecd843564c75c94bdac3035bb` |
| Prior construction, pinned and current | 5 | 82380 | `cec54e1a5f0336ad75ab036563454af9de20ae9d3ca1ffa54fcc4aeb1eb0ea33` |

The audit used exact-title, sponsor-name, resolution, and constant-regret
searches, followed by reading the complete prior proof. It is a
prior-art and scope checkpoint, not an addition to the completed-problem
count.

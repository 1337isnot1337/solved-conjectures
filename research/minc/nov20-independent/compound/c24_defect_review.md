# Review of the integer-regular collision bound

Research checkpoint, 20 November 2026 (America/Chicago). This review checks
the proposed quantitative partial theorem for Minc Conjecture 24. It does
not prove the integrality conjecture or certify historical priority.

## Statement checked

Let A be a nonnegative integer n by n matrix with every line sum k, where
2 <= k <= n. Put

```math
C(A)=\sum_{i,j}\binom{a_{ij}}2,\qquad
\beta_k=\frac{(k-1)^{k-1}}{k^{k-2}},
```

and, with the convention 0 log 0 = 0,

```math
\delta_k=(1-2/k)\log(1-2/k)
 -2(1-1/k)\log(1-1/k).
```

The proposed lower bound is

```math
\log\mathop{\mathrm{per}}A
\ge n\log\beta_k+\delta_k C(A).                 \tag{1}
```

If A is a minimum-permanent matrix among all such integer matrices, then

```math
C(A)\le
\frac{-\log\Pr\{\mathop{\mathrm{Bin}}(kn,1/k)=n\}}{\delta_k}.
                                                        \tag{2}
```

For n >= 2k-1, every such A can be changed to a binary k-regular matrix in
at most C(A) ordinary two-by-two switches, with entrywise L1 distance at
most 4C(A). Applied to a minimum, this gives O(k^2 log n) edit proximity
to a binary matrix. The switches do not preserve or decrease permanent.

## 1. Discrete convexity

Set f(x)=(1-x)log(1-x), continuously extended to x=1. On [0,1),

```math
f''(x)=\frac1{1-x},
```

which is increasing and at least one. Thus the discrete second
differences on the mesh 1/k increase with the mesh position. This remains
valid for the last interval by continuity. In particular,

```math
f((j+2)/k)-2f((j+1)/k)+f(j/k)\ge\delta_k
```

for 0 <= j <= k-2. The sharper rational bound in the final proof is also
valid. With h=1/k,

```math
\delta_k=h^2\int_0^1\int_0^1
  \frac{du\,dv}{1-h(u+v)}
\ge\frac{h^2}{1-h}=\frac1{k(k-1)}.
```

This is Jensen's inequality for the convex reciprocal function. At k=2,
one can first take h<1/2 and then let h increase to 1/2. The corner
singularity is integrable and the limit has the stated value log 2.

The sequence h(j)=f(j/k)-j f(1/k) has h(0)=h(1)=0. Summing the second
differences twice proves

```math
h(j)\ge\delta_k\binom j2\qquad(0\le j\le k).
```

The standard doubly stochastic product lower bound

```math
\mathop{\mathrm{per}}(A/k)
\ge\prod_{i,j}(1-a_{ij}/k)^{1-a_{ij}/k}
```

then gives (1), because sum a_ij = nk and

```math
n\log k+nk f(1/k)=n\log\beta_k.
```

The product lower bound is an external classical input, not a theorem
established by this review. I independently inspected Gurvits,
[arXiv:1106.2844v11](https://arxiv.org/pdf/1106.2844), Theorem 2.2 and
Section 3, item 2, equation (14). The latter states exactly the needed
bound for all doubly stochastic matrices. Entries zero and one use the
continuous conventions in that theorem.

## 2. Configuration expectation

Give each of the n left and n right vertices k labeled stubs and choose
a uniform bijection between the kn stubs on each side. Let A be its
integer adjacency matrix. Every term of per A counts a permutation of
vertices together with one actual edge for each matched pair. There are
n! choices of permutation and k^(2n) choices of the selected stubs. Once
these n matched stub pairs are prescribed, precisely ((k-1)n)! of the
(kn)! configurations contain them. Therefore

```math
\mathbb E\mathop{\mathrm{per}}A
=\frac{n!k^{2n}((k-1)n)!}{(kn)!}
=\frac{k^{2n}}{\binom{kn}{n}}=:R_{n,k}.           \tag{3}
```

No uniform distribution over integer adjacency matrices is asserted or
needed. Every configuration yields an allowed integer matrix, so an
integer minimum is at most this expectation. Direct simplification gives

```math
\frac{R_{n,k}}{\beta_k^n}
=\frac1{\binom{kn}{n}(1/k)^n(1-1/k)^{(k-1)n}},
```

which proves (2). The replacement of a simple-graph expectation by the
unconditional configuration expectation avoids all Poisson asymptotics
in the finite theorem.

Robbins's factorial remainder bounds yield

```math
-\log\Pr\{\mathop{\mathrm{Bin}}(kn,1/k)=n\}
\le\frac12\log\!\left(\frac{2\pi n(k-1)}k\right)
 +\frac1{12n}+\frac1{12(k-1)n}.
```

The sign of the discarded remainder is correct: the exact remainder is
eta_n + eta_((k-1)n) - eta_kn, with eta_m positive and below 1/(12m).
Together with delta_k >= 1/[k(k-1)], this is a uniform O(k^2 log n) bound.

At k=2, delta_2=log 2, beta_2=1, and (1) reads per A >= 2^C(A).
This is consistent with doubled isolated edges and simple even cycles.

## 3. Switch repair

Suppose a_ij >= 2. Let R be the set of positive positions in column j
viewed as row indices, and let S be the positive positions in row i
viewed as column indices. Each set has at most k-1 members, since the
entry a_ij uses at least two units of its line sum. The total weight
outside these rows and columns is at least

```math
\sum_{r\notin R,\ s\notin S}a_{rs}
\ge kn-k|R|-k|S|
\ge k(n-2k+2)>0.
```

Thus, when n >= 2k-1, choose a positive a_rs outside those sets. The
other two corners a_is and a_rj are zero. Subtract one from a_ij and
a_rs and add one to a_is and a_rj. All line sums remain k, and all
entries remain nonnegative integers.

For D(A)=sum max(a_ij-1,0), this switch decreases D by at least one:
the repeated corner loses one unit of excess; the second removed corner
loses zero or one; both new corners become one and create no excess.
Iterating reaches a binary matrix in at most D(A) <= C(A) steps. Each
step has L1 length four, so the final distance is at most 4C(A).

The condition n >= 2k-1 is used exactly where the outside weight must be
positive. This argument does not claim the same short repair at smaller
n, and it never compares the permanents along the repair sequence.

There is a small optional sharpening. If a=a_ij >= 2, then
|R|,|S| <= k-a+1 and A[R,S] >= 2k-a, since the rectangle contains the
whole selected row and column, with their common entry counted once.
The exact rectangle identity consequently gives

```math
\sum_{r\notin R,\ s\notin S}a_{rs}
\ge k(n-2k+2a)-a
\ge k(n-2k+4)-2.
```

Thus the same repair proof works already for n >= max(k,2k-3): for k>=3
the last lower bound is at least k-2, and for k=2, n>=2 it is at least
two. This refinement is independent of the permanent lower bound.

## 4. Optional fixed-k refinement

The earlier simple-configuration refinement has the correct constant
provided its standard joint Poisson limit is supplied. Original
simplicity has limiting probability exp(-(k-1)^2/2). After a tagged
matching, the remaining degree k-1 configuration must avoid double
edges, with limiting mean (k-2)^2/2, and avoid the n tagged vertex pairs,
with limiting mean k-1. The ratio of the limiting probabilities is
exp(-1/2). Stirling's formula therefore gives

```math
\mathbb E_{\text{uniform simple }k\text{-regular}}
\mathop{\mathrm{per}}A
\sim e^{-1/2}\sqrt{\frac{2\pi n(k-1)}k}\,\beta_k^n
```

for fixed k. This improves only the constant term in (2). It is
unnecessary for the main finite statement and should not obscure it.

## Review conclusion

No mathematical gap was found in (1), the exact finite bound (2), or
the stated switch repair, assuming the cited doubly stochastic product
lower bound. These results constrain every integer minimizer; they do
not force C(A)=0. A repair close to a minimizer need not have no larger
permanent. Accordingly C24 remains open.

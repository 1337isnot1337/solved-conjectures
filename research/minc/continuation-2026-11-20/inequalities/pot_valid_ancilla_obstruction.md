# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago.

Status: an all-order obstruction to one counterexample-transfer mechanism.
No MINC conjecture or problem is resolved, and no novelty claim is made for
this lemma.

## Statement

Let $`A\succeq0`$ have order $`n`$, let $`C\succeq0`$ have order $`m`$,
and suppose that the permanent-on-top inequality holds for this particular
ancillary matrix:

```math
\Pi(C)\preceq\operatorname{per}(C)I_{m!}.
\tag{1}
```

For $`H\leq S_{n+m}`$ and a character $`\chi`$ of degree $`q>0`$, define

```math
K=\{g\in S_n:(g,e)\in H\},\qquad
\theta(g)=\chi((g,e)).
```

Here $`S_n\times S_m`$ has its usual action on the two disjoint index
blocks. The restricted character $`\theta`$ can be reducible, but its degree
remains $`q`$. With the normalized convention

```math
f_{G,\eta}(M)=\frac1{\eta(e)}\sum_{g\in G}\eta(g)
                              \prod_i m_{i,g(i)},
```

one has

```math
\boxed{f_{H,\chi}(A\oplus C)
       \leq \operatorname{per}(C) f_{K,\theta}(A).}
\tag{2}
```

Thus a dominance violation for $`A\oplus C`$, with (1), would already imply
a dominance violation for a subgroup and character on $`A`$. The same
conclusion holds within the degree-one problem when $`\chi`$ is linear.

## Proof

For a PSD matrix $`M`$, put $`a_g(M)=\prod_i m_{i,g(i)}`$. This is a
positive-definite function on its symmetric group: its convolution matrix,
up to inverse convention, is the positive semidefinite Gram matrix
$`\Pi(M)`$.

By (1), the function on $`S_m`$

```math
Q(h)=\operatorname{per}(C)\mathbf1_{h=e}-a_h(C)
```

is positive definite. Let $`L=H\cap(S_n\times S_m)`$. Restriction and
pullback preserve positive definiteness, as does pointwise multiplication.
Characters are positive-definite functions. Therefore

```math
(g,h)\longmapsto a_g(A)Q(h)\chi((g,h))
```

is positive definite on $`L`$. The sum of a positive-definite function on a
finite group is nonnegative: it is the all-ones quadratic form of its Gram
matrix, divided by the group order. Expanding that sum gives

```math
0\leq \operatorname{per}(C)\sum_{g\in K}\theta(g)a_g(A)
 -\sum_{(g,h)\in L}\chi((g,h))a_g(A)a_h(C).
```

All terms of the generalized matrix function of $`A\oplus C`$ outside
$`L`$ vanish because they use a cross-block zero entry. Dividing the last
display by the same degree $`q=\chi(e)=\theta(e)`$ proves (2).

If $`\operatorname{per}C=0`$, (2) and positivity force the left side to
vanish. Otherwise a violation of
$`f_{H,\chi}(A\oplus C)\leq\operatorname{per}A\operatorname{per}C`$
forces $`f_{K,\theta}(A)>\operatorname{per}A`$. Decomposing $`\theta`$
into irreducible characters then yields at least one violating constituent,
because the normalized function is a degree-weighted average.

## Scope and limitations

This includes identity padding and mutually orthogonal rank-one marker
blocks. It also applies to any other ancillary matrix satisfying (1), without
assuming it has that marker form. It does not exclude coupled, nonorthogonal
ancillary vectors or ancillary matrices that themselves violate
permanent-on-top.

The matrix-specific assumption (1) must be verified. The permanent-on-top
conjecture is false in general; substituting an arbitrary PSD ancillary block
would make the argument invalid. For example, a diagonal subgroup on
$`A\oplus\overline A`$ produces the self-Chollet quantity
$`\operatorname{per}(A\circ\overline A)`$, so arbitrary orthogonal blocks
already include a separate open problem.

Definitions and the distinction between permanent-on-top and the open
dominance conjecture can be checked in
[Wanless's survey](https://arxiv.org/abs/2202.01867) and in the current
[MINC Conjecture 42 entry](https://yair-lavi.com/mincs-list/conjecture-42/index.html).
The proof above uses positive definiteness directly and does not use any
claim that a normalized subgroup character function must be an eigenvalue of
the full Schur power matrix.

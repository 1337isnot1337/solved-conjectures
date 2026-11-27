# Counting terms between an Ulam number and its larger parent

For an accepted term $`n=p+q`$ with its distinct parents $`p<q`$,
write $`A(x)=|U\cap[1,x]|`$ and define the deficit

```math
\Delta(p,q)=A(p)+A(q)-A(p+q).
```

A related proposed estimate is recorded in the
[parent-translation route](https://www.proofatlas.ai/collaboration/ulam-sequence-density/).
The following conditional bound uses only estimates for sufficiently
large smaller parents.

**Proposition.** Assume $`\Delta(p,q)\le2\sqrt p`$ for every actual
parent pair with $`p\ge4096`$. Then the lower natural density of $U$
is at least $1/5000$.

Set $`L=4096`$, $`T=(10L)^2`$, and $`F(x)=x/5000+(7/2)\sqrt x`$.
The exact [phase probe](phase_probe.cpp) checks $`A(x)\ge x/15`$ for
all integers from $L$ through $10^8$, giving $`A(x)\ge F(x)`$
there. It counts 7,399,353 terms through $10^8$, which exceeds
$F(2T)$. Monotonicity covers the rest of the finite base range up to
$T+L$.

Induct on accepted terms $n>T+L$. When $`p\ge L`$, both parents
satisfy the induction inequality and

```math
A(n)\ge F(p)+F(q)-2\sqrt p\ge F(n).
```

The last inequality follows from
$`\sqrt p+\sqrt q-\sqrt{p+q}\ge(2-\sqrt2)\sqrt p`$ and
$`(7/2)(2-\sqrt2)>2`$. When $p<L$, the larger parent satisfies
$q>T$ and $`A(n)\ge A(q)+1`$. The increase of the comparison
function is at most

```math
F(q+p)-F(q)\le p/5000+\frac{7p}{4\sqrt q}
\le L/5000+7/40<1.
```

This gives $`A(n)\ge F(n)`$ at every accepted term from $L$ onward.
For an arbitrary cutoff $x$, the first accepted $n>x$ has
$`A(x)=A(n)-1`$, which proves the lower density implication.

## Exact tests and the missing estimate

The probe finds each accepted term's true parents using the exact
middle-third partition. It checks both bounds below by integer
comparison of the squared positive deficit and the smaller parent.

| Parents tested through target $10^8$ | Bound checked | Largest positive deficit divided by $\sqrt p$ | Target |
| --- | ---: | ---: | ---: |
| All | 4 | $57/\sqrt{339}$ | 1,137,338 |
| $`p\ge4096`$ | 2 | $127/\sqrt{4118}$ | 89,941,075 |

The inclusion part of the full rule is essential to this route. Keep
a long genuine prefix ending in its two latest terms $p,q$ with
$`p\ge L`$. Append only $p+q$ after $q$. It has exactly one old pair
because it is the largest sum of distinct members. All selected
terms in this finite word therefore have their required unique
representations. Its local increment at $p+q$ is one, so the
deficit is $`A(p)-1`$, violating the proposed bound whenever
$`A(p)>1+2\sqrt p`$. The omitted compulsory terms before $p+q$
are the additional constraint. An all-scale bound on the parent
deficit and a convergence argument for the actual sequence remain
open.

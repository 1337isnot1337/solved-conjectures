# Erdős’s logarithmic density conjecture for delayed congruences

**Finite affine residue templates.** Let $a_i\bmod n_i$ be a family of residue classes. Suppose there is a finite set of pairs $(b,c)$ of integers, with $b\ge1$, such that for every $i$ one pair satisfies $b a_i\equiv c\pmod{n_i}$. Then the delayed survivor set in [Erdős Problem 25](https://www.erdosproblems.com/25) has logarithmic density, equal to the limit of its finite periodic densities. The moduli need not be coprime, and their reciprocal sum need not converge. The proof permits multiple residues at each modulus provided each satisfies one of the finitely many templates.

This includes arbitrary finite mixtures of fixed residue values, bounded-denominator fractions of the modulus when integral, and classes coming from a fixed rational residue wherever defined. For example $a_i=n_i/2$ on even moduli is allowed. The same conclusion holds if the affine-template condition fails only on a family of delayed classes with summable reciprocal moduli. The unrestricted singleton problem remains open.

## Approximation for quotient-restricted multiples

Use the [Davenport–Erdős theorem](https://renyi.hu/~p_erdos/1936-04.pdf) in its finite-approximation form. For finite generator sets $D_N\uparrow D$, the natural densities of the finite multiples sets $M(D_N)=\bigcup_{d\in D_N}d\mathbb N$ increase to the logarithmic density of $M(D)$. Thus
```math
 \lim_{N\to\infty}\limsup_{X\to\infty}
    \frac{1}{\log X}\sum_{\substack{x\le X\\x\in M(D)\setminus M(D_N)}}\frac1x
 =0.
```
Intersecting with a fixed congruence class only decreases this nonnegative mass.

Fix a modulus $q\ge1$ and a residue $r\bmod q$ coprime to $q$ (the trivial class for $q=1$ is allowed). Consider
```math
 M_{q,r}(D)=\{y>0:y=d\,t,\ d\in D,\ t>0,\ t\equiv r\bmod q\}.
```
Let $v$ be the part of $y$ supported on the prime divisors of $q$, and put $z=y/v$. The quotient $t$ is coprime to $q$, so the part of $d$ supported on these primes must be exactly $v$. For fixed $v$ and unit class $u=z\bmod q$, the test becomes
```math
 z\in M\bigl(\{e>0:ve\in D,\ e\equiv u r^{-1}\bmod q\}\bigr),
 \qquad z\equiv u\bmod q.
```
Indeed $`z=e\,t`$, and the indicated class of $e$ forces the quotient into class $r$. For $q=1$ this is the classical multiples set.

This gives finite-generator approximation even after restricting to $y=Lx-C>0$ for fixed integers $L\ge1,C$, and taking logarithmic sums over $x$. For each fixed $v,u$, the difference between the full and finite-generator tests in $z$ has asymptotically vanishing upper logarithmic mass by Davenport–Erdős. Since $vz=Lx-C$, the weight $1/x$ is at most $2L/(vz)$ for large $x$. The transformation is one-to-one and $z=O_{L,C}(X)$, so the affine change preserves vanishing logarithmic mass. For the terms $v>V$, sum the bound $2L/(vz)$ over all $z\le O_{L,C}(X)/v$. Their normalized harmonic mass is at most a constant times
```math
 \sum_{\substack{v>V\\p\mid v\Rightarrow p\mid q}}\frac1v.
```
This tends to zero because the full sum is $\prod_{p\mid q}(1-1/p)^{-1}$. First choose $V$, then a generator prefix for the finitely many $v,u$. This proves the required approximation.

## Apply the result to the delayed congruences

Partition the classes by a chosen template $(b,c)$ and then by the residue $s\bmod b$ of the integer $r_i=(b a_i-c)/n_i$. In one such group put $g=\gcd(b,s)$. Then $g\mid c$, since $g$ divides $b$ and every $r_i$ in the group. Define
```math
 q=b/g,\qquad r=s/g\bmod q,\qquad y=(b x-c)/g=q x-c/g.
```
The residue $r$ is coprime to $q$, including the trivial case. For large enough $x$ that $y>0$, the congruence $x\equiv a_i\pmod{n_i}$ is equivalent to $y=n_i t$ for a positive integer $t\equiv r\bmod q$. For both directions use $y/n_i-r_i/g=q(x-a_i)/n_i$: the difference is an integer multiple of $q$ exactly when $n_i\mid x-a_i$. Apply the approximation above to $`D=\{n_i:i\text{ in this group}\}`$.

Only finitely many groups occur, so the union of the **undelayed** classes differs from its finite prefixes by asymptotically arbitrarily small upper logarithmic mass. The delayed exclusion set is contained in this union. It contains the exclusions from every finite prefix, which differ from their undelayed versions by finitely many integers. Squeezing gives the logarithmic density equal to the limit of the finite periodic exclusion densities; taking complements proves the claim. There is no need to compare the initial missing representatives separately.

For a summable reciprocal family of exceptional classes, each class modulo $n$ has at most $\lfloor X/n\rfloor$ delayed hits up to $X$. The upper natural density of any such tail union is bounded by the remaining reciprocal sum, and the same upper bound holds for logarithmic density by partial summation. Thus a summable reciprocal exceptional family can be added without spoiling approximation.

## Priority and the remaining question

[Erdős’s original survey](https://users.renyi.hu/~p_erdos/1980-03.pdf), the classical multiples theorem, [Chojecki’s 2026 singleton note](https://www.ulam.ai/research/erdos25.pdf), and [Wang’s separate multi-residue construction](https://github.com/ShouqiaoW/erdos/tree/main/486) give the background. Searches on bounded-denominator and affine delayed residues located the classical ingredient, but no exact source for the template statement above. The proof has no uniform control as the denominators in the templates range without bound.

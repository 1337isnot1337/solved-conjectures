# Independent review of the orbit-product and rational-invariant obstruction

Reviewed file: [ORBIT_PRODUCT_COMPRESSION_ATTEMPT.md](ORBIT_PRODUCT_COMPRESSION_ATTEMPT.md).

Status: independent written audit passed. This is not a formal verification and does not prove the target complex BSS separation. The reviewed conclusion excludes polynomial completeness of the stated certificate families under the standing permanent border lower bound and the separately reviewed finite-block theorem.

## 1. Indexed products and direct cost

The identity
```math
S_r(\zeta t)=S_{r+1}(t)-h(t)
```
has the stated orientation. On a true input, the wrap relation is $`S_D=S_0=0`$. Comparing the indexed multiplicities in
```math
W_0=\prod_{r=0}^{D-1}(g+S_r)^{r+1},
\qquad
W_1=\prod_{r=0}^{D-1}(g+S_{r+1})^{r+1}
```
gives
```math
g^D W_0/W_1=\prod_{r=0}^{D-1}(g+S_r)=Q
```
as a rational identity, including when partial sums collide. In the binary recursion the second block has exponent $`k+(r+1)`$, so its contribution is exactly $`W_j(t',g')Q_j(t',g')^k`$. A substituted evaluation is a separate circuit copy. The explicit $`O(2^m m^2)`$ upper bound is valid and supplies no polynomial compression.

The generic distinctness argument is also valid: a permanent monomial occurs only in the full-column Ryser term, while subtraction of $`y/D=\mathop{\mathrm{per}}(X)/D`$ contributes $`-k/D`$ on an interval of length $`k`$. Its coefficient is therefore $`-k/D`$ or $`1-k/D`$, both nonzero for $`0<k<D`$. The finite union of the corresponding proper zero sets is proper.

## 2. Section 5.1: the soundness identity

The polynomial equation
```math
g^D W_0W_2=(g+h(t))^D W_1^2
```
is equivalent, in $`\mathbb C(g)`$, to
```math
F_t(g)=F_{\zeta t}(g+h(t)),
\qquad
F_t=g^D W_0/W_1,
```
provided every $`W_c(t,g)`$ is a nonzero polynomial. No pointwise evaluation at a pole occurs in this implication.

Writing $`d_t=\deg_g W_c(t,g)`$, the leading Laurent exponent is $`k_t=D+d_t-d_{\zeta t}`$. Translation preserves it. Thus all $`k_t`$ on the primitive orbit are equal, and telescoping the degrees gives $`k_t=D`$. This handles possible degree drops between fibers without assuming a common formal degree.

After a full orbit, $`F_t(g)=F_t(g+\delta)`$ where $`\delta=\mathop{\mathrm{per}}(X)-y`$. If $`F_t=a g^D+b g^{D-1}+\cdots`$, the coefficient of $`g^{D-1}`$ in the difference is $`aD\delta`$. Since $`a\ne0`$ and the field has characteristic zero, the identity forces $`\delta=0`$.

## 3. Section 5.2: finite identity verification

The parameter count $`M=m^2+p+4`$ correctly includes $`X,y,\zeta,\rho,c,t`$. With $`\rho`$ treated as an independent parameter, the digit circuit and the residual are polynomial families; the verifier separately enforces $`\zeta\rho=1`$.

For each nonzero univariate polynomial in either family, its zero set has dimension zero. The incidence of parameter tuples and $`M+1`$ simultaneous zeros has dimension at most $`M`$, so its image in $`\mathbb C^{M+1}`$ has proper Zariski closure. Avoiding the union of the two bad closures gives one tuple that both tests the identity and hits every nonzero fiber of $`W`$. This is a nonuniform existence statement; it supplies fixed complex constants, not an effective hitting-set construction.

The finite disjunction that one evaluation of $`W`$ is nonzero therefore verifies the nonzero-fiber requirement exactly. The orbit index uses $`m`$ Boolean bits and polynomially many operations. This is the finite verifier to which the reviewed obstruction applies.

## 4. Section 5.3: arbitrary nonconstant rational invariants

The cross-multiplied equation for $`F_t=A_t/B_t`$ has the correct orientation:
```math
A(t,g)B(\zeta t,g+h(t))
=
A(\zeta t,g+h(t))B(t,g).
```
The local witnesses $`u,v`$, the conditions $`B(t,u)B(t,v)\ne0`$, and
```math
A(t,u)B(t,v)-A(t,v)B(t,u)\ne0
```
certify that $`B_t`$ is nonzero and $`A_t/B_t`$ is nonconstant. Conversely any nonconstant rational function over $`\mathbb C`$ admits such two points because its domain is cofinite and its image is infinite.

A nonconstant rational function cannot have a nonzero additive period. If it had a finite pole, all its integer translates by that period would be distinct poles. With no finite pole the rational function is a polynomial, and comparison of its leading term excludes the nonzero period. Consequently the full skew orbit again forces $`\delta=0`$.

The polynomial identity can be tested by a parameter-family hitting tuple, while $`u,v`$ are local complex witnesses for each Boolean orbit index. Thus this reduction lies in the finite-block format. It excludes a complete polynomial-size rational-invariant family, including rational functions with removable factors in their displayed presentations. It does not construct such a rational function from arbitrary setwise invariant root fibers.

## 5. Scope

No cancellation algorithm, reduced-denominator circuit, radical extraction, or regularity certificate is assumed in the soundness proof. The only uses of a rational function are identities in $`\mathbb C(g)`$, and its denominators are explicitly nonzero polynomials.

The distinction at the end of Section 5.3 is necessary: equal root supports alone do not provide a small invariant rational function. The reviewed argument does not exclude every continuous-quantifier moving-fiber certificate and does not establish membership of the permanent graph in a fixed level of the complex polynomial hierarchy.

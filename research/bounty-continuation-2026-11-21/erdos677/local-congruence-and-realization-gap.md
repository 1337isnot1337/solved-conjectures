# Erdős 677: finite local data and the global realization gap

Date: 21 November 2026. Status: method diagnostic, not a solution of Erdős 677. The general CRT obstruction to selected prime routing was already described in the [July 2026 working report](https://www.erdosproblemaday.com/day/677-lcm-bridge). No priority claim is made here. The theorem below records an explicit version that also retains the exact carry coefficients, arbitrary prescribed finite Taylor precision, and the first-order real coefficient corridor.

The funded statement and current source audit are in [target-and-prior-audit.md](target-and-prior-audit.md). The exact target remains open in this lane.

## 1. The genuinely global condition

Write

```math
P_k(x)=\prod_{i=1}^k(x+i),\qquad
M_k(x)=\mathop{\mathrm{lcm}}(x+1,\ldots,x+k),\qquad
\lambda_k=\mathop{\mathrm{lcm}}(1,\ldots,k).
```

The [Danesh–Bianchetti paper](https://ijmttjournal.org/public/assets/volume-72/issue-9/IJMTT-V72I9P101.pdf), Proposition 16, gives the exact reflection. If $`d=m-n\geq k`$, then

```math
m+j\mid M_k(n)
\quad\Longleftrightarrow\quad
m+j\mid\mathop{\mathrm{lcm}}(d+j-k,\ldots,d+j-1),
```

and

```math
n+i\mid M_k(m)
\quad\Longleftrightarrow\quad
n+i\mid\mathop{\mathrm{lcm}}(d+1-i,\ldots,d+k-i).
```

Indeed, for each prime power dividing the tested integer, divisibility by one original block entry is equivalent to divisibility by the corresponding difference. Applying both systems to every index gives mutual divisibility of the two LCMs. Thus the complete simultaneous sliding system is equivalent to the original collision. It is not a weaker conclusion that can be upgraded to a proof merely by invoking reflection again.

The same paper uses the normalized defect

```math
D_k(x)=\frac{P_k(x)}{M_k(x)},\qquad
B_k=\frac{k!}{\lambda_k},\qquad
E_k(x)=\frac{D_k(x)}{B_k}.
```

Its carry formula shows that $`E_k`$ is periodic modulo $`\lambda_k`$. An actual collision yields an exact product identity with the corresponding coprime carry coefficients. The word “exact” is essential: congruences at any chosen finite list of primes do not establish that identity.

## 2. A uniform finite-local construction

Fix an integer $`k\geq3`$ for which $`k+1`$ is not a prime power. This permits unbounded lengths, for example $`k=6t-1`$ for all positive integers $`t`$.

Put

```math
b=k+1,\qquad \alpha=b^{1/k},\qquad
F_k(X,Y)=P_k(Y)-bP_k(X).
```

Let $`B\geq k+1`$ and $`N\geq1`$ be arbitrary integers. Choose any finite list of distinct primes $`p_t>B`$ not dividing $`N`$. For each of them prescribe owner indices $`i_t,j_t\in\{1,\ldots,k\}`$, an exponent $`e_t\geq1`$, and a precision $`r_t\geq2e_t`$.

There are infinitely many pairs of nonnegative integers $`n,m`$, with $`m\geq n+k`$, satisfying all of the following:

1. For every prime $`p\leq B`$, the two block LCMs have the same valuation, namely $`v_p(\lambda_k)`$.
2. The actual normalized carry coefficients are $`E_k(n)=1`$ and $`E_k(m)=b`$.
3. The normalized product equation holds to the prescribed finite precision:

```math
F_k(n,m)\equiv0
\pmod{N\prod_t p_t^{r_t}}.
```

4. Each selected prime has exactly its prescribed maximal exponent and owners:

```math
v_{p_t}(n+i_t)=v_{p_t}(m+j_t)=e_t,
```

and it divides no other member of either block.

5. The real coefficient corridor also holds:

```math
1+\frac{m-n}{n+k}
\lt\alpha\lt
1+\frac{m-n}{n+1}.
```

6. Nevertheless, the two LCMs are unequal. A fresh prime can be fixed in advance to divide one upper-block term and no lower-block term.

This is a construction of false positives for the listed necessary tests. Item 6 agrees with Erdős 677; it is not a counterexample to that conjecture.

### Proof: the overlapping seed and exact carry data

Because $`b=k+1`$ is not a prime power, every maximal prime-power factor of $`b`$ is strictly smaller than $`b`$. Hence $`b\mid\lambda_k`$ and

```math
M_k(0)=M_k(1)=\lambda_k,
\qquad P_k(1)=bP_k(0).
```

The two seed blocks overlap. Their defects give

```math
E_k(0)=1,\qquad E_k(1)=b.
```

For each prime $`p\leq B`$, choose an exponent $`h_p`$ with $`p^{h_p}>k+1`$, and let

```math
T_B=\prod_{p\leq B}p^{h_p}.
```

Impose $`n\equiv0`$ and $`m\equiv1\pmod{\mathop{\mathrm{lcm}}(N,T_B)}`$. For every block entry, these congruences preserve its valuation at each prime up to $`B`$ from the seed. In particular they preserve the equal block maxima. They also preserve the carry coefficients because $`\lambda_k\mid T_B`$. Finally, the polynomial identity at the seed gives $`F_k(n,m)\equiv0\pmod N`$.

For completeness, the periodicity can also be seen without selecting any owner. At a prime with $`p^a\leq k\lt p^{a+1}`$, a length-$`k`$ block contains a multiple of $`p^a`$ and at most one multiple of each higher power. Consequently

```math
D_k(x)
=\frac{1}{\lambda_k}\prod_{i=1}^k
\mathop{\mathrm{gcd}}(x+i,\lambda_k),
```

prime by prime. Its right side is periodic modulo $`\lambda_k`$.

### Proof: arbitrary finite local lifts at rough primes

Fix one selected prime $`p=p_t`$, omit subscripts temporarily, and prescribe

```math
n\equiv-i+p^e\pmod{p^r}.
```

The polynomial $`P_k`$ has a simple root at $`-j`$ modulo $`p`$, because $`p>k`$. Its derivative there is

```math
A_j=P_k'(-j)=(-1)^{j-1}(j-1)!(k-j)!,
```

a unit modulo $`p`$. The congruence

```math
P_k(m)\equiv bP_k(-i+p^e)\pmod{p^r},
\qquad m\equiv-j\pmod p,
```

therefore has a unique successive lift to precision $`p^r`$. Explicitly, if a root is fixed modulo $`p^u`$, adding $`cp^u`$ changes the polynomial by $`cp^u A_j`$ modulo $`p^{u+1}`$, so exactly one residue $`c\pmod p`$ cancels the next digit. This proves the finite lifting assertion directly.

Modulo $`p^{e+1}`$, the lifted root satisfies

```math
m+j\equiv bA_i A_j^{-1}p^e\pmod{p^{e+1}}.
```

Here $`p`$ divides none of $`b,A_i,A_j`$. Thus both prescribed owners have valuation exactly $`e`$. All other entries are nonzero modulo $`p`$, since their index differences have absolute value less than $`p`$. The chosen precision is at least $`e+1`$ and at least $`2e`$, so it includes the usual quadratic Taylor constraint. It can be taken arbitrarily large.

Carry out this construction independently at every selected prime. Their moduli are coprime to the previous modulus, so the Chinese remainder theorem combines the residue conditions on $`n`$ and on $`m`$.

### Proof: a witnessed inequality and the real corridor

Choose a fresh prime $`\ell>k+1`$ dividing none of the preceding moduli and impose

```math
n\equiv0\pmod\ell,\qquad m\equiv-1\pmod\ell.
```

No member of the lower block is divisible by $`\ell`$, whereas $`m+1`$ is. This proves the LCM inequality. It also forces

```math
F_k(n,m)\equiv-bk!\not\equiv0\pmod\ell,
```

so the exact global product equation fails. This does not conflict with any prescribed finite modulus, since $`\ell`$ was chosen outside it.

After combining all congruences, write

```math
n=u+Tt,\qquad m=v+Ts
```

for two fixed residues and one common modulus $`T`$. The number $`\alpha=(k+1)^{1/k}`$ is irrational: a rational root of the monic polynomial $`X^k-(k+1)`$ would be an integer, but $`1<\alpha<2`$ for $`k\geq3`$.

The corridor in item 5 is equivalent to

```math
\alpha-1\lt m-\alpha n\lt k(\alpha-1).
```

This is a fixed nonempty open interval. Density of the irrational rotation $`t\mapsto\alpha t\pmod1`$ gives infinitely many positive integers $`t`$ for which some integer $`s`$ places $`v+Ts-\alpha(u+Tt)`$ in that interval. Every tail of an irrational rotation is dense, so $`t`$ can be arbitrarily large. Along these choices, $`m/n\to\alpha>1`$; therefore both variables are positive and $`m-n\geq k`$ for all sufficiently large choices. All congruences remain valid. This proves the theorem.

## 3. What this does and does not test

The owner list can include every ordered pair of indices, using a different prime at each pair. In that version every block entry has several prescribed large prime factors and every possible transport edge is represented. One can instead prescribe any number of genuinely moved edges. The construction still does not account for all prime factors of the actual integers.

In an actual collision, the September paper's complete owner matrix has identities of the form

```math
n+i=x_i\prod_j W_{ij},\qquad
m+j=y_j\prod_i W_{ij},
```

with

```math
x_i\mid(i-1)!(k-i)!,\qquad
y_j\mid(j-1)!(k-j)!.
```

The constructed pairs do not satisfy those complete identities using only the prescribed packets. In fact, those packets are fixed while the pairs tend to infinity, so the unrecorded row cofactors eventually exceed the factorial bounds. The deliberately introduced prime $`\ell`$ is already an unmatched factor. Thus this theorem is not a countermodel to the paper's full transport system or to its exact reflection system.

Nor does the theorem claim the sharper second-order centered approximation from Section 8 of the paper. The first-order corridor is a fixed-width irrational-rotation condition. The centered approximation shrinks with the denominator and cannot be inferred from density alone.

## 4. Why the attempted global continuations stop

Two possible extensions were examined without obtaining the full theorem.

First, for fixed length, the quadratic lift bounds an occupied packet by a square root of the height when its associated linear form is nonzero. Increasing the required number of occupied edges is not a contradiction: the matrix has quadratically many possible edges. Moreover, some linear forms can vanish, and the paper already treats those edges separately. An assertion that all such packets obey the same nonzero-form bound would drop a hypothesis.

Second, the finite-spectrum argument is genuinely tied to two active primitive sites. In the paper's notation,

```math
ab d_0^2=\mathcal C\prod_i\mathcal J_i,
\qquad \mathcal C\mid(k-1)!,
\qquad \mu_i=\mathcal J_i x_i.
```

If exactly $`r`$ packets are active, multiplication gives

```math
\prod_{\mathcal J_i>1}x_i
=\frac{\mathcal C}{ab d_0^2}
  \prod_{\mathcal J_i>1}\mu_i.
```

The proved bound $`0<\mu_i\lt b(k-1)d_0`$ only yields

```math
\prod_{\mathcal J_i>1}x_i
\lt \frac{\mathcal C\,b^{r-1}(k-1)^r}{a}\,d_0^{r-2}.
```

For two sites the right side is independent of the reduced gap, producing the finite spectrum used in Theorem 14. For three or more sites it grows. Applying the same argument to a higher geometric mean therefore does not retain a finite list of candidate values. A new global restriction on the cofactors would be required; none was proved here.

The exact remaining obligation is to exclude full integer realization with every prime factor covered and both factorial residual budgets satisfied, or to exhibit an actual realization and thereby refute Erdős 677. The local construction above does neither. No finite numerical search or fixed-length theorem is counted as progress toward the user's completion count.

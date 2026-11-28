# Littlewood’s conjecture

**Partial research.** A common higher-degree extension of the cubic-field method cannot produce Littlewood approximations from a single dominant conjugate and a fixed set of norm primes. For a jointly generating pair in a real-embedded field of degree $d\ge4$, the Littlewood product along such trace denominators grows at least as $q^{1-2/(d-1)-\varepsilon}$. Suitable unit sequences attain the limiting exponent of this bound. The obstruction concerns the trace construction and leaves arbitrary denominators open. [Issue #392](https://github.com/1337isnot1337/solved-conjectures/issues/392)

## Target and sources

For all real $\alpha,\beta$, Littlewood’s conjecture asserts

```math
\liminf_{q\to\infty} q\|q\alpha\|\,\|q\beta\|=0,
```

where $q$ is a positive integer and $`\|x\|`$ is distance to the nearest integer. Cassels and Swinnerton-Dyer established the common cubic field case. Their paper is an early primary source for the conjecture and its algebraic setting. The November 24, 2026 source check found no general resolution. Schleischitz’s 2026 disproof concerns the separately quantified uniform conjecture. The proof below uses the number-field Subspace Theorem and finiteness of nondegenerate multiplicative-group equations. Priority for this particular trace obstruction is provisional. [Cassels–Swinnerton-Dyer](https://doi.org/10.1098/rsta.1955.0010) · [*Dispersion and Littlewood’s conjecture*](https://wrap.warwick.ac.uk/id/eprint/194804/1/DispersionLittlewood.pdf) · [Schleischitz](https://arxiv.org/abs/2603.12611) · [Evertse–Schlickewei](https://pub.math.leidenuniv.nl/~evertsejh/98-absolute.pdf) · [Evertse–Schlickewei–Schmidt](https://arxiv.org/abs/math/0409604)

## Trace denominators with bounded other conjugates

Let $K=\mathbb Q(\alpha,\beta)\subseteq\mathbb R$ have degree $d\ge4$, with both $\alpha$ and $\beta$ irrational. Write its embeddings into $\mathbb C$ as $\sigma_1,\ldots,\sigma_d$, with $\sigma_1$ the given real embedding. Fix a height bound $B\ge1$ for the other conjugates and a finite set $\mathcal P$ of rational primes. Consider $`\xi\in\mathcal O_K\setminus\{0\}`$ with

```math
Q=|\sigma_1(\xi)|,\qquad |\sigma_j(\xi)|\le B\quad(j>1),
```

and such that every prime divisor of $|N_{K/\mathbb Q}(\xi)|$ belongs to $\mathcal P$. Then for every $\varepsilon>0$, all sufficiently large denominators $`q=|\mathop{\mathrm{Tr}}_{K/\mathbb Q}(\xi)|`$ of this form satisfy

```math
q\|q\alpha\|\,\|q\beta\|\gg q^{1-2/(d-1)-\varepsilon}.
```

The constants and threshold may depend on $K,\alpha,\beta,B,\mathcal P,\varepsilon$. The norm condition includes units and any fixed bound on absolute norms. Since the sum of the other conjugates is bounded, $q=Q+O(1)$. We may replace $\xi$ by $-\xi$ to have positive trace. Multiplying $\alpha,\beta$ by a fixed integer to make them integral is harmless for the lower bound, using $`\|m x\|\le m\|x\|`$. Joint generation and the sets of embeddings that fix each element are preserved by that scaling.

### Cancellation estimate

Let $L$ be a normal closure of $K$, with the distinguished infinite place agreeing with the given inclusion into $\mathbb C$. All $\sigma_j(\xi)$ are $S$-units of $L$ for the fixed set $S$ consisting of infinite places and places above $\mathcal P$. In fact they are algebraic integers whose product is the norm, so outside $S$ each has absolute value one. For any tuple $x$ of distinct conjugate coordinates, possibly also with the coordinate $1$, use the absolute projective height $H(x)=\prod_v\max_i|x_i|_v$ with absolute values normalized to the product formula. At any infinite place the conjugate coordinates have ordinary moduli at most $\max(Q,B)$, and at each finite place they have moduli at most one. Thus $H(x)\le Q$ for large $Q$.

For this family of tuples, every proper linear subspace contains only finitely many choices of $\xi$. To see this, take a nonzero fixed relation among the coordinates defining a hyperplane containing the subspace. Choose a minimal vanishing subsum at each tuple. Divide it by one of its terms to obtain a nondegenerate $S$-unit equation. There are finitely many possible subsums and finitely many solutions in ratios for each, by the multiplicative-group equation theorem. Consequently any infinite subfamily in the subspace would have a fixed ratio of two coordinates. A ratio involving the constant coordinate fixes $\xi$ outright. For two distinct embeddings $\sigma_i,\sigma_j$, choose one element $\xi_0$ with the fixed ratio. Then all elements with that ratio have $\xi/\xi_0$ in the proper subfield

```math
F=\{z\in K:\sigma_i(z)=\sigma_j(z)\}.
```

Because $[K:F]>1$, the restriction of $\sigma_1$ to $F$ has another extension $\sigma_\ell$ to $K$. On this subfamily $|\sigma_\ell(\xi)|$ is a fixed positive multiple of $|\sigma_1(\xi)|$. Its boundedness forces bounded $Q$. Algebraic integers of $K$ with all conjugates bounded form a finite set, for example by boundedness of the integer coefficients of their conjugate polynomials. This gives the claimed finiteness for each proper subspace.

Now fix any linear form $M(x)$ with nonzero coefficients on all chosen coordinates. At the distinguished place, choose a largest coordinate $x_i$, and replace its coordinate form by $M$. The resulting collection of forms is linearly independent, and all forms at the other places can be the coordinate forms. The product of normalized evaluations in the Subspace Theorem is

```math
\frac{|M(x)|_{v_0}}{|x_i|_{v_0}}H(x)^{-m},
```

where $m$ is the number of coordinates. This uses the product formula for each $S$-unit. The theorem places all solutions with the ratio at most $H(x)^{-\eta}$ in finitely many proper subspaces for any $\eta>0$. The preceding argument removes all but finitely many $\xi$ from those subspaces. Taking into account the fixed exponent between $|\cdot|_{v_0}$ and ordinary modulus and using $H(x)\le Q$ gives, for any $\delta>0$,

```math
|M(x)|\gg Q^{-\delta}\max_i|x_i|
```

as $Q$ grows. There are finitely many possible choices of largest coordinate. This derivation is a standard application of the Subspace Theorem to prevent power-scale cancellation of $S$-units. Its specific finite-exception argument here uses the single-dominant-conjugate condition. [Evertse–Schlickewei](https://pub.math.leidenuniv.nl/~evertsejh/98-absolute.pdf) · [Evertse–Schlickewei–Schmidt](https://arxiv.org/abs/math/0409604)

### The two trace errors and the exponent

For integral $\alpha$, the trace $`\mathop{\mathrm{Tr}}(\alpha\xi)`$ is an integer and

```math
q\alpha-\mathop{\mathrm{Tr}}(\alpha\xi)
=\sum_{j>1}(\alpha-\sigma_j(\alpha))\sigma_j(\xi).
```

The sum is bounded uniformly, so the difference between the trace numerator and a nearest integer belongs to a fixed finite set of integers. Let $`A=\{j>1:\sigma_j(\alpha)\ne\alpha\}`$ and $`B'=\{j>1:\sigma_j(\beta)\ne\beta\}`$. In the cancellation estimate use the conjugate coordinates from the support $A$ and, if the integer correction is nonzero, the constant coordinate $1$. Do this separately for each of the finitely many corrections, and likewise for $\beta$. It follows that

```math
\|q\alpha\|\gg Q^{-\delta} M_A,\qquad
\|q\beta\|\gg Q^{-\delta} M_{B'},
\qquad M_U=\max_{j\in U}|\sigma_j(\xi)|.
```

The sets $A,B'$ together cover every $j>1$, since an embedding fixing both generators fixes $K$. Each also has size at least $d/2$. For example the number of embeddings fixing $\alpha$ is $[K:\mathbb Q(\alpha)]\le d/2$, including the distinguished one. Allocate weights $\theta_j\in[0,1]$ to $A$ and $1-\theta_j$ to $B'$ for each $j>1$, with zero weight on a set that does not contain $j$, and with total weight $(d-1)/2$ to each set. This is possible since the forced weights on either side sum to at most $(d-1)/2$, so the common indices can fill the difference. Then

```math
Q^{-1}\le\prod_{j>1}|\sigma_j(\xi)|
\le (M_A M_{B'})^{(d-1)/2}.
```

The first inequality uses $|N(\xi)|\ge1$, and the second follows by bounding each conjugate with the weighted geometric mean of the two relevant maxima. Combining with the cancellation bounds and $q=Q+O(1)$ proves the stated exponent by choosing $2\delta=\varepsilon$.

### Sharpness and scope of the prime condition

For integral $\alpha,\beta$, the exponent is attained up to an arbitrarily small loss in the lower bound. In the logarithmic embedding of the unit group, the target vector with first coordinate $(d-1)t$ and every other conjugate logarithm $-t$ lies in the norm-zero hyperplane, with complex places counted twice. Dirichlet’s unit theorem gives a lattice of full rank there. Taking a lattice point within a fixed distance of each target gives units with $Q\asymp e^{(d-1)t}$ and all other conjugates $O(e^{-t})$. Both trace errors are then $O(e^{-t})$, giving Littlewood product $O(q^{1-2/(d-1)})$. For nonintegral $\alpha,\beta$, multiplying the units by a fixed integer that clears their denominators gives the same upper bound within a fixed prime support.

Bounded other conjugates alone do not limit the choice of trace in the same way. The image of the trace on $\mathcal O_K$ is a nonzero ideal $e\mathbb Z$. For every $q\in e\mathbb Z$, choose one representative of trace $q$. The trace-zero integral lattice projects to a full lattice in the space of all the other archimedean coordinates, because the projection is an isomorphism on the real trace-zero hyperplane. Subtracting a trace-zero lattice element puts the other conjugates into a fixed bounded fundamental domain. Thus every trace in $e\mathbb Z$ has a representative with bounded other conjugates. If Littlewood approximations exist, multiplying their denominators by $e$ preserves convergence to zero, and any such bounded representatives must eventually escape every fixed prime support for their norms. The general conjecture leaves that escape entirely available.

## Exact control

Take the real root $\theta>1$ of $x^4-x^3-x^2-x-1$, with $\alpha=\theta$ and $\beta=\theta^2$. The polynomial is irreducible modulo two because it is the fifth cyclotomic polynomial there and two has order four modulo five. The root is a unit and the other three conjugates lie inside the unit circle. For the latter fact multiply the polynomial by $x-1$ to get $x^5-2x^4+1$. On radii $s$ just above one, $2s^4>s^5+1$, so Rouché’s theorem gives four roots inside, including the root at one. Equality on the unit circle forces $x^5=x^4=1$, so no root of the original polynomial occurs on the unit circle.

The integer traces of powers begin with $4,1,3,7$ and then follow the four-term recurrence from the polynomial. Using 512 rational bisections starting from $[1,2]$ and interval arithmetic at powers $20,40,80,160$ verified that the nearest numerators for both coordinates are the next two traces. Comparing fourth powers verified $`q\|q\theta\|\|q\theta^2\|>q^{1/4}`$ at each of these controls. No finite calculation is used for the asymptotic proof.

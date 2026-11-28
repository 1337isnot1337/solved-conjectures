# Erdős–Graham's disjoint-block question: the affine construction barrier

**Scope:** A restriction on one-parameter constructions, not a resolution of Erdős Problem 930. The original allows an unrelated finite solution for each length and does not require infinitely many points in an affine family.

For a squarefree positive integer $`P`$, let $`h(P)`$ be the least $`h\geq1`$ such that every interval of $`h`$ integers contains an integer coprime to $`P`$. Set $`h(1)=1`$. Let $`h_*(k)`$ be the maximum of $`h(P)`$ over $`P`$ with at most $`k`$ prime factors. In particular $`h_*(0)=1`$.

**Theorem.** Fix $`r`$ blocks with $`i`$-th block
```math
I_i(t)=\{a_i t+b_i+1,\ldots,a_i t+b_i+\ell_i\},\qquad
a_i,b_i\in\mathbb Z,\quad \ell_i\geq1,
```
where not all $`a_i`$ are zero, and assume the blocks are positive and pairwise disjoint for infinitely many $`t\in\mathbb Z`$. If their total product is a square at infinitely many such parameters, then any block of maximal slope in the corresponding unbounded parameter direction has length less than $`3h_*(r-1)`$. In particular
```math
\min_i\ell_i\ll \frac{r^2}{(\log\log(3r))^2}.
```
Thus any infinite square-valued integral affine construction with minimum block length $`L`$ needs $`r\gg\sqrt{L}\log\log(3L)`$ blocks, with absolute constants. The same minimum-length restriction applies to a nonconstant rational-function reparametrization of the common affine variable producing a square identically.

**Proof.** Pass to infinitely many admissible parameters tending in one direction. Replace $`t`$ by $`-t`$ if necessary so they tend to $`+\infty`$. All $`a_i`$ are now nonnegative. Let $`A`$ be the least common multiple of the positive $`a_i`$, and put $`d_i=A/a_i`$ when $`a_i>0`$. Each nonconstant summand $`a_i t+b_i+j`$ has root $`-(b_i+j)/a_i`$; multiplying its negative by $`A`$ gives the integer label $`d_i(b_i+j)`$.

Fix a maximum-slope block $`i`$, and write $`d=d_i`$. No other block of slope $`a_i`$ can contribute a matching root label. Matching labels would imply $`b_i+j=b_{i'}+j'`$, and the corresponding integers would coincide for every parameter, contrary to disjointness. Constant blocks have no root. For any block $`i'`$ with strictly smaller positive slope, its step $`d_{i'}`$ is larger than $`d`$, and a matching root at label $`du`$ requires
```math
\frac{d_{i'}}{\gcd(d,d_{i'})}\mid u.
```
The quotient exceeds one. Select one of its prime divisors for each such block and let $`P`$ be the product of the distinct selected primes. Thus $`\omega(P)\le r-1`$. Every $`u\in\{b_i+1,\ldots,b_i+\ell_i\}`$ coprime to $`P`$ gives a root of multiplicity exactly one in
```math
Q(t)=\prod_{i=1}^r\prod_{j=1}^{\ell_i}(a_i t+b_i+j).
```
In particular the number of simple roots is at least $`\lfloor\ell_i/h(P)\rfloor`$. This holds also if the interval contains negative integers or zero.

If $`\ell_i\ge3h_*(r-1)`$, then there are at least three simple roots. Factor the integer polynomial as $`Q=S^2R`$ with $`S,R\in\mathbb Z[t]`$ and $`R`$ squarefree over $`\mathbb Q`$, by collecting even powers of primitive factors and leaving the numerical content in $`R`$. Thus $`\deg R\ge3`$. For any integer parameter under consideration, $`S(t)\ne0`$ because all factors of $`Q(t)`$ are positive. If $`Q(t)=z^2`$, then $`z/S(t)`$ is a rational square root of the integer $`R(t)`$, hence an integer. The smooth projective model of $`y^2=R(t)`$ has genus $`\lfloor(\deg R-1)/2\rfloor\ge1`$, so Siegel's theorem gives only finitely many such integral points. This contradicts the hypothesis of infinitely many square values.

If instead $`T(s)\in\mathbb Q(s)`$ is nonconstant and $`Q(T(s))`$ is a square in $`\mathbb Q(s)`$, division by $`S(T(s))^2`$ gives a nonconstant rational map from the projective line to the smooth projective model of $`y^2=R(t)`$. The map extends to a morphism and contradicts Riemann–Hurwitz for genus at least one.

The final quantitative bound follows from the 2026 bound $`h_*(k)\ll k^2/(\log\log(3k))^2`$. Inverting only needs the cases $`r>L`$ (then trivial) and $`r\le L`$; the inequality $`L\ll r^2`$ first forces $`r\gg\sqrt L`$, so $`\log\log(3r)`$ is comparable to $`\log\log(3L)`$. Iwaniec's classical bound suffices independently for $`\min_i\ell_i\ll r^2\log^2(2r)`$.

## Polynomial starts of bounded degree, with arbitrary unequal lengths

**Theorem.** For every $`r,D\ge1`$ there is $`C(r,D)`$ with the following property. Let $`P_i(t)\in\mathbb Z[t]`$ have degrees at most $`D`$, at least one nonconstant, and use the $`r`$ blocks $`\{P_i(t)+1,\dots,P_i(t)+\ell_i\}`$ of positive lengths. Assume there is at least one integer parameter at which all blocks are positive and pairwise disjoint. If the maximum length among the blocks with nonconstant starts exceeds $`C(r,D)`$, only finitely many admissible parameters have a perfect-power total product (allowing the exponent to vary). There is also no nonconstant rational reparametrization of the common variable that makes the total product a fixed perfect power. Neither claim requires comparability of the lengths. The coefficients are unrestricted. The same holds for starts in $`\mathbb Q(t)`$ that take integer values on the common admissible integer parameters, using their polynomial degrees after reduction as below. Quantitatively, for each fixed $`r`$, a sequence of examples with infinitely many perfect-power values and $`M\to\infty`$ must have maximum polynomial degree $`\gg_r \sqrt{M}/(\log M)^{\kappa/2}`$, for an absolute $`\kappa`$.

**Proof.** Partition the nonconstant starts into classes according to proportionality of their vectors of nonconstant coefficients over $`\mathbb Q`$. For a class choose a polynomial $`F\in\mathbb Z[t]`$ with zero constant coefficient and primitive coefficient vector. Each member has the form $`c_jF+b_j`$ with $`c_j`$ a nonzero integer and $`b_j\in\mathbb Z`$, since rational multiples of a primitive integral vector that are integral have integer multiplier.

Put $`H=h_*(r-1)`$ and let $`M`$ be the largest length of any moving block. Consider a class containing a block of length $`M`$. Sort its lengths in decreasing order $`L_1=M\ge L_2\ge\dots\ge L_s`$, and put $`L_{s+1}=0`$. With $`B=4rH`$, choose the first $`k`$ with $`L_{k+1}<L_k/B`$. Call the first $`k`$ blocks the top blocks. Each has length at least $`L_k\ge M/B^{r-1}`$. Choose a top block $`i`$ with maximal absolute scalar $`|c_i|`$.

Within the top blocks, use the affine argument with $`F(t)`$ in place of $`t`$. Same-scalar blocks cannot share a level $`c_iF+u`$, by pairwise disjointness at the admissible point. If $`c_j=-c_i`$ and two levels share a root then the corresponding factors are negatives of each other, contradicting positivity there. When $`|c_j|<|c_i|`$, matching requires $`|c_i|/\gcd(|c_i|,|c_j|)\mid u`$, giving the same coprimality condition as before. Hence at least $`\lfloor\ell_i/H\rfloor`$ indices $`u\in\{b_i+1,\ldots,b_i+\ell_i\}`$ give levels whose zeros cannot meet any zero from a top block. Every block from the same class below the cutoff can spoil at most its own length in these indices: one of its levels $`c_jF+v`$ can have a common zero with $`c_iF+u`$ only at the single rational value $`u=(c_i/c_j)v`$. Their combined lengths are less than $`\ell_i/(4H)`$.

For a different class, any matching zero gives an integer pair on the plane curve
```math
C_{ij}=\overline{\{(P_i(z),P_j(z)):z\in\mathbb C\}},
\qquad
(P_i(z),P_j(z))=(-u',-v')
```
with $`1\le u'\le\ell_i`$, $`1\le v'\le\ell_j`$. Here $`u'=u-b_i`$. The closure is the Zariski closure. This curve is geometrically irreducible, being the nonconstant image closure of the affine line. Its degree $`d`$ is at most $`D`$: extend the map to projective lines and planes by homogenizing all three coordinates to degree $`\max(\deg P_i,\deg P_j)`$; there are no base points, including at infinity. The pullback of a general line has degree at most $`D`$ and meets every point of the image in that line. Also $`d\ge2`$, because a line containing the image would make the two nonconstant coefficient vectors proportional. The integer pairs lie in a square of side $`M`$. The uniform Bombieri–Pila bound gives $`O_D(M^{3/4})`$ such pairs, using exponent $`1/d+1/4\le3/4`$. This bound is independent of the $`P_j`$. A pair can spoil only its one selected index $`u`$, so altogether the other classes spoil $`O_{r,D}(M^{3/4})`$ indices. Constant starts contribute no roots.

Finally, at most $`\deg(P_i)-1\le D-1`$ further indices are critical values at which the selected polynomial level has any repeated root. After all these exclusions there are at least
```math
\frac{3\ell_i}{4H}-1-O_{r,D}(M^{3/4})-(D-1)
```
indices remaining. This is at least three when $`M`$ is sufficiently large only in terms of $`r,D`$, because $`\ell_i\ge M/B^{r-1}`$. Each remaining selected polynomial level has nonempty, simple roots over $`\mathbb C`$, with no roots shared by other factors, and distinct levels have disjoint root sets. Thus the total polynomial has at least three simple roots. For squares, the integer-point and rational-reparametrization proofs above apply unchanged (using primitive irreducible factors in $`\mathbb Z[t]`$, rather than only linear factors).

For powers of exponent $`m>2`$ with integer parameters and base of absolute value greater than one, Schinzel–Tijdeman's Corollary 1 gives finiteness jointly in $`t`$, base, and $`m`$ as soon as $`Q`$ has two simple zeros. (A base of absolute value one gives only finitely many parameters since $`Q`$ is nonconstant.) This extends the integer-point conclusion to arbitrary perfect powers, with exponent not fixed in advance. If a rational substitution produces a perfect $`m`$-th power, pick a prime $`p\mid m`$. The curve $`y^p=Q(t)`$ is geometrically irreducible of degree $`p`$ over the $`t`$-line, by Eisenstein at any simple zero. Its smooth projective model has total ramification index $`p`$ over each of three simple zeros; Riemann–Hurwitz gives $`2g-2\ge-2p+3(p-1)=p-3`$, so $`g\ge1`$ for every $`p\ge2`$. Hence no nonconstant rational reparametrization exists by the same argument as for squares. This also extends the sharper $`3h_*(r-1)`$ affine cutoff to arbitrary perfect powers.

**Quantitative degree requirement.** The integer-point bound of Binyamini, Cluckers, and Novikov, Theorem 2, equation (27), gives an absolute upper bound $`O(d^2 M^{1/d}(\log M)^\kappa)`$ for the points on $`C_{ij}`$ within the relevant box. For $`2\le d\le D`$,
```math
d^2 M^{1/d}\ll \sqrt M+D^2.
```
Indeed, on $`2\le d\le\log M`$, the function $`d^2 M^{1/d}`$ has no interior maximum: the derivative of its logarithm has the sign of $`2d-\log M`$. The endpoint bounds are $`4\sqrt M`$ and $`e(\log M)^2=O(\sqrt M)`$. For $`d>\log M`$, the exponential factor is at most $`e`$. Thus the other-class exclusions total $`O_r((\sqrt M+D^2)(\log M)^\kappa)`$, and critical values exclude at most $`D-1`$. For fixed $`r`$ and $`M`$ large, three simple roots therefore survive whenever $`D\le c_r\sqrt M/(\log M)^{\kappa/2}`$ for sufficiently small $`c_r>0`$.

**Rational starts on integral parameters.** Write a rational function $`P(t)\in\mathbb Q(t)`$ as a polynomial plus a proper rational function, $`P=G+R`$. On the integers, $`G(t)`$ lies in the lattice $`F^{-1}\mathbb Z`$ for a fixed common coefficient denominator $`F`$, while $`R(t)\to0`$ as $`|t|\to\infty`$. Thus if $`P(t)`$ is an integer on an infinite set of integer parameters, $`R(t)\in F^{-1}\mathbb Z`$ and must vanish there for all sufficiently large $`|t|`$; hence $`R`$ vanishes identically. Apply this to all starts. Choose a common positive denominator $`F`$ for their polynomial coefficients and a residue class $`a\pmod F`$ containing infinitely many admissible parameters (or infinitely many perfect-power parameters, when proving finiteness by contradiction). The starts after $`t=Fv+a`$ have integral nonconstant coefficients, by binomial expansion, and their constants are integral as well, since they take integer values for those integer $`v`$. Their degrees do not change. Rational reparametrizability producing a fixed perfect power is also unaffected by the invertible affine change.

**Multivariate polynomial identities.** The bounds also forbid identities in several variables: let the integer starts have at most $`D`$ total degree and at least one be nonconstant, and assume an admissible integer point $`z_0`$. Choose an integer vector $`v`$ off the zero sets of all the leading homogeneous parts of the nonconstant starts. Such $`v`$ exists because their product is a nonzero polynomial and $`\mathbb Z^n`$ is Zariski dense. Restrict the starts to the line $`z_0+tv`$. The degrees of the nonconstant starts are preserved, the original admissible point occurs at $`t=0`$, and a polynomial perfect-power identity remains an identity. The one-variable theorem gives a contradiction for $`M>C(r,D)`$. A rational-function root of a polynomial lies in the polynomial ring by unique factorization, so such a root would likewise specialize. This is an identity obstruction, not a finiteness theorem for integral points in several parameters.

The use of the unequal lengths is essential to the proof design: a short block with a larger scalar could cover an unwanted large fraction of the longest block's levels. The cutoff discards all such short blocks at a total cost bounded by their lengths, while retaining a block of length comparable to $`M`$ with constants depending only on $`r`$.

## Sources and scope

- P. Erdős and R. L. Graham, *On products of factorials*, Bull. Inst. Math. Acad. Sinica 4 (1976), 337–355. [Primary text](https://combinatorica.hu/~p_erdos/1976-25.pdf). [Erdős Problem 930](https://www.erdosproblems.com/930) records the fixed-number/arbitrary-minimum-length problem for all perfect powers. It differs from the fixed-length/eventually-all-block-counts conjecture of Ulas.
- E. Bombieri and J. Pila, *The number of integral points on arcs and ovals*, Duke Math. J. 59 (1989), 337–357, [primary text](https://people.maths.ox.ac.uk/pila/Ovals.pdf), Theorem 5. Its exponential factor is $`O_D(M^{1/4})`$ for bounded degree, with small $`M`$ absorbed into the constant.
- G. Binyamini, R. Cluckers, and D. Novikov, *Bounds for rational points on algebraic curves, optimal in the degree, and dimension growth*, Int. Math. Res. Not. 2024, 9256–9265, [author version](https://arxiv.org/pdf/2302.04209v2), Theorem 2, equation (27).
- A. Schinzel and R. Tijdeman, *On the equation* $`y^m=P(x)`$, Acta Arith. 31 (1976), 199–204, [primary text](https://matwbn.icm.edu.pl/ksiazki/aa/aa31/aa3129.pdf), Corollary 1.
- H. Iwaniec, *On the problem of Jacobsthal*, Demonstratio Mathematica 11 (1978), 225–231, [doi:10.1515/dema-1978-0121](https://doi.org/10.1515/dema-1978-0121), Corollary.
- OpenAI, *A quadratic bound for Jacobsthal's function*, September 2026, Theorem 1.1, [primary preprint](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/A-quadratic-bound-for-Jacobsthals-function-September-25-2026/paper.pdf).
- M. Ulas, *On products of disjoint blocks of consecutive integers*, Enseign. Math. 51 (2005), 331–334, [primary article](https://www.e-periodica.ch/view/ens-001/2005/51/417). R. Yıldız and J. K. Gürel, *On a Problem of Erdős and Graham*, [doi:10.1007/s00574-019-00158-9](https://doi.org/10.1007/s00574-019-00158-9), use finite-length constructions.
- B. Pouly, *An explicit bound below one half for a quartic Liouville correlation*, [hexagon:2611.00891v1](https://hexagonmath.org/pdf/2611.00891v1), Appendix D, classifies squarefree kernels of products of three rational affine copies at length four. The appendix cites Günter Pilz's lower bound in the pure-dilation case up to length six, Holdridge–Pach's work on Pilz, and Ke–Meyer's full minimum-length result for up to three pure dilations. Those cases are different from arbitrary translated root progressions at growing length and arbitrary $`r`$. No prior theorem for the precise affine generality above was located in these sources.

**Limitation.** This does not rule out one isolated square value per affine family; each arbitrary solution is itself contained in some unrelated affine family. It also does not rule out constructions whose polynomial degrees grow with the block length, or constructions unrelated to a single polynomial parameter.

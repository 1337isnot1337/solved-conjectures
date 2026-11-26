# Erdős–Pyber–Tuza rainbow six-cycle conjecture

This note settles the zero-density classification for every compact abelian Cayley model of [Erdős #811](https://www.erdosproblems.com/811), including arbitrary compact groups, inverse-symmetric fractional palettes and groups with many sign characters. The unrestricted graphon conjecture is not addressed.

**Theorem.** Let G be a compact abelian group with probability Haar measure. Let six measurable inverse-symmetric f_i:G→[0,1] sum to one almost everywhere and have mean 1/6 each. The balanced Cayley graphon W_i(x,y)=f_i(y−x) has zero rainbow C6 density if and only if a continuous nontrivial character χ:G→{1,−1} places three colors on each of its two cosets, with each color supported almost everywhere in its assigned coset.

A change to successive edge differences makes each ordered rainbow density equal to the sixfold convolution of the f_i at zero, independently of the order. In the asserted parity example exactly three steps are in the odd coset, so no such convolution can contribute.

## 1. Some sign character must have mean bias greater than two thirds

Write g_i=6f_i and let a_i(ψ) be the Fourier coefficient of g_i at a character ψ. This is real by inverse symmetry. Define D(ψ)=(1/6)Σ_i|a_i(ψ)| and E(ψ)=(1/6)Σ_i a_i(ψ)^2. The palette sum gives D(ψ)≤∫|Re ψ|.

If ψ is nontrivial and has order other than two, then ∫|Re ψ|≤2/3, as in the [no-sign Fourier argument](FOURIER-CAYLEY.md), with the following even-order addition. The circle average is 2/π. On a cyclic image of odd order r≥3 the average is 1/(r sin(π/(2r))), at most 2/3. For order 2r with r odd, summing opposite pairs gives the same average as order r. For order q divisible by four, the symmetric cosine sum gives (2/q)cot(π/q)≤2/π. These exhaust the non-sign characters.

For every character, AM–GM and the quadratic mean give
```math
\left|\prod_{i=1}^6 a_i(\psi)\right|\le D(\psi)^4 E(\psi).
```
Parseval gives Σ_{ψ≠1} E(ψ)≤5 since g_i²≤6g_i and the trivial coefficient is one. The Fourier expansion at zero is absolutely convergent by Cauchy–Schwarz on two factors and the coefficient norm bound on the rest. In particular if every nontrivial sign character also had D≤2/3, the normalized rainbow density would be at least
```math
1-(2/3)^4\sum_{\psi\ne1}E(\psi)\ge 1-5(2/3)^4=1/81.
```
Thus a zero-density coloring has a sign character χ with D>2/3.

For this χ write a_i=a_i(χ) and H=ker χ. The average of f_i on H is (1+a_i)/6, and that on the other coset is (1−a_i)/6. The two sums of the positive and negative absolute biases are equal, each 3D>2, since Σ_i a_i=0. With six numbers in [−1,1], there are consequently three strictly positive and three strictly negative a_i. In each group of three absolute biases, every pair sums to more than one, and at least two of the three biases are greater than 1/2.

## 2. One even fiber assignment forces a small finite quotient

Initially choose the heavier coset for every color: three selections lie outside H. If all colors are pure, this is exactly the claimed obstruction. Otherwise switch a color of least absolute bias, which has a positive lighter average, to select an even number of outside cosets. Call the six selected means b_i. This assignment has five heavier selections and one lighter. Four of the heavier selections still have absolute bias greater than 1/2: initially each side had at least two; if the minimum was at most 1/2, the switch leaves all four, and otherwise five remain. Hence the five heavier means are all strictly greater than 1/6 and at least four are strictly greater than 1/4.

The total mean is large:
```math
\sum_i b_i=1+D-\tfrac13 \min_i |a_i|\ge 1+2D/3>1+4/9.
```
Fix a representative a of the odd coset, without assuming it is an involution. Identify each selected fiber with H using translation by zero or a, and write h_i for the restricted function on H. Let ℓ be the even number of selected odd cosets. The corresponding summand in the sixfold convolution on G at zero is a positive constant times (h_1*…*h_6)(−ℓ a), and must vanish. Each positive support A_i⊆H has μ(A_i)≥b_i.

Work with positive supports of successive partial convolutions on H. If at each multiplication the new support measure were at least the sum of the two input support measures, the final measure would exceed one. At the first strict deficiency, the positive support is an exact union of cosets of an open subgroup by compact Kneser. Indeed, for compact metrizable abelian groups [Griesmer's Lemma 5.3](https://arxiv.org/abs/1807.01694) gives full-measure subsets of the two positive supports whose ordinary sum is contained in the positive convolution set, and the reverse containment holds since a positive convolution has positive-measure representations and can avoid any null deletions. Apply [compact Kneser, Griesmer's Proposition 1.1](https://arxiv.org/abs/1112.6403), to those representatives; it gives exact saturation. Metrizability is without loss by factoring the six f_i through the quotient defined by their countably many nonzero Fourier characters, using completeness of the characters in L². The sign character under discussion is among them; quotient Haar is the corresponding probability measure.

Convolving such a partial product with remaining nonnegative factors preserves saturation: an occupied coset in the first factor and a coset of positive mean in the second give strict positivity everywhere on their sum coset. If there is no such pair, the entire output coset is zero. Thus the stabilizer K of the final positive support within H is open. In G/K, let T_i be the support of the averaged hue in its selected coset. The T_i are inverse-symmetric in G/K; translating back to H/K may have changed the individual symmetry centers, but it does not change any cardinalities. Conditional averaging commutes with convolution. The full sum of the T_i is aperiodic, lies in H/K, and misses zero. Absence of periods holds by the definition of K, since a period of a nonempty subset of H/K must itself lie in H/K.

Put q=|H/K|. In the quotient each partial sum is aperiodic, because its period would persist in the full sum. Applying finite Kneser in arbitrary groupings and using |T_i|≥q b_i gives
```math
q+4\ge \sum_i |T_i|\ge q\sum_i b_i>q+4q/9.
```
Hence q<9. The full sum is nonempty and misses zero, so q≥2.

## 3. Capacities and symmetry exclude every remaining quotient

**Order two.** The bound q+4=6 forces six singleton supports. One parity side retained all three of its heavier choices. Any two of these have total mean strictly greater than 1/2, since the corresponding two absolute biases sum to more than one. They cannot share one of the two points of that parity side. Three pairwise distinct support points do not fit.

**Orders four, five and eight.** The at least four means strictly greater than 1/4 require at least two support points for q=4 or 5, or at least three for q=8. This gives total cardinality at least ten for q=4 or 5, and at least fourteen for q=8, all above q+4.

**Order six.** Each heavier mean is strictly greater than 1/6, so the five heavier supports have at least two points. The sum of sizes is at least eleven, greater than q+4.

For q=3 or 7, H/K is cyclic of odd order, so G/K splits as (H/K)×F₂. (For these cases any odd-coset element can be adjusted by the unique half of its double in H/K.) Identify both fibers with Q=H/K through this splitting. The support sets S_i in Q are now genuinely symmetric under negation. Their full sum has the same cardinalities as before and misses zero, since an even tuple has zero F₂-coordinate.

**Order three.** The only proper nonempty symmetric supports in Q are {0} and the pair {1,−1}. A full support would make the full sum full. Two copies of the pair would also produce a full sum; no copies would give a sum containing zero. So five supports are singleton {0}. At least four of these are heavier choices. Two heavy singletons on the same fiber would already exceed that single point's capacity 1/3, since each mean is greater than 1/6. Four cannot fit.

**Order seven.** Every heavier mean exceeds 1/7, requiring at least two support points. Since the size sum is at most eleven, the five heavier supports have size two and the light support has size one. All pairs of the heavier supports must sum to exactly three points: if one pair grew further, Kneser for the grouped five summands would force the entire sum to have at least seven points. Any symmetric two-point set in Q is {t,−t}, t≠0, and two different such pairs sum to four distinct points. Indeed a coincidence among ±t±u implies t or u is zero or t=±u. The five heavier supports must therefore be the same pair. Two lie in the same parity fiber, where their total mean is greater than 1/3, but the pair's capacity is only 2/7.

Each possible quotient is impossible. The initial heavily biased split must therefore consist of pure colors, proving the theorem. An abelian homogeneous action is also covered after pulling the colors back to its group: if the kernels descend to G/L for a closed stabilizer L, a pure palette split forces L⊆ker χ and hence the cut descends.

## Scope and inputs

The proof combines the [previous Fourier estimate](FOURIER-CAYLEY.md), the biased-fiber choice of the [component argument](SMALL-COMPONENT-QUOTIENTS.md), compact and finite Kneser, and a capacity argument on quotients of order below nine. It is independent of the [Kemperman–Griesmer equal-measure route for elementary abelian two groups](COMPACT-ELEMENTARY-TWO.md), which this theorem subsumes. [Original Erdős–Tuza chapter](https://doi.org/10.1016/S0167-5060(08)70377-7) · [Issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870). Nonabelian and nonhomogeneous zero-density cases are not claimed.

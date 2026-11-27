# Words at a prescribed depth and the size of a Fourier packet

Fix an odd prime $`p`$ and a generating triple $`S`$ of $`K=K_1`$. Write $`\varphi=(1+\sqrt5)/2`$ and $`\gamma=\log 2/\log\varphi`$. For every $`\eta>0`$ and every depth $`d\ge1`$, each nonzero first digit in $`K_d/K_{d+1}`$ is realized by a word of length $`O_{p,\eta}(d^{\gamma+\eta})`$. At Fibonacci depths $`d`$ one can use length $`O_p(d^\gamma)`$. The construction uses Elkasapy's short lower-central-series words. The bracket computation below gives the exact depth and permits any prescribed output digit for each marking. [Elkasapy, Section 2](https://arxiv.org/abs/1610.09725)

This gives a restriction on every new unit vector $`f`$ on the ordinary projective ball of size $`N=p^M`$. Use the Fourier basis of a full cycle $`Z`$ as in the [cycle calculation](CYCLIC-FOURIER.md), and let $`E`$ be the six-move energy of $`f`$. Given $`0<\delta\le1`$, there exist $`c_{p,\delta}>0`$ and $`E_{p,\delta}>0`$ such that, for $`E<E_{p,\delta}`$, every set $`A`$ of cycle frequencies carrying squared mass at least $`\delta`$ satisfies

```math
|A|\ \ge\ c_{p,\delta}\sqrt N\,
       \exp\!\left(c_{p,\delta}\,E^{-1/(2\gamma)}\right).
```

The frequencies may be selected after seeing $`f`$. For example, if new vectors had energies $`O_p(1/M)`$, then the square-root support bound would gain a factor exponential in $`M^{1/(2\gamma)}`$ for each fixed positive fraction of the mass. The full cycle basis still has $`N`$ labels. The estimate permits energy tending to zero.

## Keeping the leading brackets nonzero

Use the three axes $`H=\mathrm{diag}(1,-1)`$, $`I_+=E_{12}+E_{21}`$ and $`I_-=E_{12}-E_{21}`$ in the traceless matrices modulo $`p`$. The brackets of distinct axes span the third axis. Their nonzero scalar factors are $`\pm2`$. Multiplication identifies $`K_b/K_{b+1}`$ with addition of first digits. The usual commutator of elements of exact depths $`a,b`$ has digit $`[X,Y]`$ at depth $`a+b`$. This follows by expanding the matrices modulo $`p^{a+b+1}`$, and gives exact depth whenever the bracket is nonzero.

Take seed words $`A,B`$ of depths $`a,b`$ with first digits on two distinct axes. Write $`[u,v]=uvu^{-1}v^{-1}`$. Elkasapy's recursion is

```math
U_0=B^{-1},\quad V_0=ABA^{-1},\qquad
U_{j+1}=U_jV_j,\quad V_{j+1}=U_j^{-1}V_j^{-1}.
```

Thus $`U_1=[B^{-1},A]`$ and $`U_{j+2}=[U_{j+1},U_j^{-1}]`$. Consecutive leading directions remain distinct, and the third is their bracket direction. If $`F_0=0,F_1=1`$ are the Fibonacci numbers then

```math
d_j=\mathrm{depth}(U_j)=F_{j+1}b+F_j a,\qquad
|U_j|_S\le 2^j(2|A|_S+|B|_S).
```

Cycling the initial axis assignments gives all three axes at the same depth. Products of bounded powers of these three outputs realize every first digit there. At depth one any desired digit has a word of length at most $`3(p-1)/2`$ by the first-digit basis test. Taking $`a=b=1`$ gives the asserted Fibonacci-depth bound.

For the bound at every depth, let $`T(n)`$ be the worst, over markings and target digits, of the shortest length at depth $`n`$. It is finite at each fixed $`n`$ by generation of the finite group $`G_{n+1}`$. For sufficiently large $`n`$ choose $`j`$ maximal with $`k=F_j\le\sqrt n/4`$, and let $`l=F_{j+1}`$. Then $`k\asymp\sqrt n`$, $`kl<n`$, and $`\gcd(k,l)=1`$. Take $`1\le b\le k`$ with $`lb=n\bmod k`$ and $`a=(n-lb)/k`$. Both inputs are positive and at most an absolute constant times $`\sqrt n`$. The recursion gives

```math
T(n)\le C_p\,2^j\max\{T(a),T(b)\},\qquad 2^j\ll n^{\gamma/2}.
```

Induct with $`T(m)\le C m^{\gamma+\eta}`$. The right side is at most $`C C_{p,\eta}'n^{\gamma+\eta/2}`$, which is bounded by $`C n^{\gamma+\eta}`$ beyond a threshold independent of $`C`$. The finitely many smaller depths fix $`C`$.

## Fourier mixing inside residue classes

Let $`W_d`$ be a word with first digit $`E_{12}`$ at depth $`d`$, put $`q=p^{d+1}`$ and take $`2(d+1)\le M`$. The length is denoted $`L`$. For nonzero integral $`j`$ the exact squared overlaps of $`W_d^j`$ in the cycle basis, from a primitive label $`\xi`$ to a label $`\zeta`$, are

```math
\frac{q_j}{N}\mathbf1_{\xi=\zeta\bmod q_j},\qquad
q_j=\gcd(N,p^{d+1}j).
```

To check the change of depth in the [complete-sum proof](CYCLIC-FOURIER.md), put $`s=d-1+v_p(j)`$ there. The new matrix is identity plus a unit multiple of $`p^{s+1}E_{12}`$ modulo $`p^{s+2}`$. Its slope map has constant term in $`p^{s+1}\mathbb Z_p`$, linear multiplier in $`1+p^{s+2}\mathbb Z_p`$, and denominator $`1+v y`$ with $`v_p(v)=s+2`$. These are exactly the hypotheses of the double-difference argument. They also cover $`q_j=N`$.

We need the distribution of cycle labels modulo $`q`$. In the coordinate $`k`$ the slope is $`p y(k)`$ with $`y(k)=r_0k+p^2P(k)`$, where $`r_0`$ is a unit and $`P`$ is an integral restricted power series. For a shift by $`p^{M-d-1}t`$, Taylor expansion modulo $`N`$ changes $`y`$ by $`p^{M-d-1}t\, y'(k)`$. The error vanishes since $`2(d+1)\le M`$. In each joint position and frequency packet at precision $`d+1`$, the cycle label is consequently $`\xi_y y'(k)\bmod q`$, where $`\xi_y`$ denotes the ordinary frequency. Under the sector-wise uniform law, given any position, $`\xi_y`$ is uniform on one primitive class modulo $`p`$, and $`y'(k)=r_0\bmod p`$. Thus every individual cycle label modulo $`q`$ has reference mass at most $`p/q`$. The [total variation estimate for packets](PHASE-PLANE.md) bounds the discrepancy on **any collection** of these classes by $`C_p\sqrt{(d+2)E}`$.

For any $`K_0>0`$ remove from $`A`$ the classes modulo $`q`$ containing more than $`K_0`$ selected labels. At most $`|A|/K_0`$ classes are removed, so their squared mass is at most $`p|A|/(K_0q)+C_p\sqrt{(d+2)E}`$. Call the rest $`A_0`$. Every class modulo $`q_j`$ contains at most $`K_0`$ labels of $`A_0`$. The row and column sums bound the norm of the compression of $`W_d^j`$ to $`A_0`$ by $`K_0\sqrt{q/N}\,p^{v_p(j)/2}`$. Also $`\|(W_d-1)f\|\le L\sqrt{6E}`$. Averaging the first $`J`$ powers as in the cycle calculation gives

```math
\|P_{A_0}f\|_2^2\ll_p J^2 L^2E+J^{-1}+K_0\sqrt{q/N},
```

since $`J^{-1}\sum_{1\le j\le J}p^{v_p(j)/2}\ll_p1`$. For $`L^2E\le1`$ take $`J`$ comparable to $`(L^2E)^{-1/3}`$. For $`L^2E>1`$ the bound by one suffices. Optimizing the sum of the two class bounds in $`K_0`$ gives

```math
\|P_Af\|_2^2\ll_p
 (L^2E)^{1/3}+\sqrt{(d+2)E}
 +\left(\frac{|A|}{\sqrt{Nq}}\right)^{1/2}.
```

For the stated mass bound choose a Fibonacci depth $`d`$ comparable to $`c E^{-1/(2\gamma)}`$ and at most that quantity, where $`c>0`$ is sufficiently small depending on $`p,\delta`$. Consecutive Fibonacci depths have bounded ratio. The existing lower bound $`E\gg_p 1/(M+1)`$ for all generating triples ensures $`2(d+1)\le M`$ once $`E`$ is small. With $`L\ll_p d^\gamma`$ the first two terms, including their constants, are then below $`\delta/2`$. The last term forces $`|A|\gg_{p,\delta}\sqrt{Nq}`$. [Earlier finite-depth lower bound, entries 52 and 128](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539)

The matrix check evaluates the words with three different seed directions and higher-digit perturbations at powers of 3, 5 and 7. It verifies 1,134 word depths and leading digits. The Fourier checker also counts every finite difference for nine additional deep matrix pairs, including signed powers. Run `python3 -B research/padic-sl2-uniform-gap/check_depth_words.py` and `python3 -B research/padic-sl2-uniform-gap/check_cyclic_fourier.py`. [Word check](check_depth_words.py) · [Fourier check](check_cyclic_fourier.py)

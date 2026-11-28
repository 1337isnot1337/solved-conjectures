# A necessary mixed-prime modulus

Every covering in [Erdős #273](https://www.erdosproblems.com/273) must use a modulus divisible by two distinct primes greater than three. The bound holds with arbitrarily many moduli, arbitrarily large primes and arbitrary exponents.

More precisely, fix any finite selection of distinct moduli $p-1$ for primes $p\ge5$, and choose one residue per modulus. Write each modulus as an even 3-smooth part times a factor coprime to six. On more than $1/100$ of the choices of the 2- and 3-coordinates, all purely 3-smooth classes are avoided and, for **every** prime $q>3$, the classes with $q$ as their sole auxiliary prime forbid less than $9/10$ of its coordinate. Coordinate proportions are uniform in the prime-power factors of the least common multiple. Independent choices in the remaining coordinates then avoid all classes with at most one auxiliary prime.

Earlier work bounds the sum of reciprocals of the purely 3-smooth moduli, excludes a bounded pool of shifted primes and explains why independent fresh primes cannot fill a single class with pairwise coprime multipliers. The theorem here permits unlimited repetition of each auxiliary prime with different 3-smooth parts or exponents. [Earlier covering-system note, §§3–5](https://github.com/idealombrer/erdos-273-covering-pm1/blob/master/PAPER_273.tex)

## Bounding a blocked coordinate

Write $d=2^a3^b$, with $a\ge1$ and $b\ge0$. For a base point $x$ in the 2- and 3-coordinates define
```math
 W_q(x)=\sum_{dq^e\text{ selected}} q^{-e}\,1_{x\equiv a_{dq^e}\bmod d},\qquad e\ge1 .
```
Each contributing class forbids fraction $q^{-e}$ of the $q$-coordinate, so $W_q$ bounds its forbidden proportion. For each $d$ bound the sum of its possible weights by $b_d$. For any finite initial set of small parts $D$, their contribution is at most $\sum_{d\in D}b_d$ at every $x$. Each remaining term contributes an expected amount at most $b_d/d$, since the base point is uniform. Thus
```math
 \Pr(W_q\ge9/10)\le
 \frac{\sum_{d\notin D}b_d/d}{9/10-\sum_{d\in D}b_d}
```
whenever the denominator is positive. Infinite sums in the upper bounds allow parts absent from the actual least common multiple.

For $5\le q\le100$ use the first three possible powers, retaining $q^e d+1$ if it passes Fermat's test to base two. Allow all higher powers. For $d>2000$ allow every power, so $b_d=1/(q-1)$. The full sum of $1/d$ over the even 3-smooth parts is $3/2$. For the purely 3-smooth moduli themselves, sum $1/d$ when $4\le d\le2000$ and $d+1$ is prime, and include every $d>2000$. The total of this direct bound and the small-prime probability bounds is less than $967/1000$. The attached standard-library script checks this by exact rational arithmetic, taking the best bound over initial segments $D$ for each prime. [Arithmetic certificate](verify_fibres.py)

For every prime $q>100$, put $A=\lfloor\sqrt{(q-1)/2}\rfloor\ge7$. Use as $D$ the rectangle $1\le a\le A$, $0\le b<A$. Its $A^2$ terms contribute at most $A^2/(q-1)\le1/2$. The expected weight outside the rectangle is at most $\frac{3}{2(q-1)}(2^{-A}+3^{-A})$ by the geometric series. The denominator in the bound is at least $2/5$. For each $A$ there are at most $4A+2$ integer choices of $q$, and $q-1\ge2A^2$. Since $3(4A+2)/(2A^2)\le1$ for $A\ge7$, the sum of all large-prime probabilities is at most
```math
 \frac54\sum_{A\ge7}(2^{-A}+3^{-A})=
 \frac54\left(\frac1{64}+\frac1{2\cdot3^6}\right).
```
Adding this to $967/1000$ gives less than $99/100$. The union bound gives the claimed base proportion. At each such base point, choose an allowed value independently in every auxiliary prime-power coordinate. The Chinese remainder theorem gives an integer with those coordinates. If every modulus had at most one auxiliary prime, this integer would be uncovered.

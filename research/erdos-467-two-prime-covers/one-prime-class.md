# Covering a long interval with one residue class of primes and finitely many auxiliaries

Fix $L>0$. There is a **finite** set $F$ of primes congruent to one modulo three such that for all sufficiently large $x$, the primes up to $x$ from
```math
 \{p:p\equiv 2\pmod3\}\cup F
```
admit one residue each covering every integer $1\le n\le Lx$. One may take $F$ from any prescribed set of primes congruent to one modulo three with divergent reciprocal sum. Consequently adding any such set to the primes congruent to two modulo three gives coverable interval length divided by $x$ tending to infinity. For a particular $L$ only finitely many of the added primes are used.

Give each prime $p\le x/2$ congruent to two modulo three the unique residue determined by $3n-1\equiv0\pmod p$. Every $3n-1$ under consideration is positive and congruent to two modulo three, so it has a prime factor $p\equiv2\pmod3$. If the point is missed, every such prime factor exceeds $x/2$. Writing $3n-1=pm$ for one of them gives $m\le6L$ and $p\le3Lx$. Thus there are at most $C_Lx/\log x$ missed integers, by summing the prime-counting upper bound over the finitely many possible positive $m$. This starts from the same nonresidue-factor principle as the construction for sums of two squares discussed in the [work of Dietmann, Elsholtz, Kalmynin, Konyagin and Maynard](https://www.math.tugraz.at/~elsholtz/WWW/papers/papers77large54.pdf).

Choose $F$ as in the theorem so that $C_L\prod_{q\in F}(1-1/q)<1/8$. For $x$ above all these primes, independent uniform residues at them leave fewer than $x/(8\log x)$ misses in expectation. Fix a choice attaining this bound. The unused primes in $(x/2,x]$ congruent to two modulo three number $(1/4+o(1))x/\log x$ by the prime number theorem in fixed progressions. Assign a distinct one to each remaining point. Extra primes may take arbitrary classes.

In particular the above covers $[1,x]$ while leaving all but finitely many primes congruent to one modulo three available for the second colour. A separate construction with those remaining primes would solve [Erdős problem 467](https://www.erdosproblems.com/467). Their being the complementary class does not supply the prime factor used in this proof: an integer congruent to one modulo three may be a product entirely of primes congruent to two.

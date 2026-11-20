# Shapiro’s conjecture

Let $1\lt a_1\lt a_2\lt\cdots$ generate a multiplicative semigroup $G$ containing 1. Assume the values belonging to distinct nonnegative, finitely supported exponent vectors differ by at least 1. Shapiro’s question, recorded by Erdős, asks whether the generator count $A(x)$ is at most $\pi(x)$ for all sufficiently large $x$. The cutoff is allowed to depend on the whole sequence.

## Status as of 2026-11-20

Erdős’s 1969 paper asks a finite version. The 1977 and 1980 surveys ask the real-generator question and discuss the relationship with Beurling’s generalised primes. Known finite counterexamples refute the interpretation requiring the inequality at every $x$. Their extensions produce infinite separated systems with a violation at a fixed cutoff. The wiki claim records, the finite-case research report, the survey sources and searches for subsequent eventual results yielded no resolution for arbitrarily large cutoffs.

- [Erdős, *Some applications of graph theory to number theory*, p. 82](https://users.renyi.hu/~p_erdos/1969-14.pdf)
- [Erdős, *A survey of problems in combinatorial number theory*, pp. 102–104](https://renyi.hu/~p_erdos/1980-03.pdf)
- [Erdős Problem 951 and its historical and claim records](https://erdosproblems.ai/wiki/problems/number_theory/E0951)
- [July 2026 finite-extremum report](https://www.erdosproblemaday.com/report/951)

Lagarias studies a rigidity question for integer Beurling systems under bounded gaps and proves structural results about omitted primes. The argument below uses gaps strictly smaller than one to rule out nonintegral elements when the system contains sufficiently many ordinary primes. It imposes no upper bound on gaps in $G$.

- [Lagarias, *Beurling generalized integers with the Delone property*](https://websites.umich.edu/lagarias/doc/beurling.pdf)

## Ordinary primes and separation

Let $E$ consist of the ordinary primes which are absent from $G$. Let $S_E$ be the integers whose prime factors all lie outside $E$. Multiplicative closure gives $S_E\subseteq G$. Any noninteger $\lambda\in G$ and a pair $n,m\in S_E$ satisfying $0\lt |\lambda n-m|\lt1$ contradict separation.

**Theorem 1.** If $\sum_{p\in E}1/p\lt\infty$, all elements of $G$ are integers, and $A(x)\le\pi(x)$ for every $x$. If $\#(E\cap[1,x])=o(\pi(x))$, all *rational* elements of $G$ are integers. In particular, a separated system with a rational noninteger element omits a positive upper proportion of the ordinary primes.

### Irrational elements when the omitted reciprocals converge

Suppose $\lambda$ is irrational. For a finite $E_0\subseteq E$, write $M=\prod_{p\in E_0}p$ and $\rho_0=\varphi(M)/M$. Consider $n\le X$ and $m=\lfloor\lambda n\rfloor$. Restricting $n$ to any given class modulo $M$, the fractional parts of $\lambda n/M$ are equidistributed. Thus the asymptotic count with both $n,m$ coprime to $M$ is $\rho_0^2 X$. The convergent reciprocal sum gives a uniform positive lower bound $\rho_0\ge\rho=\prod_{p\in E}(1-1/p)\gt0$.

The integers $n\le X$ divisible by a prime in $E\setminus E_0$ number at most $X\sum_{p\in E\setminus E_0}1/p$. The map $n\mapsto m$ is injective because $\lambda\gt1$. The same upper bound for the images, with $\lambda X$ in place of $X$, counts the $n$ whose $m$ is divisible by an omitted prime outside $E_0$. Choose $E_0$ so the sum of these two upper bounds is at most $\rho^2 X/2$, and then let $X$ grow. The surviving pairs give $0\lt\lambda n-m\lt1$.

### Rational elements when the omitted primes have relative density zero

Take $\lambda=a/b\gt1$ in lowest terms with $b\ge2$. Choose $t=2$ if both $a,b$ are odd and $2\in E$. Otherwise choose $t=1$. In either case $0\lt t\lt b$ and $\gcd(t,ab)=1$. The positive solutions of $an-bm=t$ are parameterised, after a possible shift of the parameter, by two primitive linear forms $L_1(k)=bk+n_0$ and $L_2(k)=ak+m_0$. For $p\in E$, let $\nu(p)$ count the roots of $L_1L_2$ modulo $p$. Then $\nu(p)\lt p$, and $\nu(p)=2$ for $p\nmid abt$. The choice of $t$ ensures this at 2 even if both forms have odd leading coefficient. It suffices to show that for some $k$ the two forms are both $E$-free.

Put

```math
W(Y)=\prod_{p\in E,\ p\le Y}(1-1/p),\qquad
V(Y)=\prod_{p\in E,\ p\le Y}(1-\nu(p)/p).
```

The prime number theorem and partial summation show that $\sum_{Y^c\lt p\le Y^d,\ p\in E}1/p=o(1)$ for fixed $0\lt c\lt d$, and $\sum_{p\le Y,\ p\in E}1/p=o(\log\log Y)$. Consequently $W(Y^d)/W(Y^c)\to1$, $W(Y)=(\log Y)^{-o(1)}$, and $V(Y)/W(Y)^2$ tends to a positive constant. Constant multiples in the product cutoffs also have ratio tending to one.

We use the combinatorial fundamental lemma for linear congruences. If at each prime $p$ at most two classes are deleted and the number deleted is strictly less than $p$, then for an interval of length $H$ and sifting range $z\le H^{c_*}$, with $c_*$ a sufficiently small absolute constant, the count is between

```math
\tfrac34 H U(z)-O(H^{2/3})\qquad\text{and}\qquad
2H U(z)+O(H^{2/3}),
```

where $U(z)$ is the product of the retained residue proportions. Indeed, use sieve level $H^{1/2}$ and the uniform dimension-two product bound from Mertens’ theorem, since the deletion density is at most $2/p$ and at most $1/2$ at 2. The total interval remainder is bounded by $\sum_{d\le H^{1/2}}2^{\omega(d)}=O(H^{1/2}\log H)$. The constants thus do not depend on the individual residues or on the omitted-prime set. A prime with no retained residue gives count zero in the upper-bound uses below.

- [Tao, *Some sieve theory*, Corollary 19](https://terrytao.wordpress.com/2015/01/21/254a-notes-4-some-sieve-theory/)

Fix $0\lt c\lt c_*$. Sifting $1\le k\le X$ by the primes in $E$ up to $X^c$ leaves at least $(3/4-o(1))X V(X)$. Take a fixed $0\lt\delta\lt\min(c,1/10)$. The survivors that fail at some $p\in E$ with $X^c\lt p\le X^{1-\delta}$ can be counted separately in the at most two roots modulo $p$. In each root the interval for the new variable has length $X/p+O(1)$. The still-present restrictions up to $z_0=X^{c_*\delta/2}$ have the same local proportions, because $p$ is invertible at each of those small primes. The upper sieve gives a bound of order $(X/p)V(z_0)+(X/p)^{2/3}$ per root. Summing over this range gives

```math
O\left(XV(z_0)\sum_{X^c\lt p\le X^{1-\delta},\ p\in E}\frac1p
   + X^{1-\delta/3}\right)=o(XV(X)).
```

It remains to handle $p\gt X^{1-\delta}$. Write $L_1(k)=hp$ first. Then $h\le C X^\delta$ for a constant $C$ depending on the forms, and $h$ itself is $E$-free because $C X^\delta\lt X^c$ for large $X$. Primitivity of $L_1$ gives $\gcd(h,b)=1$. Thus $p$ runs in one class modulo $b$, say $p=r+bu$. The other form is $(ahp-t)/b$, an integral linear form in $u$. For an upper bound, sieve the $u$ interval by all primes up to $z_1=X^{c_*/4}$ for the primality of $p$, and by $E$ up to $z_1$ for the absence of those prime factors in the other form. The interval has length at most $O(X/h)$ and can be enlarged to that length. The primality restriction is valid since $p\gt z_1$, and the upper-sieve range condition holds since $h=O(X^\delta)$.

For primes $q\nmid abt$, the first form has one forbidden residue. If $q\in E$, the second form has a different forbidden residue since $q\nmid h$ and $t\ne0\pmod q$. The primes dividing $abt$ change the product by at most a constant depending on $a,b,t$. Hence the sieve product is at most a constant times $W(z_1)/\log X$. The bound for each $h$ is

```math
O_{a,b}\left(\frac{X}{h\log X}W(z_1)+(X/h)^{2/3}\right).
```

There is the same bound with the two forms interchanged. For $Y=C X^\delta$, the Euler product and Mertens’ theorem give

```math
\sum_{h\le Y,\ h\text{ is }E\text{-free}}\frac1h
\le \prod_{q\le Y,\ q\notin E}(1-1/q)^{-1}\ll W(Y)\log Y.
```

The two large-prime counts are therefore at most $O_{a,b}(\delta X V(X))+o(XV(X))$, with a constant independent of $\delta$. Here $W(z_1)W(Y)\sim W(X)^2$, and the summed remainders are $O_{a,b}(X^{(2+\delta)/3})$. Fix $\delta$ sufficiently small that this large-prime bound and the medium-prime error leave a positive number of survivors. For any such $k$,

```math
0\lt \left|\lambda L_1(k)-L_2(k)\right|=t/b\lt1.
```

This excludes the rational noninteger. Convergence of the omitted reciprocal sum does not by itself imply relative prime density zero. For that hypothesis, the rational assertion follows directly from the same local root conditions: among $1\le k\le X$ the density passing a finite set of sieving primes is the corresponding product of $1-\nu(p)/p$, uniformly bounded below away from zero as the set grows. The union bound for the remaining primes gives $O_{a,b}(X\sum_{p\in E\setminus E_0}1/p+\pi(CX))$. Choose the finite set $E_0$ first, then let $X$ increase. This proves the rational part under either hypothesis.

If $G$ contains only integers, the valuation vectors for the generators at most $x$ are linearly independent over the rationals, because an integer relation would equate products with distinct exponent vectors. They are supported on the $\pi(x)$ primes at most $x$, which proves the bound in Theorem 1. The same rank argument proves the eventual bound whenever all generators are rational and only finitely many are nonintegers. In that case take $x$ beyond all prime factors of every exceptional numerator and denominator.

## Open step

The theorem constrains attempts to extend a finite nonintegral counterexample by including almost all ordinary primes. The appearance of a positive proportion of omitted primes does not compare the total of the noninteger and integer generalised generators. A proof of the eventual inequality or a single counterexample violating it for arbitrarily large $x$ remains open.

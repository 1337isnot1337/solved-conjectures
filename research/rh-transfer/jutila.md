# Jutila's conjecture

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact statement and status

For \(X\ge3\), let \(\mathcal S(X)\) contain every nonprincipal real Dirichlet character of modulus at most \(X\), including imprimitive characters. Characters are counted with their moduli. For every positive integer \(m\), Jutila's character-sum moment conjecture asks for constants \(c_1(m),c_2(m)>0\), depending only on \(m\), such that
\[
\boxed{\quad
 \sum_{\chi\in\mathcal S(X)}
 \left|\sum_{n\le Y}\chi(n)\right|^{2m}
 \le c_1(m)XY^m(\log X)^{c_2(m)}
 \qquad(X\ge3,\ Y\ge1).
 \quad}                                                   \tag{J}
\]

The original statement is in [J73, §5, printed p. 250]; its original indexing uses nonsquare discriminants and Kronecker characters. [V02, first page] and [GZ25, equation (1.1)] give the all-nonprincipal-real-character formulation above. Bounding all characters with their moduli also bounds the original Kronecker family, and remains valid if repeated arithmetic functions are counted only once.

**Status: complete mathematical draft for independent review.** The proof below establishes (J) from rational Dirichlet GRH. It includes both signs of primitive discriminants, all positive integer moments, all lengths, and the induced-character summation. It does not substitute a smoothed sum or one congruence family for the target.

At the repository owner's request, rational Dirichlet GRH is accepted from the source pin [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Independently of that accepted input, the result here is conditional on rational Dirichlet GRH.

The analytic method is the classical conditional moment method developed by Soundararajan and Harper. Gao–Zhao already prove closely related conditional results, including unsmoothed sums for the family \(\chi_{8d}\). This note uses their general logarithm inequality and supplies a deliberately nonsharp complete derivation of the full stated scope. It claims no new optimal exponent or exclusive priority for the conditional deduction. No Lean verification or numerical checking is used.

## 1. Primitive quadratic characters and an elementary orthogonality bound

Write
\[
\mathcal D(X)=\{D:\ D\text{ is a fundamental discriminant},\
                     1<|D|\le X\}.
\]
The primitive character is \(\chi_D(n)=(D/n)\); its conductor is \(|D|\). The positive fundamental discriminant \(1\), which would give the principal character, is excluded.

Every \(D\in\mathcal D(X)\) has one of the following forms, with \(u\) positive, odd, and squarefree:

| Form of \(D\) | Restriction on \(u\) |
|---|---|
| \(u\) | \(u\equiv1\pmod4\) |
| \(-u\) | \(u\equiv3\pmod4\) |
| \(4u\) | \(u\equiv3\pmod4\) |
| \(-4u\) | \(u\equiv1\pmod4\) |
| \(8u\), \(-8u\) | no further restriction |

The case \(D=1\) is removed from the first row. There are \(O(X)\) such discriminants.

**Lemma 1.** For every odd positive nonsquare integer \(N\),
\[
 \left|\sum_{D\in\mathcal D(X)}\chi_D(N)\right|
 \ll \sqrt{XN}.                                             \tag{1}
\]
For an odd square \(N\), the same sum is nonnegative and at most \(O(X)\).

**Proof.** In each row of the table, write \(D=cu\), \(Z=X/|c|\). The constant factor \((c/N)\) has absolute value one. It suffices to bound
\[
 \sum_{\substack{u\le Z\\u\equiv a\ (4)}}\mu^2(u)(u/N),
 \qquad a=1\text{ or }3.
\]
For the last two rows sum the two classes. Expand
\(\mu^2(u)=\sum_{h^2\mid u}\mu(h)\). Only odd \(h\) occur, and \(h^2\equiv1\pmod4\). Terms with \((h,N)>1\) vanish. For the other terms the inner sum is
\[
 \sum_{\substack{v\le Z/h^2\\v\equiv a\ (4)}}(v/N).
\]
Because \(N\) is an odd nonsquare, \(v\mapsto(v/N)\) is a nonprincipal Dirichlet character modulo \(N\), possibly imprimitive. A complete period on this progression has zero sum: the step \(4\) is invertible modulo \(N\). Consequently the inner sum is
\[
 O\bigl(\min(Z/h^2,N)\bigr).
\]
If \(N\le Z\), splitting at \(h=\sqrt{Z/N}\) gives
\[
 \sum_{h\le\sqrt Z}\min(Z/h^2,N)\ll\sqrt{ZN}.
\]
If \(N>Z\), the bound \(O(Z)\) is already \(O(\sqrt{ZN})\). Sum the six rows. Removing \(D=1\) changes the answer by at most one. For square \(N\), every \(\chi_D(N)\) equals zero or one. \(\square\)

This elementary estimate is weaker than standard quadratic orthogonality estimates. Its advantage here is that its complete sign and conductor scope has been proved explicitly.

## 2. Moments of a short prime polynomial

Put
\[
 W=\log X,\qquad L=\log\log X.
\]
All estimates initially concern sufficiently large \(X\), depending only on fixed parameters. Bounded \(X\) will be handled at the end.

Let \(2\le x\le X\), let \(b_p\) be arbitrary real numbers satisfying \(|b_p|\le1\), and put
\[
 P_D=\sum_{\substack{p\le x\\p\text{ odd prime}}}
           \frac{b_p\chi_D(p)}{\sqrt p}.
\]

**Lemma 2.** Uniformly in these coefficients and every positive integer \(r\),
\[
 \sum_{D\in\mathcal D(X)}|P_D|^{2r}
 \ll X(4rL)^r+\sqrt X\,x^{2r}.                              \tag{2}
\]
The implied constant is absolute; in particular it does not grow with \(r\).

**Proof.** Expand the even power. For a tuple \(p_1,\ldots,p_{2r}\), write \(N=p_1\cdots p_{2r}\). If \(N\) is not a square, Lemma 1 bounds the corresponding sum over \(D\) by \(C\sqrt{XN}\). The factor \(N^{-1/2}\) cancels, so the total absolute error is at most
\[
 C\sqrt X\,\pi(x)^{2r}\le C\sqrt X\,x^{2r}.
\]

For square \(N\), every prime occurs an even number of times; the corresponding product of the real coefficients \(b_p\) is nonnegative. Pairing the \(2r\) positions gives the bound
\[
 CX\,\frac{(2r)!}{2^r r!}
       \left(\sum_{\substack{p\le x\\p\text{ odd}}}\frac{b_p^2}{p}\right)^r.
\]
Pairing overcounts tuples in which one prime occurs more than twice, which is permissible. Since \((2r)!/(2^r r!)\le(2r)^r\) and
\(\sum_{p\le X}p^{-1}\le2L\) for sufficiently large \(X\), this is at most \(CX(4rL)^r\). \(\square\)

## 3. The only conditional analytic input

We use the following standard GRH logarithm inequality. It is stated for **every primitive Dirichlet character** in [GZ25, Lemma 2.6], with the earlier source [M17, Proposition 2.3].

For a primitive nonprincipal character \(\chi\) of conductor \(q\), \(\sigma\ge1/2\), real \(t\), and \(x\ge2\),
\[
\begin{split}
 \log|L(\sigma+it,\chi)|
 \le{}&
 \Re\sum_{n\le x}
 \frac{\chi(n)\Lambda(n)}
 {n^{1/2+\max(\sigma-1/2,\,1/\log x)+it}\log n}
 \frac{\log(x/n)}{\log x}\\
 &+\frac{\log q+\log^+(|t|)}{\log x}
 +O(1/\log x).                                            \tag{3}
\end{split}
\]
Changing the harmless constants near \(t=0\) gives the same inequality with \(\log(|t|+3)\). At a zero its left side is \(-\infty\), so it remains valid.

Fix \(A\ge1\), and suppose \(q\le X\), \(|t|\le X^A\). Separate odd primes, prime squares, the prime \(2\), and prime powers of exponent at least three. The last two classes contribute \(O(1)\); the prime-square contribution is at most
\[
 \frac12\sum_{p\le\sqrt x}\frac1p
 \le \frac12\log\log X+O(1).
\]
At \(\sigma=1/2\), (3) therefore gives
\[
 \log|L(1/2+it,\chi_D)|
 \le P_D(x,t)+\frac12L
       +(A+2)\frac{W}{\log x}+C,                           \tag{4}
\]
where
\[
 P_D(x,t)=\sum_{\substack{p\le x\\p\text{ odd}}}
 \frac{\chi_D(p)}{\sqrt p}\,
 \cos(t\log p)\,p^{-1/\log x}
 \frac{\log(x/p)}{\log x}.                                \tag{5}
\]
Its coefficients satisfy exactly the hypotheses of Lemma 2. The constants are uniform in all the discriminants and in \(|t|\le X^A\). The accepted Dirichlet GRH hypothesis supplies (3) for each character involved.

### A uniform pointwise ceiling

The same reasoning works for every \(\sigma\ge1/2\), since the coefficient magnitudes can only decrease. Set
\[
 x_0=(W/L)^2.
\]
For sufficiently large \(X\), \(2\le x_0\le X\) and \(\log x_0\ge L\). The absolute prime sum is at most
\[
 \sum_{n\le x_0}n^{-1/2}\le2\sqrt{x_0}=2W/L.
\]
Consequently, with a constant \(K_A>0\) depending only on \(A\),
\[
 \log|L(\sigma+it,\chi_D)|
 \le K_A W/L
 \quad(\sigma\ge1/2,\ |t|\le X^A,\ D\in\mathcal D(X)).       \tag{6}
\]
In particular, for every fixed \(\delta>0\), these \(L\)-values are \(O_{A,\delta}(X^\delta)\). This ceiling is proved from (3), rather than added as another conjectural assumption.

## 4. A complete uniform polylogarithmic moment bound

**Lemma 3.** For every positive integer \(m\) and fixed \(A\ge1\), there are constants \(B_{m,A}\) and \(C_{m,A}\) such that
\[
 \sum_{D\in\mathcal D(X)}
 |L(1/2+it,\chi_D)|^{2m}
 \le C_{m,A}X(\log X)^{B_{m,A}}
 \qquad(|t|\le X^A).                                      \tag{7}
\]

**Proof.** Fix \(m,A\). Write
\[
 B=8(A+2),\qquad
 C_0=\exp\bigl(200B(2m+3)\bigr),\qquad
 V_0=C_0L,\qquad V_{\max}=K_AW/L.
\]
Enlarging a fixed threshold for \(X\), assume \(L\ge2\), \(V_0\ge200B\), and that the constant \(C\) in (4) is at most \(V_0/16\). Define
\[
 N_t(V)=\#\{D\in\mathcal D(X):
                 \log|L(1/2+it,\chi_D)|\ge V\}.
\]
If \(V_0>V_{\max}\), (6) immediately gives (7), so suppose \(V_0\le V_{\max}\).

For \(V_0\le V\le V_{\max}\), choose
\[
 x=X^{B/V},\qquad r=\left\lfloor\frac{V}{100B}\right\rfloor.
\]
For sufficiently large \(X\), \(2\le x\le X\). Indeed \(V\ge B\), while
\(\log x\ge (B/K_A)L\) by \(V\le V_{\max}\). Also
\[
 \frac{V}{200B}\le r\le\frac{V}{100B},
 \qquad x^{2r}\le X^{1/50}.
\]
The conductor term in (4) is \(V/8\), and
\(\tfrac12L+C\le V/4\). Thus every discriminant counted by \(N_t(V)\) satisfies \(P_D(x,t)\ge V/2\).

Markov's inequality and (2) yield
\[
\begin{split}
 N_t(V)
 &\ll X\left(\frac{16rL}{V^2}\right)^r
       +X^{13/25}(2/V)^{2r}\\
 &\ll X(L/V)^r+X^{13/25}\\
 &\le X\exp\bigl(-(2m+3)V\bigr)+CX^{13/25}.                \tag{8}
\end{split}
\]
In the last line, \(V/L\ge C_0\), \(r\ge V/(200B)\), and the definition of \(C_0\) were used. All constants are independent of \(t\).

Use the elementary distribution identity
\[
 \sum_D |L(1/2+it,\chi_D)|^{2m}
 \le \#\mathcal D(X)
 +2m\int_0^{V_{\max}} e^{2mV}N_t(V)\,dV.                  \tag{9}
\]
For \(0\le V\le V_0\), the trivial bound \(N_t(V)\ll X\) contributes
\[
 O_m\bigl(Xe^{2mV_0}\bigr)
   =O_m\bigl(X(\log X)^{2mC_0}\bigr).
\]
Above \(V_0\), the first term of (8) contributes \(O_m(X)\). The second contributes
\[
 O_m\bigl(X^{13/25}e^{2mV_{\max}}\bigr)
  =X^{13/25+o_{m,A}(1)}=o(X).
\]
This proves (7), for example with \(B_{m,A}=2mC_0\). Bounded \(X\) is absorbed into the constant, since \(|t|\le X^A\) then ranges over a compact set and there are finitely many characters. \(\square\)

The very large exponent is intentional. The original conjecture asks for some exponent depending on \(m\), not the sharp exponent. No fixed moment or range has been omitted.

## 5. Unsmoothed primitive sums, including short and long lengths

Define
\[
 T_m(X,Y)=\sum_{D\in\mathcal D(X)}
       \left|\sum_{n\le Y}\chi_D(n)\right|^{2m}.
\]

**Lemma 4.** For each \(m\ge1\), some \(K_m>0\) satisfies
\[
 T_m(X,Y)\ll_m XY^m(\log(2X))^{K_m}
 \qquad(X\ge3,\ Y\ge1).                                  \tag{10}
\]

**Proof.** For \(1\le Y<2\), every inner sum equals one, so (10) follows from \(\#\mathcal D(X)\ll X\).

Suppose \(2\le Y\le X\). Let
\[
 y=\lfloor Y\rfloor+\tfrac12,\qquad
 c=1+\frac1{\log y},\qquad T=X^4.
\]
Then \(y\asymp Y\), \(\sum_{n\le y}\chi_D(n)=\sum_{n\le Y}\chi_D(n)\), and \(y\) has distance at least \(1/2\) from every integer.

Truncated Perron inversion gives
\[
 \sum_{n\le Y}\chi_D(n)
 =\frac1{2\pi i}\int_{c-iT}^{c+iT}
           L(s,\chi_D)\frac{y^s}{s}\,ds
  +O\left(\frac{y\log(2y)}{T}\right).                     \tag{11}
\]
For clarity, the usual error sum is
\[
 \sum_{n\ge1}(y/n)^c
    \min\left(1,\frac1{T|\log(y/n)|}\right).
\]
For \(y/2<n<2y\), the half-integer choice bounds this by
\(O((y/T)\sum_{j\le2y}(j+1/2)^{-1})\).
Outside that range, absolute convergence gives
\(O(y^c\zeta(c)/T)=O(y\log(2y)/T)\). This proves the error in (11).

The nonprincipal \(L\)-function is entire. Shift the contour to
\(\Re s=1/2\); the point \(s=0\) is not crossed. For \(|\Im s|=T\) and
\(1/2\le\Re s\le c\), the ceiling (6), with \(A=4\), gives
\(|L(s,\chi_D)|\ll X^{1/4}\) for sufficiently large \(X\), uniformly in \(D\). Since \(y^c=ey\), the horizontal integrals are
\[
 O\bigl(YX^{1/4}/X^4\bigr)=O(1).
\]
Together with the truncation error, this yields
\[
 \left|\sum_{n\le Y}\chi_D(n)\right|
 \ll \sqrt Y\int_{-T}^{T}
       \frac{|L(1/2+it,\chi_D)|}{1+|t|}\,dt+1.             \tag{12}
\]
This is an exact sharp-cutoff sum; no smoothing parameter remains.

Apply Minkowski's integral inequality in the finite
\(\ell^{2m}(\mathcal D(X))\) space. Lemma 3, uniformly for
\(|t|\le X^4\), gives
\[
\begin{split}
 T_m(X,Y)^{1/(2m)}
 &\ll_m \sqrt Y
   \int_{-T}^{T}
    \frac{\left(\sum_D|L(1/2+it,\chi_D)|^{2m}\right)^{1/(2m)}}
         {1+|t|}\,dt
   +X^{1/(2m)}\\
 &\ll_m X^{1/(2m)}\sqrt Y
        (\log X)^{B_{m,4}/(2m)+1}.
\end{split}
\]
Hence (10) holds in this range with \(K_m=B_{m,4}+2m\).

If \(Y>X\), the primitive Pólya–Vinogradov inequality, valid for arbitrary partial-sum length after removing complete periods, gives
\[
 \left|\sum_{n\le Y}\chi_D(n)\right|
 \ll\sqrt{|D|}\log(2|D|).
\]
Consequently
\[
 T_m(X,Y)\ll_m X^{m+1}(\log(2X))^{2m}
 \le XY^m(\log(2X))^{2m},
\]
which is covered by the same \(K_m\). Finally enlarge the constant for bounded \(X\). There are finitely many primitive characters in that case and their periodic partial sums are uniformly bounded for every \(Y\). \(\square\)

We may also use (10) for \(0<Y<1\), since then all its inner sums vanish.

## 6. All imprimitive characters with the correct conductor weights

Every \(\chi\in\mathcal S(X)\) is induced from a unique primitive nonprincipal real character \(\psi\) of conductor \(f\), and its modulus is uniquely \(q=fr\). Thus \(f\le X/r\). For every integer \(n\),
\[
 \chi(n)=\psi(n)\mathbf1_{(n,r)=1}.
\]
This identity is still valid when \(r\) and \(f\) have common prime factors, since \(\psi(n)=0\) whenever \((n,f)>1\).

By Möbius inversion,
\[
 \sum_{n\le Y}\chi(n)
 =\sum_{d\mid r}\mu(d)\psi(d)
       \sum_{v\le Y/d}\psi(v).                            \tag{13}
\]
For a fixed \(r\), take the \(\ell^{2m}\)-norm over all primitive real
\(\psi\) of conductor \(f\le X/r\). Put
\[
 A(r)=\sum_{d\mid r}d^{-1/2}.
\]
Minkowski and (10) imply
\[
\begin{split}
 \left(\sum_{\substack{\psi\ {\rm primitive\ real}\\
                 1<f\le X/r}}
      \left|\sum_{n\le Y}\chi_{fr}(n)\right|^{2m}
 \right)^{1/(2m)}
 &\le
 \sum_{d\mid r}
 \left(\sum_{\substack{\psi\ {\rm primitive\ real}\\
                 1<f\le X/r}}
       \left|\sum_{v\le Y/d}\psi(v)\right|^{2m}
 \right)^{1/(2m)}\\
 &\ll_m (X/r)^{1/(2m)}\sqrt Y
       (\log(2X))^{K_m/(2m)} A(r).                        \tag{14}
\end{split}
\]
Terms with \(Y/d<1\) vanish. If \(X/r<3\), there are no nonprincipal primitive real characters and the displayed bound is automatic.

Raising (14) to the \(2m\)-th power and summing over \(r\) gives
\[
 \sum_{\chi\in\mathcal S(X)}
      \left|\sum_{n\le Y}\chi(n)\right|^{2m}
 \ll_m XY^m(\log(2X))^{K_m}
       \sum_{r\le X}\frac{A(r)^{2m}}r.                    \tag{15}
\]

It remains to bound the last sum without losing a power of \(X\).

**Lemma 5.**
\[
 \sum_{r\le X}\frac{A(r)^{2m}}r\ll_m\log(2X).             \tag{16}
\]

**Proof.** Let \(F(r)=A(r)^{2m}\). It is multiplicative. Define the multiplicative function \(g=F*\mu\). At prime powers,
\[
 g(p^j)=A(p^j)^{2m}-A(p^{j-1})^{2m}\ge0.
\]
Since \(A(p^j)-A(p^{j-1})=p^{-j/2}\) and
\(A(p^j)\le(1-2^{-1/2})^{-1}\), the mean-value theorem gives
\[
 0\le g(p^j)\le C_m p^{-j/2}.
\]
Therefore the nonnegative Euler product
\[
 \sum_{d\ge1}\frac{g(d)}d
 =\prod_p\left(1+\sum_{j\ge1}\frac{g(p^j)}{p^j}\right)
 <\infty,
\]
because the local excess is \(O_m(p^{-3/2})\). Since \(F=1*g\),
\[
 \sum_{r\le X}\frac{F(r)}r
 =\sum_{d\le X}\frac{g(d)}d\sum_{h\le X/d}\frac1h
 \ll_m\log(2X).
\]
This proves (16). \(\square\)

Equations (15)–(16) prove (J), with
\[
 c_2(m)=K_m+1
\]
after changing the constant to replace \(\log(2X)\) by \(\log X\) for \(X\ge3\). The exponent depends only on \(m\). The original conjecture permits precisely this dependence. \(\square\)

## 7. Scope and credit

The proof establishes the complete original moment-bound shape. It does not claim:

- the optimal logarithmic exponent or an asymptotic leading constant;
- the distinct conjecture about increments in the divisor or circle problem also called Jutila's conjecture;
- a separate solution for each moment, parity, or conductor family.

The source-theorem input is (3). Its hypothesis is rational Dirichlet GRH, and its quantifiers already include both even and odd primitive characters. The orthogonality, moment argument, contour treatment, and imprimitive lift are written out above, so no extension from \(\chi_{8d}\) is silently assumed.

This is a full-scope application of established conditional analytic methods to the accepted input. Soundararajan, Harper, Munsch, Gao, and Zhao retain credit for the underlying method and published conditional results. The proof does not rely on the exact sharp exponent or smoothing-removal estimates of [GZ25, Theorem 1.3].

## 8. Prior-art audit

Audit date: 20 November 2026. The audit has not located an unconditional full proof or disproof of the exact statement (J). This is bounded negative evidence, not a claim of exclusive priority.

The original [J73, §5] expressly states the whole integer-moment family. Its first moment was already proved in [J73b]. [A99] improves that known second-power estimate to its sharp logarithmic exponent. [V02] gives an \(X^\varepsilon\) loss for the fourth power and explicitly distinguishes it from the conjectured fixed power of \(\log X\).

[GZ24] proves a smoothed conditional result for \(\chi_{8d}\). [GZ25] proves the corresponding unsmoothed family under GRH and displays the full original conjecture in its introduction. [MT26] sharpens the logarithmic exponent for smoothed sums and supplies new lower bounds; it retains GRH for its high-moment upper bounds. The July 2026 prime-modulus paper [ZZ26] also explicitly retains GRH and treats a subfamily. None is misdescribed here as an unconditional earlier resolution.

Both web engines were searched for Jutila's conjecture, real/quadratic character-sum moments, full or unconditional resolution, GRH, QRH, and recent work through November 2026. Current author publication lists and the recent papers' references were checked. Results on circle-problem correlations, divisor-problem increments, the large sieve with an \(X^\varepsilon\) loss, and function-field analogues were excluded from the exact target.

Source access: the original four-page MathNet scan is available, and its extracted text includes the conjecture on printed page 250. The exact formula and ranges are also readable in [V02] and [GZ25]. No visual inspection of an unreturned screenshot is claimed.

## 9. Review checkpoint

Independent adversarial review is pending. The principal checks requested are:

1. the six discriminant classes and complete-period cancellation in Lemma 1;
2. constants independent of \(r\) in Lemma 2, including the nonsquare error;
3. uniformity in \(|t|\le X^4\), the \(X^{13/25}\) tail error, and its integrated contribution;
4. the half-integer Perron cutoff and horizontal errors;
5. the exact \(q=fr\) parametrization and the convergent Euler product in Lemma 5.

This is a mathematical manuscript and internal-review checkpoint, not formal verification or external peer review.

## References

[J73] M. Jutila, *On sums of real characters*, Trudy Mat. Inst. Steklov. **132** (1973), 247–250. [Primary record](https://www.mathnet.ru/eng/tm3224); [original PDF](https://www.mathnet.ru/php/getFT.phtml?jrnid=tm&option_lang=eng&paperid=3224&what=fullt). Conjecture in §5, printed p. 250.

[J73b] M. Jutila, *On character sums and class numbers*, Journal of Number Theory **5** (1973), 203–214.

[A99] M. V. Armon, *Averages of real character sums*, Journal of Number Theory **77** (1999), 209–226.

[V02] H. Virtanen, *The mean fourth power of real character sums*, Acta Arithmetica **103** (2002), 249–257. [Primary PDF](https://www.impan.pl/shop/en/publication/transaction/download/product/83376). Exact conjecture and ranges on the first page.

[S09] K. Soundararajan, *Moments of the Riemann zeta function*, Annals of Mathematics **170** (2009), 981–993. The conditional large-deviation method.

[H13] A. J. Harper, *Sharp conditional bounds for moments of the Riemann zeta function*, 2013. [arXiv:1305.4618](https://arxiv.org/abs/1305.4618). Section 6 and Theorem 2 discuss quadratic-character moments.

[M17] M. Munsch, *Shifted moments of \(L\)-functions and moments of theta functions*, Mathematika **63** (2017), 196–212. Proposition 2.3 is the earlier source cited for the general logarithm bound.

[GZ24] P. Gao and L. Zhao, *Bounds for moments of quadratic Dirichlet character sums*, published online 2024; Bulletin of the Australian Mathematical Society **111** (2025), 43–47. DOI [10.1017/S0004972724000327](https://doi.org/10.1017/S0004972724000327). [Author preprint](https://arxiv.org/abs/2403.14634).

[GZ25] P. Gao and L. Zhao, *Shifted moments of quadratic Dirichlet \(L\)-functions*, Canadian Mathematical Bulletin, 2025. DOI [10.4153/S0008439525000335](https://doi.org/10.4153/S0008439525000335). [Author version v2](https://arxiv.org/html/2406.18024v2). Equation (1.1), Lemma 2.6, Theorems 1.1 and 1.3.

[MT26] M. Munsch and Y. Toma, *Bounds for moments of quadratic character sums and theta functions*, Bulletin des Sciences Mathématiques **210** (June 2026), 103806. DOI [10.1016/j.bulsci.2026.103806](https://doi.org/10.1016/j.bulsci.2026.103806). [Author version](https://arxiv.org/html/2503.05269v2).

[ZZ26] *Bounds for moments of quadratic Dirichlet character sums of prime moduli*, Indagationes Mathematicae **37** (July 2026), 1557–1585. DOI [10.1016/j.indag.2025.11.003](https://doi.org/10.1016/j.indag.2025.11.003). Author metadata and full text to be checked before final bibliography completion.

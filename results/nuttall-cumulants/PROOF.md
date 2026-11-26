# Nuttall's conjecture

Status, 20 November 2026: complete proof of the full cumulant conjecture, with an independent internal mathematical review and a bounded primary-source prior-art audit recorded below. The argument is unconditional and uses no computation or Lean. It arose from the Riemann-hypothesis applications campaign. Internal review is not external peer review, and priority is not certified.

## 1. Exact target

Put
```math
 \Phi(t)=\sum_{n\ge1}
 \left(2\pi^2n^4e^{9t}-3\pi n^2e^{5t}\right)
 e^{-\pi n^2e^{4t}},\qquad t\ge0,
```
and define
```math
 \Psi_0=\Phi,\qquad
 \Psi_m(u)=\int_u^\infty\Psi_{m-1}(t)\,dt
 =\frac1{(m-1)!}\int_0^\infty v^{m-1}\Phi(u+v)\,dv
 \quad(m\ge1).
```
Write $`\epsilon_s=(-1)^{s(s-1)/2}`$.

Nuttall's Conjecture 1 in §4.5 of [N1] says that, for each integer $`r>1`$, there is an integer $`m(r)`$ for which the kernel
```math
 K_m(x,y)=\Psi_m(x+y),\qquad x,y\ge0,
```
is strictly sign-reverse regular through order $`r`$. Explicitly, for every $`1\le s\le r`$ and every two strictly increasing nonnegative lists $`x_1<\cdots<x_s`$, $`y_1<\cdots<y_s`$,
```math
 \epsilon_s\det[\Psi_m(x_i+y_j)]_{i,j=1}^s>0.                 \tag{1}
```
The existence of a least such integer then follows from well-ordering. We prove the strict determinant conclusion (1) for **every sufficiently large integer $`m`$**, with the threshold depending only on $`r`$. The eventual-all-$`m`$ quantifier is not claimed as a new strengthening: [N1, Remark 4.1] already propagates a successful cumulant order to every larger order. The proof below gives that conclusion directly with strict signs.

This is different from the positivity of every Toeplitz determinant of the normalized even moments of $`\Phi`$. That latter condition is equivalent to RH; the cumulant conjecture by itself does not establish it. Nuttall states the remaining gap explicitly in [N1, §§1.5, 4.6].

## 2. A determinant sign criterion

For a smooth real function $`f`$, define
```math
 \tau_s(f;t)=\det[f^{(i+j)}(t)]_{i,j=0}^{s-1},\qquad \tau_0=1.
```

We use the following standard extended-Chebyshev criterion, also underlying [N1, Lemma 2.1].

**Lemma.** If all initial Wronskians of $`f_0,\ldots,f_{r-1}`$ are nonzero throughout an interval, then for $`s\le r`$ the determinant
```math
 \det[f_{j-1}(t_i)]_{i,j=1}^s,\qquad t_1<\cdots\lt t_s,
```
never vanishes, and its sign is the sign of the initial Wronskian of order $`s`$.

For completeness, this follows by induction from Rolle's theorem. Divide a linear combination by the nowhere-zero first function. Differentiation reduces the number of functions by one; the initial Wronskians of the resulting derivative system are the original initial Wronskians divided by nonzero powers of the first function. A nonzero combination consequently has at most $`s-1`$ zeros, with multiplicities. The evaluation determinant is therefore nonzero. Its sign is constant on the connected ordered-node domain; coalescing the nodes identifies that sign with the Wronskian, since the Vandermonde and the factorial factors are positive.

Two consequences will be used.

1. If $`\epsilon_s\tau_s(f;t)>0`$ for $`s\le r`$ and $`t\ge U`$, then
```math
 \epsilon_s\det[f^{(j-1)}(t_i)]_{i,j=1}^s>0
 \quad(U\le t_1<\cdots\lt t_s).                              \tag{2}
```
Here the functions are $`f,f',\ldots,f^{(s-1)}`$.

2. If the same Wronskian signs hold for a function $`g`$ on all $`t\ge0`$, then $`g(x+y)`$ satisfies (1). Indeed, first use (2) to establish that every initial Wronskian of the functions $`y\mapsto g(x_i+y)`$ is nonzero with the required sign, then apply the lemma again to the ordered $`y`$-nodes.

Thus it suffices to establish
```math
 \epsilon_s\tau_s(\Psi_m;u)>0
 \quad(u\ge0,\ 1\le s\le r)                               \tag{3}
```
for every sufficiently large $`m`$.

## 3. Eventual signs for the theta kernel

Set $`y=\pi e^{4t}`$, $`a=9/4`$, and
```math
 F_0(t)=2\pi^{-1/4}y^a e^{-y}.
```
The first theta summand gives
```math
 \Phi(t)=F_0(t)
 \left(1-\frac{3}{2y}
 +\sum_{n\ge2}\left(n^4-\frac{3n^2}{2y}\right)
 e^{-(n^2-1)y}\right).                                  \tag{4}
```
For each fixed derivative order, the tail in parentheses and its derivatives with respect to $`t`$ are bounded by a polynomial in $`y`$ times $`e^{-3y}`$. Termwise differentiation is justified by uniform absolute convergence for $`y\ge\pi`$. In particular, (4) has a differentiable asymptotic expansion in powers of $`1/y`$, with exponentially small remainder.

For each fixed $`s\ge1`$,
```math
 \tau_s(\Phi;t)
 =\epsilon_s c_s F_0(t)^s y^{s(s-1)/2}
       \left(1+O_s(y^{-1})\right),                       \tag{5}
```
where
```math
 c_s=16^{s(s-1)/2}\prod_{j=0}^{s-1}j!>0.
```
The remainder in (5) can be differentiated any fixed number of times using $`d/dt=4y\,d/dy`$, and remains $`O_s(y^{-1})`$.

Here is a short proof. The Hankel-Wronskian identity gives
```math
 \tau_{s+1}\tau_{s-1}
 =\tau_s\tau_s''-(\tau_s')^2
 =\tau_s^2(\log|\tau_s|)''.                             \tag{6}
```
The case $`s=1`$ is (4). If (5) holds through $`s`$, then
```math
 (\log|\tau_s|)''
 =-16s\,y+O_s(y^{-1}).
```
Substituting in (6) proves (5) at $`s+1`$, since
```math
 c_{s+1}=16s\,c_s^2/c_{s-1},
 \qquad
 2\binom{s}{2}+1-\binom{s-1}{2}=\binom{s+1}{2}.
```
The asymptotic-expansion class is preserved by the finite products, quotients with nonzero leading term, and differentiations in this induction.

Fix $`r`$. It follows that there is $`U\ge1`$, depending only on $`r`$, such that
```math
 \epsilon_s\tau_s(\Phi;t)>0
 \quad(t\ge U,\ 1\le s\le r).                            \tag{7}
```
By (2), all the corresponding derivative-evaluation determinants have the correct sign when all their arguments are at least $`U`$.

We will also need a crude global bound. For any fixed $`r`$, there is $`C_r`$ such that
```math
 \max_{0\le j\le r-1}|\Phi^{(j)}(t)|
 \le C_r e^{-e^{2t}}\qquad(t\ge0).                       \tag{8}
```
The differentiated theta series proves this for large $`t`$, since its decay is exponential in $`e^{4t}`$. Increasing $`C_r`$ covers the remaining compact interval.

## 4. Exact integral for cumulant Wronskians

Fix $`s\le r`$, and take an integer $`m\ge s`$. Repeated integration by parts gives, for $`0\le i,j<s`$,
```math
 \Psi_m^{(i+j)}(u)
 =\frac{(-1)^i}{(m-i-1)!}
   \int_0^\infty v^{m-i-1}\Phi^{(j)}(u+v)\,dv.
```
All boundary terms vanish: at zero the relevant polynomial power is positive before each integration by parts, and at infinity (8) applies.

Let
```math
 V(v_1,\ldots,v_s)=\prod_{1\le i\lt j\le s}(v_j-v_i).
```
Andreief's determinant identity now gives
```math
 \tau_s(\Psi_m;u)
 =
 \frac{1}{s!\prod_{i=0}^{s-1}(m-i-1)!}
 \int_{[0,\infty)^s}
 \left(\prod_{i=1}^s v_i^{m-s}\right)
 V(v)\,
 \det[\Phi^{(j-1)}(u+v_i)]_{i,j=1}^s\,dv.               \tag{9}
```
There is no omitted sign in (9). The row factors $`(-1)^i`$ contribute $`\epsilon_s`$; reversing the descending powers in
```math
 \det[v_k^{m-i-1}]_{i=0,\ldots,s-1;\,k=1,\ldots,s}
 =\epsilon_s\left(\prod_k v_k^{m-s}\right)V(v)
```
contributes the second $`\epsilon_s`$.

The integrand is symmetric under permutations of the $`v_i`$, because both determinants change sign. If all $`u+v_i\ge U`$ and the $`v_i`$ are distinct, (2) shows that its sign is $`\epsilon_s`$.

For $`u\ge U`$, this already proves
```math
 \epsilon_s\tau_s(\Psi_m;u)>0\qquad(m\ge s).              \tag{10}
```
It remains to handle $`0\le u\le U`$, uniformly.

## 5. Uniform upper bound on the possibly negative part

Put
```math
 B=\{v\in[0,\infty)^s:\min_i v_i\lt U\}.
```
Outside $`B`$ the signed integrand in (9) is positive, regardless of $`u\ge0`$. By the determinant expansion, (8), and
```math
 |V(v)|\le\prod_i(1+v_i)^{s-1},
```
the absolute integral over $`B`$, before the common positive factorial prefactor, is at most
```math
 C_s U^m\,M_m^{\,s-1},                                 \tag{11}
```
uniformly for $`0\le u\le U`$, where
```math
 M_m=\int_0^\infty v^{m-s}(1+v)^{s-1}e^{-e^{2v}}\,dv.
```
Here $`U\ge1`$; constants depending on $`U,s`$ absorb the bounded-variable integral and the finite union over which variable is below $`U`$.

For all sufficiently large $`m`$,
```math
 M_m\le C_s(2\log m)^m.                                \tag{12}
```
To check (12), split at $`v=\log m`$. Below that point,
```math
 v^{m-s}(1+v)^{s-1}\le(1+\log m)^{m-1},
```
so integration gives at most $`(1+\log m)^m`$. Above it, for large $`m`$,
```math
 m\log(1+v)\le\tfrac12e^{2v}.
```
The latter inequality holds at $`v=\log m`$, and its right-to-left ratio increases thereafter. The remaining tail is at most
```math
 \int_{\log m}^\infty e^{-e^{2v}/2}\,dv\le1.
```
This proves the claimed bound.

## 6. A positive part that dominates uniformly

Set
```math
 w_m=\tfrac18\log m.
```
Choose fixed disjoint intervals
```math
 I_i=[2i,\,2i+\tfrac12],\qquad 1\le i\le s,
```
and restrict (9) to the ordered box
```math
 v_i\in w_m+I_i.                                       \tag{13}
```
For large $`m`$, this box is disjoint from $`B`$. Its volume and the lower bound for $`V(v)`$ are positive constants depending only on $`s`$.

For $`0\le u\le U`$, put
```math
 y_i=\pi e^{4(u+v_i)}
     =\pi e^{4u}\sqrt m\,e^{4(v_i-w_m)}.
```
Uniformly for $`u\in[0,U]`$ and throughout the box, there are constants $`0<c_{s,U}<C_{s,U}`$ such that
```math
 c_{s,U}\sqrt m\le y_i\le C_{s,U}\sqrt m,\qquad
 y_j-y_i\ge c_{s,U}\sqrt m\quad(i\lt j).
```
Indeed,
```math
 y_j-y_i
 =\pi e^{4u}\sqrt m
 \left(e^{4(v_j-w_m)}-e^{4(v_i-w_m)}\right),
```
and the chosen intervals $`I_i`$ are separated. The same $`u`$ occurs in every $`y_i`$; no global disjointness assertion for their ranges as $`u`$ varies is needed. From (4), for $`0\le j<s`$,
```math
 \frac{\Phi^{(j)}(u+v_i)}{\Phi(u+v_i)}
 =(-4y_i)^j+O_s(y_i^{j-1}),                            \tag{14}
```
where for $`j=0`$ the ratio is exactly $`1`$. Expanding the finite determinant, the leading term in (14) is a Vandermonde:
```math
 \epsilon_s
 \det[\Phi^{(j-1)}(u+v_i)]_{i,j=1}^s
 \ge c_{s,U}
      \left(\prod_i\Phi(u+v_i)\right)
      m^{s(s-1)/4}                                   \tag{15}
```
for all sufficiently large $`m`$, uniformly in the entire box and in $`u\in[0,U]`$. Indeed, after extracting the row factors, the leading determinant is
```math
 (-4)^{s(s-1)/2}\prod_{i\lt j}(y_j-y_i);
```
the remainder is smaller by $`O_{s,U}(m^{-1/2})`$.

Again by (4), uniformly on (13),
```math
 \prod_i\Phi(u+v_i)\ge c_{s,U}e^{-C_{s,U}\sqrt m}.       \tag{16}
```
The polynomial factors in $`y_i`$ are positive and may be discarded from this lower bound for large $`m`$.

Since every $`v_i\ge w_m`$, equations (13)–(16) show that the signed integral over this positive box is at least
```math
 c_{s,U}w_m^{s(m-s)}e^{-C_{s,U}\sqrt m}.                \tag{17}
```
We have discarded another positive factor $`m^{s(s-1)/4}`$, which is unnecessary.

Divide the bound (11), using (12), by (17). The quotient is at most
```math
 C_{s,U}(\log m)^{s^2}
 e^{C_{s,U}\sqrt m}
 \left(\frac{U\,2^{s-1}8^s}{\log m}\right)^m,
                                                                  \tag{18}
```
which tends to zero. Its logarithm is
```math
 -m\log\log m+O_{s,U}(m)+O_{s,U}(\sqrt m)
   +O_s(\log\log m)\longrightarrow-\infty.
```
Thus the positive box dominates the entire possibly negative contribution, uniformly for $`u\in[0,U]`$. The rest of the integral is nonnegative. This proves
```math
 \epsilon_s\tau_s(\Psi_m;u)>0
 \quad(0\le u\le U)
```
for every sufficiently large integer $`m`$.

Combined with (10), this establishes (3) for the chosen $`s`$. Taking the maximum of the finitely many thresholds for $`1\le s\le r`$, and applying the criterion of §2, proves (1) for every sufficiently large $`m`$. This completes the proof of Nuttall's full cumulant conjecture.

## 7. Scope and relation to the RH campaign

The argument uses the precise theta-kernel tail, determinant identities, and real-variable estimates. It does not assume RH, Dirichlet GRH, simplicity of zeta zeros, or any numerical certificate.

No claim that the original kernel $`\Phi(x+y)`$ is reverse regular of every order is made. Its failure at sufficiently high orders is precisely why Nuttall introduced the repeated-tail cumulants. The threshold $`m(r)`$ can grow with $`r`$; this proof gives existence, not the small thresholds that would be needed to eliminate the separate low-index Toeplitz-determinant gap in an RH proof.

The full statement is quantified over every order and every pair of ordered nonnegative node sets. It is not a finite-order verification or an improvement of a numerical threshold. The seven additional Conrey–Ghosh kernels are not being counted as seven new conjectures.

## 8. Prior-art audit

The following primary sources were inspected on 20 November 2026.

- [N1] John Nuttall, *Wronskians, Cumulants, and the Riemann Hypothesis*, Constructive Approximation 38 (2013), 193–208, DOI [10.1007/s00365-013-9200-8](https://doi.org/10.1007/s00365-013-9200-8). [Author manuscript](https://publish.uwo.ca/~jnuttall/det3CAEXP_2.pdf). The full target is Conjecture 1, §4.5. Lemma 2.1 provides the underlying Wronskian criterion; §4.6 identifies the remaining RH gap.
- [N2] John Nuttall, *Wronskians and the Riemann Hypothesis*, August 2012. [Author manuscript](https://publish.uwo.ca/~jnuttall/wronskRH.pdf). It studies the first theta summand and describes the full cumulant assertion as a remaining task.
- [N3] John Nuttall, *Cumulants, the Riemann Hypothesis, and Similar Problems*. [Author manuscript](https://publish.uwo.ca/~jnuttall/cumanal_a.pdf). Its Theorem 5.6 proves the analogous assertion for one Conrey–Ghosh kernel $`\Theta_1`$. Its introduction explicitly treats extension to the Riemann theta kernel as prospective. Its determinant-integral and first-summand dominance strategy are close prior art; no claim to have invented those ingredients is made.
- [N4] [Author's current publication index](https://publish.uwo.ca/~jnuttall/index.html), sections 2.1.14–2.1.16. It identifies the later proof as covering one Conrey–Ghosh case.

- [N5] Karlheinz Gröchenig, *Schoenberg's Theory of Totally Positive Functions and the Riemann Zeta Function*, [arXiv:2007.12889](https://arxiv.org/pdf/2007.12889), published 2023, DOI [10.1007/978-3-031-41130-4_9](https://doi.org/10.1007/978-3-031-41130-4_9). Its citation to Nuttall concerns the Taylor-coefficient Toeplitz criterion. Its reciprocal-$`\Xi`$ and inverse-Laplace characterization does not assert eventual reverse regularity of the repeated tail integrals.
- [N6] Karlheinz Gröchenig, *Infinite totally positive matrices: some open problems*, 17 August 2026, DOI [10.1007/s44146-026-00264-3](https://link.springer.com/article/10.1007/s44146-026-00264-3). Its questions concern variation diminution and invertibility of matrices already assumed totally positive; this does not supply the sign-regularity assertion proved here.
- [N7] Jaume de Dios Pont, Karlheinz Gröchenig, Lukas Liehr, Irina Shafkulovska and Mitchell A. Taylor, *Gabor Frames of Totally Positive Functions: A Complete Characterization*, [arXiv:2608.04992](https://arxiv.org/abs/2608.04992). Its frame-set result assumes total positivity of the generating function. It does not establish the cumulant conjecture.
- [N8] Bao-Xuan Zhu, *Coefficientwise Hankel-total positivity from a universal cumulant lifting*, [arXiv:2611.01172](https://arxiv.org/abs/2611.01172). The term “cumulant” there means probabilistic logarithmic cumulants of moment sequences. It is not the repeated tail integration in the present problem.

The two collaborating audit lanes queried both search engines with the exact author, title, conjecture, cumulant, sign-regularity and $`RR_r`$ terms; compared the original manuscripts and author followups; checked later citing papers and 2025–2026 results; and searched the public OpenAI/math and qqliu/CoPEER research inventories. The full-text comparison of [N1]–[N5] distinguishes the Riemann kernel from the one Conrey–Ghosh case. The scope checks [N6]–[N8] address possible subsumption by more general recent total-positivity results.

No full earlier proof of the exact assertion for $`\Phi`$ was located in the inspected sources. That is bounded negative search evidence, not proof of priority or a guarantee that no unindexed result exists. The determinant identities, extended-Chebyshev criterion, first-summand asymptotics and dominance strategy are established ingredients. The proof's claimed contribution is their uniform combination for all $`u\ge0`$ in the full Riemann-kernel cumulant assertion.

## 9. Independent review

The root research agent independently checked the exact target against [N1, §4.5] and reviewed the complete proof in [issue #121, review comment](https://github.com/1337isnot1337/solved-conjectures/issues/121#issuecomment-7049681840). The review checked:

- all initial Wronskians in both applications of the extended-Chebyshev criterion;
- the differentiable asymptotic expansion and the Sylvester identity;
- both sign cancellations in the Andreief formula;
- the compact-$`u`$ bad-region bound and the separated-box lower bound;
- the ratio in (18), the all-$`u`$ conclusion and the quantifier “every sufficiently large $`m`$”;
- the distinction between this full conjecture and the separate RH-equivalent Toeplitz positivity problem.

The reviewer requested one wording correction: the ranges of $`y_i/\sqrt m`$, as the common $`u`$ varies, need not be globally disjoint. The required uniform pairwise separation is valid and is now stated directly in §6. This correction was committed in [871c019](https://github.com/1337isnot1337/solved-conjectures/commit/871c01965c916034cb4d549f0d926cb1f4024d39). No other proof defect was found in that review.

The first complete draft was committed in [4dcac9d](https://github.com/1337isnot1337/solved-conjectures/commit/4dcac9dba3b2933c481e8c3f98ccbb0a97619892). Discussion and subsequent checks are recorded in [issue #121](https://github.com/1337isnot1337/solved-conjectures/issues/121). This is an internal review record, not a claim of external peer review or formal verification.

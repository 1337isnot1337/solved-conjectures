# Karlin's conjecture

## Status

**Excluded from the new-resolution count.** The name has been used for different determinant statements. The classical general conjecture was already disproved; the Riemann-Xi coefficient condition is an established RH equivalence. This audit records the distinction so neither is promoted by name alone.

## 1. Classical Hankel statement: already disproved

Csordas–Dimitrov, *Conjectures and theorems in the theory of entire functions*, §1, state Karlin's conjecture as follows. For

```math
\phi(x)=\sum_{k\ge0}\gamma_k x^k/k!\in\mathcal{LP},
\qquad \gamma_k\ge0,
```

and

```math
H_m(f;x)=\det(f^{(i+j)}(x))_{i,j=0}^{m-1},
```

the proposed conclusion is

```math
(-1)^{m(m-1)/2}H_m(\phi^{(q)};x)\ge0
\qquad(q\ge0,\ m\ge2,\ x\ge0).
\tag{1}
```

Immediately after equation (1.4), the authors report independent counterexamples by Dimitrov and Craven–Csordas. This is positive prior-resolution evidence, not an inference from search silence.

Craven–Csordas later published *Karlin's conjecture and a question of Pólya*, Rocky Mountain Journal of Mathematics 35 (2005), 61–82, DOI 10.1216/RMJM/1181069768. Its abstract explicitly states that counterexamples are supplied; Example 3.1 uses $`x^3(x+1)^5`$ and a negative fifth-order Wronskian near zero. No new counterexample is claimed here.

## 2. Xi Toeplitz condition: a different classical criterion

For the Xi-associated coefficient sequence $`\beta_n`$, let

```math
B_{ij}=
\begin{cases}
\beta_{j-i},&j\ge i,
\\ 0,&j\lt i,
\end{cases}
\qquad
D(n,r)=\det(B_{i,j+n})_{i,j=1}^{r}.
```

Nuttall's *Determinantal inequalities and the Riemann hypothesis*, §1.2, equations (1.4)–(1.6), explicitly records

```math
\mathrm{RH}
\iff D(n,r)>0
\quad(n\ge0,\ r\ge1).
\tag{2}
```

He attributes the criterion to the relevant results in Karlin's *Total Positivity*, rather than presenting it as a new conditional implication.

Thus the accepted RH premise does supply the Xi determinant condition (2). That deduction would apply an established equivalence. It neither proves the already false general statement (1) nor supplies a new campaign-developed argument. The two matrices also differ: (1) is a Hankel matrix of derivatives; (2) is a Toeplitz matrix of coefficients.

The 2024 Wang–Yang manuscript's terminology around Xi determinant positivity does not override these exact statements or their prior history.

## 3. Audit and disposition

Primary sources inspected on 20 November 2026:

- [Csordas–Dimitrov author manuscript](https://www.dcce.ibilce.unesp.br/~dimitrov/papers/varga.pdf), §1, especially equation (1.4) and the following paragraph.
- [Author-hosted abstract](https://www.dcce.ibilce.unesp.br/~dimitrov/zeros/absascii/p0007.html), which also describes the earlier resolution.
- [Craven–Csordas published article](https://doi.org/10.1216/RMJM/1181069768); accessible [author-uploaded full text](https://www.academia.edu/19018058/Karlins_Conjecure_and_a_Question_of_P%C3%B3lya), including the abstract and Example 3.1.
- [Nuttall author manuscript](https://publish.uwo.ca/~jnuttall/DET3.pdf), first page, §1.2.
- [Wang–Yang author manuscript](https://cfc.nankai.edu.cn/_upload/article/files/81/18/f83d37e449ebaf1b2f4141fa59be/9323c2fc-4d6a-4610-a747-1bd985a7be41.pdf), introduction.

Both search engines were used for the exact name, Hankel/Wronskian counterexamples, Xi Toeplitz determinants, and the relevant titles. Here the exclusion rests on located primary statements, so an exhaustive negative search is unnecessary.

**Disposition:** no new issue claiming a resolution, no added target count, and no modification of the separate [Nuttall conjecture proof](nuttall.md). Nuttall's tail-cumulant assertion is a different target.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80), including comment 7050776144.

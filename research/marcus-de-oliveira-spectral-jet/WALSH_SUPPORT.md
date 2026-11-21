# A support obstruction to common compound weights

Research continuation for [Marcus–de Oliveira’s conjecture, issue 57](https://github.com/1337isnot1337/solved-conjectures/issues/57), 21 November 2026. The root lane supplied the Walsh support argument; the algebra lane checked it and derived the quantitative forbidden-pair bound below. These are obstructions to a stronger proof method, not a proof or counterexample to Marcus–de Oliveira. No priority claim is made.

## 1. The stronger common-weight requirement

For a unitary matrix `U` of order `N`, a spectrum-independent permutation representation would in particular require nonnegative weights `w_pi` summing to one such that

```math
|\det U[I,J]|^2
=\sum_\pi w_\pi\,1_{\{\pi(I)=J\}}
\qquad(|I|=|J|=2).
\tag{1}
```

The analogous requirement simultaneously for every minor size is the stronger Merikoski–Virtanen coupling, already disproved by Drury. Marcus–de Oliveira permits its convex weights to depend on the spectra, so failure of (1) does not refute it.

Let `N=2^m` and index rows and columns by `F_2^m`. Use the real orthogonal Walsh matrix

```math
U_{r,c}=N^{-1/2}(-1)^{r\cdot c}.
```

For distinct rows `r,s` and distinct columns `c,d`, direct expansion gives

```math
\det U[\{r,s\},\{c,d\}]=0
\quad\Longleftrightarrow\quad
(r+s)\cdot(c+d)=0\quad\text{in }\mathbb F_2.
\tag{2}
```

Every nonzero such minor has squared modulus `4/N^2`. Because every summand on the right of (1) is nonnegative, any permutation given positive weight must avoid every zero minor. It would therefore have to satisfy

```math
(r+s)\cdot(\pi(r)+\pi(s))=1
\qquad(r\ne s).
\tag{3}
```

## 2. No support-compatible permutation for m at least four

Translate every value of `pi` by `pi(0)`, which preserves (3), to arrange `pi(0)=0`. Taking `s=0` gives `r dot pi(r)=1` for every nonzero `r`. Subtracting those two diagonal relations from (3), in characteristic two, gives

```math
r\cdot\pi(s)+s\cdot\pi(r)=1
\qquad(r,s\ne0, r\ne s).
```

Let `X,Y` be the `(N-1)`-by-`m` binary matrices whose rows are the nonzero `r` and their `pi(r)`, respectively. Thus

```math
XY^T+YX^T=J_{N-1}+I_{N-1}
\quad\text{over }\mathbb F_2.
\tag{4}
```

The left side has rank at most `2m`. The matrix on the right has rank `N-2`: because `N-1` is odd, its kernel consists precisely of the constant vectors. Equation (4) is impossible when `N-2>2m`, which holds for every `m>=4`.

Hence no permutation can receive positive weight in (1), contradicting normalization. This proves the stated obstruction for the entire Walsh family of orders `2^m`, `m>=4`.

## 3. A quantitative separating functional

Call a row pair forbidden for `pi` when the left side of (3) is zero. Let `b(pi)` be the number of forbidden unordered row pairs. One has the stronger estimate

```math
b(\pi)\ge k_m:=\frac{N-2m-2}{2}
\qquad(m\ge4).
\tag{5}
```

To prove it, work now on all `N` rows, without translating `pi`. Let `X,Y` have rows `r,pi(r)`, and set `c_r=r dot pi(r)`. Define the binary matrix

```math
D=c\mathbf1^T+\mathbf1c^T+XY^T+YX^T.
```

It has rank at most `2m+2`, zero diagonal, and entries

```math
D_{rs}=(r+s)\cdot(\pi(r)+\pi(s)).
```

Therefore `E=D+(J_N+I_N)` is the adjacency matrix of the forbidden-pair graph. Since `N` is even, `J_N^2=0` over `F_2`, so `(I_N+J_N)^2=I_N`. In particular `J_N+I_N` has full rank `N`. The rank inequality implies

```math
\mathop{\mathrm{rank}}E\ge N-2m-2.
```

Each undirected edge contributes a matrix of rank two, so `rank(E)<=2 b(pi)`. This proves (5). For order 16 the bound gives at least three forbidden pairs for every permutation; no enumeration is used.

Let `Z` be the collection of pairs `(I,J)` of two-element subsets for which the Walsh minor vanishes, and define a linear functional on second-compound arrays by

```math
\Phi(V)=\sum_{(I,J)\in Z}V(I,J).
```

The Walsh squared-minor array has `Phi=0`. Every permutation feature array has `Phi=b(pi)>=k_m>0`. Thus `Phi` is an explicit strict separating functional for this stronger convex hull.

If a signed common representation of these features is used instead, its total negative mass `nu` must satisfy

```math
\nu\ge\frac{k_m}{\binom N2-k_m}.
\tag{6}
```

Indeed, positive coefficients have total mass `1+nu`, negative coefficients have total absolute mass `nu`, and the functional values lie between `k_m` and `binom(N,2)`. Therefore `0=Phi(V)>=k_m(1+nu)-binom(N,2)nu`. This is a bound on representations, not a distance of an actual determinant from its spectral hull.

## 4. Why the spectral step is still missing

The determinant uses the coefficients `|det U[I,J]|^2` only through the special products

```math
F_U(a,b)=\sum_{|I|=|J|}a_{I^c}b_J|\det U[I,J]|^2.
```

The separating functional above assigns arbitrary zero-minor indicators to second-compound coordinates. It has not been expressed as the real part of one spectral evaluation, or as an exposed spectral derivative. It therefore cannot be substituted into the original conjecture.

There is a useful simplification of the previous spectral-derivative condition. Both `F_U` and every permutation product `p_pi` are homogeneous of degree `N`. Euler's identity gives, at a fixed real spectral base `x`,

```math
N F_U(x)=x\cdot\nabla F_U(x),\qquad
N p_\pi(x)=x\cdot\nabla p_\pi(x).
```

Consequently the joint value/gradient convex-hull condition in `SPECTRAL_JET.md` is equivalent to

```math
\nabla F_U(x)\in
\mathop{\mathrm{conv}}\{\nabla p_\pi(x):\pi\in S_N\}.
\tag{7}
```

A separating functional `a F_U+v dot grad(F_U)` can be replaced by the gradient functional `(v+a x/N) dot grad(F_U)`. Its determinant term is redundant, not an additional degree of freedom. The unresolved question is whether actual real spectra and a weighted adjugate trace can expose the compound support incompatibility. No such spectra or separator have been obtained here.

## 5. Prior scope checked

- Drury, [*A counterexample to a question of Merikoski and Virtanen on the compounds of unitary matrices*](https://doi.org/10.1016/0024-3795(92)90296-M), *Linear Algebra and its Applications* 168 (1992), 251–257, already disproves the stronger general coupling. The publisher's primary abstract was checked; the complete original paper was not retrieved in this pass. Its established negative result is not new here.
- Drury, [*The determinantal conjecture and Hadamard type inequalities*](https://doi.org/10.1016/0024-3795(94)00361-0), *Linear Algebra and its Applications* 246 (1996), 279–297, explicitly studies how to recover spectral information despite the failure of common compound weights. The primary abstract was checked; no full-paper novelty comparison is asserted.
- The full primary manuscript [Sidney Holden, *A fourteen-term identity and a sharp orthogonal obstruction bound*](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/eb7c9d64f91757a82fbe9167e80ab9c1b7f36c22/references/holden-mi05-2026-09-13/report.tex), dated 13 September 2026, was read. It provides signed representations for order-four unitaries and explicitly leaves the spectral closure open. Its common-weight obstruction is not an MDO counterexample, and neither is the Walsh obstruction above.
- Searches with both web engines for Walsh/Hadamard matrices, second compounds, permutation support and the Merikoski–Virtanen coupling found no exact source for this Walsh-family argument. This bounded search does not establish priority. The note is retained without a novelty claim.

The scope remains research toward the unrestricted named conjecture. There is no result registration, numerical size-case claim, or formal verification.

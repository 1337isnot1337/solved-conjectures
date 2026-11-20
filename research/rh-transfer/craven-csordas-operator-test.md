# Craven–Csordas

## Status

**Excluded from the unresolved-conjecture count.** The literal operator-test implication in Craven–Csordas Problem 3.9 (2004), repeated as Csordas Open Problem 12 (2014), follows from an earlier published complex Laguerre criterion and the cosine–sine decomposition. The shifted-cosine proof below is a useful short derivation, but it does not establish an eligible new resolution under this project's prior-result rule.

This screening is unconditional. It uses neither the accepted Riemann hypothesis source nor Lean.

## 1. Exact target and conventions

For a real entire function \(h\), write
\[
L_1[h](x)=h'(x)^2-h(x)h''(x).
\]
The printed problem assumes that \(f\) is real entire of order less than two and that
\[
L_1[\varphi(tD)f](x)>0
\quad(x,t\in\mathbb R,\ t\ne0,\ \varphi\in\mathcal{LP}),
\tag{1}
\]
and asks whether \(f\in\mathcal{LP}\). Here \(D=d/dx\) and \(\mathcal{LP}\) is the Laguerre–Pólya class.

The quantifier is over all symbols, with no restriction to even symbols. Both primary versions have a strict inequality. The proof uses only nonzero trigonometric symbols, so it does not rely on a convention that includes the zero symbol in \(\mathcal{LP}\), which would make the literal strict premise impossible.

## 2. Why this target is excluded

Theorem 3.8 of the same 2004 survey states the earlier complex Laguerre criterion: if a nonzero real entire function has the form
\[
f(z)=e^{-\alpha z^2}f_1(z),\qquad \alpha\ge0,
\]
where \(f_1\) has genus zero or one, then
\[
f\in\mathcal{LP}
\quad\Longleftrightarrow\quad
|f'(z)|^2-\operatorname{Re}\!\left(f(z)\overline{f''(z)}\right)\ge0
\quad(z\in\mathbb C).
\tag{2}
\]
There is no horizontal-strip hypothesis in this theorem. The survey credits Csordas–Varga (1990), Theorem 2.10.

Every real entire function of order less than two has genus at most one, so it satisfies the growth hypothesis with \(\alpha=0\). For real \(t\), set
\[
A_t(x)=\cos(tD)f(x)=\operatorname{Re}f(x+it),\qquad
B_t(x)=\sin(tD)f(x)=\operatorname{Im}f(x+it).
\]
The Taylor series defining these particular operators converge for every entire \(f\). Direct expansion gives
\[
L_1[A_t](x)+L_1[B_t](x)
=
|f'(x+it)|^2-\operatorname{Re}\!\left(
f(x+it)\overline{f''(x+it)}
\right).
\tag{3}
\]
Both \(\cos z\) and \(\sin z\) belong to \(\mathcal{LP}\). Thus (1) makes the left side positive whenever \(t\ne0\). Continuity gives nonnegativity at \(t=0\). Criterion (2) then gives the full conclusion.

The decomposition (3), with a factor-four normalization, is also explicitly published in Csordas–Escassut (2005), Lemma 5.2, equation (5.12). Their Proposition 5.4 treats a strip-confined class, but that restriction is not needed for the algebraic identity or the earlier criterion (2).

This is a full-scope prior barrier, not a result restricted to finitely many zeros, a bounded strip, or a numerical case. The continued appearance of the question in 2014 does not remove that barrier. We therefore do not count a new result here.

## 3. Alternative direct proof retained for reuse

Assume only the subset of (1) consisting of
\[
\varphi_\theta(w)=\cos(w+\theta),\qquad \theta\in\mathbb R.
\]
Every such nonzero symbol is in \(\mathcal{LP}\): it is a real entire function of order one with only real zeros.

Suppose that \(f\) has a nonreal zero
\[
z_0=x_0+iy_0,\qquad y_0\ne0.
\]
Choose a real \(\theta\) with
\[
\operatorname{Re}\!\left(e^{i\theta}f'(z_0)\right)=0.
\]
Such a phase always exists; if \(f'(z_0)=0\), any phase works. The translated Taylor series gives the entire function
\[
h(z)=\varphi_\theta(y_0D)f(z)
=\frac{e^{i\theta}f(z+iy_0)+e^{-i\theta}f(z-iy_0)}2.
\]
Since \(f\) is real entire, \(f(\overline z)=\overline{f(z)}\), and hence
\[
h(x_0)=\operatorname{Re}\!\left(e^{i\theta}f(z_0)\right)=0,
\qquad
h'(x_0)=\operatorname{Re}\!\left(e^{i\theta}f'(z_0)\right)=0.
\]
Consequently \(L_1[h](x_0)=0\), contradicting (1). Thus all zeros of \(f\) are real.

The strict premise excludes \(f\equiv0\). Hadamard factorization for a real entire function of order less than two now expresses \(f\) as a real exponential of degree at most one times a genus-zero or genus-one canonical product over real zeros. This is the defining Laguerre–Pólya form. Therefore \(f\in\mathcal{LP}\).

The exclusion of nonreal zeros in this direct argument needs no growth assumption; the order restriction is used only for the final Laguerre–Pólya conclusion. This observation is not a separate target or count.

## 4. Distinct fixed-symbol question left open by these proofs

Csordas–Escassut (2005), Conjecture 3.5, asks for an implication involving only the fixed cosine symbol on their class \(\mathcal S(A)\). Neither proof above settles that question: (3) additionally uses the sine symbol, and the direct proof chooses the phase \(\theta\) from the putative zero and its derivative. The fixed-cosine assertion must not be conflated with the all-symbol assertion.

## 5. Source and review record

Sources were inspected through primary PDF text on 20 November 2026. No visual inspection is claimed.

1. T. Craven and G. Csordas, *Composition theorems, multiplier sequences and complex zero decreasing sequences* (2004), author PDF, Theorem 3.8, Problem 3.9 and reference 34. [Full primary source](https://math.hawaii.edu/~tom/mathfiles/czdssurvey.pdf).
2. G. Csordas, *Turán-type inequalities and the distribution of zeros of entire functions*, in *Number Theory, Analysis, and Combinatorics* (2014), Open Problem 12, printed page 30. [Publisher preview containing the chapter and problem](https://api.pageplace.de/preview/DT0400.9783110282429_A21596136/preview-9783110282429_A21596136.pdf).
3. G. Csordas and A. Escassut, *The Laguerre inequality and the distribution of zeros of entire functions*, Annales Mathématiques Blaise Pascal **12** (2005), 331–345, especially Conjecture 3.5, Lemma 5.2, equation (5.12), and Proposition 5.4. DOI: [10.5802/ambp.210](https://doi.org/10.5802/ambp.210). [Full primary PDF](https://www.numdam.org/item/10.5802/ambp.210.pdf).
4. G. Csordas and R. S. Varga, *Necessary and sufficient conditions and the Riemann hypothesis*, Advances in Applied Mathematics **11** (1990), 328–357, Theorem 2.10. The exact criterion was checked in its primary-author restatement as Theorem 3.8 in source 1; this note does not claim separate inspection of the full 1990 article.

The root, analytic and arithmetic workers independently checked the exact quantifiers, the full-scope criterion, identity (3), and the exclusion decision. No dedicated resolution issue was created. This note preserves the proof and prevents repeated rediscovery.

Independent analytic review and exclusion receipt: [issue 80, comment 7050810845](https://github.com/1337isnot1337/solved-conjectures/issues/80#issuecomment-7050810845). The reviewer also checked the indexed primary text of the original 1990 definition (2.66) and Theorem 2.10.

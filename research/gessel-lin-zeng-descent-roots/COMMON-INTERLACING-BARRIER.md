# A structural obstruction to the common-interlacing approach to Gessel–Lin–Zeng

[Gessel–Lin–Zeng, *Jacobi–Stirling polynomials and P-partitions*, Conjecture 15](https://people.brandeis.edu/~gessel/homepage/papers/Jac-Stir.pdf) asks for real-rootedness of the Jacobi–Stirling descent polynomials. We use the normalization of [Ma–Wang, Section 4](https://arxiv.org/html/2610.03111#S4), removing the common factor \(x\). For a set \(S\subseteq\{1,\ldots,k\}\) of labels whose barred letter has been deleted, let \(A_{k,S}\) be the resulting fixed-set descent polynomial. The original conjecture concerns the *particular equal-weight sum* \(\sum_{|S|=i}A_{k,S}\), not arbitrary nonnegative mixtures.

**Results.** The ordered zeros of \(A_{k,S}\) move to the right if a deleted barred label is moved to an earlier adjacent label. The existence of a common interlacer for all size-\(i\) deletion sets therefore reduces to the first-\(i\) and last-\(i\) deletions. There is no common interlacer for all sufficiently large \(k\) whenever \(i\ge6\) and \(k-i\ge4\). At \((k,i)=(13,7)\), an exact positive-weight counterexample is already available. These are obstructions to a proof strategy, not counterexamples to the original conjecture.

The relevant prior theorem is Ma–Wang Corollary 2: **all** nonzero nonnegative mixtures are real-rooted for \(i\in\{1,2,3,k-2,k-1\}\). The exact sources and indexed literature searches including MathDB and Hexagon did not locate an earlier general obstruction. No minimality or exclusive priority is claimed.

## 1. Insertion and root order

For the insertion operator
\[
 D_L f=(1+Lx)f+x(1-x)f',
\]
a deletion appends the single operation \(D_L\) and increases the current word length \(L\) by 2. Retaining a barred letter appends \(D_{L+1}D_L\) and increases the length by 3. This is Ma–Wang's recurrence: start with \(A_{0,\varnothing}=1\), process labels in increasing order, and write operators in composition order with the rightmost applied first. Apart from the initial \(D_0 1=1\), \(D_L\) has \(L>\deg f\). It strictly increases degree, has positive leading and constant coefficients, and strictly interlaces its real-negative-rooted input by evaluating at the input's negative roots and \(0\), with the leading sign at negative infinity.

At two adjacent labels with exactly one deletion, write \(h=D_L a\) after the first operation. Keeping and then deleting gives \(D_{L+3}F\), where \(F=D_{L+1}h\). Deleting and then keeping gives \(D_{L+3}G\), where \(G=D_{L+2}h=F+xh\). At each negative root \(u_j\) of \(G\), \(F(u_j)=-u_jh(u_j)\) has the sign of \(h(u_j)\), alternating in \(j\) because \(h\) strictly interlaces \(G\). At the smallest such \(u_j\) this sign is opposite to the leading sign of \(F\) at negative infinity. Therefore \(F\)'s first zero is below the first of \(G\), and its remaining zeros lie in the intervals between zeros of \(G\). The constant-input case uses the same signs.

More generally, this strict orientation between equal-degree \(F,G\) is preserved under a shared \(D_M\) with \(M>\deg F\). The partial fraction expansion of \(F/G\) has positive residues because \(F(u_j)\) and \(G'(u_j)\) have the same sign, so \((F/G)'<0\) away from poles when the degree is positive. At any negative root \(u\) of \(D_MG\), which is not a root of \(G\),
\[
 D_MF(u)=u(1-u)G(u)(F/G)'(u)
\]
has the sign of \(G(u)\). Evaluating at all these zeros and at negative infinity again proves the same orientation. This applies to \(D_{L+3}\) and every shared suffix operation. Thus an earlier adjacent deletion moves each root strictly to the right. The two extremal deletion sets give the coordinatewise minimum and maximum of the increasing zero lists, respectively the last-\(i\) and first-\(i\) sets.

For a family of degree \(d\), a common weak interlacer exists exactly when the intervals \([\max_S r_j(S),\min_S r_{j+1}(S)]\) are nonempty for every \(j=1,\ldots,d-1\), where \(r_j(S)\) is the \(j\)-th zero in increasing order. In this case selecting a point from each interval gives the interlacer, since intervals are ordered. This criterion, and hence common interlacing, reduces to the two extreme sets.

## 2. Means separate the extremes

For such a nonconstant polynomial \(p\) write \(\mu(p)=p'(1)/p(1)=\sum_j(1-r_j)^{-1}\), its mean descent exponent after normalization at 1. Let \(f\) correspond to the late deletions and \(g\) to the early ones. If the extremes have a common interlacer, then \(r_j(f)\le r_j(g)\le r_{j+1}(f)\) for \(j<d\), together with \(r_d(f)\le r_d(g)<0\). The increasing function \(x\mapsto(1-x)^{-1}\) and telescoping therefore give \(0\le\mu(g)-\mu(f)<1\).

Differentiating the insertion identity gives
\[
 \mu(D_Lp)=\frac{L}{L+1}\bigl(\mu(p)+1\bigr).
\]
A delete step \(L\mapsto L+2\) contracts deviation from the affine baseline \((L-2)/3\) by \(L/(L+1)\). A keep step \(L\mapsto L+3\) contracts deviation from \(2L/5-7/10\) by \(L/(L+2)\), by applying the displayed identity twice. The first step starts at \(L=0\), so all-keep and all-delete prefixes are exactly on their respective baselines.

Set \(U=2i\), \(T=3(k-i)\), \(N=U+T\). For a step size \(r\in\{2,3\}\) and \(c\in\{1,2\}\), the product along an arithmetic progression starting at \(L_0>0\) satisfies
\[
 \prod_{L=L_0,L_0+r,\ldots,N-r}\frac{L}{L+c}
  = (L_0/N)^{c/r}\bigl(1+O(1/L_0)\bigr).
\]
This follows by expansion of the logarithm, integral comparison for the reciprocal sum, and the summable \(L^{-2}\) error. The constants are absolute, independent of \(N/L_0\). First keeping until length \(T\) and then deleting gives
\(\mu(f)=N/3+(T/15)(T/N)^{1/2}+O(1)\).
First deleting until \(U\) and then keeping gives
\(\mu(g)=2N/5-(U/15)(U/N)^{2/3}+O(1)\).
With \(u=U/N,v=T/N\), subtract to find
\[
 \mu(g)-\mu(f)=\frac{N}{15}(1-v^{3/2}-u^{5/3})+O(1)
       \ \ge\ \frac{7Nuv}{90}+O(1).
\]
The inequality follows from the tangents at 1 for \(z^{1/2}\) and \(z^{2/3}\). Since \(Nuv\ge\tfrac12\min(U,T)\), this difference tends to infinity when both deletion and retention counts grow. In particular the entire common-interlacing approach fails throughout the interior-fraction regime.

For a fixed number \(i\) of deletions the long keep suffix on \(g\) loses the effect of any fixed prefix, so \(\mu(g)=2N/5-7/10+o(1)\). For \(f\), each of its last \(i\) deletions increases the mean by \((L-\mu)/(L+1)\to3/5\), whereas the keep baseline increases by \(4/5\) across two units of length. Thus the limiting gap is \(i/5\), greater than one for \(i\ge6\). Likewise with \(b=k-i\) fixed, \(f\)'s long delete run approaches its baseline; each of \(g\)'s final keeps gives an increment tending to \(4/3\) versus the delete baseline's increment 1 across three length units. The limiting gap is \(b/3\), greater than one for \(b\ge4\). If there were infinitely many exceptions with \(i\ge6,\ b\ge4\), a subsequence would either have both counts diverge or one fixed, contrary to these bounds.

By the same-degree common-interlacing equivalence [Marcus–Spielman–Srivastava, Lemma 4.5](https://cs-www.cs.yale.edu/homes/spielman/PAPERS/Marcus_Spielman_SrivastavaIFI.pdf), in these ranges some nonzero nonnegative mixture has nonreal zeros.

## 3. An exact finite separation

For \(k=13,i=7\), let \(f=A_{13,\{7,\ldots,13\}}\) and \(g=A_{13,\{1,\ldots,7\}}\). The [integer certificate](check.py) proves that \(234f+g\), of degree 18, has exactly 16 simple negative roots and one nonreal conjugate pair. The strictly positive weight mixture \(10^5(234f+g)+\sum_{|S|=7}A_{13,S}\) has the same root count. In contrast, the equal-weight sum itself has 18 simple negative roots at this parameter pair. This distinction is why neither the finite witness nor the large-parameter result disproves Conjecture 15.

# Every basis vector can attain the sharp small-norm order on \(\mathbb S^3\)

There is a real orthonormal Laplace eigenbasis on the round three-sphere such that **every** unit degree-\(k\) mode in that basis satisfies
\[
 \|u\|_1\asymp k^{-1/2}\qquad(k\ge1).
\]
Consequently that basis simultaneously has \(\|u\|_p\asymp k^{1/2-1/p}\) for all \(1\le p\le\infty\). For \(p<2\) this is the smallest possible order; for \(2<p\le4\) it is the largest possible order. For \(p>4\) it is the selected basis profile, not maximal Sogge growth. This strengthens the [log-free average result](LOG-FREE.md), not a separate conjecture claim. Here the modification is to match the packet width to the binomial variance in the holomorphic model.

## 1. A mirror-invariant partition with variable widths

Let \(m=k+1\), and let \(q\) be the largest nonnegative integer with \(2q(q+1)\le m\). Partition the first \(q^2\) indices using
\[
 I_h=\{h^2,\ldots,(h+1)^2-1\},\qquad 0\le h<q,
\]
mirror them at the opposite end, and put the middle indices in one block. The middle block has length \(m-2q^2\) in \([2q,6q+3]\), so it too has size comparable to \(\sqrt{k}\) for large \(k\). Consecutive lengths are comparable. Use a DCT-IV basis in each block, now with its own length \(B\) in the formula for \(\omega_l\). That formula is orthonormal for odd lengths as well.

At each boundary between two blocks, use the same paired rotations as in the log-free note, with transition half-width \(M=\lfloor\min(B_\mathrm{left},B_\mathrm{right})/3\rfloor\), omitting the transition if this is zero. The pairs are disjoint, and the transition half-width is reflection invariant. For any block of length \(B\) with two nonzero transitions, the resulting coefficient window is
\[
 W(r)=w((r+\tfrac12)/M_\mathrm{left})
       w((B-r-\tfrac12)/M_\mathrm{right}).
\]
As before, this is exactly the coefficient window, by the cosine's even left and odd right reflection. Each factor equals one when the other is in its nonconstant support except possibly near that factor's own transition, because \(M_\mathrm{left}+M_\mathrm{right}\le2B/3\). The first and second discrete differences are \(O(B^{-1})\) and \(O(B^{-2})\) because nonzero neighboring transition widths are comparable to \(B\). The antiunitary \(J\) permutes the whole basis up to phases: the cosine reflection and sign identity holds for any \(B\), including the central block, and the paired rotations commute with \(J\) exactly as before.

Fix a sufficiently large constant \(h_0\). For the first and last \(h_0\) blocks, the resulting packets are supported on only boundedly many monomial indices at their respective ends, even after the paired rotations. For fixed \(j\), direct integration yields
\[
 \|F_j\|_1
    = \sqrt{(k+1)\binom{k}{j}}\,
        B\!\left(\frac j2+1,\frac{k-j}2+1\right)=O_j(k^{-1/2}).
\]
This uses the standard beta asymptotic with fixed first argument and second argument of order \(k\), and also applies with \(k-j\) fixed by symmetry. The triangle inequality and the unit Euclidean norm of the coefficient vectors give the same uniform bound for all the finitely many edge packets.

## 2. The adapted norm bound for each packet

Consider another block in the lower half with index \(h\ge h_0\), and put \(\sigma=h^2/k\); for the middle block use \(\sigma=1\). Upper-half blocks are obtained by reflection. Every involved \(s=j/k\), including the index support of the window enlarged by two indices, satisfies \(s\asymp\sigma\), \(1-s\gtrsim1\), and
\[
 B\asymp\sqrt{k\sigma}.
\]
Let \(J_I\) be the interval hull of that enlarged support divided by \(k\). In the estimates (2) of the log-free note, we may use the following sharper envelope, with fixed constants \(C_0,C_1,c>0\):
\[
 \mathcal E(t)=C_0 k^{1/4}\sigma^{-1/4}
 \begin{cases}
  \exp[-c k\,\operatorname{dist}(t,J_I)^2/\sigma],& t\le C_1\sigma,\\
  \exp[-c k t],&t>C_1\sigma.
 \end{cases}
\tag{1}
\]
Indeed for \(t\le C_1\sigma\), the bound
\(D(s\Vert t)\ge (s-t)^2/(2\max(s,t))\) applies with denominator \(O(\sigma)\). If \(t\) is close to \(s\) in the sense of Section 2 of the log-free proof, the same ratio estimates absorb one and two differences, keeping the exponent with this denominator. Otherwise, for all adjacent indices the distance is at least \(c\sigma\); choosing \(h_0\) large ensures \(2/k\ll\sigma\). This gives the additional factor \(\exp(-c k\sigma)\) to absorb the inverse powers of \(k\sigma\). For \(t>C_1\sigma\) choose \(C_1\) sufficiently large that every adjacent \(s\le t/2\). The same entropy bound gives \(D(s\Vert t)\ge ct\) and hence supplies both the new far exponent and the inverse powers. In the middle block only the first line of (1) is used. The preceding arguments therefore yield (2) of the log-free note with \(\mathcal E\) as in (1).

The length of \(J_I\) is \(O(B/k)\). Integrating the two terms in (1), and using \(k\sigma\ge1\), gives
\[
 \int_0^1\mathcal E(t)\,dt
 \le C k^{1/4}\sigma^{-1/4}
       (B/k+\sqrt{\sigma/k}+k^{-1})
 \le Ck^{-1/4}\sigma^{1/4}.
\]
The finite-difference product estimate still gives \(S_0\le C B\mathcal E(t)\) and \(S_2\le C B\mathcal E(t)/(k\sigma)\), because now \(B^{-2}\asymp(k\sigma)^{-1}\). The same twice-summed Fourier bound then gives angular \(L^1\) at most
\[
 C B^{-1/2}\sqrt{S_0S_2}
 \le C B^{-1/2}\mathcal E(t)
\]
using \(B\asymp\sqrt{k\sigma}\). Each packet, not merely their mean, therefore has \(L^1\) norm at most \(C B^{-1/2}k^{-1/4}\sigma^{1/4}\le Ck^{-1/2}\).

The [matrix-coefficient bound](PROOF.md) now gives \( \|U_{ij}\|_1\le\sqrt{k+1}\|F_{v_i}\|_1\|F_{v_j}\|_1=O(k^{-1/2})\) individually. Each realification step uses at most two such functions, so it preserves the individual order. The universal matching lower bound follows from the unit \(L^2\) norm and the degree-\(k\) estimate \(\|u\|_4\lesssim k^{1/4}\).

Finally, for \(1\le p\le2\), interpolate \(L^1,L^2\) for the upper bound and \(L^p,L^4\) for the universal lower bound. For \(2\le p\le\infty\), use \(L^1,L^p\) interpolation to get the lower bound on the constructed basis. For the upper bound, use \(|U_{ij}(g)|\le\sqrt{k+1}\) by unitarity, preserve it up to \(\sqrt2\) under realification, and interpolate \(L^2,L^\infty\). Both yield the same power \(k^{1/2-1/p}\). The corresponding [two-sphere result](TWO-SPHERE.md) uses a torus-fixed middle weight in the same matrix-coefficient lift.

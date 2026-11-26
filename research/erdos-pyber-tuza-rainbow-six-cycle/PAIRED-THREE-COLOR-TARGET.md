# A paired three-color target forces global parity

Work in the balanced zero-rainbow-six-cycle [three-block setup](PAIR-GRAPHONS.md) with within-part colors \(A,B\), and put \(t=1/6\). Let the parts be \(X,Y,Z\) and the cross palette be \(K\).

**Theorem.** Suppose \(X\) has two internal \(A\)-row classes of measure \(t\). Almost every outside vertex sends precisely three colors into \(X\), with one color filling one class and the two other colors splitting the other class. Suppose there is a common pairing of \(K\) such that the two colors splitting a class are always partners. Finally suppose each missing-label class of outside vertices has measure at most \(t\). Then there is an exact parity cut.

In particular, this settles the all-heavy target regime of [ALL-HEAVY-PAIRING.md](ALL-HEAVY-PAIRING.md), now including a positive measure of complete roots. There the hypotheses all hold and all four missing classes measure exactly \(t\). This does not settle the missing-pair reduction as a whole or the unrestricted Erdős problem.

Pass to deterministic color kernels by [circle refinement](DETERMINISTIC.md). The classes and degree hypotheses lift and parity descends. Write \(\pi:K\to\{0,1\}\) for the bit distinguishing the two color pairs, \(\bar a\) for the partner of \(a\), and \(p(x)\) for the \(A\)-row bit in \(X\). The internal \(A,B\)-rule on \(X\) depends only on \(p(x)+p(x')\), all bit arithmetic being modulo two. This follows by symmetry and the internal degree \(t\).

## The outside interfaces have a common bit rule

Let \(a(y)\) denote the unique color absent from \(y\) into \(X\). Its saturated color into \(X\) is \(\overline{a(y)}\), the other color of the singleton's pair. Thus into the other outside part \(y\) has color \(a(y)\) of degree \(t\), color \(\overline{a(y)}\) absent, and both opposite-pair colors positive with degrees summing to \(t\). There is a bit \(s(y)\) for almost every outside vertex such that
\[
\pi(\operatorname{col}(xy))=p(x)+s(y) \qquad(x\in X).
\]

Fix a typical \(z\in Z\), write \(b=a(z)\), and take \(y,y'\in Y\) with respective \(z\)-edge colors \(b,c\), where \(c\ne b\). Both are present colors and \(\pi(b)\ne\pi(c)\). The remaining two cross colors can be assigned to edges from \(y\) and \(y'\) into \(X\), with positive neighborhoods at those endpoints. The only obstruction to assigning two distinct colors to the two vertices would be the same missing label at both, belonging to the remaining pair of colors. But if \(y,y'\) have the same missing label \(a\), both forbid \(\bar a\) on edges to \(z\). Thus \(b,c\) cannot include \(\bar a\), and as \(b,c\) belong to opposite pairs this implies \(a\in\{b,c\}\). The obstruction is impossible.

Choose the two \(X\)-endpoints of the resulting four-color return from their positive neighborhoods. If these endpoints had opposite \(p\)-bits, their \(A\)-rows would differ and an \(A,B\) two-path of positive density could close the cycle. Fubini therefore gives
\[
s(y)+\pi(b)=s(y')+\pi(c)
\]
for almost every such triple. Each fixed \(z\) has both a positive saturated neighborhood of color \(b\) and positive neighborhoods of other colors. Comparing across these neighborhoods shows that \(\pi(\operatorname{col}(yz))+s(y)\) is constant for almost every \(y\), for almost every \(z\). Applying the argument with \(Y,Z\) switched shows the constant is \(s(z)+g\), with one fixed bit \(g\). Consequently
\[
\pi(\operatorname{col}(yz))=s(y)+s(z)+g.
\]
Every outside vertex sends degree \(t\) of each color-pair bit into the other outside part, so \(s\) takes each value on measure \(t\) in both parts.

## The inside rules agree as well

Let \(L\in\{A,B\}\) be the color used within an \(X\)-row class, and \(L'\) the other internal color. Suppose a positive measure of same-\(s\)-bit pairs \(y,y'\in Y\) has color \(L'\). We show these pairs yield a forbidden cycle. Fix a typical such pair and put \(b=a(y')\). Choose \(z\) in the saturated \(b\)-neighborhood of \(y'\). Choose \(y''\in Y\) with the opposite \(s\)-bit and with \(a(y'')\ne a(y)\). The latter choices have positive measure: the whole opposite bit class has measure \(t\); if it were all of missing label \(a(y)\), the total outside mass cap \(t\) for that label would exclude almost all vertices \(y\) of the original bit from having that label.

By the outside bit rule, \(c=\operatorname{col}(zy'')\) has opposite bit to \(b\). The complementary two colors can be assigned to \(xy\) and \(y''x'\), with positive degree into \(X\), because the missing labels at \(y,y''\) differ. Their bits sum to one. Since \(s(y)+s(y'')=1\), the two \(X\)-endpoints have the same \(p\)-bit. Their internal edge has color \(L\). We have a positive-density cycle
\[
x,\ y,\ y',\ z,\ y'',\ x',\ x
\]
using all six colors, a contradiction. In these choices the sides of each color neighborhood are fixed by the bit formula, and the two \(X\)-ends can be chosen independently, so the argument gives positive density rather than merely a walk on a quotient.

Thus every same-\(s\)-bit pair in \(Y\) has color \(L\) almost everywhere. As each bit class and each internal color degree has measure \(t\), every opposite-bit pair has color \(L'\). The argument holds verbatim in \(Z\). All three internal rules now agree. The three interpart bit shifts are \(0,0,g\); if \(g=1\), flip the bits on both \(Y,Z\), making all shifts one instead. Choose the corresponding cross-color pair, together with \(L'\), as the three crossing colors. This gives the claimed exact parity cut, with both sides of measure \(3t\).

Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).

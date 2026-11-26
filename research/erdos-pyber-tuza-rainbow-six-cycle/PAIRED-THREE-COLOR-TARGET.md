# A paired target with at least three colors forces global parity

Work in the balanced zero-rainbow-six-cycle [three-block setup](PAIR-GRAPHONS.md) with within-part colors \(A,B\), and put \(t=1/6\). Let the parts be \(X,Y,Z\) and the cross palette be \(K\).

**Theorem.** Suppose \(X\) has two internal \(A\)-row classes of measure \(t\). Almost every outside vertex sends at least three colors into \(X\). Suppose there is a common pairing of \(K\) such that all present colors of each pair are sent into only one row class, and the other pair goes into the other class. Then there is an exact parity cut.

In particular, this settles the all-heavy target regime of [ALL-HEAVY-PAIRING.md](ALL-HEAVY-PAIRING.md), now including a positive measure of complete roots. The theorem also applies when fewer than three missing labels are heavy, by the pairing criterion at the end. The proof works with any mixture of three- and four-color profiles once this pairing is established. It does not settle the missing-pair reduction as a whole or the unrestricted Erdős problem.

Pass to deterministic color kernels by [circle refinement](DETERMINISTIC.md). The classes and degree hypotheses lift and parity descends. Write \(\pi:K\to\{0,1\}\) for the bit distinguishing the two color pairs, \(\bar a\) for the partner of \(a\), and \(p(x)\) for the \(A\)-row bit in \(X\). The internal \(A,B\)-rule on \(X\) depends only on \(p(x)+p(x')\), all bit arithmetic being modulo two. This follows by symmetry and the internal degree \(t\).

## The outside interfaces have a common bit rule

A three-color vertex \(y\) has a unique missing label \(a(y)\) into \(X\), so its saturated color into \(X\) is \(\overline{a(y)}\). Thus into the other outside part it has color \(a(y)\) of degree \(t\), color \(\overline{a(y)}\) absent, and both opposite-pair colors positive with degrees summing to \(t\). A four-color vertex has two positive colors in each of the two \(X\)-classes, so all four are positive also into the other outside part. In either case the total degree of each color-pair bit into either other part is \(t\). Write \(a(y)=*\) for a vertex with all four colors into \(X\), meaning it has no missing label. There is a bit \(s(y)\) for almost every outside vertex with
\[
\pi(\operatorname{col}(xy))=p(x)+s(y) \qquad(x\in X).
\]

Fix a typical \(z\in Z\), and take \(y,y'\in Y\) with respective \(z\)-edge colors \(b,c\) in opposite pairs. The remaining two cross colors can be assigned to edges from \(y\) and \(y'\) into \(X\), with positive neighborhoods at those endpoints. The only obstruction to assigning two distinct colors to the two vertices would be the same genuine missing label at both, belonging to the remaining pair of colors. But if \(y,y'\) have the same missing label \(a\), they both forbid \(\bar a\) on edges to \(z\). Thus \(b,c\) cannot include \(\bar a\), and since they belong to opposite pairs this implies \(a\in\{b,c\}\). The obstruction is impossible.

Choose the two \(X\)-endpoints of the resulting four-color return from their positive neighborhoods. If these endpoints had opposite \(p\)-bits, their \(A\)-rows would differ and an \(A,B\) two-path of positive density could close the cycle. Fubini therefore gives
\[
s(y)+\pi(b)=s(y')+\pi(c)
\]
for almost every such triple. Each fixed \(z\) has positive degree into both color-pair bits. Comparing across these neighborhoods shows that \(\pi(\operatorname{col}(yz))+s(y)\) is constant for almost every \(y\), for almost every \(z\). Applying the argument with \(Y,Z\) switched shows the constant is \(s(z)+g\), for one fixed bit \(g\). Consequently
\[
\pi(\operatorname{col}(yz))=s(y)+s(z)+g.
\]
Since each color-pair degree into the other outside part is \(t\), the bit \(s\) takes each value on measure \(t\) in both parts.


## The inside rules agree as well

Let \(L\in\{A,B\}\) be the color used within an \(X\)-row class, and \(L'\) the other internal color. Suppose a positive measure of same-\(s\)-bit pairs \(y,y'\in Y\) has color \(L'\). We show these pairs yield a forbidden cycle. Fix a typical such pair with bit \(s\). If \(y\) has missing label \(m\ne *\), the total outside mass with label \(m\) AND bit \(1-s\) is at most \(t\): such vertices all receive the saturated color \(\bar m\) from the same \(X\)-class. Every \(X\)-vertex has total \(\bar m\)-degree \(t\). Since the total outside mass with bit \(1-s\) is \(2t\), there are positive-measure possible intermediaries \(w\) of bit \(1-s\) with no missing label in common with \(y\), in at least one of \(Y,Z\). If \(y\) has no missing label, all intermediaries of bit \(1-s\) work.

If these intermediaries occur in \(Y\), use the two-edge middle path \(y',z,w\) through \(z\in Z\); the two middle edges have opposite color-pair bits by the outside bit rule. If these intermediaries occur in \(Z\), use the two-edge middle path \(y',x_0,w\) through \(x_0\in X\); the two edges again have opposite bits by the \(X\)-outside bit rule.

In either case the two complementary cross colors can be assigned to \(xy\) and \(wx'\), with positive degree into \(X\), since \(y,w\) do not share any missing label. Their bits sum to one. Since \(s(y)+s(w)=1\), the two \(X\)-endpoints have the same \(p\)-bit. The internal edge between them has color \(L\). The resulting cycle \(x,y,y',z,w,x',x\), or \(x,y,y',x_0,w,x',x\), uses all six colors. The sides of each new color neighborhood are fixed by the bit relation, and the \(X\)-ends can be chosen independently on positive sets, so the argument produces positive density. Repeated part indices do not identify vertices.

Thus every same-\(s\)-bit pair in \(Y\) has color \(L\) almost everywhere. As each bit class and each internal color degree has measure \(t\), every opposite-bit pair has color \(L'\). The argument holds verbatim in \(Z\). All three internal rules now agree. The three interpart bit shifts are \(0,0,g\); if \(g=1\), flip the bits on both \(Y,Z\), making all shifts one instead. Choose the corresponding cross-color pair, together with \(L'\), as the three crossing colors. This gives the claimed exact parity cut, with both sides of measure \(3t\).


## Automatic pairing when two matching tests are globally complete

More precisely, it suffices that **two of the three complementary matchings are complete at almost every root** of \(X\), and that all incoming color neighborhoods into \(X\) are already in single types. Suppose all incoming profiles have size three. Every outside vertex \(y\) has a specific pairing \(J(y)\), formed by its two double colors and by the singleton plus its missing color. At a typical root, a complete matching has a fixed same- or opposite-type status.

Suppose two distinct pairings occur on positive measure. At least one, say \(J_1\), is a globally complete matching. Take a typical \(y_1\) of pairing \(J_1\). On its entire double type, \(J_1\) has same-type status, since the double-to-double palette uses that matching and both colors have positive degree. Let \(y_2\) have the other pairing \(J_2\). If its singleton type is the double type of \(y_1\), then its two singleton-to-double palettes include \(J_1\) and force opposite status there, a contradiction. If instead their double types coincide, one of its two double colors pairs with the singleton color in \(J_1\). On the positive neighborhood of that double color, \(J_1\) is again opposite, a contradiction.

Thus the pairing is fixed. In the setting of [THREE-COLOR-PROFILES.md](THREE-COLOR-PROFILES.md) with at most two heavy missing labels, two tests are globally complete and the homogeneous two-type conclusion applies. The theorem therefore proves global parity for exactly-three incoming profiles whenever the number of heavy missing labels is zero, one, two or four. For an exact-three target the only remaining heavy-label count is three; general mixed profile counts remain open too.

Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).

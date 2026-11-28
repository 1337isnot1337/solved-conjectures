# A two-hop cut when pentagons are scarce

This is an upper bound for every triangle-free graph or graphon in [Erdős Problem 23](https://www.erdosproblems.com/23). Unlike an application of the removal lemma, it supplies an explicit pentagon-density threshold and a pointwise version for each root. It does not address graphs with arbitrary pentagon density.

Use total vertex mass one. Let \(e\) and \(\beta\) be unordered edge mass and minimum deletion mass, respectively. Let \(d(x)=\int W(x,y)\,dy\), and let \(T_5=t(C_5,W)\) be the homomorphism density with fixed cyclic labels. Then
```math
 \beta\le \frac e2-\frac12\int d(x)^2\,dx
          +\frac34(1-2e)^{2/3}T_5^{1/3}
 \le \frac e2-2e^2+\frac34(1-2e)^{2/3}T_5^{1/3}.
```
For a graph with vertex product weights, use its zero-one step graphon. The graphon argument below is also valid for nonbinary \(W\).

## The cut

Fix a typical root \(r\), and set \(K(r,z)=\int W(r,y)W(y,z)\,dy\). Sample the first side \(A\) using fractional selector \(W(r,y)\). All of its positive support is independent by triangle-freeness. For \(t>0\), assign every vertex of \(B=\{z:K(r,z)\ge t\}\) to the other side. The support of \(A\) and \(B\) are disjoint up to null sets. Vertices outside \(B\) and not assigned to \(A\) go independently to the two sides with equal probability. Equivalently assign expected sign \(-W(r,y)\) on the complement of \(B\), and \(+1\) on \(B\). Fractional expected cut costs are realized or improved by a true cut, via independent subdivision and rounding.

Compared with the baseline cost \(e/2\), every edge from \(A\) to \(B\) gains half its weight and every edge inside \(B\) loses half its weight. There are no other expected changes: in particular the support of \(W(r,\cdot)\) has no internal edges. Thus
```math
 \beta\le\frac e2-\frac12\int_B K(r,z)\,dz
              +\frac14\int_{B^2}W(y,z)\,dy\,dz.
```
Put \(D(r)=\int K(r,z)\,dz\) and \(P(r)=\int W(y,z)K(r,y)K(r,z)\,dy\,dz\). Then
```math
 \beta\le\frac e2-\frac12D(r)
               +\frac{1-d(r)}2\,t+\frac{P(r)}{4t^2}.
```
For the loss from excluding low-codegree vertices, use that \(\{K(r,z)>0\}\) is disjoint from the support-neighborhood of \(r\), which has measure at least \(d(r)\). For the last term, both codegrees on \(B^2\) are at least \(t\).

The minimizing choice is \(t=(P(r)/(1-d(r)))^{1/3}\) when both quantities are positive; take a limit if one vanishes. Hence the same bound with the last two terms replaced by \(\tfrac34(1-d(r))^{2/3}P(r)^{1/3}\) holds at almost every root. Averaging uses \(\int D=\int d^2\), \(\int P=T_5\), and Hölder's inequality.

## Consequences

If there are no pentagons, \(\beta\le e/2-2e^2\le1/32\). This is enough for the triangle-free conjecture in that class, but is weaker than the separate higher-odd-girth conjecture \(N^2/49\).

If a graph in the open density band \(0.2486\le2e\le0.3197\) violates the conjecture, its labeled pentagon density must exceed
```math
 \frac{(7/600)^3}{(3757/5000)^2}> \frac{28}{10^7}.
```
In fact the first bound retains degree variance, and at almost every root a necessary lower bound is
```math
 (1-d(r))^2P(r)>
 \left[\frac43\left(\frac1{25}-\frac e2+\frac12D(r)\right)\right]^3
```
whenever the quantity in the final parentheses is nonnegative. The root-level inequality complements the [pentagon-to-induced-path ratio](ROOTED-PENTAGON-RATIO.md), which helps when existing pentagons dominate much of the vertex mass. Neither inequality forces all remaining graphs into the other's range.

The classical [density cut](https://combinatorica.hu/~p_erdos/1988-12.pdf) also starts with one independent neighborhood. Here the thresholded two-hop extension makes the penalty an explicit cubic-root function of rooted pentagon density. The published [Balogh–Clemen–Lidický result](https://arxiv.org/html/2103.14179) supplies the two density endpoints used only in the last numerical consequence.

## Extending both ends of a sampled edge

A second bound uses a sampled **edge** instead of a sampled vertex and retains four-cycle density. Put \(p=2e>0\), \(P_4=t(P_4,W)\) for the path of three edges, \(C_4=t(C_4,W)\), and \(M_2=\int d^2\). For every \(t>0\),
```math
 \beta\le \frac p4-\frac{P_4}{p}+\frac{C_4}{2p}
     +t\left(1-\frac{2M_2}{p}\right)
     +\frac{T_5}{p}\left(\frac1t+\frac1{5t^2}\right). \tag{1}
```
It suffices to prove this for zero-one graphons of finite graphs; the general case follows by sampling and continuity of the normalized optimum and the displayed densities.

For a sampled oriented edge \(uv\), force \(X=N(u)\) and \(Y=N(v)\) to opposite sides. They are disjoint and independent. For \(z\) outside those two sets, put \(K_u=K(u,z)\) and \(K_v=K(v,z)\). If both are below \(t\), assign \(z\) a fair independent sign. Otherwise place \(z\) opposite the neighborhood into which it has the larger degree, breaking ties consistently. There are \(I=\int_X d+\int_Y d-e(X,Y)\) edges by mass incident to at least one of \(X,Y\), counting each once.

Compare to the baseline \((e-I)/2\), which cuts all incident edges and charges the other edges half. Outside \(X,Y\), a vertex with both codegrees below \(t\) adds at most \(t\) per unit vertex mass to this baseline. Otherwise its missed incident mass per unit vertex mass is \(\min(K_u,K_v)\le K_uK_v/t\). Among nonincident edges, a positive excess over baseline is possible only between two forced vertices of the same sign. One sign class must have \(K_u\ge t\), the other \(K_v\ge t\). Their combined excess is at most \((P(u)+P(v))/(4t^2)\), with \(P(r)\) as in the one-root proof.

Average over ordered root edges with measure \(W(u,v)\,du\,dv/p\). The averages of \(I\), of \(1-d(u)-d(v)\), and of \(\int K_uK_v\) are respectively \((2P_4-C_4)/p\), \(1-2M_2/p\), and \(T_5/p\). Finally \(\int d(r)P(r)\,dr\le (2/5)T_5\): at a sampled pentagon the sum of its five degrees is at most two, because every external vertex sees at most two of its vertices, and all five positions have the same law. This proves (1).

The elementary edge-root cut with just \(X,Y\) forced gives \(\beta\le p/4-C_4/(2p)\). Averaging with (1) cancels \(C_4\). The standard three-edge-path inequality \(P_4\ge p^3\) follows directly from Jensen: under the probability of a random oriented edge, the mean of \(\log d(u)\) is \(\int d\log d/p\ge\log p\). Exponentiating Jensen for \(d(u)d(v)\) gives \(P_4/p\ge p^2\); zero-degree vertices do not occur as edge endpoints. With \(M_2\ge p^2\), we obtain
```math
 \beta\le \frac p4-\frac{p^2}{2}
     +\frac t2(1-2p)+\frac{T_5}{2p}\left(\frac1t+\frac1{5t^2}\right). \tag{2}
```
In the open density band choose \(t=1/45\) and use \(p\ge1243/5000\). If \(T_5\le34/10^7\), the right side is below \(1/25\): the three terms are bounded by \(1/32\), \((1-2(1243/5000))/90\), and \((34/10^7)450/(2(1243/5000))\), whose sum is strictly below \(1/25\). Keeping \(P_4\) and \(C_4\) in (1), or retaining the actual density \(p\) in (2), gives potentially stronger tests. This still does not bridge the gap to the dense-pentagon attachment argument.

## Clipped signs: a stronger pentagon floor

An independent internal research pass sharpened the edge-root estimate above by replacing the hard threshold with a bounded, gradual sign. With the same densities and any \(t>0\), the result is
```math
 \beta\le \frac p4-\frac{P_4}{p}+\frac{C_4}{2p}
 +\frac{t}{8}\left(1-\frac{2M_2}{p}\right)
 +\frac{T_5}{p}\left(\frac2t+\frac1{5t^2}\right). \tag{3}
```
Averaging with the elementary edge-root cut gives
```math
 \beta\le \frac p4-\frac{p^2}{2}
 +\frac{t(1-2p)}{16}
 +\frac{T_5}{2p}\left(\frac2t+\frac1{5t^2}\right). \tag{4}
```
At \(t=1/6\), a middle-band counterexample must therefore have **\(T_5>9/100000\)**. Indeed, if \(T_5\) is at most that value, (4) is bounded above by
```math
 \frac1{32}+\frac{1257}{240000}
 +\frac9{100000}\frac{96}{5}\frac{2500}{1243}
 < \frac1{25}.
```
This is more than 26 times the threshold given by the hard cut. The value of \(t\) can instead depend on \(p\), and (3) retains additional constraints from the path and four-cycle densities.

To prove (3), fix a root edge \(uv\), force \(X=N(u)\) and \(Y=N(v)\) to opposite sides exactly as above, and write \(A=K(u,z), B=K(v,z)\) for an exterior vertex \(z\). Independently assign a sign whose mean has magnitude \(\min(|A-B|/t,1)\) toward opposition to the larger attachment. Compared with cutting all its incident edges into \(X\cup Y\), this incurs an expected loss of
```math
 \min(A,B)+\tfrac12|A-B|\bigl(1-\min(|A-B|/t,1)\bigr)
 \le t/8+2AB/t .
```
For the inequality put \(s=\min(A,B)/t\), \(w=|A-B|/t\). If \(w\ge1\), the normalized loss is \(s\le2s(s+w)\). If \(w\le1\), subtract \(2s(s+w)\) from the normalized loss to obtain
```math
 s(1-2w)-2s^2+w(1-w)/2.
```
For \(w\le1/2\) this has maximum \(1/8\) over \(s\ge0\), by completing the square. For \(w\ge1/2\) its maximum is \(w(1-w)/2\le1/8\). Edges entirely in the exterior can increase the cost above their fair baseline only when the two expected signs agree. For one preferred sign the magnitude is at most \(K(u,z)/t\), and for the other at most \(K(v,z)/t\). The exterior penalty is therefore at most \((P(u)+P(v))/(4t^2)\), as above. Use the previous root-edge averaging identities for \(AB\), \(P(u)+P(v)\), and the exterior mass to get (3). Independent sign assignment constructs a true cut of cost at most the expectation; graphon sampling and continuity transfer the inequality.

There is a parallel one-root improvement. Assign expected sign \(-W(r,z)+\min(K(r,z)/t,1)\); its two summands have disjoint supports almost everywhere. The dropped gain is at most \(t(1-d(r))/8\), since \(K(1-\min(K/t,1))\le t/4\). The exterior penalty is again \(P(r)/(4t^2)\). Optimizing \(t\) now gives the previous one-root formula with \(3/4\) replaced by \((3/4)4^{-2/3}\), including at each individual root. It improves that pentagon threshold by a factor of 16. The two-root bound gives the stronger uniform threshold, but neither excludes the whole middle band.

## Only singly attached vertices pay the exterior penalty

One can keep the exclusion of the fixed neighborhoods in the previous section instead of discarding it. For a pentagon sampled with its graphon weight, let \(\nu_1\) be the mean mass of vertices adjacent to exactly one of its roots. If \(T_5>0\), the stronger averaged bound is
```math
 \beta\le \frac p4-\frac{p^2}{2}
    +\frac{t(1-2p)}{16}
    +\frac{T_5}{2p}\left(\frac2t+\frac{\nu_1}{10t^2}\right).
    \tag{5}
```
When \(T_5=0\), interpret the last term as zero. In particular \(\nu_1\le1\) and \(t=1/6\) imply that a middle-band counterexample must have \(T_5>11/100000\). The exact comparison for this last statement is
```math
 \frac1{32}+\frac{1257}{240000}
 +\frac{11}{100000}\frac{78}{5}\frac{2500}{1243}<\frac1{25}.
```

To see the improvement, denote by \(P_{\rm ext}\) the same-root exterior term from [SIGNED-CODEGREE-CUT.md](SIGNED-CODEGREE-CUT.md):
```math
 P_{\rm ext}=
 \int W(z,z')K(x,z)K(x,z')
              [d(x)-K(x,z)-K(x,z')]\,dx\,dz\,dz'.
```
Indeed, if we already count \(K(x,z)K(x,z')>0\), the two terminals avoid \(N(x)\). For a root edge \(xy\) to place both in its exterior we must also avoid \(yz\) and \(yz'\). These two excluded subsets of \(N(x)\) are disjoint since \(zz'\) is an edge. This explains the exact bracket. The clipped sign same-side penalty, averaged over the root edge, is thus at most \(P_{\rm ext}/(2pt^2)\) in unordered units. All other terms of (3) are unchanged.

The key identity is \(5P_{\rm ext}=\nu_1 T_5\). The factor \(W(z,z')K(x,z)K(x,z')\) samples a pentagon with root \(x\) and vertices \(z,z'\) at distance two from \(x\). Sum the bracket over the five choices of \(x\) on this pentagon. A fresh vertex with no root neighbor contributes zero. One with a single root neighbor contributes one via a degree term. One with two root neighbors contributes two via degree terms and loses exactly two via the two orders of their nonadjacent pair. No vertex can have three root neighbors. Thus the sum of the brackets is exactly the singly attached mass. Average over labeled pentagons, using cyclic symmetry. Using this identity after averaging the clipped and elementary edge-root bounds proves (5).

There is also a signed version retaining a negative exterior term. Let
```math
 U_{\rm ext}=\int W(x,y)\int_{D_{xy}^2}
     W(z,z')K(x,z)K(y,z')\,dz\,dz'\,dx\,dy,
```
where \(D_{xy}\) is the exterior of the two root neighborhoods in the binary model. This is the \(U\) from the signed-codegree note. If \(L\) bounds both \(t\) and the maximum degree, clipping gives magnitude at least \(|A-B|/L\). Pointwise
```math
 (A-B)_+(B'-A')_+\ge AB'-AA'-BB',
```
by checking the signs of both differences and expanding when they have the desired signs. Integrate on ordered exterior edges and average over roots. The decrease from opposite clipped signs is at least \((U_{\rm ext}-2P_{\rm ext})_+/(2pL^2)\) in the edge-root bound (3), and half that in (5). This term does not affect the universal numerical threshold above; it supplies a sharper test if the exterior six-cycle term is known.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

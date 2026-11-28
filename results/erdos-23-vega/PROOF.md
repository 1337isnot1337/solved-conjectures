# The sharp Erdős bound for every Vega template

**Theorem.** Every graph homomorphic to a Vega graph satisfies the sharp weighted bound in [Erdős Problem 23](https://www.erdosproblems.com/23). When its unordered edge mass is at most \(4/25\) in total vertex mass one, its minimum monochromatic edge mass is at most \(399/10000\). This includes arbitrary vertex weights and arbitrary missing edges in the preimages. The separately published [Andrásfai result](../heinig-andrasfai-bipartification/) treats the other dense-template family. The general triangle-free conjecture remains open.

The proof applies to a broader template. Start with any core \(M\) carrying a proper three-colouring \(M_1,M_2,M_3\) whose cyclic orientation is acyclic. Add the six-vertex crown \(a_i,b_i\) (\(1\le i\le3\)), with edges \(a_i b_j\) for \(i\ne j\); join each of \(a_i,b_i\) to all of \(M_i\). Add vertices \(x,y\), join \(x\) to all \(a_i\), \(y\) to all \(b_i\), and join \(xy\). There are no other edges. The template is triangle-free. In any homomorphic preimage, group vertices into its fibers and use their inherited labels. Actual edge mass between fibers is at most the product of their two vertex masses.

In the Vega construction the core is the circular Andrásfai graph, or an indicated vertex deletion, in three consecutive colour classes. The classes are consecutive intervals of lengths \(i,i,i-1\) on the \(3i-1\) equally spaced positions of the underlying Andrásfai circle. After scaling to circumference three these are the classes of the integer parts. Both circular arcs of an edge are strictly longer than one, since the minimum gap in the original integer positions is \(i\). An edge oriented cyclically then has strictly increasing fractional part, so the core order is acyclic. See [Łuczak–Polcyn–Reiher, Section 4.1](https://arxiv.org/abs/2002.01498). The deletions of \(y\) and/or an inner vertex amount to empty fibers, and are covered.

## Three basic comparisons

Normalize the total mass to one and suppose the minimum monochromatic weight \(\beta\) exceeds \(b=399/10000\) with unordered edge mass \(e\le e_0=4/25\). Write
- \(c\) for the core mass, \(s=1-c\) for the outer mass, and \(z=e(M)\);
- \(A=\sum_i a_i\), \(B=\sum_i b_i\), \(t=x+y\), using outer vertex names also for fiber masses;
- \(h,L,K,Q\) for the actual edge masses in the apex–apex link, apex–crown links, crown, and crown–core attachments, respectively. In particular \(h\le xy\) and \(L\le xA+yB\).

Thus \(e=z+K+Q+L+h\). The ordered core has both \(\beta(M)\le c^2/25\) and \(\beta(M)\le c^2/44+z/11\), as follows. Bisect the core at the weighted median of its topological order, splitting a false twin at the boundary if needed. All cross edges point forward, so rotating the three labels of the second shore makes every cross edge match. Apply (2) below to the normalized core with zero defects and scale back: this gives the linear bound at all densities. It is at most \(c^2/25\) when \(z/c^2\le19/100\), and otherwise the published dense tail gives that bound. If \(c=0\), both assertions are immediate.

1. The outer graph is bipartite with shores \(\{a_1,a_2,a_3,y\}\) and \(\{b_1,b_2,b_3,x\}\). Cut it, optimize the core, and align them fairly, so \(\beta\le\beta(M)+Q/2\).
2. Give \(M_i,a_i,b_i\) label \(i\), and give \(x,y\) the same fourth label. Choose a uniform 2-versus-2 cut of the four labels and reverse it on the outer block. It crosses every attachment, misses a third of ordinary internal edges, and misses \(xy\) always. Hence \(\beta\le(e-Q+2h)/3\).
3. Give the three core classes constant signs, uniformly choosing which one to isolate, and put \(a_i,b_i\) opposite \(M_i\). Cut \(xy\) in a fair random orientation. This crosses all attachments and charges \((z+K)/3+L/2=(e-Q-h)/3+L/6\).

Since \(\beta>b\), comparison 3 gives \(Q<e-3b-h+L/2\). Comparison 1 with the linear core bound gives \(44\beta\le c^2+4e-4(K+L+h)+18Q\). Consequently

```math
 \Phi:=c^2-4K+5L-22h>98b-22e\ge1951/5000=.3902. \tag{1}
```

## When the outer mass is at most one half

For a balanced split with four auxiliary labels per shore, suppose \(D\) is the internal equal-label edge mass and \(U\) the cross edge mass with different labels. The four-label cuts, reversed across shores, give \(\beta\le(E+2D+2U)/3\), where \(E\) denotes the internal edge mass. Separately optimize the shores and fairly align them. On a shore of mass \(1/2\) and edge mass \(u\), the classical neighborhood cut bounds its cost by \(u-16u^2\le1/16-u\). This gives \(\beta\le1/8+e/2-3E/2\). Taking the linear combination that cancels \(E\),

```math
 \beta\le1/44+e/11+6(D+U)/11. \tag{2}
```

Thus \(D+U\le\tau=(11b-1/4-e_0)/6=289/60000\) would contradict \(\beta>b\).

Put the entire outer block in the first shore and fill to mass \(1/2\) with a prefix of the core's topological order. Split a false twin at the threshold if necessary; this preserves the optimum. Keep original core labels in the first shore and rotate them down by one in the second. Give \(a_i,b_i\) the rotated label of \(M_i\); keep \(x,y\) at the fourth label. The only internal defect is \(xy\), and every cross edge matches. Therefore \(h>\tau\).

For any index \(i\), instead give \(y\) the rotated label of \(M_i\) and recolour its neighbor \(b_i\) to the fourth label. That fixes the internal defect. Only the attachments from \(b_i\) to the \(M_i\) suffix can be unmatched. The symmetric move using \(x,a_i\) also works. If \(c_i'\) is the suffix mass of \(M_i\), failure implies \(a_i c_i'>\tau\) and \(b_i c_i'>\tau\) for every \(i\). Since \(\sum_i c_i'=1/2\), Cauchy–Schwarz gives \(A,B>18\tau=r=867/10000\).

In another balanced split place \(x,a_i\) in the first shore and \(y,b_i\) in the second, filling each with the appropriate prefix or suffix of the core. Both outer groups have mass at most \(s\le1/2\), so this is possible. Keep \(x,y\) at label four; on the \(a_i\) use the suffix labels, on the \(b_i\) the prefix labels. All attachments and \(xy\) are compatible. Only three of the crown's six fiber links can be wrong. Reversing both the core order and its cyclic label direction gives the complementary three wrong links. The two defect masses add to \(K\). Thus (2) forces \(K>2\tau\).

Set \(m=\max(x,y)\), \(m'=\min(x,y)\). Then \(L\le m(s-t)-(m-m')r\), because both \(A,B\ge r\). For fixed \(x,y,h\) the resulting upper bound on \(\Phi\), using \(K>2\tau\), is convex in \(s\in[t+2r,1/2]\).
- At \(s=t+2r\) the bound on \(L\) is \(rt\). Since \(xy\ge h>\tau\), we have \(t>.138\). The function \((1-2r-t)^2+5rt\) is decreasing for \(t\le1/2-2r\), with derivative at most \(-1+5r<0\). Also \(22h+4K>30\tau\). The endpoint upper bound is \((1-2r-.138)^2+5r(.138)-30\tau=.38949296\).
- At \(s=1/2\) the bound on \(L\) is \(m(1/2-r)-m^2-xy+r m'\), and \(m'\le(1/2-2r)/2\). Completing the square gives \(L\le(1/2-r)^2/4+r(1/2-2r)/2-h<.057-h\). The endpoint upper bound is \(.25+5(.057)-35\tau=4397/12000\).

Both are below .3902, contradicting (1).

## When the outer mass is greater than one half

Now \(c<1/2\). Comparison 1 with \(\beta(M)\le c^2/25\) gives \(Q>2b-2c^2/25\). Comparison 2 then forces \(h>(5b-e)/2-c^2/25\ge .01975-.04c^2\).

For \(.17\le c<1/2\), use \(L\le m(s-m-m')\le s^2/4-h\) and \(K\ge0\). Then

```math
 \Phi\le c^2+\tfrac54(1-c)^2-27h<3.33c^2-2.5c+.71675.
```

The convex quadratic is bounded by its larger endpoint value .387987 on \([.17,.5]\), below .3902.

For \(0\le c<.17\), use the total edge budget \(L\le e-Q-h\) and drop \(-4K\). Substituting the lower bounds on \(Q,h\) gives

```math
 \Phi\le c^2+5e-5Q-27h<2.48c^2+18.5e-77.5b
 \le2.48(.17)^2+18.5(.16)-77.5(.0399)=-.060578.
```

This finishes the contradiction. The comparisons are exact rational arithmetic; the proof uses neither extremal stationarity nor numerical optimization.

## Consequences and scope

For \(e\le4/25\), the uniform bound is \(\beta\le399/10000\). At larger \(e\), the [dense-tail result](https://arxiv.org/abs/2103.14179) already gives the sharp coefficient \(1/25\) for all triangle-free graphs. Thus a middle-band counterexample must be more than \(1/10000\) in unordered product edge-edit mass from the Vega homomorphic class. Edits of that much would leave its new edge mass below \(4/25\), and undoing them increases its cut cost by at most .0001. The independently proved circular median estimate gives the same robustness for the other template family; see the [campaign record](https://github.com/1337isnot1337/solved-conjectures/issues/1097). It remains to control unrestricted graphs outside this union.

# Erdős–Galvin–Hajnal’s repeated-pair page avoidance problem

**Theorem (ZFC).** For every infinite cardinal \(\kappa\) there is a triple system on exactly \(\kappa\) vertices with chromatic number exactly \(\kappa\) such that, for any pair \(u,v\), no two distinct completions of \(u,v\) belong together to any triple. It therefore simultaneously avoids \(T_9\) and \(T_3\).

Here a completion of \(u,v\) is a vertex \(w\) with \(\{u,v,w\}\) a triple. The pattern \(T_9\) is \(\{abx,aby,xyz\}\) on five distinct points, and \(T_3\) is three triples on four points. The theorem gives a ZFC positive answer to the individual \(T_9\) clause of [Erdős–Galvin–Hajnal (1975), Problem 9/A, p. 481](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=57). It does not address \(T_1+T_9\) in 9/B or resolve the full obligatory-class problem.

## The word and its completions

The vertices are the increasing four-tuples from the initial ordinal \(\kappa\). Declare three such tuples to form an edge exactly when their coordinates are disjoint and the twelve coordinates, listed in increasing order and named by tuple, spell
\[
\texttt{ABAB}\;\texttt{ACAC}\;\texttt{BCBC}.
\]
The role labels are unambiguous because the tuples' first coordinates appear in order \(A,B,C\). Equivalently the edge inequalities are
\[
 a_0<b_0<a_1<b_1
 < a_2<c_0<a_3<c_1
 < b_2<c_2<b_3<c_3.
\]

A pair of tuples in some edge has one of the following order-type words, naming the tuple with the smaller first coordinate \(X\) and the other \(Y\):
\[
 \begin{array}{c|c}
 AB&\texttt{XYXYXXYY}\\
 AC&\texttt{XXXYXYYY}\\
 BC&\texttt{XXYYXYXY}.
 \end{array}
\]
They are distinct, so the pair identifies which role is missing. The word has no consecutive equal letters. Therefore, once the pair is fixed, the four coordinates of any completion are constrained to four **distinct** gaps between coordinates of the pair (allowing initial and final gaps). These gaps are ordered by the coordinate index. Two completions sharing a coordinate cannot both be in an edge, whose three tuples have disjoint coordinates. If they have disjoint coordinates, their pair projection consists of four two-letter blocks, each either \(\texttt{XY}\) or \(\texttt{YX}\), because both coordinates from one gap precede both coordinates from the next. None of the three permitted pair types has this form. Thus the completions cannot be together in any edge. In any copy of \(T_9\) the vertices \(x,y\) would violate this, and in any \(T_3\) two of its triples share a pair whose completions are together in the third triple.

## Exact chromatic number

First let \(\kappa\) be regular infinite, including \(\kappa=\omega\). Fix a colouring \(f:[\kappa]^4\to\theta\) with \(\theta<\kappa\). In this proof \(f(p,\gamma,\delta)\) denotes the colour of the concatenation of the increasing pair \(p\) and the larger increasing pair \((\gamma,\delta)\).

For each increasing pair \(p\) and colour \(i<\theta\), let
\[
 R_{p,i}=\{\gamma>\max p:\{\delta>\gamma:f(p,\gamma,\delta)=i\}\text{ is unbounded in }\kappa\}.
\]
For every \(\gamma>\max p\), at least one \(i\) works in this definition because \(\kappa\) is regular and \(\theta<\kappa\). Hence for every \(p\) at least one \(R_{p,i}\) is unbounded, by the same argument. Put \(P_i=\{p:R_{p,i}\text{ is unbounded}\}\); these sets cover all increasing pairs. For every \(\alpha<\kappa\), some \(P_i\) has unboundedly many \((\alpha,\beta)\), and there is a single \(i\) for which
\[
 U_i=\{\alpha:\{\beta>\alpha:(\alpha,\beta)\in P_i\}\text{ is unbounded}\}
\]
is unbounded. These are again applications of regularity.

We construct a colour-\(i\) edge by making the three blocks in order.

1. Choose \(a_0<b_0\) from \(U_i\). Choose \(a_1>b_0\) so \(p=(a_0,a_1)\in P_i\), and \(b_1>a_1\) so \(q=(b_0,b_1)\in P_i\). This gives the first block.
2. Choose \(a_2>b_1\) in \(R_{p,i}\), then \(c_0>a_2\) in \(U_i\). Choose \(a_3>c_0\) with \(f(p,a_2,a_3)=i\). Choose \(c_1>a_3\) with \(s=(c_0,c_1)\in P_i\). This gives the second block and fixes the colour of \(A\).
3. Choose \(b_2>c_1\) in \(R_{q,i}\), then \(c_2>b_2\) in \(R_{s,i}\). Choose \(b_3>c_2\) with \(f(q,b_2,b_3)=i\), and finally \(c_3>b_3\) with \(f(s,c_2,c_3)=i\). This gives the third block and colours \(B,C\) with \(i\).

Thus \(\theta\) colours never suffice. If \(\kappa\) is singular, restrict to all four-tuples on any smaller infinite regular initial segment. The definition gives exactly the corresponding smaller hypergraph there. Such regular cardinals are cofinal in \(\kappa\), so its chromatic number is again at least \(\kappa\). The trivial upper bound is \(|[\kappa]^4|=\kappa\) in all cases.

## Priority and scope

EGH Definition 11.10 and Theorem 11.11 ([printed p. 479](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=55)) give the exact pattern and a witness on \(\lambda\) of chromatic number at least the least \(\delta\) with \(\lambda^\delta>\lambda\). The original Problem 9/A cites the resulting CH answer at \(\aleph_1\) and asks for ZFC. That arithmetic estimate can be only \(\aleph_0\) at \(\lambda=\aleph_1\) when the continuum is larger. The new four-tuple proof never uses exponentiation, a forcing axiom, or CH. EGH Theorem 11.6 already gives \(T_3\) avoidance under CH, and its individual ZFC counterpart also follows from the elementary directed-path construction on a triangle-free graph of equal order and chromatic number. The new point here is the stronger simultaneous pair-completion exclusion at the exact host cardinality, in particular its \(T_9\) consequence. The unrestricted-host [#593/#1177 exact-spectrum preprint](https://arxiv.org/html/2606.24882v1) does not supply this size guarantee; compare its Theorem 6.14 and Corollary 7.2.

The same word necessarily contains loose triangles, by the [pure-tuple obstruction](../erdos-galvin-hajnal-link-path-partition/PURE-TUPLE-OBSTRUCTION.md); in particular the method does not collapse the distinction from 9/B. This is a written proof, pending independent review; no Lean formalization is claimed.

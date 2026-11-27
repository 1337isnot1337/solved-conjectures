# A classification of binary-product minimum links

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
A natural sparse ansatz for a minimum-pair component is to have
all traces at one edge choose one point from each of a fixed
matching of vertex pairs. At saturation the local constraints
classify this ansatz completely.

Suppose \(r=5t+3s-2\) in the near-threshold range, with
\(\tau>t\), minimum intersection \(m=t+s\), and thus
\(\delta=0\). Fix an edge \(A\) having at least one minimum
neighbor. Let
\[
\mathcal L_A=\{A\cap B:\ B\ne A,\ |A\cap B|=m\}.
\]
Then all traces in \(\mathcal L_A\) pairwise meet in at least
\(s\) points. For each trace \(Y\) and each \(s\)-subset
\(S\subseteq Y\), there is another trace meeting \(Y\) exactly
in \(S\).

Suppose in addition that there are \(m\) disjoint designated
pairs of vertices in \(A\) such that each trace in
\(\mathcal L_A\) contains one vertex from each pair. Then
\(s=1\), \(t\) is even, and the trace family is exactly one
parity class of the binary \(m\)-cube. In particular that
family has \(2^t\) distinct traces. No binary-product minimum
link with polynomially many traces can occur in this saturated
range. This is a classification under the paired-coordinate
assumption, not a construction of an ambient example.

## Proof

For any trace \(Y=A\cap B\) and \(s\)-set \(S\subseteq Y\),
\(\tau>t\) supplies an edge \(E\) avoiding \(Y\setminus S\).
By [exact petal accounting](NEAR-THRESHOLD-PETALS.md), when
\(\delta=0\) it has \(E\cap Y=S\) and meets each of \(A,B\)
in exactly \(m\) points. Indeed choose a witness for a disjoint
\(s\)-cut of \(Y\), possible since \(m>2s\); the sum of the two
petal upper bounds equals the necessary union, so both witnesses
attain their upper bounds. Therefore \(A\cap E\in\mathcal L_A\)
realizes \(S\). The same argument excludes any edge in the
full hypergraph meeting \(Y\) in fewer than \(s\) points: its
\(Y\)-trace would be contained in some \(s\)-cut \(S\), making
it a witness to \(S\) that fails the equality. This proves the
asserted \(s\)-intersection property.

Encode each paired trace by its binary word in
\(\mathbb F_2^m\). If the bits on the coordinates of \(S\)
are prescribed to agree with a given word and all other
coordinates are prescribed to disagree, there is a unique
possible word. The witness property forces this word to occur.
Thus the nonempty word family is closed under translation by
every weight-\(t\) vector. Their span contains every
weight-two vector: choose two \(t\)-subsets differing only by
exchanging the two designated coordinates, which is possible
since \(1\le t<m\). The span is the entire even subspace
when \(t\) is even, and the full space when \(t\) is odd.
Consequently the trace family is a union of cosets of
the relevant span.

It cannot contain two complementary words since they are
disjoint. This excludes odd \(t\); when \(t\) is even it also
excludes even \(m\) and excludes the union of both cosets.
For odd \(m\), a single even-subspace coset has two words
differing in \(m-1\) coordinates, since \(m-1\) is even.
They agree on just one coordinate, so \(s\)-intersection
forces \(s=1\). Each parity coset does indeed satisfy the
link conditions in this remaining case, independently of
whether any such link can be realized in a full hypergraph.

For \(s=1\), the singleton-trace witness property is the
criticality of the cross-intersecting pair
\((\mathcal L_A,\mathcal L_A)\) in the sense of
[Cherkashin, Definition 1.9](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v25i1p47/7257/).
The extra paired-coordinate form is what makes the translation
argument possible.

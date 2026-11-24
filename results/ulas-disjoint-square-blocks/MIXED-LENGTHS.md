# Squares from blocks of bounded mixed lengths

**Theorem.** For every integer \(L\ge2\) there exists \(R(L)\) such that for every prescribed finite list \(\ell_1,\ldots,\ell_r\in[2,L]\cap\mathbb Z\) with \(r\ge R(L)\), infinitely many collections of \(r\) pairwise disjoint intervals of positive integers with these lengths (with multiplicity) have square product. The claim prescribes the multiset, not the spatial order of lengths. With the notation in [Bennett–van Luijk](https://personal.math.ubc.ca/~bennett/BeVL-Oct18-2011b.pdf), if their ordered inequalities also require the \(k_i\) to occur in prescribed order, this stronger ordering is not claimed.

This extends the common-length [Ulas Conjecture 4](PROOF.md) and establishes the bounded-mixed sufficiency statement for multisets. The introduction of Bennett–van Luijk explicitly discusses a block-count threshold depending only on the maximum length. The proof below takes the elementary polynomial square families and stable residue result from the common-length proof as input.

## 1. A fixed squareclass can be represented late

Fix \(d\ge2\) and a positive squarefree integer \(D>1\). For each completely multiplicative \(\chi:\mathbb N\to\{\pm1\}\) with \(\chi(D)=-1\), there is a prime \(p\mid D\) with \(\chi(p)=-1\). Write \(P\) for the largest prime factor of \(D\), and let \(q\le P\) be the least prime with \(\chi(q)=-1\).

We first show that \(\chi\) has \(\gg_D X\) adjacent changes by \(X\), with a threshold uniform in such \(\chi\). Choose coprime integers \(a>b\ge2\) with \(a/b<2\) and \(\chi(a)=-\chi(b)\) as follows. For \(q\ge3\), take \((a,b)=(q,q-1)\); the prime factors of \(q-1\) are smaller than \(q\) and have sign \(+1\). For \(q=2\), take \((a,b)=(3,2)\) if \(\chi(3)=+1\), and \((4,3)\) otherwise. Thus \(a,b\le\max(P,4)\).

For \(m\in[Y/b,2Y/a]\cap\mathbb N\) coprime to \(ab\), both \(am,bm\) are in \([Y,2Y]\) and their signs are opposite. Each number appears in at most one of these pairs: collisions across the two coordinates require \(a\mid m'\) or \(b\mid m\). The interval for \(m\) has length \((2/a-1/b)Y>0\), so among it there are \(\gg_D Y\) admissible \(m\), uniformly over the finitely many choices for \((a,b)\). Therefore the dyadic mean of \(\chi\) has absolute value at most \(1-c_D\) for all large \(Y\), with \(c_D>0\).

Apply [Matomäki–Radziwiłł, *Multiplicative functions in short intervals*, Theorem 1](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p06-p.pdf). Choose their parameter \(\delta<c_D/4\), and then a fixed integer \(h\) sufficiently large in terms of \(D\), so that for all large \(Y\) at least half the integer starts \(y\in[Y,2Y]\) have short-interval mean within \(c_D/2\) of the dyadic mean. The constants in their theorem are uniform in the function. For each such start, \([y,y+h]\) contains both signs, hence an adjacent change. Each adjacent change is counted by at most \(h\) starts. Taking \(Y=\lfloor X/3\rfloor\) proves the uniform \(\gg_D X\) assertion.

Set \(G(n)=\prod_{i=1}^d\chi(n+i)\). If \(\chi(m)\ne\chi(m+1)\), then for \(n=dm-1\),
\[
G(n)G(n+1)=\chi(dm)\chi(d(m+1))=\chi(m)\chi(m+1)=-1.
\]
At least one of \(G(n),G(n+1)\) is then negative, and any negative start corresponds to at most two adjacent pairs. The sign-change lower bound applied through \(m=\lfloor X/d\rfloor-1\) gives \(\gg_{D,d}X\) negative block starts with all entries at most \(X\).

Fix any lower endpoint \(T\). As in the common-length proof, partition \((T,X]\) into successive full cells of fixed size \(H\) (discard an incomplete cell) and choose independently one random length-\(d\) block per cell. Choose \(H\) large enough in terms of \(D,d\) that the loss from discarding starts crossing cells is smaller than half the uniform lower bound for negative starts. Then for every \(\chi(D)=-1\), the probability that all chosen blocks have positive \(\chi\)-sign is exponentially small in \(X\). Take \(X\) larger than all prime factors of \(D\). A union bound over the \(2^{\pi(X)}=\exp(o(X))\) possible characters gives a selected disjoint family admitting no such character. In prime-exponent parity coordinates this says that the vector of \(D\) belongs to the span of the columns of the selected blocks; otherwise a linear functional would vanish on the columns and take value one on the vector of \(D\). Take the subset specified by an expression of that vector as a sum of columns. Its product has squareclass \(D\), as asserted. For \(D=1\) the empty collection suffices.

## 2. Extend the squareclass to every large count

For each common length \(d\), let \(r_{0,d}>0\) denote the cardinality of the corresponding moving polynomial square family. The common-length result proves a stronger intermediate fact: the residues modulo \(r_{0,d}\) of counts of finite length-\(d\) square products beyond any fixed lower endpoint exhaust all residue classes.

Fix \(D\) and \(T\). Obtain one squareclass-\(D\) collection above \(T\) by §1, with a fixed count \(b\). Above this collection append one fixed square-product collection for each residue class modulo \(r_{0,d}\) as needed to adjust the residue of \(b\). From each adjusted collection append a positive prescribed number of mutually disjoint moving polynomial copies, all later still. Exactly as for the common-length result, this proves that every sufficiently large fixed count \(r\) supports infinitely many collections of disjoint length-\(d\) blocks beyond \(T\) with squareclass \(D\). The threshold may depend on \((D,T,d)\).

## 3. Mixed lengths

For \(d=2,\ldots,L\), let \(n_d\) be the number of blocks of length \(d\) requested. Choose a dominant length \(d_*\) realizing \(\max_d n_d\). For each other length \(d\), write
\[
n_d=s_d+t_d r_{0,d},\qquad 0\le s_d<r_{0,d}.
\]
Choose \(s_d\) fixed disjoint length-\(d\) blocks for each minority length, placing all these fixed blocks consecutively beginning at 1, using increasing order of lengths as a convention. Let the product of these fixed blocks have squareclass \(D\), and their maximum entry be \(T\) (take \(T=0\) if none).

There are finitely many possibilities for \(d_*\) and the residual tuple, so there is a bound \(B(L)\) for all thresholds in §2 used with the resulting triples \((D,T,d_*)\). If \(r\ge (L-1) B(L)\), then \(n_{d_*}\ge B(L)\); thus the dominant blocks can have squareclass \(D\) and lie beyond the fixed minority blocks, in infinitely many ways. For each such collection choose the remaining \(t_d\) polynomial square families of each minority length, placing all their entries past the preceding intervals and each other. Their products are squares. The total product has squareclass \(D^2=1\). The full collections are distinct because precisely the dominant blocks have length \(d_*\), and these vary over infinitely many distinct collections. This proves the theorem.

## Prior scope

This argument uses the same polynomial family and residue mechanism as the proof of Ulas’s Conjecture 4, now with the squareclass reachability supplied by the short-interval theorem. Earlier small-length results include [Bauer–Bennett, Theorem 2.1](https://www.math.ubc.ca/~bennett/Erdos-Graham.pdf), with arbitrary remaining lengths when the shortest is two or the two shortest are three, and [Bennett–van Luijk, Theorem 1.1](https://personal.math.ubc.ca/~bennett/BeVL-Oct18-2011b.pdf), with all lengths five and \(r\ge5\). [Yıldız–Gürel](https://doi.org/10.1007/s00574-019-00158-9) extended polynomial methods and gave examples at six and seven. The theorem here does not control a fixed number of blocks while the maximum length grows.

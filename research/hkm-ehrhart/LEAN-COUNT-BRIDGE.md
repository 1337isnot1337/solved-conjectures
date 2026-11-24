# Higashitani–Kummer–Michałek conjecture

This is a written counting bridge for the [partial Lean checkpoint](../../docs/verification/lean-hkm-ehrhart-partial-20261124.md). It is not the literal geometry theorem, does not add a conjecture entry, and carries no separate priority claim. The [written disproof on main](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/hkm-ehrhart/PROOF.md) gives the geometric membership proof.

Let the graph have (N\ge3) vertices and (t) parts of size two, with all other parts singletons. For a dilation (m\ge0), consider the integer vectors with equal total positive and negative mass (p\le m). The membership bridge identifies those in the polytope by requiring each part to have absolute mass at most (m). At most one part can violate that cap: total absolute mass is (2p\le2m). Singletons never violate it. The resulting count is (C_N(m)-tR_N(m)), where (C_N) omits the caps and (R_N) counts violations for one fixed pair.

## One violating pair

The two deleted coordinates must have opposite signs. Choose their orientation (two possibilities) and call their complement (w), with positive and negative masses (A,B). Put (q=m-p). The deleted absolute values are (m-q-A) and (m-q-B). The cap violation is equivalent to (A+B+2q+1\le m). This bound also makes both recovered absolute values positive, so the construction is reversible.

Choose one of the (N-2) complement coordinates (c). Replace ((c,q)) by ((c_++q,c_-+q)). The inverse uses their difference and their minimum. Their sum is (|c|+2q). Among the other (N-3) coordinates, choose a support of size (h) and (2^h) signs, then subtract one from every chosen absolute value. The resulting (h+2) nonnegative coordinates have sum at most (m-1-h). Introducing a slack entry gives `choose(m+1,h+2)`, with zero when (m-1-h<0). Therefore
```
R_N(m) = 2 sum_{h=0}^{N-3} choose(N-3,h) 2^h choose(m+1,h+2).
```

## Unclipped vectors

The zero vector contributes one. For (p>0), choose positive and negative supports of sizes (r,s\ge1), (r+s\le N), in `choose(N,r) choose(N-r,s)` ways. Choose a positive composition of (p) on each, using ((r-1))- and ((s-1))-subsets of the same (p-1) possible separator positions. For a given union of size (j), choose the first subset in `choose(j,r-1)` ways. The second must contain the complement of the first in the union and pick another (r+s-2-j) positions from the first. The choice of the union contributes `choose(p-1,j)`. Summing over (1\le p\le m) changes this last factor to `choose(m,j+1)` by the hockey-stick identity.

Write (B_{N,j}) for the coefficient of `choose(m,j+1)` in this formula:
```
B_{N,j} = sum_{r,s>=1, r+s<=N, j<=r+s-2}
  choose(N,r) choose(N-r,s) choose(j,r-1) choose(r-1,r+s-2-j).
```
Pascal's identity on each term of (R_N) gives the single-basis coefficient
```
W_{N,t,j} = B_{N,j} - 2t (
    choose(N-3,j) 2^j
    + [j>0] choose(N-3,j-1) 2^(j-1)
  ).
E(m) = 1 + sum_{j=0}^{N-2} W_{N,t,j} choose(m,j+1).
```

The polynomial extension of each basis element is a falling factorial divided by ((j+1)!), so the displayed count has degree at most (N-1). A separate general Ehrhart theorem or six-part convolution is not needed if the literal geometry and these finite bijections are formalized. Either the explicit polynomial or the earlier checked interpolation endpoint can finish the root step.

Independent exact integer evaluation reproduced all 23 values for the two witness graphs. The coefficients (W$ in increasing order of (j) are:
```
N=12, t=6: 120, 4062, 58116, 440658, 1985760, 5645136,
           10389024, 12351222, 9154856, 3846084, 699288
N=11, t=5: 100, 2800, 33040, 204610, 741076, 1652560,
           2297920, 1940950, 910980, 182196
```
The general counting and all-dilation identity are still outside the earlier Lean receipt. A numerical match alone does not discharge the source bridge.

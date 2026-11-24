# Local weighted covariance bounds for the hard-core model

[Zhang–Xu, arXiv:2604.01717v3](https://arxiv.org/abs/2604.01717v3) already resolve the uniform scalar variance conjecture of [Davies–Sandhu–Tan](https://arxiv.org/abs/2505.13396). This note is not a new resolution of that conjecture. It gives a different residual proof that also applies to arbitrary weighted linear statistics and inhomogeneous positive fugacities.

Let \(G\) be a finite simple graph. Sample an independent set \(I\) with probability proportional to \(\prod_{i\in I}\lambda_i\), where all \(\lambda_i>0\). Put \(X_i=\mathbf1_{\{i\in I\}}\), \(P_i=\mathbb EX_i\), \(p_i=\lambda_i/(1+\lambda_i)\), and \(b_i=(1-p_i)P_i\). For arbitrary real weights \(w_i\),
\[
 \operatorname{Var}\!\left(\sum_i w_i X_i\right)\ge
       \sum_i\frac{w_i^2 b_i}{1+\sum_{j\sim i}p_j}.
 \tag{1}
\]
In matrix notation this is a positive diagonal lower bound on the full occupancy covariance matrix, not just a bound along the all-ones vector.

## Proof

Let \(U_i\) be the indicator that no neighbor of \(i\) is occupied. Conditioned on all variables other than \(X_i\), its conditional mean is \(p_iU_i\). The centered residual \(Y_i=X_i-p_i U_i\) thus has mean zero, \(\mathbb E Y_i^2=b_i\), and
\[
 \operatorname{Cov}(X_j,Y_i)=b_i\mathbf1_{\{j=i\}}.
 \tag{2}
\]
For nonadjacent distinct \(i,j\), \(Y_j\) depends only on variables other than \(X_i\), so \(\mathbb EY_iY_j=0\). For an edge \(ij\), if either endpoint is occupied then its neighbor is both unoccupied and unavailable, and the product of residuals vanishes. If neither endpoint is occupied, the product is nonzero only when both are available. Hence
\[
 0\le\mathbb EY_iY_j=p_i p_j\Pr(U_i=U_j=1)
       \le \min(p_j b_i,p_i b_j)
       \le\sqrt{p_i p_j b_i b_j}.
\]
The middle bound uses \(U_i=U_j=1\) implying \(U_i=1,X_i=0\), an event of probability \((1-p_i)\Pr(U_i=1)=(1-p_i)P_i/p_i\), and symmetrically at \(j\). For any real coefficients \(a_i\), using \(2uv\le u^2+v^2\) at each edge then gives
\[
 \operatorname{Var}\!\left(\sum_i a_iY_i\right)
       \le\sum_i a_i^2 b_i\bigl(1+\sum_{j\sim i}p_j\bigr).
\]
Take \(a_i=w_i/(1+\sum_{j\sim i}p_j)\). By (2) the covariance of the weighted statistic and this residual sum is the right-hand side of (1), whereas the residual variance is at most the same quantity. Cauchy–Schwarz proves (1). If all weights vanish the claim is immediate; otherwise that quantity is positive.

## Consequences and scope

1. With a common fugacity \(\lambda\), the choice \(w_i=1\) gives
\[
 \operatorname{Var}(|I|)\ge
   \sum_i\frac{\Pr(i\in I)}{1+(d_i+1)\lambda}.
\]
It implies the known sharp uniform bound: summing \(\Pr(U_i)\ge1-\sum_{j\sim i}P_j\) gives \(\sum_iP_i\ge n\lambda/[1+(\Delta+1)\lambda]\). This and \(\Delta\ge d_i\) give the lower bound \(n\lambda/[1+(\Delta+1)\lambda]^2\). Equality holds for disjoint \((\Delta+1)\)-cliques, as previously proved. Conversely equality in the occupancy bound forces regularity (all \(P_i>0\)) and no nonadjacent pair of neighbors at any vertex, since every independent two-vertex set has positive probability. A graph in which every neighborhood is a clique is a union of cliques.
2. In the heterogeneous model there is also an explicit bound without occupancy terms:
\[
 \operatorname{Var}\!\left(\sum_i w_i X_i\right)\ge
 \sum_i\frac{w_i^2 p_i(1-p_i)\prod_{j\sim i}(1-p_j)}
                  {1+\sum_{j\sim i}p_j}.
\]
Indeed every conditional probability of a neighbor being unoccupied, given any previous subset of neighbors is unoccupied, is at least \(1-p_j\) by conditioning further on all other variables. Multiply these conditional probabilities and use \(P_i=p_i\Pr(U_i)\).
3. For residual covariance \(R=\operatorname{Cov}(Y)\) and \(D=\operatorname{diag}(b_i)\), the block covariance of \((X,Y)\) has off-diagonal block \(D\). In fact \(R\) is positive definite: if \(\sum a_iY_i\) has zero variance, its covariance with each \(X_i\) is zero, so (2) and \(b_i>0\) give all \(a_i=0\). The Schur complement therefore yields the stronger matrix bound \(\operatorname{Cov}(X)\succeq D R^{-1}D\), with \(R\) supported on the graph plus its diagonal. The explicit diagonal bound (1) needs no matrix inverse.

The exact prior homogeneous result is credited to Zhang–Xu. Focused searches for an exact inhomogeneous weighted bound located related occupancy and upper spectral-independence results, not this residual formula. This is a scoped research supplement, not a claim of a new solution to Davies–Sandhu–Tan.

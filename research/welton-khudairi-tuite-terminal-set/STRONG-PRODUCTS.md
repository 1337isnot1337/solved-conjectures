# Terminal sets in strong products

**Theorem.** Let \((X_i,d_i)\) be finitely many nonempty finite metric spaces, and equip their product with metric \(d(x,y)=\max_i c_i d_i(x_i,y_i)\) for arbitrary positive scales \(c_i\). For nonempty subsets \(S_i\subseteq X_i\), the rectangular set \(S=\prod_i S_i\) is terminal if and only if every \(S_i\) is terminal in its factor. In particular, the class of finite graphs admitting terminal sets is closed under arbitrary finite strong products. This is a structural partial result toward [Welton–Khudairi–Tuite's conjecture](README.md), not a claim for arbitrary graphs.

A set is in general position when there are no three distinct points \(x,y,z\) in it with \(d(x,z)=d(x,y)+d(y,z)\). An outside point \(x\notin S\) is covered if that equality holds for some distinct \(y,z\in S\), and a general-position set is terminal if every outside point is covered.

## The coordinate that attains equality

If distinct product points satisfy \(d(x,z)=d(x,y)+d(y,z)\), take any coordinate \(i\) attaining \(d(x,z)\). The inequalities
\[
d(x,z)=c_i d_i(x_i,z_i)\le c_i d_i(x_i,y_i)+c_i d_i(y_i,z_i)
\le d(x,y)+d(y,z)
\]
are all equalities. Each coordinate leg equals its positive product leg, and the three projected points are distinct and collinear. Therefore a product of general-position sets is in general position. The converse follows by fixing all other coordinates. This portion for graphs is the usual proof underlying the product lower bound for the ordinary general position number.

## Both implications for terminal sets

Assume all factors are terminal and \(x\notin S\). For each coordinate let \(\rho_j=\min_{s_j\in S_j}c_jd_j(x_j,s_j)\) and choose \(i\) maximizing \(\rho_j\). Then \(\rho_i>0\). By terminality take \(a_i,b_i\in S_i\) with \(d_i(x_i,b_i)=d_i(x_i,a_i)+d_i(a_i,b_i)\). For \(j\ne i\) choose \(a_j=b_j\) to be a closest point of \(S_j\) to \(x_j\). Thus the \(x,a\) and \(x,b\) distances attain their maxima at \(i\): both \(i\)-coordinate distances are at least \(\rho_i\), dominating all the other distances \(\rho_j\). The \(a,b\) distance is entirely in coordinate \(i\). The factor equality is exactly a product geodesic witness, so \(x\) is covered.

Conversely, suppose \(S\) is terminal and \(x_i\notin S_i\). Choose \(x_j\in S_j\) for every \(j\ne i\). Apply terminality to the resulting \(x\). Its distinct witness points \(a,b\in S\) give an equality as above, and the maximizing coordinate must be \(i\): any other coordinate would have three distinct collinear points inside the general-position set \(S_j\). The projected witness proves that \(x_i\) is covered.

## Graph consequences and scope

The graph distance on a strong product of connected graphs is the maximum of the factor distances: any step advances at most one step in each coordinate, and factor shortest paths can be followed simultaneously, allowing finished coordinates to wait. Disconnected graphs are treated componentwise. If both factors have terminal sets, the smallest terminal-set size in their strong product is at most the product of the two smallest sizes; the largest size is at least the product of the two largest sizes. The assertion concerns rectangular sets and does not classify nonrectangular terminal sets.

The [survey, §2.4.2](https://arxiv.org/html/2501.19385#S2.SS4.SSS2) treats the usual maximum general-position number in the strong product and gives the general-position lower bound from products. Its terminal-set discussion is about the Cartesian product. The [original conjecture paper](https://doi.org/10.22049/cco.2024.29171.1879), the survey, and focused searches for terminality in strong products showed no earlier statement of this exact rectangular criterion. Coordination: [#869](https://github.com/1337isnot1337/solved-conjectures/issues/869).

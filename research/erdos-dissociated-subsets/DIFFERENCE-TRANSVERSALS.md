# Dissociated differences do not guarantee a dissociated transversal

One possible extraction move for [Erdős #963](https://www.erdosproblems.com/963) would pick one number from each of several disjoint pairs, assuming their positive gaps are dissociated. This is false, even with gaps equal to consecutive powers of two. A stronger bounded-relation version does hold.

## Obstruction

Take the four pairs {3,4}, {5,7}, {2,6}, {1,9}. Their gaps 1,2,4,8 are dissociated. For every transversal the following table gives a nontrivial equality of subset sums.

| First three choices | Fourth choice 1 | Fourth choice 9 |
| :--- | :--- | :--- |
| 3, 5, 2 | 3+2=5 | 3+2=5 |
| 3, 5, 6 | 5+1=6 | 3+6=9 |
| 3, 7, 2 | 3=2+1 | 7+2=9 |
| 3, 7, 6 | 7=6+1 | 3+6=9 |
| 4, 5, 2 | 4+1=5 | 4+5=9 |
| 4, 5, 6 | 5+1=6 | 4+5=9 |
| 4, 7, 2 | 4+2+1=7 | 7+2=9 |
| 4, 7, 6 | 7=6+1 | 4+9=7+6 |

Appending pairs {u_j,2u_j} where the positive u_j and 1 are rationally independent gives the same failure for any number of pairs at least four. The old dependencies remain in every transversal; the new gaps preserve dissociation. This does not challenge the Erdős target: the union of the original four pairs contains the dissociated subset {1,2,4,9}.

## A bounded-relation repair

For k≥2 arbitrary disjoint pairs of distinct real numbers, suppose their positive gaps d_i=b_i−a_i have no nonzero integer relation with coefficient magnitudes at most k^k. Then a dissociated transversal exists. In fact, if all transversals fail, the following argument constructs an integer relation on the gaps with coefficient magnitudes at most k^k.

Work formally in Q^(2k) with one coordinate vector for each endpoint. For each transversal, choose a nonzero ternary relation witnessing its failure, expressed in these formal coordinates. Let R be their rational span. Under the linear functional sending each endpoint coordinate to its actual value, R maps to zero.

In Q^(2k)/R every choice of one endpoint from each pair is linearly dependent. Let v_i be the formal difference of the two endpoint coordinate vectors of the ith pair. Their images in the quotient must be linearly dependent. Indeed, if their kth exterior product were nonzero, expanding it by multilinearity would express it as a signed sum of exterior products of the endpoint transversals, all of which vanish. (The argument also covers quotient dimension less than k.)

Choose a basis of R from the given ternary witnesses and form the integer matrix with those basis vectors and all the v_i as columns. There is a minimal linearly dependent set of columns containing at least one v_i, since the R columns are independent and the images of the v_i are dependent. If its size is s, take s−1 rows giving rank s−1 on these columns. The alternating maximal minors give an integer relation, and no coefficient in this relation is zero because the selected columns were minimally dependent. Each R column has at most k nonzero entries of size one. Each difference column has exactly two entries of size one. Thus every coefficient, being a determinant of size at most 2k, has magnitude at most (√k)^(2k)=k^k by Hadamard's inequality. Apply the actual-value linear functional to the entire relation. The R columns vanish and at least one gap coefficient is nonzero, yielding the promised obstruction among the d_i.

The bound is not asserted to be sharp; k^k keeps the algebraic point separate from optimizing cofactors. Distinct gap valuations only guarantee the weaker ternary dissociation and thus cannot justify this move by themselves.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).

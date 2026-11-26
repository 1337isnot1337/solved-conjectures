# All vertex-transitive balanced colorings contain rainbow six-cycles

**Theorem.** Let \(n=6t+1\). In every completely balanced six-coloring of \(K_n\) with a transitive color-preserving automorphism group, there are \(\Omega(n^6)\) labeled rainbow six-cycles for all sufficiently large \(n\), uniformly over the automorphism group and the coloring. No regular subgroup is required.

This advances the [Cayley-case theorem](ALL-CAYLEY.md) to all transitive color-preserving actions. It does not settle arbitrary balanced colorings in the original [Erdős–Pyber–Tuza clause](https://www.erdosproblems.com/811).

## The remaining small representation degrees

Use the balanced kernels \(W_i\), mean-zero operators \(B_i\), isotypic blocks \(I_d\otimes M_i\), and energy bounds from [the Cayley-case proof](ALL-CAYLEY.md). That proof controls all \(d\ge5\) and all \(d=1\) without using any other hypothesis on the action. We remove its remaining assumption on degrees \(2,3,4\). The stabilizer \(H\) of one vertex has index \(n\), and the multiplicity of an irreducible \(\pi\) is \(\dim \pi^H\) by Frobenius reciprocity.

**Complex type.** If \(\pi\) is not equivalent to its conjugate, its conjugate summand has identical Hilbert–Schmidt energy for every \(B_S\), since the \(B_i\) are real. Hence the block norm bound is
\[
\|M_S\|_{\mathrm{HS}}^2\le |S|(6-|S|)/(2d).
\]
For degrees three and four, the six-matrix estimate applies with effective parameter \(2d\ge6\). For degree two, the multiplicity cannot be two: then \(H\) is in the kernel, so the order of the image divides odd \(n\), contradicting divisibility of this image order by irreducible degree two. The block is therefore scalar when present, and the scalar bound below applies with effective parameter four.

**Quaternionic type.** Its representation degree is even, and the multiplicity in a real representation is even. Degree two cannot occur: its multiplicity would have to be two, giving the same contradiction by trivial action of \(H\). In degree four, multiplicity four is excluded by the same argument using degree four. When the multiplicity is two, each real symmetric \(B_i\) has one scalar eigenvalue on the multiplicity space. Indeed its eigenspaces are real invariant subspaces; on each eigenspace the multiplicity of a quaternionic type is even. Two copies cannot split between distinct eigenvalues. The scalar bound below applies with effective parameter eight (and parameter four would already suffice).

**Real type in degree two.** The image \(Q\) is a finite irreducible subgroup of \(O(2)\), so it is dihedral: the rotation subgroup is cyclic, and lacking reflections would make the complex representation reducible. The image of \(H\) fixes a nonzero vector. It must be the order-two group fixing a line, since it has odd index in \(Q\) and the full \(O(2)\) point stabilizer has order at most two. Thus \(Q\) is the dihedral group of order \(2k\), with \(k\) odd, and the multiplicity is one. A unit \(H\)-fixed vector \(v\) gives the real spherical function \(\langle v,\pi(g)v\rangle\), whose distribution on the orbit is uniform on the \(k\) cosine values of the regular \(k\)-gon, with repetition. This function is an eigenvector of each color operator because the multiplicity is one. Evaluating at the basepoint gives the eigenvalue as the uniform row average of \(6W_i\) times this cosine (the spherical function equals one at the basepoint). Taking absolute values and summing over \(i\) now gives average absolute eigenvalue at most \(2/3\), by the [odd polygon computation](FOURIER-CAYLEY.md). Thus it satisfies exactly the scalar estimate already used for dimension one.

**Real type in degree three.** If the fixed space of the image of \(H\) had dimension at least two, that image would embed in \(O(1)\) and have order at most two. Its index in \(Q\) divides \(n\) and is coprime to three. Therefore \(3\nmid |Q|\), contrary to the irreducible degree dividing \(|Q|\). The multiplicity is at most one, so the scalar estimate applies with parameter three.

**Real type in degree four.** The fixed space of the image of \(H\) has dimension at most one, by the geometric lemma below, since its index in the faithful orthogonal image is odd. Thus the scalar estimate applies with parameter four.

The scalar estimate used in these cases is elementary. The real eigenvalues \(a_1,\ldots,a_6\) sum to zero. With \(S\) the set of positive ones,
\[
\frac16\sum_i|a_i|=\frac13\sum_{i\in S}a_i
\le\frac13\sqrt{|S|(6-|S|)/d_{\rm eff}}
\le 1/\sqrt{d_{\rm eff}}\le2/3
\]
as soon as the applicable dimension parameter \(d_{\rm eff}\ge3\). Here the subset bound is the isotypic energy bound; in the conjugate-pair or repeated-scalar case its effective dimension is multiplied as described above. The arithmetic-geometric estimate in the earlier proof applies. We have therefore covered every block with the same coefficient, giving the same uniform rainbow-walk density \(6^{-6}/81\) and, after dropping the repeated vertices, \(\Omega(n^6)\) simple cycles.

## The real four-dimensional lemma

**Lemma.** Let \(Q\) be a finite irreducible real orthogonal group in dimension four, with irreducible complexification. No odd-index subgroup \(K\le Q\) can fix a two-dimensional plane pointwise.

Suppose otherwise, and take a Sylow two-subgroup \(P\) of \(K\), also Sylow in \(Q\). It fixes that plane. Moreover \(|P|\ge4\), by divisibility of the faithful irreducible complex degree four into \(|Q|\).

First \(Q\) cannot contain any reflection. To see this, let \(N\) be the normal subgroup generated by all its reflections. Their normal vectors span the whole space by irreducibility. The irreducible components of the resulting finite reflection group are permuted transitively by \(Q\), since a union of components from an orbit would span an invariant subspace. There are three possibilities for equal component dimensions in dimension four:

- One rank-four component. The finite irreducible rank-four reflection groups are \(A_4,B_4,D_4,F_4,H_4\). In type \(A_4\) a Sylow two-subgroup of \(S_5\) on its standard representation has fixed space of dimension one: its orbits on five letters have sizes four and one, and the constant direction has been removed. All other types contain \(-I\). For \(B_4,F_4\) this follows from the coordinate reflections, for \(D_4\) from the four orthogonal root directions \(e_1\pm e_2,e_3\pm e_4\), and \(H_4\) contains a \(D_4\) root subsystem. Hence in each case the Sylow two-subgroup of \(N\), namely \(P\cap N\), has fixed dimension at most one.
- Two rank-two components. \(P\cap N\) is a product of the two dihedral reflection groups' Sylow two-subgroups. Each has fixed dimension at most one on its plane, since it is nontrivial. The transitive permutation of the two components is an index-two quotient of \(Q\), so some element of \(P\) swaps them. This swap cuts the common fixed space of dimension at most two to dimension at most one: the component projections of a fixed vector determine each other.
- Four rank-one components. Then \(-I\) is the product of the four component reflections and lies in the Sylow two-subgroup of \(N\).

All cases contradict the plane fixed by \(P\). This uses the [classical finite reflection group classification](https://www.cambridge.org/core/books/reflection-groups-and-coxeter-groups/2910C1E00877D33A04A512791B6EDD72) and the [explicit \(D_4\) subsystem of \(H_4\)](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/42422/454-22-3-425_22n3p425.pdf?sequence=1).

Now \(K\subset SO(4)\), since an orientation-reversing operator fixing the plane would reflect in its two-dimensional orthogonal complement and be a reflection on the full space. Odd index then gives \(Q\subset SO(4)\). Also \(K\), hence \(P\), is cyclic, acting by rotations on the complement of the fixed plane.

The group \(SO(4)\) acts on each three-dimensional space of self-dual and anti-self-dual two-forms through an \(SO(3)\) representation. The image of \(Q\) in either \(SO(3)\) has cyclic Sylow two-subgroup, since it is a quotient and the Sylow two-subgroup of \(Q\) is cyclic. The [finite rotation group classification](https://link.springer.com/article/10.1365/s13291-024-00291-5) shows that each image preserves an unoriented axis: the cyclic and dihedral groups do so, while the three polyhedral groups have noncyclic Sylow two-subgroups.

Choose an oriented orthonormal basis \(e_1,e_2,e_3,e_4\) with \(e_1,e_2\) in the plane fixed by \(P\). A generator of \(P\) acts as a rotation of order at least four in the complementary plane. In each of the self-dual and anti-self-dual spaces the induced action fixes the line spanned by \(e_1\wedge e_2\pm e_3\wedge e_4\) and rotates the transverse plane by the same angle up to sign, as one sees by applying the rotation to the basis two-forms. The rotation angle is neither zero nor \(\pi\), so this is its unique real invariant line. Thus it must be the axis preserved by the corresponding image of \(Q\). The action on each of these lines gives a sign character of \(Q\) trivial on \(P\). Since \(P\) is full Sylow, the character is trivial on \(Q\). The two forms themselves are therefore fixed by \(Q\), and so is their half-sum \(e_1\wedge e_2\). Its supporting plane is invariant, contradicting irreducibility. This proves the lemma.

## Attribution and scope

The small orthogonal group classifications are classical; the use of the stabilizer multiplicities and the six-matrix count is the present research step. A bounded search covered the original chapter, later completely balanced colorings, and the vertex-transitive, Cayley, and association-scheme formulations without finding an earlier theorem covering every transitive color-preserving action. General, possibly asymmetric six-colorings are unaffected by the group representation argument. Coordination: [issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870).

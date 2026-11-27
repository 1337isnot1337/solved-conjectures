# Carry obstructions for Erdős’s dissociated-subset conjecture

[Erdős #963](https://www.erdosproblems.com/963), from [Erdős 1965, p. 188](https://renyi.hu/~p_erdos/1965-02.pdf), asks whether every n-element real set contains a dissociated subset of size at least floor(log₂ n). For a finite positive set P write d=d(P) for the largest dissociated subset size. The equivalent positive-set assertion is |P|≤2^d−1: passing to absolute values preserves dissociation dimension, and the symmetric set consisting of zero and both signs of P attains size 2|P|+1.

This note proves the bound for a class defined by the bounded-coefficient relations of a maximum dissociated subset, and identifies what an exact parity injection would have to overcome. It neither proves the unrestricted bound nor treats a fixed finite order as a result.

## The criterion

Let B={b₁,…,b_d}⊆P be a maximum dissociated subset. Say B is 2-dissociated if no nonzero integer vector c with ||c||∞≤2 has ∑c_i b_i=0. For any nonzero relation r with ||r||∞≤3 put

    C(r) = {j : |r_j|=3}.

If B is 2-dissociated and either there are no nonzero relations with ||r||∞≤3, or the sets C(r) of all such relations have nonempty common intersection, then |P|≤2^d−1. This includes the case where the bounded relations span at most one rational dimension: if the dimension is one, its primitive integer generator has sup norm exactly three (using 2-dissociation), and the only nonzero bounded relations are its two signs.

More locally: if two elements repeat an unsigned support S, the collection of all C(r) that are contained in S contains at least two distinct members and has empty intersection. Each carry relation in this collection relevant to a swap has all its coordinates outside S in {−1,0,1}.

## Proof

Every a∈P has a ternary representation v(a)∈{−1,0,1}^d on B, by maximality of B. It is unique since B is 2-dissociated: the difference of two representations would be a 2-relation. Send a to its nonempty unsigned support S(a)={i:v(a)_i≠0}. It suffices to show this map is injective. A repeat cannot include an element of B, because singleton support only gives one positive value. Suppose distinct a,a' repeat S.

For any i∈S, replace b_i by both a and a'. The resulting d+1-element set must have a nontrivial ternary relation by maximal size d. Substitute the coordinate vectors v=v(a), v'=v(a'). The resulting coefficient vector r on B has sup norm at most three. It is not the zero vector. Indeed, in the formal coordinates, a relation involving only retained unit vectors is impossible. If just one of a,a' occurs, its ith coordinate is nonzero and cannot cancel. If both occur, cancellation at i fixes their relative signs; because v,v' have the same support and are not equal or opposite, at some other coordinate their signed sum then has magnitude two and cannot be canceled by one retained unit vector. Thus every actual dependence in the swap gives a nonzero bounded relation r on B.

By 2-dissociation there is at least one coordinate of magnitude three. Since both substituted vectors vanish off S, all off-S coefficients have magnitude at most one. At i no retained unit vector was available, so |r_i|≤2. Hence ∅≠C(r)⊆S\{i} for **each** i∈S. This is the asserted local condition, and excludes a repeat if all bounded 3-relations share a carry coordinate. There are at most 2^d−1 distinct nonempty supports, completing the proof.

## An exact obstruction to relying on 2-dissociation alone

Take P={1,3,9,16,20,27} and B={1,3,9,27}. The powers of three are 2-dissociated: the largest nonzero coefficient term dominates the sum of all smaller terms. The two extra values have the same full support, since 16=1−3−9+27 and 20=−1+3−9+27. Yet B is maximum. Every five-element subset is dependent, as witnessed by these four ternary equalities:

    16+20=9+27          (omitting 1 or 3)
    20=1+3+16           (omitting 9 or 27)
    3+27=1+9+20         (omitting 16)
    3+9+16=1+27         (omitting 20)

This is not a counterexample to Erdős. It excludes the stronger claim that a 2-dissociated maximum subset always yields an unsigned-support injection. Adding any number of positive reals rationally independent together with 1 preserves the obstruction at arbitrarily large dissociation dimension, since the new coordinates are independent of the old ones and increase both maxima additively.

## Prior work and gap

The [current problem audit](https://erdosproblems.ai/wiki/research/erdos_963/proof_sketch) records near-logarithmic global bounds, arbitrary-rank residue-quotient arguments, and the stronger bounded intrinsic rank-defect cases. The absence of low-coefficient relations on a selected maximum subset is a different sufficient hypothesis; it does not follow just from maximal dissociation. In particular an interval can have maximum dissociation dimension logarithmic in its length but cannot have a 3-dissociated subset that large when its span is short. The point to pursue is how to charge repeated supports to the family of forced incompatible carries, not to assume they are absent.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).

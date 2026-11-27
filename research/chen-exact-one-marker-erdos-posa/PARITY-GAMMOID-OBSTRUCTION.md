# Prescribed-parity root linkage is not a gammoid

An obstruction for the approach to
[Chen's prescribed-parity conjecture #1012](https://github.com/1337isnot1337/solved-conjectures/issues/1012).
The parity-free proof uses an ordinary terminal-to-root gammoid.
Replacing independent sets there by independently parity-linkable
terminal sets does not preserve the augmentation axiom, even if
all desired parities are even.

Given terminals \(A\) and roots \(Z\), call \(U\subseteq A\)
linkable when its vertices have vertex-disjoint even-length
simple paths to distinct roots. We consider first-hit linkability
(arms avoid \(Z\) internally) and then the variant that permits
internal roots.

## Arbitrarily bad augmentation for first-hit arms

For any \(m\ge2\), form a spine
\[
x,y_1,u_1,y_2,u_2,\ldots,u_{m-1},y_m,r_0 .
\]
Its \(x\)-to-\(y_i\) distance is \(2i-1\) and its
\(x\)-to-\(r_0\) distance is \(2m\).
For each \(i\ge1\) attach the private arm \(y_i-w_i-r_i\).
The terminals are \(A=\{x,y_1,\ldots,y_m\}\) and the roots
are \(Z=\{r_0,r_1,\ldots,r_m\}\). Extra structure can be
attached to the graph only through \(Z\). In particular,
the roots may all belong to the same side of an arbitrarily
large bipartite root core. For example, include them in one side
of \(K_{M,M}\) and use otherwise fresh vertices for the core.

The \(m\) private arms show that all the \(y_i\)'s are linkable.
The full spine shows that \(x\) is linkable by itself.
But the first-hit path from \(x\) to \(r_i\), \(i\ge1\), has
length \(2i+1\), which is odd. The unique even first-hit
path is therefore the spine to \(r_0\); it contains every
other terminal. Thus \(\{x\}\) admits no augmentation at
all, although there is an independent set of size \(m\).
In particular even a uniform bounded-rank relaxation of
matroid augmentation, based on comparing maximal set sizes,
fails for these root-avoiding parity arms.

## Failure still occurs if internal roots are allowed

Use the path \(x-y-z-u-r_1\) and the arm \(y-w-r_2\), as above
with two terminals on consecutive, rather than alternate,
spine positions. Add the length-two core path \(r_1-v-r_2\).
Use terminals \(x,y,z\) and roots \(r_1,r_2\). Even paths
\(y-w-r_2\) and \(z-u-r_1\) are disjoint.
The even path \(x-y-z-u-r_1\) shows that \(x\) alone
is linkable. Every path from \(x\) of positive length uses
\(y\), so \(x\) cannot be linked with \(y\).
If \(z\) is removed, the remaining graph is a tree in which
the distances from \(x\) to \(r_2\) and \(r_1\) are,
respectively, three and five. Thus every even path from \(x\)
to either root uses \(z\), and \(x\) cannot be linked with
\(z\) either. Augmentation fails.

These examples are not counterexamples to Chen's conjecture.
They rule out copying the parity-free step that contracts a
maximal union of whole pairs and uses parallel classes of
remaining terminals. The unrestricted packing-covering proof
may still be possible using a different invariant or added
parity structure on the root model.

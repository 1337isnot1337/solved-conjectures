# Steady frequencies of a fixed phase truncation

For a fixed memory length, there are only finitely many exact output
frequency regimes, even when the phase angle is irrational.

**Lemma.** Let a deterministic finite-state machine read one letter at a
time from a two-sided Sturmian shift of slope $\alpha$ and emit one
letter per step. Every one-sided run, from any initial state and any
point of the input shift, has limiting factor frequencies. While the
machine and slope are fixed, there are finitely many possible limiting
frequencies for any given output factor. Every such frequency has the
form $(a+b\alpha)/r$ for integers $a,b$ and a positive integer $r$ at
most the number of states.

## The eventual state bundle

Let $X$ be the two-sided input shift, $T$ its shift map, and $Q$ the
finite set of states. For a word $w$ in the input language, write
$`D_w:Q\to Q`$ for the transformation produced by reading $w$. Choose
an input word for which the image of $D_w$ has minimum cardinality $d$.
By uniform recurrence a fixed length $L$ suffices to find this word in
every input factor of length $L$. All transformations from input
factors of length at least $L$ therefore have rank exactly $d$.

At an input point $x$, let $Q_x$ be the image of the transformation
from reading the previous $L$ letters of $x$. Then $Q_x$ has $d$
elements, depends on a finite input block, and contains the actual
state of every run after its first $L$ steps. The next-letter map
sends $Q_x$ onto $Q_{Tx}$. Indeed, the former image is the image of
a word of length $L+1$, hence has $d$ elements. It is contained in
the latter image because the latter uses only the last $L$ letters
of that word. The next-letter map is thus bijective between the
two fibers.

On $`Y=\{(x,q):x\in X,\ q\in Q_x\}`$ the joint shift of input and state
is a homeomorphism. To decompose it, take any nonempty closed minimal
invariant subset $C\subseteq Y$. Its projection onto $X$ is all of $X$.
For each $k$, the set of input points above which $C$ has at least
$k$ states is closed and invariant. Closedness follows by taking a
finite union over choices of $k$ distinct states. Invariance follows
from the bijection of fibers. Minimality of $X$ makes the cardinality
of the $C$-fiber a constant $r$.

For a fixed state $q$, membership of $(x,q)$ in $C$ is a clopen
condition on $x$. It is closed because $C$ is closed. The complement is
closed because it is the condition that some $r$ other distinct states
are in the $C$-fiber. Since the alphabet and the state set are finite
and the shift space is compact, a bounded input block decides all
these conditions. Consequently $C$ is clopen in $Y$. Continue on its
complement until the space has been partitioned into at most $d$
minimal components.

## Frequencies on each component

On a component $C$ take the measure obtained by using the Sturmian
invariant measure on $X$ and the uniform measure on each $r$-point
fiber. The fiber bijections make this measure invariant. To see
uniqueness, code $C$ by the bi-infinite sequence of state and input
pairs. This is a conjugacy onto a minimal subshift, since it retains
$x$ and the state at time zero. A component cylinder of length $n$
contains the lift from a specified initial state of some input cylinder
of length $n+2R$, where the constant $R$ is large enough for the
clopen membership test above. Its measure is at least $1/r$ times
that input cylinder's measure. The Sturmian input satisfies
Boshernitzan's condition. The cylinder bound transfers that condition
to $C$ by taking $n+2R$ along its witnessing lengths. The minimal
component is uniquely ergodic by Boshernitzan's theorem. The two
properties of Boshernitzan's condition used here are stated in
[Lemma 3.8 and Remark 3.9 of arXiv:2606.30013v1](https://arxiv.org/html/2606.30013v1#S3).

By unique ergodicity the frequency of any output factor equals the
measure of its clopen occurrence set. Conditional on the input,
the occurrence condition for a specified state depends on only
finitely many input letters. A cylinder measure for a Sturmian word
is a sum of lengths of arcs whose endpoints are integer multiples
of $\alpha$ modulo 1, so it belongs to $\mathbb Z+\alpha\mathbb Z$.
Summing those cylinder measures with weight $1/r$ proves the formula.
The run's finite transient does not affect its frequencies.

## Application to the Ulam phase model

The exact finite phase model in [the phase note](phase-confinement.md)
is obtained by putting the phase residue into the finite state and
taking $`\alpha=\{m\theta\}`$, where $m$ clears the endpoint
denominators. For that model each component's density therefore
belongs to $\mathbb Q+\theta\mathbb Q$. This also identifies a needed
stability fact for approximate phase results. Small corrections can
move the actual state between different components, so convergence
requires information about those transitions.

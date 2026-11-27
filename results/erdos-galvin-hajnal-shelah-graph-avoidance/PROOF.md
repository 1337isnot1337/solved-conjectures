# Erdős–Galvin–Hajnal’s Shelah-graph avoidance problem

**Relative to the consistency of ZFC, the existence statement is independent over ZFC with GCH.**
[Research issue #1037](https://github.com/1337isnot1337/solved-conjectures/issues/1037).

Problem 4 of [Erdős–Galvin–Hajnal (1975), §6](https://www.renyi.hu/~p_erdos/1975-24.pdf)
asks whether ZFC proves, or CH implies, that there is an
$`\aleph_1`$-chromatic graph on $`\omega_1`$ that contains
no Shelah graph. Their Definition 6.4 calls a graph on
$`\aleph_1`$ vertices a Shelah graph if some countable set
has infinitely many neighbors at each vertex outside it.
The answer is no to both implications, relative to the
consistency of ZFC. The original paper already supplies
the positive consistency direction under $`V=L`$.

The step here is a ZFC club decomposition converting the
avoidance statement to the existence of an uncountably
chromatic Hajnal–Máté graph on $`\omega_1`$. The known
consistency theorem about the latter then answers the
negative direction without any new forcing.

## 1. The avoidance condition

Let $`G=(\omega_1,E)`$, and write $`N(v)`$ for the neighbors
of $`v`$. Then $`G`$ contains no Shelah graph if and only if
for every countable $`X\subseteq\omega_1`$, the set

```math
\{v\notin X: |N(v)\cap X|=\aleph_0\}
```

is countable. If that set is uncountable, its union with
$`X`$ induces a Shelah graph. Conversely, restricting a
Shelah subgraph's vertices cannot add any edges, so its
countable set also witnesses failure of this condition in
$`G`$. Since each countable subset is bounded in $`\omega_1`$,
it is enough to verify the condition for initial segments
$`X=\alpha<\omega_1`$.

Call a graph on $`\omega_1`$ **of Hajnal–Máté type** if for
each vertex $`\xi`$ the set of its lower neighbors is finite
or an increasing $`\omega`$-sequence cofinal in $`\xi`$.
This is equivalent to having only finitely many lower
neighbors below any $`\eta<\xi`$: if infinitely many
lower neighbors remained bounded strictly below $`\xi`$,
or had order type more than $`\omega`$, this property
would fail. (If the lower neighbors are finite, no
cofinality requirement is imposed.)

## 2. Club decomposition

Suppose $`G`$ contains no Shelah graph. For every
$`\alpha<\omega_1`$ choose a countable ordinal $`f(\alpha)>\alpha`$
such that

```math
v\ge f(\alpha)\quad\Longrightarrow\quad
 |N(v)\cap\alpha|<\aleph_0 .
```

This is possible by §1. The set of nonzero limit ordinals
$`\delta`$ such that $`f(\alpha)<\delta`$ for every
$`\alpha<\delta`$ is club. To see unboundedness, iterate
the operation of passing to an ordinal strictly above
the current ordinal and all $`f`$-values below it
for $`\omega`$ steps and take their supremum. For
closedness, any $`\alpha`$ below a limit of closure
points is below one of them. Adjoin zero and enumerate
this club increasingly and continuously by
$`\langle\gamma_\xi:\xi<\omega_1\rangle`$.

For each interval $`I_\xi=[\gamma_\xi,\gamma_{\xi+1})`$
enumerate its vertices injectively by natural numbers.
For each slot $`i<\omega`$, use at most one vertex per
interval, namely the vertex assigned $`i`$ if there is
one. Transport the induced graph on those vertices to
their interval indices $`\xi`$; add isolated vertices
for missing indices, making a graph on $`\omega_1`$.

Every transported graph is of Hajnal–Máté type. Indeed,
take a nonisolated slot vertex $`v\in I_\xi`$, and
$`\eta<\xi`$. All slot vertices at indices below
$`\eta`$ have original ordinal $`<\gamma_\eta`$.
Since $`f(\gamma_\eta)<\gamma_\xi\le v`$, only finitely
many of them neighbor $`v`$. This proves the finite
bounded-initial-segment property at $`\xi`$, including
successor indices. The one-vertex-per-slot step is
essential: a single previous interval may contain
infinitely many neighbors at a successor step.

If every Hajnal–Máté-type graph is countably colorable,
color each transported slot by $`\omega`$. Color the
original vertices by the pair of slot and slot color.
An edge across slots is separated by its first
coordinate, while an edge within a slot is separated
by its second. Thus $`G`$ is countably colorable.

Conversely, every graph of Hajnal–Máté type avoids
Shelah graphs: for any countable $`X`$, pick an ordinal
$`\alpha`$ strictly above its elements. A vertex strictly
above $`\alpha`$ has only finitely many neighbors in
$`X`$, and there are only countably many other vertices.
We conclude in ZFC that the existence of a Shelah-free
$`\aleph_1`$-chromatic graph on $`\omega_1`$ is equivalent
to the existence of an uncountably chromatic
Hajnal–Máté-type graph on $`\omega_1`$.

## 3. The two models

* **Positive.** $`V=L`$ implies GCH. The original paper's
  Theorem 6.6 and the following argument give a ladder
  graph with no stationary independent set: each lower
  neighborhood is empty or a cofinal increasing
  $`\omega`$-sequence. It is uncountably chromatic
  because $`\omega_1`$ cannot be covered by countably
  many nonstationary sets. By §2 the graph avoids Shelah
  graphs. This direction is due to the original authors.
* **Negative.** [Avraham–Devlin–Shelah (1978)](https://shelah.logic.at/files/95244/81.pdf),
  Theorem 2.1, proves that under SAD every Hajnal–Máté
  graph in exactly the finite-or-cofinal sense of §1 is
  countably colorable. Their definition of SAD includes
  GCH; §3 constructs its model over $`L`$, relative to
  ZFC. By §2 every Shelah-free graph on $`\omega_1`$
  in that model is countably colorable. In particular
  CH cannot imply the requested existence.

Both models have CH and indeed GCH. Independently of
the GCH refinement, the classical countable colorability
of Hajnal–Máté graphs under $`\mathrm{MA}_{\aleph_1}`$
also gives a negative model by the same reduction.

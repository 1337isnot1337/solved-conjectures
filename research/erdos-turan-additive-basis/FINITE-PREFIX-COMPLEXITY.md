# Erdős–Turán additive basis conjecture

**Partial research.** Bounded two-term representation counts force exponential grammar size on the finite numeral prefixes of any hypothetical counterexample. The grammars may change at every prefix length. The proof also bounds the width of read-once branching programs, including programs with different digit orders on different paths. The unrestricted conjecture remains open. [Tracking issue #379](https://github.com/1337isnot1337/solved-conjectures/issues/379)

## Target and sources

The conjecture asks whether every asymptotic additive basis of order two in the nonnegative integers has unbounded two-term representation counts. We count ordered pairs. This differs by at most a factor of two from counting unordered pairs. Li and Zhang state the exact conjecture and give a density theorem. Bell, Hare and Shallit characterize automatic additive bases. The earlier [fixed-grammar checkpoint](README.md) gives power-law representation spikes for nonsparse multiple context-free numeral languages. The finite result below concerns grammar size at each length, so it also applies to a different grammar at every length. A November 24, 2026 primary-source search located no earlier statement of these finite-size bounds and no resolution of the unrestricted conjecture. Priority for the finite result is provisional. [Erdős and Turán, p. 215](https://combinatorica.hu/~p_erdos/1941-01.pdf#page=4) · [Li and Zhang](https://arxiv.org/abs/2605.30922) · [Bell, Hare and Shallit](https://arxiv.org/abs/1710.08353) · [Seki et al., multiple context-free grammars](https://nessie.ilab.sztaki.hu/~kornai/2023/Hopf/Resources/seki_1991.pdf)

## A finite counting bound

Fix an integer base $b\ge2$ and a digit length $L\ge1$. A word of length $L$ denotes its ordinary positional value, with zero padding allowed. Let $S$ be the set of values of the length-$`L`$ words of a nondeleting linear multiple context-free grammar. Write $G$ for its number of nonterminals plus its number of productions, $f$ for its maximum tuple arity, and $R$ for the maximum number of children in a production. A production concatenates terminal strings and labelled components of its children. Every child component appears exactly once. The start symbol has arity one.

Let $B=\max_n r_S(n)$, where $r_S(n)$ counts ordered pairs summing to $n$. If $S$ is nonempty and $d=\lfloor\log_2 B\rfloor\ge1$, then

```math
|S|\le \bigl(2^8 G^6 (L+1)^{2f(R+4)}\bigr)^d .
```

For $d=0$, there is at most one word. If the original grammar permits deletion of components, the projection normalization of the preceding checkpoint preserves the start language and uses at most $2^fG$ nonterminals and productions together, with the same bounds on arity and number of children.

### Independent substitutions

Suppose some accepted word admits $h$ independent replacements. Each has two different assignments to a fixed subset of the digit positions, and the $h$ subsets are disjoint. Assume all $2^h$ combinations are accepted. The resulting words have distinct values. Pair every choice with its bitwise complement. The digit sums at each position are independent of the choices, so all pairs have the same sum, including in the presence of carries. Hence $2^h\le B$. This gives $h\le d$.

### States and cuts in a derivation

For each word, choose a complete derivation tree. Give each node a state consisting of its nonterminal and the ordered list of absolute half-open intervals occupied by its output components in the final word. Linearity and nondeletion make the intervals of a node's components disjoint as sets of digit positions, and make the positions belonging to children disjoint. Empty intervals are allowed.

Mark a node when its nonterminal generates at least two different tuples with its vector of component lengths. Marking propagates from a child to its parent, since a replacement in one child changes the parent tuple. The marked nodes form a rooted subtree if nonempty. If the root is unmarked there is at most one word of length $L$ in the whole language. Otherwise let $t$ be the number of leaves of the marked subtree. These leaves can be replaced independently, so $1\le t\le d$.

Partition the marked subtree into chains of one-marked-child steps. A chain starts at the root or at a marked child of a branching node, and ends at a branching node or a marked leaf. Chains of length zero are included. There are at most $2t-1$ chains and at most $t-1$ branching nodes. These bounds follow because the sum of the marked outdegrees minus one over branching nodes is $t-1$.

An interval of edges in a chain is ambiguous if, between the two endpoint states, there is a second possible assignment of terminal digits to the positions of the ancestor outside those of the descendant. Count all derivation contexts with these endpoint states and the same placement of the descendant components. That placement is specified by their ordered absolute intervals. Every such context can be substituted while leaving the descendant derivation unchanged. Any collection of edge-disjoint ambiguous intervals in the chains gives independent replacements, jointly with the $t$ marked leaves. Within a chain, the changed digits belong to disjoint differences of nested position sets. Between chains, an earlier context stops at the branching node before any of the later chains, or the chains lie in distinct subtrees. The leaf positions are excluded from all of the contexts. Thus the sum of the maximum numbers of disjoint ambiguous intervals over the chains is at most $d-t$.

In each chain select a set of edges that meets every ambiguous interval, using no more edges than the maximum number of disjoint ambiguous intervals. The usual greedy rule selects the right endpoint of an interval with earliest right endpoint, removes the intervals it meets, and repeats. The intervals used to choose these endpoints are disjoint, proving the bound. Across all chains there are at most $d-t$ selected edges.

### Reconstructing the word

Record the ordered tree of chains, with a distribution of selected edges across the chains. Record the states of the chain endpoints and of the endpoints of each selected edge, in order. There are at most $2(2t-1)+2(d-t)\le4d$ state records. At each branching node, marked leaf and selected edge, record the production and the lengths of every component of every child. At most $(t-1)+t+(d-t)\le2d$ production records are needed.

These data determine the word. At a recorded production, the rule and lengths place each child component. The tuple of any unmarked child of those lengths is unique. At a selected edge the unique marked child gives the continuation of the chain, and at a branching node the marked children give the next chains in their rule order. The portions of chains between recorded edges and endpoints have no ambiguous interval. Their terminal digits are therefore determined by their endpoint states. Evaluating these contexts with the recorded productions and unique unmarked tuples reconstructs the start word. This reasoning counts words rather than derivations and works for ambiguous grammars.

There are fewer than $2^{4d}$ ordered trees of chains of order at most $2d$, and at most $2^{3d}$ distributions of at most $d$ selected edges among them. A state record has at most $G(L+1)^{2f}$ choices, and a production record has at most $G(L+1)^{Rf}$ choices. Using the preceding bounds on the numbers of records gives the displayed inequality, with $2^{8d}$ absorbing the bounded combinatorial choices.

## Consequence for a hypothetical basis

Let $A$ be an asymptotic additive basis of order $h$ and suppose its ordered two-term representation counts are bounded by $B$. For all sufficiently large $L$, its initial segment $A\cap[0,b^L)$ has at least $c b^{L/h}$ elements, since all sufficiently large integers below $b^L$ have representations using only that segment. If a grammar of fanout $f$ and maximum production rank $R$ recognizes the padded words for the segment at length $L$, its size satisfies

```math
G\ \ge\ c' b^{L/(6dh)}(L+1)^{-f(R+4)/3},
\qquad d=\lfloor\log_2 B\rfloor .
```

Here $B\ge2$ since an infinite set has two distinct elements. With fixed $f,R,h,B$ this lower bound is exponential in $L$, even for grammars chosen separately for every segment. In particular this excludes all subexponential-size families of such grammars from any counterexample to the original order-two conjecture. The conclusion supplies a description-size constraint for a potential counterexample. It does not supply a small grammar for an arbitrary basis.

## Read-once branching programs

Consider a program with one start and one accepting sink, where every accepting path reads every one of the $L$ digit positions exactly once. Vertices and transitions may be nondeterministic. Edges query labelled digit positions and require one digit value. The order need not be common to different paths. Remove vertices on no accepting path. At a retained vertex, fix an accepting suffix path. Every prefix to that vertex must read exactly the positions complementary to that suffix, since concatenation gives an accepting path. Thus the set of positions read before the vertex is fixed, and its cardinality defines its layer.

Let $W$ be the largest number of retained states in a layer. An interval in a particular accepting path is ambiguous when another path with the same endpoints reads a different assignment to the digit positions between them. These positions are fixed by the endpoints. Disjoint ambiguous intervals give independent replacements, so at most $d$ are disjoint. Stab the intervals by at most $d$ edges as before. Record their layer indices, the two states on each recorded edge, and its digit. The queried position is the difference of the fixed position sets on its endpoints. The stretches between recorded edges have unique assignments with their endpoints. Thus they reconstruct the input. If the program is deterministic, a recorded state and digit determine the next state, so the second state can be omitted.

In particular

```math
|S|\le\sum_{j=0}^{\min(d,L)}\binom Lj (bW^2)^j,
```

with $bW$ replacing $bW^2$ in the deterministic case. For fixed $B$ and a basis prefix this implies exponential width in either case. The program hypothesis is complete read-once evaluation on accepting paths. Programs with repeated queries are outside the argument.

## Replay

Run `python3 research/erdos-turan-additive-basis/verify_finite_complexity.py` from the repository root. The replay independently enumerates the sum counts, path ambiguities and encodings for 53,003 accepting paths over 32 deterministic and nondeterministic programs with variable digit orders. It also checks independent digit swaps for a branching tuple grammar with exchange of component positions through depth nine. These are exact controls for the written argument. A second reader and a formal proof have yet to verify the theorem.

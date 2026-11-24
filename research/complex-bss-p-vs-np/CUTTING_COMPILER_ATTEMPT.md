# Partial compiler for weighted cuts: word extensions and sparse names

Status: research construction, 23 November 2026 (America/Chicago). The individual-word extension, the terminal oracle-sumcheck kernel, and sparse postponement below are proved. The complete recursive compiler is not. In particular no sufficiently short generic protocol for the permanent is obtained.

The imported cutting statements are Definition J.1, Theorem J.4, Definition K.1, and Lemma K.4 of the [pinned Anthropic paper](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp), commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`. They are used with their stated contracting-case hypothesis. This note supplies some possible compiler operations; it does not assume that the cutting theorem already applies to programs with opaque value oracles.

## 1. A small weighted program for one multilinear word extension

Fix a binary word length $`s`$ and a time budget $`T`$. Let $`A_T(w)\in A`$ be the value of a bounded universal plain evaluator on $`w\in\{0,1\}^s`$. Invalid word encodings reject. A simulated $`\mathop{\mathrm{use}}`$ instruction rejects, as in the proof of Proposition I.1. A clock stops every run after $`T`$ simulated native steps; its implementation allows the universal interpreter's separately charged overhead. It does not stop after only $`T`$ interpreter steps.

One can instead use a fixed-length padded encoding with a length header and ignored padding; the header adds $`O(\log(s+1))`$ bits. Every original word of length at most $`s`$ has a fixed canonical padded encoding. Padding bits are prescribed, not extra accepting choices.

The evaluator agrees with the value of every valid $`T`$-plain instance represented by such a word: every accepting run of that instance has empty tally and finishes within $`T`$. Truncating other runs adds no accepting contribution. The bounded interpreter has the usual
```math
O((T+s)\mathop{\mathrm{polylog}}(T+s+2))
```
per-run cost. Proposition I.1 supplies the corresponding near-linear universal simulation; its displayed overhead is a square of a logarithm.

For $`r=(r_1,\ldots,r_s)\in\mathbb C^s`$, define
```math
\Phi_T(r)=
\sum_{w\in\{0,1\}^s}
\left(\prod_{i=1}^{s}r_i^{w_i}(1-r_i)^{1-w_i}\right)A_T(w).
                                                               \tag{1}
```
This is the multilinear extension of the Boolean word-value function.

There is one short weighted program with value (1):

1. For each position $`i`$, guess a Boolean bit $`w_i`$.
2. Append the name of $`r_i`$ if $`w_i=1`$, and the name of $`1-r_i`$ if $`w_i=0`$.
3. Assemble the genuine Boolean word $`w`$.
4. Run the bounded plain evaluator on $`w`$.

There are $`2s`$ named scalar values, which can be held in a trie with $`O(s)`$ nodes and height $`O(\log(s+1))`$. Word generation and naming cost $`O(s\log(s+2))`$. Together with the evaluator this remains
```math
O((T+s)\mathop{\mathrm{polylog}}(T+s+2)).          \tag{2}
```
Every word-generation choice and every accepting evaluator run contribute exactly the corresponding term of (1). Thus no $`2^s`$-entry table is introduced.

The generator is **not plain**: it has a tally of $`s`$ names. Enlarging the fixed coefficient ring is not an uncharged substitute for this tally. Lemma K.4 can postpone these names with a polynomial name inventory. For this particular generator every position contributes one of its two names exactly once, so the nonzero exponent vectors encode the chosen Boolean word.

This construction computes a weighted value in the source model. It is not a deterministic BSS algorithm that returns the value $`\Phi_T(r)`$, and does not by itself give a short verification protocol for it.

## 2. A coherent terminal polynomial for the outer cutting sum

Suppose a cut run outputs at most $`P`$ piece words, each of length at most $`s`$, for a common time budget $`T`$. Introduce a complete Boolean transcript $`\xi`$ of the cutting computation, including its output word slots.

Pad the output list to $`P`$ positions with deterministic inactive slots. Let $`a_j`$ be the Boolean activity bit and $`w_j`$ the padded word in slot $`j`$. Inactive slots have prescribed zero data. Let $`V(\xi)`$ be a Boolean constraint polynomial taking value one on valid accepting transcripts and zero otherwise. Let $`W(\xi)`$ supply the run weight. The extension
```math
K(\xi)=V(\xi)W(\xi)
\prod_{j=1}^{P}
\left(1-a_j+a_j\Phi_T(w_j)\right)                 \tag{3}
```
has Boolean sum equal to the weighted cutting sum in Definition J.1.

This assertion requires a parsimonious transcript encoding: each accepting cut run has exactly one valid assignment of all auxiliary, padding, copy, and sorting variables. Such an encoding is obtained from a Boolean verification circuit by introducing its gate values, since those values are determined by its inputs. Absorbing accepting states have prescribed padding choices.

### Constant individual degree is possible at this interface

Give every output-word slot its own transcript variables, and impose copies through bounded-fanout equality wires. Each word coordinate occurs in only one $`\Phi_T`$, where it has degree one. Activity bits also have dedicated slots.

The supported ordinary weights are those of the fixed universal interpreter in Appendix I: a finite scalar alphabet $`\Gamma\subset A`$. At each step, Boolean control selects one $`\gamma\in\Gamma`$. Give that selection dedicated one-hot bits and multiply by the corresponding linear selector $`\sum_{\gamma\in\Gamma}\gamma e_\gamma`$. The one-hot and control conditions are Boolean local constraints. This gives the required $`W(\xi)`$ as a product of bounded-degree factors with bounded variable occurrence. Appendix I.1 has finitely many named generators of $`A`$; the pointer-machine proof of Proposition I.1 likewise uses finitely many fixed weights.

This assertion does not cover an arbitrary arithmetic computation of an input-dependent weight. Additional scalar parameters can be fixed coefficients at this interface only when their selection is explicitly represented. Dynamically generated names with opaque scalar values remain the separate $`\Phi_T`$ factors in (3), or the named-weight objects of Section 7. They are not Boolean gate values.

For a Boolean AND gate $`c=ab`$, the validity factor
```math
1-c-ab+2cab
```
is one exactly when the gate relation holds, and zero otherwise. NOT and copy gates have analogous multilinear validity factors. Replacing large fanout by binary copy trees bounds the number of local factors containing each bit by an absolute constant. Consequently (3) has an absolute constant individual degree $`D_0`$ under the stated finite-weight assumption.

Near-linear-size bit-computation transcripts can be obtained without writing a full time-by-space tableau. Record the head address, finite state, read symbol, and write symbol at each step. Enforce consecutive control transitions locally. Sort the memory-access records, including the $`s`$ initial input records, by address and time with a deterministic sorting network, and enforce that each read matches the preceding write at that address or the prescribed initial symbol. Addresses have $`O(\log(t+s+2))`$ bits. A sorting network has $`O((t+s)\log^2(t+s+2))`$ comparators, each implemented by $`O(\log(t+s+2))`$ Boolean gates. Its wire values are unique. This gives a parsimonious
```math
M=O((t+s)\mathop{\mathrm{polylog}}(t+s+2))
```
transcript length and bounded-occurrence local factors for a fixed binary machine of time $`t`$. It introduces no arithmetic circuit for $`\Phi_T`$.

Ordinary sumcheck on (3) is now sound with constant-size univariate messages. At its final challenge tuple, the verifier needs the values of the $`P`$ word extensions. It can guess those $`P`$ values, check the displayed product, and use one finite universal slot index to select a piece value for subsequent verification. Invalid indices in a padded binary encoding accept. This parallelizes the *number of piece instances*: it does not remove the earlier outer sumcheck stages. The slot choice costs one quantifier block, but it has $`P`$ outcomes. It therefore contributes $`\lceil\log_2(P+1)\rceil`$ binary scalar challenges, or a factor $`P`$ in full strategy expansion. It is not constant cost in the scalar-stage recurrence below.

### Correlations and the choice of extension

If one Boolean bit $`b`$ generates the word $`(b,b)`$, coherent averaging of the word value is
```math
(1-r)A_T(0,0)+rA_T(1,1).
```
It is generally different from $`\Phi_T(r,r)`$, which also includes the cross-words. For $`A_T(w_1,w_2)=w_1w_2`$ and $`r=1/2`$, these values are $`1/2`$ and $`1/4`$, respectively.

This does not invalidate (3). A sumcheck verifier may use an unreduced polynomial extension, provided it fixes that extension in advance and charges its actual degree. Dedicated output slots and copy constraints specify exactly such an extension. It would be invalid to switch later to coherent joint averaging while keeping the earlier messages or degree bound unchanged.

## 3. The missing recursive interface

Section 2 yields a valid outer sumcheck with $`M`$ scalar stages, followed by a verification of a selected piece extension. It does not yet replace those $`M`$ stages by a short recursive protocol.

The scalar function used by the outer computation is not just the cutting program's ordinary weight. It contains values $`\Phi_T(w_j)`$ at dynamically produced word arguments. Thus the outer object is a weighted computation with opaque value calls.

Theorem J.4 is stated for plain instances. It does not give a cut of this opaque-call computation while preserving the calls as individually verifiable atoms. If one makes it plain by inlining the piece computations, the cost of $`P`$ calls is
```math
P\,T.
```
At J.4's bounds,
```math
P\le\frac{\tau v^2}{v^H},\qquad T=v^H,
\qquad
PT\le\tau v^2.                                   \tag{4}
```
Charging the advertised maximum gives no time reduction. A proof using only a bound on the outer control time $`\tau/v^{24}`$ must therefore supply a relativized cutting theorem or another explicit treatment of the opaque calls. That theorem is absent from the current construction.

Partial complex challenges cause a further bookkeeping issue. A residual after $`i`$ challenged transcript positions has $`i`$ independently supplied complex parameters. Treating these parameters as names and applying ordinary K.4 can introduce an exponent-counter input with at least $`i`$ slots. When $`i`$ is comparable to the outer time, the short-input condition required by J.4 is lost. Keeping the residual as an implicit arithmetic expression does not prove that it has a short plain-instance encoding.

## 4. Unbalanced serial recursion: conditional upper estimates

Ignore the interface issue temporarily and assume a compiler with the serial resource recurrence
```math
R(\tau)\le
R(\tau/v^{24})+R(v^H)+O(1).                       \tag{5}
```
This is an additional assumption, not a conclusion of J.4. In particular, it assumes that piece selection has already been compressed to constant scalar cost. Section 2 does not provide that compression.

Put $`L=\log\tau`$, $`x=\log v`$, with any fixed logarithm base. Choose
```math
x=K\sqrt{L\log L},                                \tag{6}
```
up to rounding $`v`$ to an integer. Fix
```math
c>\log_2(H/24).
```
Then, for all sufficiently large $`L`$,
```math
F(L)=L(\log L)^c
```
is a supersolution for the leaf count of the two-child budget recursion:
```math
F(L)\ge F(L-24x)+F(Hx)+1.                         \tag{7}
```

For a proof, $`x=o(L)`$ and the mean value theorem give
```math
F(L)-F(L-24x)
=24x(\log L)^c(1+o(1)).
```
On the other hand,
```math
F(Hx)
=Hx\left(\tfrac12\log L+\tfrac12\log\log L
                    +\log(HK)\right)^c
=H2^{-c}x(\log L)^c(1+o(1)).
```
The strict inequality $`H2^{-c}<24`$ proves (7). A constant multiplier covers the finitely many base budgets below a fixed threshold.

Thus the assumed serial compiler, with constant-cost leaves and all input conditions maintained, could have
```math
R(\tau)=O\bigl(\log\tau\,(\log\log\tau)^c\bigr).    \tag{8}
```
The balanced-recursion estimate in the earlier generic-game audit is not an optimized bound. Its elementary logarithmic lower bound on the advertised leaf budget tree remains valid.

### J.4's logarithmic scale condition

Take
$`\alpha=\lceil L/(Hx)\rceil`$. The condition
$`(\log v)^{C_{\mathrm{cut}}\alpha}\le v`$ is, after taking logarithms,
```math
C_{\mathrm{cut}}\alpha\log x\le x.
```
Since
```math
\alpha\le L/(Hx)+1,\qquad x^2=K^2L\log L,
```
a sufficiently large fixed $`K`$ makes this true for large $`L`$. Also $`Hx<L`$ eventually, so $`v^H\le\tau`$. Rounding changes only lower-order terms.

This verifies the scale condition, not the separate input-length condition.

### Charging the actual finite piece selection

Without a separate batching construction, the scalar-stage toll supplied by the slot interface is $`O(\log(P+1))=O(L)`$. The appropriate hypothetical compiler recurrence is therefore
```math
R(e^L)\le R(e^{L-24x})+R(e^{Hx})+C_0L.           \tag{8a}
```
There is still a useful unbalanced choice. Take
```math
x=L^{3/4},\qquad F_*(L)=C_1L^{5/4}.              \tag{8b}
```
For fixed $`H`$ and large $`L`$, the mean value theorem gives
```math
F_*(L)-F_*(L-24L^{3/4})=30C_1L(1+o(1)),
\qquad F_*(HL^{3/4})=C_1H^{5/4}L^{15/16}=o(L).
```
Choose $`C_1`$ large enough for the toll and the bounded base cases. Then (8a) has the conditional upper bound
```math
R(\tau)=O((\log\tau)^{5/4}).                     \tag{8c}
```
Here $`\alpha=\lceil L/(Hx)\rceil=O(L^{1/4})`$, so
$`C_{\mathrm{cut}}\alpha\log x=O(L^{1/4}\log L)=o(x)`$. Thus J.4's logarithmic scale condition again holds. Both children have smaller log-time for large $`L`$. The input and opaque-call hypotheses remain additional requirements.

More generally, $`x=L^\beta`$ with fixed $`2/3<\beta<1`$ admits $`F(L)=C L^{2-\beta}`$: its outer decrement is asymptotic to $`24(2-\beta)CL`$, and its piece term is $`O(L^{\beta(2-\beta)})=o(L)`$. The explicit choice (8b) avoids any need to tune this exponent.

## 5. Input-length conditions at the two child types

For a piece child, write $`L_b=Hx`$. Its J.4 input bound is
```math
\log s_b\le(H-32)x
=\left(1-\frac{32}{H}\right)L_b.
```
At its next scale, either $`x_b=K\sqrt{L_b\log L_b}`$ or $`x_b=L_b^{3/4}`$ is $`o(L_b)`$. Therefore
```math
\log s_b+48x_b\le L_b
```
for all sufficiently large piece budgets. Piece children have enough fractional input slack for the proposed next scale.

The outer child has no corresponding automatic property. If its word contains the original input and the cutting-program code, its length is at least the inherited original input length $`s`$, and at most a constant times $`s+v^H`$ plus encoding overhead, assuming such an outer instance has first been constructed.

A parent allowed by J.4 may have
```math
\log s=L-48x.
```
The outer child budget is $`L_a=L-24x`$, leaving only $`24x`$ of inherited input slack. Its proposed next scale has $`x_a\sim x`$, and would require about $`48x`$. Thus the parent input hypothesis does not imply even the next outer call's input hypothesis.

More generally, along a long outer chain the original input word does not shrink. With a polynomial-length root word, this chain cannot be continued to a constant-cost base merely by changing the time parameter. An input compression, a different explicit interface, or a charged treatment of shared input parameters is required.

## 6. Constant grids and generic-majority lists have different costs

For a protocol with $`h`$ scalar stages whose false continuation sets are zero sets of nonzero degree-$`D_0`$ polynomials, a fixed $`(D_0+1)`$-point universal grid suffices. If $`D_0`$ is an absolute constant, expanding its full strategy tree costs
```math
\mathop{\mathrm{poly}}(N)\,(D_0+1)^h.             \tag{9}
```
An existential graph presentation of this size gives a border circuit of size polynomial in (9). A general leaf may be a polynomial-time $`\mathrm P^{\mathrm{HN}}`$ predicate with both yes and no oracle answers. Under $`\mathrm{HN}_{\mathbb C}\in\mathrm P_{\mathbb C}`$, its oracle calls can be simulated deterministically, with the hypothetical decider's fixed exponent absorbed in the polynomial. By contrast, if the leaf is already an $`\mathrm{NP}_{\mathbb C}`$ predicate, including a verifier using only positive existential HN certificates, finite strategy expansion supplies all its leaf witnesses and gives the existential incidence unconditionally. This distinction is necessary for an argument meant to use $`\mathrm P_{\mathbb C}=\mathrm{NP}_{\mathbb C}`$.

For $`\tau=m^{O(1)}`$, the hypothetical estimate (8c), which charges the finite slot choice, would give logarithmic border size
```math
O((\log m)^{5/4}),
```
which is below the all-fields lower exponent $`(\log m)^{4/3}`$. The sharper logarithmic estimate (8) applies only under its additional constant-toll assumption. This is why preserving constant degree and scalar challenges could matter even without reducing the round count to $`o((\log m)^{1/3})`$.

By contrast, Koiran's general generic-prefix conversion uses a majority list of $`O(N)`$ samples at each stage. Its strategy expansion costs $`N^{O(h)}`$. Substituting (8c) gives a logarithmic size estimate
```math
O((\log m)^{9/4}).
```
Even the constant-toll estimate (8) would give only $`O((\log m)^2(\log\log m)^c)`$ by this conversion. Neither estimate contradicts the stronger contracting-case lower bound
$`\exp(\Omega((\log m)^2/\log\log m))`$. Fixed choices of constants do not remove the diverging logarithmic factor.

The source of the stronger bound is Theorem K.7, with its contracting hypothesis; the analogous approximate-accelerator argument is in Appendix N. It is not an unconditional statement that the complex field is in that case.

The constant-degree fact of Section 2 establishes only the terminal outer kernel's degree. It does not establish that every recursively generated challenge relation retains that degree or that either assumed compiler recurrence exists. Finite slot selection is included in (8a), not silently counted as a constant-branching operation.

## 7. Sparse postponement for an opaque name universe

A full constant-usage vector is unnecessary when only a few names occur in one run. The following variation of K.4 is exact.

Let $`p`$ be a terminating weighted program whose ordinary weights lie in $`A`$, and whose additional actions merely append names of complex scalars $`\lambda_\omega`$. A name is a Boolean word $`\omega`$ from a finite allowed universe. The value $`\lambda_\omega`$ does not control a branch or any other instruction; it is a multiplicative tally entry.

Assume that every accepting run has at most $`P`$ name uses and total name-bit length at most $`B`$. Let $`T`$ bound its ordinary computation time, with the cost of producing the name bits accounted for. The possible-name universe can be exponentially larger than $`P`$.

Let $`E`$ range over canonical lexicographically sorted lists
```math
E=((\omega_1,e_1),\ldots,(\omega_k,e_k)),
\qquad
\omega_1<\cdots<\omega_k,\quad e_j\ge1,\quad
\sum_je_j\le P,
```
with total name length at most $`B`$. The empty list is allowed.

Construct $`z_E`$ as follows. Verify the canonical list and its bounds, store its positive counters in a trie, and simulate $`p`$. On a name use, decrement the matching counter, rejecting if the name is missing or the counter is zero. Accept only if the simulated run accepts and all counters are zero. No name is appended by this interpreter.

Every accepting run of $`p`$ is accepted by exactly one $`z_E`$: its actual multiset of names determines the unique sorted list and the multiplicities. Conversely an accepting run of $`z_E`$ has exactly that multiset. Therefore
```math
\mathop{\mathrm{value}}(p)=
\sum_E
\left(\prod_{j=1}^{k}\lambda_{\omega_j}^{e_j}\right)
\mathop{\mathrm{sum}}(z_E).                       \tag{10}
```
This identity holds as a polynomial identity in the finitely many $`\lambda_\omega`$, and hence under arbitrary complex specializations.

The explicit list has size
```math
O(B+P\log(P+2)).
```
Building its trie is linear in its name data, up to standard binary bookkeeping. A query follows its name bits and updates an $`O(\log(P+2))`$-bit counter. Summed over a run, these operations cost
```math
O(B+P\log(P+2)),
```
in addition to the simulated control computation, up to interpreter logarithms. Thus both the description and the simulation avoid a vector indexed by every possible name.

If the input program is only known correct up to its accepting time bound, a clock can stop later computation; all runs then terminate and every accepting contribution within the bound is preserved. For the stated terminating hypothesis, ordinary simulation already preserves halting.

### What is gained and what remains

The gain is the replacement of the full name-universe size by the size of one run's sparse multiset. Equation (10) still sums over all such lists. Existentially choosing one $`E`$ does not verify its weighted sum.

Past complex challenges may be substituted into the scalar values $`\lambda_\omega`$; polynomial identity (10) remains valid. The *names themselves* remain genuine Boolean words. A later challenge to bits encoding $`E`$ must use a specified polynomial extension of the whole list computation. Fractional bits are not lexicographically ordered names or valid counter indices. Section 1 supplies coherent single-word extensions, not a license to interpret such fractional lists as ordinary program data.

## 8. Sparse-list budget for J.4's opaque pieces

At the advertised piece bounds,
```math
P\le\tau v^{2-H},\qquad
\ell\le v^{H-32},
```
where $`\ell`$ bounds the bit length of one piece name. Thus
```math
B\le P\ell\le\tau/v^{30}.                         \tag{11}
```
Write $`x=\log v`$ and $`L=\log\tau`$. J.4 gives $`L\le H\alpha x`$ and $`C_{\mathrm{cut}}\alpha\log x\le x`$. Consequently
```math
L\le \frac{H}{C_{\mathrm{cut}}}\frac{x^2}{\log x}
```
up to fixed factors from the source's integer logarithm convention. The constants $`H,C_{\mathrm{cut}}`$ are fixed, but $`\alpha`$ need not be constant. Hence the multiplicity and formatting cost
$`P\log(P+2)`$ is absorbed in the same bound with a harmless logarithmic factor.

Sparse postponement therefore avoids an exponential full name vector. But relative to an outer time budget $`\tau/v^{24}`$, the new input has only a factor of about $`v^6`$ of shortness:
```math
\frac{\tau/v^{24}}{\tau/v^{30}}=v^6.
```
These are advertised upper budgets, not a lower bound on every actual list. A compiler charging these budgets can apply the next J.4 cut at scale $`u`$ only after verifying
```math
u^{48}\lesssim v^6,
\qquad\text{or}\qquad
u\lesssim v^{1/8},                                \tag{12}
```
with logarithmic margins made explicit in a complete construction. Inherited input and code can further increase the new input length.

For the unbalanced choice (6), the minimal admissible logarithmic scale for the next outer time remains of order $`\sqrt{L\log L}`$, since that outer log-time is $`L-O(\sqrt{L\log L})`$. Condition (12) therefore cannot be repeatedly met by the same fixed scale coefficient. The choice (8b) initially has more scale room, but its proposed next scale is still asymptotic to the previous one and fails the factor-eight budget condition. Repeatedly reducing the logarithmic scale by that factor changes the outer log-time by only a geometric sum $`O(L^{3/4})=o(L)`$ before reaching the minimum admissible scale. This is a limitation of a compiler charging these inherited-input budgets, not a lower bound for every possible encoding or protocol. An input compression or a different interface is still required.

Definition K.1 requires an accelerator to preserve the full weighted value on every short plain input. Proposition K.5 improves such an already supplied value accelerator. A Boolean HN answer, a sparse name list, or a sumcheck terminal extension is not such an accelerator. Applying that self-improvement before constructing the value-preserving object would assume the missing operation.

The positive components above remove word-table enumeration and full name-universe enumeration. The full weighted outer aggregate and the recursive plain-input interface remain unresolved.

## 9. What the arbitrary-tensor theorem preserves

Theorem H.2 is more general semantically than the plain-program formulation of J.4: it applies to node tensors over every commutative $`A`$-algebra. Its part (c) retains each original node tensor, multiplied by the move tensors and summed over the packets used up there. Thus an opaque tensor may legitimately be retained as an original tensor. This does not give an uncharged evaluation of its local contraction.

A protected star tests the distinction. Let a central tensor on $`m`$ Boolean legs be
```math
K_X(b_1,\ldots,b_m)
=(-1)^{m-\sum_jb_j}
  \prod_{i=1}^m\left(\sum_{j=1}^m X_{ij}b_j\right),
```
and attach a unary tensor of value one at the other end of each leg. This is already a tree. Every central-tensor entry is evaluated using $`O(m^2)`$ arithmetic operations, but the value of the network is
```math
\sum_{b\in\{0,1\}^m}K_X(b)=\mathop{\mathrm{per}}_m(X)
```
by Ryser's inclusion-exclusion identity. Making a network into a tree has not removed its weighted summation.

Theorem H.2(c) leaves such a node's original local sum in the transformed node tensor. Its part (e) explicitly allows the extra $`\Lambda N`$ packet term at a given node; this term is not reduced to its parent's boundary load. A proposed protected-node compiler must therefore charge the original argument legs and every retained local sum, or delegate that whole task to a strictly smaller verified instance. Declaring one vector of $`\ell`$ complex challenges to be a single quantifier block does not make its scalar expansion constant: a fixed grid with $`q\ge2`$ points in each coordinate has $`q^\ell`$ outcomes.

The star does not rule out a more structured compiler with a proved decreasing resource measure. It rules out counting only the time needed to name a protected tensor while treating its contraction or all its argument challenges as free. No such decreasing measure has been proved here.

Finally, Sections 4 and 6 are quantitative targets, not a derivation from J.4. A sufficiently short finite-grid compiler with only deterministic or existentially verifiable leaves would already contradict the permanent border lower bound without using $`\mathrm P_{\mathbb C}=\mathrm{NP}_{\mathbb C}`$. A successful conditional separation must use the hypothesis in a substantive step, for example by turning general HN-oracle leaf predicates with negative answers into deterministic predicates. The word extension, sparse postponement, and tensor preservation above do not supply that step.

# Changing the scale inside a cut

**Research theorem, submitted for review.** Assume the contracting hypothesis of Definition D.1 over the complex field. For each fixed integer $`b\ge1`$, all sufficiently large permanents require more than $`2^{(\log m)^b}`$ gates. The threshold may depend on $`b`$. The paper's two-case theorem leaves the flat hypothesis to be treated separately.

All numbered imports below are from [Anthropic at 11b6c7e, paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf). Logs have base two, and $`\lg n=1+\lfloor\log n\rfloor`$ for positive integers. Fix its finitely generated ring $`A`$ and laws from G.2, and its constants $`a_0,C,H=16h`$ from J.3–J.4, with $`H\ge272`$ and $`H\ge a_0+16`$. A cut is a program as in J.1. On **every** sufficiently short input all runs halt and each accepting run outputs a bounded list within its time budget, without naming constants. On a plain input (all runs halt, accepting runs obey the time bound and have empty tallies), the pieces are plain and the weighted sum of products of their values equals the input value. The values are the sums of weights of accepting runs. These properties compose by distributivity. The programs and weights are those of the paper throughout.

## 1. A variable-scale cutting lemma

Fix $`d>0`$. Uniformly for large integers $`v`$, integers $`5\le\alpha\le(\lg v)^d`$, and
```math
v^H\le T\le v^{2H\alpha},\qquad s\le T/v^{48},
```
there is a cut into $`(v^H,v^{H-32})`$, with at most $`Tv^2/v^H`$ pieces and time at most $`T/v^{24}`$. Its code size is at most $`v^{h\alpha}`$ **provided $`\alpha\ge32`$**. Only this latter range is needed. The code allowance is larger than J.4's $`v^H`$.

**Schedule.** Choose an integer $`D\ge\max(128H,128a_0,512)`$. At current time $`t\ge v^H`$ use
```math
w=\max(v,\lfloor t^{1/D}\rfloor),\quad
\Lambda=(\lg w)^C,\quad
k=\min(w^{63},\lfloor t\Lambda/v^H\rfloor+1).
```
Use $`k\ge2`$ (enlarge the fixed logarithmic exponent in the resource bounds if necessary). J.3 applies: $`t\ge w^{a_0}`$, and $`t\lt(w+1)^D`$ when $`w\ge v`$, including when $`w=v`$. Thus $`4\lg t\le(\lg w)^2`$ for sufficiently large $`v`$. The bound on input length for J.3 is verified below. If the second argument of the minimum is chosen, declare the output time to be $`v^H`$ and finish. Otherwise propagate the integer bound $`t'=\lfloor t\Lambda/k\rfloor\ge v^H`$. At a tie use the final cut. Every stage is fixed from worst-case parameters before any program runs.

For $`w>v`$ and a nonfinal cut, $`\log k\ge(63/D)\log t-O(1)`$, whereas $`\log\Lambda=O(\log\log t)`$. Consequently $`\log t'\le(1-30/D)\log t`$. There are $`O_D(1+\log(2+\alpha))`$ such cuts, since $`\log T\le2H\alpha\log v`$ and the time stays above $`v^H`$. When $`w=v`$, there are only $`O_D(1)`$ remaining cuts since each nonfinal cut divides time by at least $`v^{62}`$ and $`t\lt(v+1)^D`$. Write $`r`$ for the total number and $`L=\max(2,\max_i\Lambda_i)`$. Then
```math
r=O(1+\log(2+\alpha)),\qquad
(1000L^3)^{O(r)}=2^{O_d((\log\lg v)^2)}=v^{o(1)}.
```
This replaces the fixed-base bound with $`O(\alpha)`$ factors. The constants implicit here are independent of $`v,T,s`$.

**Length and multiplicity.** Let $`p=k\Lambda`$ bound the output count of a stage. Both at a nonfinal step and at the final step with declared time $`t'`$, we have
```math
\tfrac12 t\Lambda/k\le t'\le2t\Lambda/k .
```
Indeed flooring a number at least $`v^H`$ loses at most a factor two, and the final $`k`$ lies between $`t\Lambda/v^H`$ and twice that number. If the current input length is $`u`$, J.3 gives $`u'\le(u/k+t/w^{256})\Lambda`$. Consequently
```math
u'/t'\le2(u/t+v^{-193}),\qquad pt'\le2\Lambda^2t .
```
Starting at $`s/T\le v^{-48}`$, induction gives $`u_i/t_i\le4^iv^{-48}`$, since $`k/w^{256}\le v^{-193}`$. This is below one at every stage and below $`v^{-32}`$ at the last. If $`P_i`$ bounds the number of level-$`i`$ pieces per initial accepting computation (the product of the stage counts), then $`P_it_i\le T(2L^2)^i`$. In particular $`P_r\le Tv^{-H+o(1)}`$.

**Time of composition.** A single cut at level $`i`$ costs at most $`(u_i+t_ik_i/w_i^{256})L\le 2\cdot4^it_iLv^{-48}`$. For explicit list overhead use the source composition formula for a cut of count $`p`$, time $`x`$, followed by cuts of count $`q`$, time $`y`$. The total is at most $`x+p(y+62q+110)+100`$. Unrolling from the root charges the single-cut times with multiplicities $`P_i`$, and at each join at most $`62P_r+110P_{i+1}+100P_i`$ additional steps. Since counts are at least one, $`P_i\le P_r`$. Summing over all levels gives $`Tv^{-48+o(1)}+O(rP_r)\le T/v^{24}`$. The composition theorem preserves halting also on inputs that are not plain. [Pinned composition theorem and code-size lemma](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/NS1/Compose.lean)

**Program size.** Each J.3 program has size at most $`w_i^{a_0}\le\max(v^{a_0},T^{a_0/D})`$. Composing two programs of sizes $`x,y`$ costs at most $`x+3y+3000`$. The resulting code therefore has size at most $`4^r(3000+\max(v^{a_0},v^{2H\alpha a_0/D}))`$. Here $`2Ha_0/D\le H/64=h/4`$ and $`a_0\le H\le h\alpha/2`$ for $`\alpha\ge32`$. This proves the promised $`v^{h\alpha}`$ allowance. In particular all tables used at the large scales have been charged.

## 2. A first lift with a larger cutter

An accelerator (K.1) at scale $`v`$ halts on all inputs of size at most $`v^{H-32}`$. Its accepting runs take at most $`v^{H-16}`$ steps and name powers $`\xi_j^{2^i}`$, $`i<B`$, from a fixed trie. On $`v^H`$-plain inputs its weighted value, including the named factors, equals the plain sum. Size includes bounds on the program and trie, together with the height and $`B`$ bounds specified in K.1.

Suppose an accelerator at $`v`$ has program size and trie node count at most $`v^{h\alpha}`$, for $`32\le\alpha\le(\lg v)^d`$, with height and initial $`B`$ at most a fixed power of $`\alpha\lg v`$. We claim there is one at $`v'=v^\alpha`$ with the same constants, program size at most $`(v')^{4h}`$ and exponent bound at most $`B+51h\alpha^2\lg v`$. Here and below the threshold for $`v`$ can depend on the fixed powers.

Use the **construction** in K.5, changing its cutter. Here are its parameters and the effect of that change. Start with the universal run program taking at most $`v^{H\alpha+1}`$ steps on the target plain inputs as in K.5. A round takes a program bounded there by $`v^{f+8}`$ to one bounded by $`v^f`$, with $`f\ge\alpha(H-32)+40`$. Set $`J=(H\alpha+1)\lg v`$. K.4 guesses the binary counts of the named powers, multiplies their product outside, and tests the counts by a plain interpreter. Each accepting run contributes to exactly its own count vector. The exponent bound changes by $`B_p\mapsto\max(B_p+J,B)`$. For at most $`3\alpha`$ rounds every height, exponent bound and $`J`$ are bounded by a fixed polynomial in $`\lg v`$. In particular the source round's explicit condition $`1000X^3\le v`$ holds for $`X=B+(3\alpha+1)(J+1)+\mathrm{height}+10`$.

Use precisely the interpreter time and size budgets
```math
T=v^{f+9},\qquad s=v^{\alpha(H-32)+1}.
```
We have $`sv^{48}\le T`$, and $`v^H\le T\le v^{2H\alpha}`$. For clarity, the interpreter takes time $`O(Xv^{f+8}+QX^3)`$ with $`Q\le v^{h\alpha}`$ trie nodes, including the expanded powers. Its encoding consists of the target input, the old program and $`O(QX^3+1)`$ symbols of interpreter and budget data. These fit the displayed bounds since the old program is at most $`v^{4h\alpha}`$ by induction and $`4h<H-32`$. The variable-scale lemma therefore supplies plain pieces and a value identity. Evaluating each with the original accelerator takes at most $`v^{H-16}`$ steps. With the actual source loop overhead the total is bounded by
```math
O(QX^3)+T/v^{24}+(v^{H-16}+30)Tv^2/v^H+30\le v^f .
```
The times of interest on a plain input are the accepting times. On all short inputs, even for an old program that is only known to be correct on plain inputs, the cutter halts and outputs short pieces, and the accelerator halts on each. Thus the new program has the required unconditional halting. The proof of the round uses only the cutter's list and value properties to obtain semantics and time. Its code size enters separately, once, in the following estimate. [Pinned round and code construction](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/NS1/Scale.lean) · [Explicit original round budgets](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Paper/Next.lean)

In one round the new code contains one old program, one cutter, two copies at most of the original accelerator, and $`O(1+QX^3)`$ symbols for the interpreter and guessing code (the source bound on the latter is $`O(QX^3)`$ after expanding the power trie). The growth is $`O(v^{h\alpha+2})`$ per round, including the enlarged cutter. Thus for all $`3\alpha`$ rounds the maintained size bound $`v^{4h\alpha}`$ holds. Choose the least $`n`$ with $`H\alpha+1-8n\le\alpha(H-17)`$. Then $`n\le3\alpha`$ and the last $`f`$ is greater than $`\alpha(H-17)-8\ge\alpha(H-32)+40`$. The resulting program has even the time bound $`(v')^{H-17}`$, and $`3\alpha J\le51h\alpha^2\lg v`$ proves the exponent assertion.

## 3. Consequence in permanent dimension

Fix $`b`$. Suppose a circuit at some large $`m`$ has size $`S\le 2^{(\log m)^b}`$. Take $`v=\lfloor m^{1/B_0}\rfloor`$, for the reduction constant of K.3, and $`a=\max(1,\lceil\log_v S\rceil)`$. Thus $`a+1`$ is bounded by a fixed power of $`\lg v`$. The **statement** of K.3 includes a stronger smallness condition. To use its construction in this range, apply its clause-sum construction and E.2 at $`m\ge v^{B_0}`$, then K.2 with degree and word-length bound $`v^{H-32}+1`$. The polynomial circuit for that clause sum has $`O(v^a)`$ gates by affine substitution. K.2 needs at most $`v^{O(a+1)}`$ constants; its accepting time is $`O(v^{H-32})((a+1)\lg v)^{O(1)}\le v^{H-16}`$. Its accepting names have length $`O((a+1)\lg v)`$, all powers have $`B=1`$, and its program size is $`O((a+1)\lg v+v^{H-32})`$. As in K.3 the indicator assignments evaluate the sum on every short plain instance, and the program halts on all short instances. These are all the properties used above.

Choose an integer $`\alpha\ge32`$ of order $`O_H(a+1)`$ sufficiently large to cover the trie and code by $`v^{h\alpha}`$. This choice is at most $`(\lg v)^d`$ for a suitable fixed $`d`$ and large $`v`$. Apply the first lift. At $`v'=v^\alpha`$ the program size and trie fit $`(v')^{4h}`$, the height is $`O(\lg v')`$ and the new $`B`$ is $`O_H((\lg v')^2)`$ because the old $`B`$ was one. Thus the lifted device satisfies **all** size conditions in K.1 with size $`(v')^{4h}`$, including the square and cube logarithmic bounds. Theorem K.6 now applies directly at $`v'`$ with the **fixed** exponent $`4h`$: its condition $`(\lg v')^{C4h}\le v'`$ holds. The complex field is a nonzero $`A`$-algebra in this branch. This contradiction proves the research theorem. We only changed the first lift; the finite-field and diagonal argument is imported intact through K.6.

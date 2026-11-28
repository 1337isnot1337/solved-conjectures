# Compact score perturbations for proper agnostic learning

Suppose the binary classifiers of a class $`H`$ have a common score representation
```math
 h(x)=b(x)+\langle v_h,u_x\rangle,\qquad
 \sup_h\|v_h\|_1\le V,\quad \sup_x\|u_x\|_2\le U .
```
The atom index set may be arbitrarily large. Assume each $`u_x`$ has finite support and there is a measurable coherent choice of maximizer (or additive approximate maximizer) of $`\langle v_h,q\rangle`$ for finite-support $`q`$. A fixed enumeration works with positive slack on countable classes. The explicit sparse-set learner below avoids the need for a general selection theorem.

If $`VU\le C_0 d`$, where $`d\ge1`$ is the VC dimension, this class satisfies **both** inequalities of [Steinke–Zakynthinou Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) for every $`n\ge d`$, with constants depending only on $`C_0`$. Neither the feature marginal nor the size of the set of atoms enters the learner. This includes all subsets of at most $`d`$ points of any domain admitting measurable comparison and tie breaking, and arbitrary constrained sparse families whenever the sparsity is at most a fixed multiple of their VC dimension.

## The learner acts only on atoms in the input

On $`z=((x_i,y_i))`$ compute $`g=\sum_i(2y_i-1)u_{x_i}`$. Differences in training mistake counts are exactly the negatives of the corresponding differences of $`\langle v_h,g\rangle`$. Set $`\lambda=U\sqrt{n/d}`$ (take a constant output if $`U=0`$). To each coordinate in the finite union of the input supports add independent noise of scale $`\lambda`$ and density at unit scale
```math
 p(w)=\cos^2(\pi w/2)\,1[-1\le w\le1].
```
Apply $`T_\lambda(a)=\mathop{\mathrm{sgn}}(a)(|a|-\lambda)_+`$ coordinate by coordinate and leave all unmentioned coordinates zero. Denote the resulting finite-support vector by $`q`$. Return a classifier whose $`q`$-score is within $`\sqrt{nd}`$ of the supremum, or an exact maximizer when available. Use a selection rule depending only on $`q`$, including its nonzero coordinate names. In particular, it cannot depend on which additional zero coordinates were presented during computation.

For every realization $`\|q-g\|_\infty\le 2\lambda`$. Thus the training mistake count is within $`4\lambda V+\sqrt{nd}`$ of its minimum on **every** input. For $`H=\{1_S:|S|\le d\}`$, use $`u_x=e_x`$, $`v_h=1_S`$. Choose at most $`d`$ indices with the largest strictly positive $`q`$-scores; this is an exact maximizer and uses only features in the input. For the finite singleton family in the pilot counterexample one may maximize directly over its known list, breaking ties by index.

## Information in the entire classifier

Fix the full paired pool $`\widetilde z`$. Its union $`J`$ of atom supports is finite. Equivalently one may perturb the entire score vector on $`J`$ and then apply the threshold. On a coordinate absent from the selected sample the input score is zero, so $`T_\lambda`$ kills its noise with probability one. The two implementations induce identical laws. This gives a single postprocessing rule for all selectors in this pool and requires no random process indexed by an uncountable domain.

Let $`a=\sqrt p`$, extended by zero. It has weak derivative in $`L^2(\mathbb R)`$ with $`\|a'\|_2^2=\pi^2/4`$. Jensen's inequality applied to the integral of the derivative gives
```math
 \int(a(w)-a(w-t))^2\,dw\le (\pi^2/4)t^2 .
```
For product densities, affinity multiplies; hence their squared square-root distance is at most the sum of the marginal distances. For a shift vector $`\Delta`$ the Jensen–Shannon divergence of the two unthresholded laws is at most $`\pi^2\|\Delta\|_2^2/(4\lambda^2)`$. Here the elementary bound $`\mathrm{JS}(P,Q)\le\int(\sqrt{dP}-\sqrt{dQ})^2`$ follows from $`\log u\le u-1`$ against the midpoint and $`(a-b)^2/(2(a+b))\le(\sqrt a-\sqrt b)^2`$. Thus even shifts that change the support boundary have finite JS; a bound on directed KL between the shifts would be invalid.

Changing one selector shifts $`g`$ by a vector of norm at most $`2U`$. The information in that bit conditional on the other bits and the full pool is its two-law Jensen–Shannon divergence. Tensorizing over independent bits and applying data processing gives at most $`\pi^2 n U^2/\lambda^2=\pi^2 d`$ nats. This bound holds for **each fixed pool**. It applies unchanged to arbitrary label noise and to the full returned classifier. For sparse sets it repairs the [unstable pilot winner](pilot-anchor-obstruction.md) by replacing its maximization of unperturbed gains.

The hypothesis on the score representation is an additional geometric assumption, and this theorem is a restricted result toward the prize. Other classes, including arbitrarily long threshold chains, need a different argument. The [full-score obstruction](full-score-obstruction.md) gives a lower bound for additive releases on those chains.

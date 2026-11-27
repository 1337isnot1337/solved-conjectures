# Individually prescribed tail coordinates

The repository already contains the [role-exchange and mixed-orientation theorem](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/lambie-hanson-uhrik-disjoint-type-guessing/ROLE-EXCHANGE-TAIL.md). Here is the small remaining extension: the width obstruction is necessary even when each forward color specifies an arbitrary *later* finite tail index.

Fix a family of supplied words $`s_k`$ of widths $`n_k`$. Write $`F=\{k:s_k\text{ ends in }1\}`$, and compute $`d_k,r_k`$ after normalizing the words to end in 1. Let $`j_k`$ be any prescribed natural number for each color. Ask for the literal chronological type $`s_k`$ on $`(C_\alpha[n_k],C_\beta[n_k])`$ with $`\alpha<\beta`$, and require $`C_\alpha(j_k)`$ cofinal below the same $`\beta`$ among witnesses.

In the restricted PFA models, including their countable extensions, the exact conditions are:

1. $`j_k\ge n_k`$ for $`k\in F`$, and $`j_k\ge d_k`$ for $`k\notin F`$.
2. The widths on $`F`$ are uniformly bounded.
3. The normalized depths and lower reaches outside $`F`$ are uniformly bounded.

The coordinate restrictions follow already from constant colorings, as in the existing role-exchange note. Sufficiency is already proved there: a higher index in a ladder is at least the minimal flexible coordinate. Necessity of condition (3) follows from failure of ordinary guessing, by using just the bad subfamily. The remaining case is (2) if $`j_k>n_k`$.

Use precisely the [published oriented-tail forcing](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/lambie-hanson-uhrik-disjoint-type-guessing/TAIL-COORDINATE.md) on an infinite forward-only subfamily with unbounded width. Include $`(j_k)_{k<\omega}`$ among the named parameters in the countable forcing. The deciding condition of a color-$`k`$ record now reads its type, $`j_k`$, and a $`(j_k+1)`$-prefix $`a`$ instead of its $`(n_k+1)`$-prefix. Its flag looks at $`a(j_k)>h`$ instead of $`a(n_k)>h`$; the type comparison, exact flag and cutoff still use only the $`n_k`$-prefix. The two-sided cut guard is unchanged except that a proxy must copy the whole longer prefix. This is well-defined because $`j_k\ge n_k`$.

In density, first decide the ladder point above the finitely many relevant cuts, then choose a fresh sufficiently wide color exactly as before, and strengthen the deciding condition to read the required longer prefix. The ordinal height of an inner record still bounds all of its finitely many prefix entries, so a flag with $`h\ge M\cap\omega_1`$ cannot conflict with one. The finite simultaneous-copy argument copies the longer readings by the same elementarity argument. Every comparison with an outer record uses either the last *type-prefix* point, which is still $`a(n_k-1)`$, or a proxy having all of its recorded data. Thus the clipping and guard proofs are unchanged. In the extension the exact flag at each upper vertex supplies an actual bound $`h`$ on the $`j_k`$-th points of all its same-color forward matches. Relabel the countercoloring by the original indices.

Nothing here strengthens the negative result for reverse or unordered families: their sufficiency already makes index $`d_k`$ cofinal, and failure of ordinary guessing already supplies the necessary depth/reach bounds.

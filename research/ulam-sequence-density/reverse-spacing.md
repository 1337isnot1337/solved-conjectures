# A reverse spacing bound for Ulam numbers

**Theorem.** For every nonempty finite interval $`I`$ of positive integers with least element greater than 2804,

```math
\lvert U\cap I\rvert \le \frac{47}{195}(\lvert I\rvert-1)+676.
```

For unrestricted starting positions the same bound holds with 956 in place of 676. Consequently the upper Banach density is at most $`47/195=0.241025641\ldots`$. This sharpens the [forward search bound of 193/800](README.md#uniform-upper-bound). Both bounds use the small-summand exclusion in [Hinman, Kuca, Schlesinger and Sheydvasser, Theorem 2.6](https://msp.org/involve/2019/12-3/involve-v12-n3-p11-p.pdf).

## An interval lemma

Fix a fraction $`p/q`$, an integer $`K`$, and $`H=\lfloor(qK-1)/p\rfloor`$. Use the anchors $`F=U\cap[1,H]`$. Write a collection of terms greater than $`H`$ in decreasing order as $`v-y_0,\ldots,v-y_k`$, with $`0=y_0<\cdots<y_k`$. For each $`i`$ there is at most one $`j>i`$ with $`y_j-y_i\in F`$. Every such $`j`$ supplies the representation

```math
v-y_i=(y_j-y_i)+(v-y_j).
```

Its small summand is at most $`H`$ and its large summand exceeds $`H`$. Two indices would give different unordered pairs of distinct Ulam terms.

Test whether there is a list of $`K+1`$ offsets obeying that restriction and $`py_i<qi`$ for every $`1\le i\le K`$. Start with the single offset 0. At a list of size $`k`$, try every new integer $`y`$ above the last offset with $`py<qk`$. Reject an extension precisely when it would give an existing offset a second partner. The new offset has no later partners yet. Every eligible list occurs once because deletion of its last element determines its parent. No difference larger than $`H`$ can arise.

When the test exhausts the tree, every $`K+1`$ consecutive occupied sites have a $`k\in[1,K]`$ for which $`py_k\ge qk`$. In a given interval, start at the largest occupied site. Discard the first $`k`$ sites and keep the next site as the new starting point. Each such move discards at most $`p/q`$ times the distance moved. These distances telescope to at most $`\lvert I\rvert-1`$. When fewer than $`K+1`$ sites remain, count them individually. This proves the theorem with endpoint allowance $`K`$ above $`H`$. An interval meeting $`[1,H]`$ has at most $`\lvert F\rvert`$ additional terms there. Dividing by interval length proves the uniform asymptotic bound.

## Exact certificates

| Fraction | Steps $K$ | Anchor cutoff $H$ | Anchors | Prefixes including the root | Largest size | Size $K+1$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 7/29 | 290 | 1201 | 146 | 74,924 | 290 | 0 |
| 47/195 | 676 | 2804 | 280 | 11,523,818 | 676 | 0 |

Run `python3 research/ulam-sequence-density/upper_bound.py` from the repository root. One implementation marks all future extensions forbidden by an offset that already has a partner. The other checks whether a proposed extension hits any already-used offset. The programs generate their anchors independently by pair addition and by testing complements. They compare the complete counts at every depth. [Replay both enumerations](upper_bound.py)

The smaller certificate has a tighter additive allowance for short intervals. In exploring candidate fractions, the forward search also certified $`8/33`$ in 331,965 prefixes. At $`6/25`$ both orientations admitted prefixes through 850 steps. This is an obstruction to that search depth only. The periodic construction in the [forward certificate](README.md#verification) gives a separate lower limit of $`127/540`$ on bounds obtainable from its local exclusions alone.

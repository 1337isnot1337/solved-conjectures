# Independent review of the affine-width obstruction

21 November 2026. This review covers Sections 1–5 of
[the authored Shallit 7 note](affine-certificate-obstruction.md),
including its strengthened fixed-language example. It does not establish
that primitive binary words are, or are not, context-free. The source and
eligibility audit and the Ginsburg–Spanier theorem cited in Section 6 are
outside this bounded mathematical review.

## Periodic subspaces and polynomial factors

The run-period characterization includes zero-length runs correctly: each
individual occurrence of `a` is a record boundary, and a root of a word
beginning with `a` also begins with `a`. A proper repetition therefore
repeats an integer number of complete records. Excluding all periods
$`m/p`$, for primes $`p\mid m`$, excludes every proper divisor period.

For squarefree $`m`$, the vector in Section 2 has the claimed values
$`e_0=\omega(m)`$ and $`e_{m/p}=\omega(m)-1`$. A component
$`f_q`$ belongs to $`V_p`$ whenever $`p\ne q`$. A linear
form annihilating two different spaces $`V_p,V_q`$ consequently
annihilates every component of $`e`$ and the constant vector.

The polynomial step is valid. The nonnegative integer orthant in the
independent coordinates of $`V_p`$ is Zariski dense: the elementary
one-variable root argument, iterated over the coordinates, proves this
without an additional hypothesis. If a product of affine forms vanishes
there, its restriction is the zero polynomial on $`V_p`$. The
polynomial ring is an integral domain, so one factor restricts to zero.
Since $`0\in V_p`$, that factor is homogeneous. One accepted
factor cannot serve two different primes, giving the stated width bound.

The finite-regular-guard extension also holds. Powers of each finite
`b`-transition function are eventually periodic as functions on its state
set. A common sufficiently large transient and common positive period
make all words on the displayed coordinate grid indistinguishable to
all of the finitely many guards. The shifted grid restricted to
$`V_p`$ has affine hull $`V_p`$, because the constant vector
belongs to that space. Thus the same annihilating-factor argument applies.
The guards and the number of clauses may depend on $`m`$; the proof
does not mistakenly require uniform automata.

## The fixed primitive context-free language

The four-nonterminal grammar in Section 5 generates exactly
$`D_<^+D_=`$. Repeating the wrapping production for $`U`$
gives


```math
aU\Rightarrow ab^n ab^{n+1+j},\qquad n,j\ge0,
```


and the corresponding calculation for $`V`$ gives two equal run
lengths. The recursion for $`S`$ adds one or more strict blocks
followed by exactly one equal block.

Every word in this language is primitive. An odd divisor period of
its even number of records would cancel the alternating sum, but the
strict pair inequalities make that sum negative. An even proper
period would repeat the unique equal aligned pair. These arguments
cover all proper divisor periods and permit zero exponents.

For $`m=2P`$ with squarefree odd $`P>1`$, the displayed witness
has


```math
g_p(2j+1)-g_p(2j)
 =1-p\,\mathbf1_{p\mid j+1}
```


for every odd prime $`p\mid P`$. Adding the parity component
therefore gives exactly


```math
v_{2j+1}-v_{2j}
 =\sum_{p\mid P,\ p\nmid j+1}p.
```


For $`0\le j\lt P-1`$, the positive integer $`j+1\lt P`$ cannot
be divisible by every prime dividing $`P`$, so this difference is
positive. It is zero at $`j=P-1`$. The witness and every positive
affine rescaling in the note belong to the fixed language.

Each component $`g_p`$ has period $`p`$ and hence lies in
$`V_q`$ for every different prime $`q\mid m`$. The same
width lower bound follows. Thus even a fixed context-free language
containing only primitive words can require unbounded width in this
particular safe affine-disequality description class. The claimed
bridge from fixed grammar size to bounded width is false.

No substantive correction was found. This is an obstruction to the
specified certificate class and its proposed grammar bridge; it supplies
no unrestricted context-free-language lower bound and no completed prize
claim.

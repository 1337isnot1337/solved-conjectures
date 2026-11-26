# Ekhad–Zeilberger’s most unfair bet conjecture

Let $k\ge2$ and let the letters of a length-$`n`$ text be independent and uniform on an alphabet of $q\ge2$ symbols. Players choose distinct words $A,B$ of length $`k`$. A player wins when the count of their word exceeds the other count. Overlapping occurrences count. Define the advantage as the coefficient of $n^{-1/2}$ in the difference of win probabilities, with the more likely winner first. This is the statistic in the sponsor’s rankings. [Challenge and sample rankings](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/litt.html)

**Theorem.** With unrestricted word choice, the largest advantage is

```math
 \frac{q^{k/2}}{2\sqrt{\pi}}M,\qquad M=\sum_{d=1}^{k-1}q^{-d}.
```

It is attained by $a^{k-1}b$ against $a^k$, $a\ne b$, or its reversal, up to relabeling and exchange of players. For fixed $q,k$ these pairs also maximize the gap itself for all sufficiently large $`n`$, since there are finitely many pairs and all other leading coefficients are strictly smaller.

## The overlap formula

Let $\theta_{UV}$ be the sum of $q^{-d}$ over shifts $1\le d<k$ for which the length-$`(k-d)`$ suffix of $U$ equals the prefix of $V$ of that length. Write $x=\theta_{BB}$, $y=\theta_{AA}$, and order the words so $x\ge y$. Put

```math
 z=\theta_{AB},\quad w=\theta_{BA},\quad
 V=1+x+y-z-w.
```

Theorem 1.1 and (4.19) of Janson, Nica, and Segert give the advantage as $q^{k/2}/(2\sqrt{\pi})$ times $(x-y)/\sqrt V$ when $x>y$. The asymptotic variance per letter of the signed count is $2q^{-k}V$. If $x=y$ the game is fair by the equal-autocorrelation theorem, including the exceptional binary pairs excluded from the expansion. Thus it suffices to consider $x>y$. [Janson–Nica–Segert](https://arxiv.org/abs/2503.19035) · [Basdevant and coauthors](https://www.imo.universite-paris-saclay.fr/~arvind.singh/papers/litt_cr.pdf)

## Nonconstant words

First suppose $B$ is nonconstant. Then $A$ is nonconstant as well, since a constant word has the maximum possible self-overlap $M$. Shift one gives no self-overlap for either. In particular

```math
 x\le M-q^{-1}< M/q.
\tag{1}
```

If neither cross-overlap has shift one, then $z+w\le2(M-q^{-1})<1$. Consequently $V>x+y$ and $(x-y)^2/V\le x<M^2$, using $M\ge1/q$.

Now suppose a cross-overlap has shift one. For $k=2$ all nonconstant words have zero self-overlap. For $k\ge3$, if the two interiors (positions 2 through $k-1$) are identical, a shift-one overlap forces the common interior to be a run of a single letter $c$. Indeed the overlap equates each interior letter to its neighbor and fixes the adjacent end of each word. In the orientation $A\to B$ the words have forms $a c^{k-1}$ and $c^{k-1} b$. Nonconstancy forces $a,b\ne c$. Both words are unbordered and $x=y=0$. The reverse orientation exchanges the roles.

It remains to bound $V$ for words with different interiors. For one window let $f=\mathbf{1}_A-\mathbf{1}_B$. Let $P$ center in both end letters, i.e. apply $(I-\mathbb E_1)(I-\mathbb E_k)$ where $\mathbb E_i$ averages over the letter at position $i$ keeping all others fixed. This is an orthogonal projection in $L^2$. For $W=w_1\ldots w_k$ it gives

```math
 P\mathbf{1}_W=
 (\mathbf{1}_{X_1=w_1}-q^{-1})
 \mathbf{1}_{X_2\cdots X_{k-1}=w_2\cdots w_{k-1}}
 (\mathbf{1}_{X_k=w_k}-q^{-1}).
```

The squared norm for one word is $q^{-k}(1-q^{-1})^2$. The two projected words have disjoint interior supports. Hence $`\|Pf\|_2^2=2q^{-k}(1-q^{-1})^2`$. Each translated $Pf$ is orthogonal to every $f$ or $Pf$ on another window, because one of its centered endpoints lies outside that window. On its own window it is orthogonal to $f-Pf$. Splitting the signed total into the translated projected terms and their residual therefore bounds its variance below by $`(n-k+1)\|Pf\|_2^2`$. Dividing by $`n`$ and taking the limit gives

```math
 V\ge(1-q^{-1})^2.
\tag{2}
```

Together with (1), this gives $(x-y)/\sqrt V<M/(q-1)\le M$. All nonconstant losers are strictly suboptimal.

## The constant loser and equality

Suppose $B=a^k$. Let $L,R$ be the lengths of the initial and terminal $a$-runs of $A$. They sum to at most $k-1$. Write $G(s)=\sum_{j=1}^s q^{j-k}$, including $G(0)=0$. Then $z+w=G(L)+G(R)\le G(L+R)\le G(k-1)=M$, and $x=M$. The first inequality is strict if both runs are positive, since the successive summands of $G$ increase strictly. Thus $V\ge1+y$ and $(M-y)/\sqrt V\le M$. Equality requires $y=0$ and one run of length $k-1$. These conditions hold precisely for the words stated in the theorem.

## When the two words must use the full alphabet

The sponsor’s Maple procedure `Mihai` retains a pair only when the union of its letters is the full alphabet. This is automatic for distinct binary words. For $q\ge3$ it changes the maximizer. The following gives the full-alphabet result, including the case in which no constant loser is feasible. [Ranking code](https://sites.math.rutgers.edu/~zeilberg/tokhniot/Litt.txt)

For $3\le q\le k+1$, a constant loser requires at least $q-1$ other letters in $A$, so $L+R\le k-q+1$. The preceding proof gives the best normalized advantage against this loser as

```math
 \frac{M}{\sqrt{1+M-G(k-q+1)}}.
```

It is attained by $a^{k-q+1} b_2\cdots b_q$ against $a^k$, with all $b_i$ distinct and different from $a$. This word is unbordered, and concentrating the available run at one end attains the cross-overlap bound. If $k=q-1$, it is just a permutation of the other letters.

For any nonconstant loser with $x>y$, at least one cross-overlap misses shift one. Otherwise both words have period two, the two phases of the same alternating word, and have equal self-overlap. It follows that $z+w\le2M-1/q$ and $V\ge1-2M+1/q\ge1/q$ since $M\le1/(q-1)$ and $q\ge3$. Inequality (1) now bounds the normalized advantage strictly below $M/\sqrt q$. This is smaller than the displayed constant-loser value, because $1+M<q$.

For $k+1<q\le2k$, put $d=q-k$ and $r=k-d$. When $r=0$, all letters in the two words are different and every game is fair. When $r>0$, an optimal loser $B$ is the length-$`k`$ prefix of repetitions of a block of $`d`$ distinct symbols. The winner $A$ consists of the remaining $`k`$ distinct symbols in any order.

To prove this last assertion, there are exactly $r$ repeats available among the $2k$ positions, in the sense that identifying equal letters reduces $2k$ positions to $q$ classes. A self-border or cross-overlap of length $j$ costs at least $j$ identifications. For a self-border the word has period $k-j$ and uses at most $k-j$ letters. For a cross-overlap each of the $j$ matching pairs is disjoint from all the others. Hence every overlap length is at most $r$. If $B$ has border length $r$, all identifications are used up by its period-$`d`$ equalities, so its $`d`$ residue classes are distinct, and $A$ uses $`k`$ fresh symbols. This is the claimed form, with $y=z=w=0$ and $x\ge q^{r-k}$.

If $B$ has no such border, $x\le G(r-1)<q^{r-k}/(q-1)$. Always $z+w\le2G(r)$, with $G(r)<1/(q(q-1))$ because $r\le k-2$. Put $u=1/(q(q-1))$. The proposed pair has normalized advantage at least $q^{r-k}/\sqrt{1+u}$. All competitors without a border of length $r$ have smaller advantage than $q^{r-k}/((q-1)\sqrt{1-2u})$. For $q\ge4$, $(q-1)^2(1-2u)>1+u$, proving strict optimality. If $q>2k$ no pair uses the full alphabet. For length one, distinct letters have symmetric counts and every game is fair.

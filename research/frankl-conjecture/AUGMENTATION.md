# Frankl’s conjecture

**Partial research.** Two explicit families isolate a false induction step in Demontis's preprint. The published paper changes that step and still has a quantifier gap. An augmentation argument constrains every hypothetical counterexample maximal under inclusion. Its top frequency is $(m-1)/2$ for $m$ members, and every union-closed two-set extension adds both sets through a common top-frequency element. The unrestricted conjecture remains open. [Tracking issue #530](https://github.com/1337isnot1337/solved-conjectures/issues/530) · [Related repository work #20](https://github.com/1337isnot1337/solved-conjectures/issues/20)

## Target and source status

Frankl's conjecture asserts that every finite union-closed family with a nonempty member has an element in at least half its members. The November 24, 2026 screen found a claimed full proof by Demontis, newer primary work establishing lower bounds strictly below one half, and a recent project claim of a further improvement. The gaps below prevent the two Demontis texts from establishing the result as written. The augmentation statements use maximality under increasing the family on a fixed ground set. Prior work of Norton and Sarvate, and Lo Faro, studies counterexamples of minimum size. The bounded priority search located no earlier statement of the projected-fibre condition below. Priority for that condition is provisional. [Demontis, arXiv v1](https://arxiv.org/abs/2405.03731v1) · [Published Demontis paper](https://www.opastpublishers.com/open-access-articles/the-unionclosed-set-conjecture-is-true.pdf) · [Costa and Sadhu](https://arxiv.org/abs/2610.02295) · [Quantavane, announced bound](https://quantavane.com/major-results/union-closed-sets-conjecture/) · [Lo Faro and later minimum-size results](https://www.sciencedirect.com/science/article/abs/pii/S0012365X23001164)

## Two failures of quasiminimality descent

In the first induction case of Theorem 4 of arXiv v1, Demontis takes a set pair $`Y=\{Y_1,Y_2\}`$ for which $i$ is quasiminimal on $D$, and splits the deleted family as $`D=D_0\cup\{X_1,X_2\}`$ along an optimal sequence for $i$. The step asserts that $i$ is quasiminimal on $D_0$ for the same $Y$. Definition 9 requires both minimum incidence in $D_0\cup Y$ and a union-closed optimal deletion sequence ending in $Y_1,Y_2$. Neither requirement follows.

Write $12$ for $`\{1,2\}`$ and similarly for other subsets of $[3]$. The following table starts from the seven nonempty subsets of $[3]$. In both rows, deleting the full listed sequence preserves union closure at every step. The prefix ending in $X_1,X_2$ is optimal for $i$, and an optimal sequence ending in $Y_1,Y_2$ is obtained by taking an ideal order for $D$ and then deleting $Y_1,Y_2$.

| $i$ | Ideal deletion of $D_0$ | $X_1,X_2$ | $Y_1,Y_2$ | Incidences in $D\cup Y$ | Failure after omitting $X_1,X_2$ |
| --- | --- | --- | --- | --- | --- |
| $1$ | $2,1$ | $3,13$ | $23,12$ | $(3,3,3)$ | Incidences become $(2,3,1)$, so $1$ is no longer minimal. |
| $3$ | $1$ | $2,3$ | $12,23$ | $(2,3,2)$ | The shortened terminal family contains $2$ and $3$ while omitting $23$. |

In row 1 an ideal deletion order for $D$ is $2,3,1,13$. In row 2 it is $1,2,3$. Thus both examples meet the applicable optimal-sequence requirement of Definition 9 in the full family. Row 1 also has union closure in the shortened sequence. Row 2 retains minimum incidence for $i$ after shortening. These facts isolate the two different failures.

The published version uses the pair $`\{X_1,X_2\}`$ at this step instead of $Y$. For a point minimal on $D$ this gives a quasiminimal point on $D_0$ for the specific new pair. The induction still needs to apply Theorem 4 to that point and pair. Theorem 4 supplies an existentially chosen point and allows that point to have no quasiminimal pair. The use of Theorem 4 in Theorem 5 has the same gap in both versions.

For example, take $`D_0=\{1\}`$ from the second row. Point $1$ cannot be quasiminimal on $D_0$ for any pair. Its incidence would be two after the pair is added, so the other two points would each have to be in both sets. The only candidate pair is $23,123$, and $23$ cannot be deleted after $1$ because $2$ and $3$ are still present. Thus point $1$ satisfies the stated existential conditional vacuously. The optimal pair $2,3$ from the second row qualifies for point $3$, which is minimal on $`D_0\cup\{2,3\}`$. The conditional witnessed by point $1$ gives no inequality for point $3$ on that pair. The inference needs a strengthened induction statement or a further argument selecting the witness.

## Augmenting a hypothetical maximal counterexample

Let $U$ be the union of a counterexample $\mathcal F$ maximal by inclusion among counterexamples on $U$. It contains the empty set, since adding the empty set preserves a counterexample. Put $m=|\mathcal F|$, write $f_x$ for the frequency of $x$, and let $\mathcal D=2^U\setminus\mathcal F$. An admissible augmentation is a nonempty $\mathcal E\subseteq\mathcal D$ such that $\mathcal F\cup\mathcal E$ is union-closed.

An inclusion-maximal element of $\mathcal D$ is individually addable. Its union with a member of $\mathcal F$ either equals itself or is a strict superset belonging to $\mathcal F$. Adding it gives a family satisfying the conjecture by maximality. Frequencies increase by at most one, so with $a=\max_x f_x$ we have $2a<m$ and $2(a+1)\ge m+1$. Thus $2a=m-1$. Write $g_x=a-f_x$ and $`C=\{x:g_x=0\}`$.

For any admissible augmentation of size $r$, its Frankl element must satisfy

```math
\#\{E\in\mathcal E:x\in E\}\ \ge\ g_x+\lfloor r/2\rfloor+1 .
```

This follows by substituting $m=2a+1$ into $`f_x+\#\{E:x\in E\}\ge (m+r)/2`$. In particular every addable set meets $C$, and every admissible two-set augmentation contains a point of $C$ common to both sets. Every subcollection of the inclusion-maximal missing sets is admissible. The union of two distinct maximal missing sets strictly contains both and is therefore in $\mathcal F$.

There must be at least two points in $C$. To prove this, fix $x\in C$. There are missing sets both containing and omitting $x$. The first claim holds since $f_x<m/2$ and $m\le 2^{|U|}$. For the second, the number of missing sets containing $x$ is minimal among all points. If every missing set contained $x$, then every missing set would contain every point, contradicting $U\in\mathcal F$.

Choose an inclusion-maximal missing set $Y$ omitting $x$. If $Y$ is addable, augment with $Y$ and with an inclusion-maximal missing set $X$ containing $x$. The union $X\cup Y$ either equals $X$ or lies in $\mathcal F$ by maximality of $X$ among missing sets containing $x$. If $Y$ is not addable, every missing strict union $Y\cup S$, $S\in\mathcal F$, is $`X=Y\cup\{x\}`$. Indeed, it must contain $x$, and deleting $x$ from that union gives a missing set, since membership in $\mathcal F$ would allow reconstructing the missing union using $S$. Maximality of $Y$ forces the result of deleting $x$ to be $Y$. Now $X$ is addable. If $X\cup T$ were another missing strict union with $T\in\mathcal F$, then $Y\cup(S\cup T)$ would be the same missing strict union and would differ from $X$. Thus $`\{X,Y\}`$ is admissible in either case. Its intersection omits $x$, so maximality supplies a different member of $C$ in its intersection. This is a direct formulation of the two-set addition mechanism behind Demontis's Lemma 6, with the necessary nonempty classes explicit.

### Adding entire projected fibres

For any $W\subseteq U$, project missing sets by $\pi(X)=X\setminus W$. Let $\mathcal P$ be a nonempty collection of inclusion-maximal members of $\pi(\mathcal D)$. Then

```math
\mathcal E=\{X\in\mathcal D:\pi(X)\in\mathcal P\}
```

is admissible. If $X\in\mathcal E$, then the projection of a union with $X$ contains $\pi(X)$. If the union remains missing, maximality of $\pi(X)$ in $\pi(\mathcal D)$ forces equality, which puts the union in the selected fibre.

Consequently every such choice of full fibres must satisfy the frequency inequality above for some $x$. For example, for $W=C$ with $|C|=k$, a full missing fibre over a maximal projection has size $2^k$ and gives each point of $C$ exactly half its members. If the fibre is admissible as above, there must be a point $x$ of the projection with $1\le g_x\le 2^{k-1}-1$. Points off $C$ outside the projection occur zero times in the fibre.

The two-set condition requires more than union closure and the equality of top frequencies. Let $U=A\sqcup B$ for disjoint nonempty blocks of size at least three and $`\mathcal F=\{\varnothing,A,B,U\}`$. Every point has frequency two. Any admissible pair disjoint on $U$ would have an individually addable member $X$. To see the last assertion, choose the larger of the two members under inclusion if they are comparable, and choose either if they are incomparable. A missing strict union of the chosen member with an existing set would need to be the other member of the pair, which is impossible by that choice. An individually addable missing $X$ contains all of one block and a nonempty proper subset of the other. A disjoint nonempty $Y$ is then confined to the remaining portion of the second block. Its union with the first block is distinct from $X$ and still missing, ruling out that pair. This provides an obstruction to a universal two-set descent even for families with all frequencies equal to half and no small nonempty members.

The counterexample structure above is conditional. The proof does not exclude all families satisfying the augmentation conditions.

Run `python3 research/frankl-conjecture/verify.py` from the repository root. The replay verifies each full deletion sequence, checks which requirement fails after shortening, and checks all pairs in two instances of the two-block obstruction. A second reader and a formal proof have yet to verify the audit and augmentation arguments.

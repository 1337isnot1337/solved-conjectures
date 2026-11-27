# Disjoint-type guessing after small forcing

This strengthens the [countable-forcing appendix](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/lambie-hanson-uhrik-disjoint-type-guessing/COUNTABLE-FORCING.md) and its [tail-coordinate counterpart](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/lambie-hanson-uhrik-disjoint-type-guessing/TAIL-COORDINATE.md).

**Theorem.** Suppose $`V\models\mathsf{PFA}(\omega_1)`$ and $`\mathbb R`$ preserves $`\omega_1`$ and has a dense subset of cardinality at most $`\omega_1`$. Then in $`V^{\mathbb R}`$, including for type families and ladder systems not in the ground:

1. Ordinary disjoint-type guessing for a family is possible exactly when its depths and reaches are bounded.
2. Forward normalized tail guessing is possible exactly when its widths are bounded. The negative direction covers any individually prescribed finite index $`j_k\ge n_k`$ instead of only $`n_k`$.
3. The already proved reverse-tail and mixed-orientation criteria remain exact.

The same conclusions hold after adding **any number of Cohen reals**, with no restriction on the cardinality of that forcing. In particular no such extension satisfies full disjoint-type guessing. This still does not settle the separate Hajnal–Máté graph problem.

## Forget the deciding condition in the auxiliary record

Replace $`\mathbb R`$ by its small dense suborder. Fix the names, and work below a condition forcing that the chosen parameter (depth, reach, or forward width) is unbounded. Pass to that cone. We modify the auxiliary posets of the two linked proofs; their order on finite sets of cuts, records and flags is unchanged. The only essential change is that **a record stores its finite reading, not any condition that reads it**.

Use a record $`(\gamma,k,t,a)`$ in the ordinary case, with finite prefix $`a`$ of the same length as in the question's proof, and include the threshold $`h`$ in the tail case. In the prescribed-index version also store $`j`$. A record is permitted only if some condition of $`\mathbb R`$ forces that the type at index $`k`$ is $`t`$, the specified prefix of the ladder at $`\gamma`$ is $`a`$, and, when present, that the index is $`j`$. The tag is $`(k,t)`$, enlarged to $`(k,t,j)`$ when applicable. Tags interact **if they are equal**, even when their particular readings could not occur together under $`\mathbb R`$. All flags store this finite tag instead of a forcing condition. The geometric conflict tests and guards, including the exact-flag requirements, are exactly the published ones, using same finite tag in the proxy clauses.

This strengthening of the conflict tests is intentional. It cannot hurt the density proof below, which uses a previously unused natural color, and it guarantees that copying a proxy preserves every interaction without having to copy a forcing condition.

## Density and properness

For each $`\gamma`$ and each $`v\in\mathbb R`$, require a record at $`\gamma`$ whose finite reading is forced by some $`u\le v`$. This is a dense open requirement on the auxiliary poset: apply the original density argument, first deciding a ladder point above the largest relevant cut, then choosing a fresh $`k`$ with the required parameter sufficiently large, and finally reading the entire finite payload under a condition below $`v`$. A fresh $`k`$ is distinct from the natural color of every old record and flag, so the stricter interaction test does not create a conflict. The number of dense requirements is at most $`\omega_1`$.

Let $`M`$ be a countable elementary model containing the auxiliary poset, $`\mathbb R`$, the names, and their finite reading relations. Put $`\delta=M\cap\omega_1`$. As before add a cut at $`\delta`$ to a condition from $`M`$, and take any extension $`w`$. Every retained record or flag whose ordinal entries are below $`\delta`$ (apart from a possible $`\omega_1`$ sentinel in a flag) now lies in $`M`$: its tag and other remaining entries are all finite data.

For the simultaneous copy at $`\delta`$, fix all finite payloads of the records there, including their tags and any thresholds. These are elements of $`M`$, even if no actual deciding conditions belong to $`M`$. Consider the assertion that some common limit ordinal above a given bound admits **each** of these payloads. The existence of a deciding condition is quantified separately for each record; no simultaneous $`\mathbb R`$-realization is required. This assertion holds because $`\delta`$ witnesses it. By elementarity there is one copy ordinal $`\bar\delta<\delta`$ above all finite inner bounds needed in the original proof.

Copying keeps every tag and prefix intact. Thus the two directions of the conflict check in a union with a condition in $`M`$ are unchanged, including use of the original clipped flags, cut guards, and the non-strict ordinal bound in the tail case. Explicitly, an outer record with a proxy interacts with an inner record or flag exactly when the proxy does. If there is no proxy, its high guard prevents the interaction geometrically, not through forcing compatibility. A clipped flag preserves its tag, so all tests against inner records are preserved. Retained exact flags and the additional exact flags for a copied tail record are handled exactly as before. This yields the same strong properness proof. The auxiliary poset still has size $`\omega_1`$, since **the forcing conditions do not occur in it**.

## Recover the avoiding coloring in the actual extension

Apply restricted PFA in the ground to the dense requirements above and let $`A`$ be the union of the filter's records. For each $`\gamma`$, define a ground-model dense set $`D_\gamma\subseteq\mathbb R`$ consisting of conditions forcing the finite reading of some record of $`A`$ at $`\gamma`$. It is dense because for each $`v`$ the auxiliary filter met the corresponding requirement. In the actual generic extension choose a record at each $`\gamma`$ whose reading is forced by a condition in the actual generic filter. Give $`\gamma`$ its chosen natural color. If two chosen records have the same color, their types are equal because both name-readings are correct in this extension; their prescribed index, if included, is equal for the same reason. Thus their tags interact. The same incompatibility check as in the original proof excludes their match, or bounds their requested tail at the upper threshold. This proves the two negative directions.

ZFC sufficiency for the bounded parameters is internal to the extension. For reversed roles or a mixed family, apply the ordinary obstruction or the forward-tail obstruction to the appropriate bad subfamily and relabel its countercoloring. The reversal construction is unchanged.

## Arbitrarily large Cohen forcing

For $`\operatorname{Add}(\omega,I)`$ with finite conditions, any pair of names consisting of a ladder system on $`\omega_1`$ and a countable sequence of finite types (or tail indices) depends on at most $`\omega_1`$ many Cohen coordinates. For each ladder coordinate and each type/index use a countable deciding maximal antichain, by ccc, and take the union of the finite supports of all its members. There are only $`\omega_1`$ coordinates of the named objects. Restriction to that set of Cohen coordinates is a complete factor of size at most $`\omega_1`$. Obtain the avoiding coloring there by the theorem. The counterexample's assertion about the now fixed ladders, types, coloring and ordinals is absolute to the rest of the Cohen extension. In particular the conclusion does not require $`\operatorname{Add}(\omega,I)`$ itself to be small.

The published source treats the negative result under restricted PFA in the model itself. The existing repository appendices handle countable forcing by tagging each record with its actual deciding condition. The change above removes that countability requirement and is what permits the large Cohen extension statement. Searches for the exact DTG and Cohen preservation terminology did not locate the stronger statement.

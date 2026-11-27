# Sharp width threshold for tail-coordinate guessing

This separates the ordinary/strong guessing classification from the extra quantitative clause of [Lambie-Hanson–Uhrik, Theorem 2.7](https://doi.org/10.1112/mtk.12261). It concerns the **oriented** clause of that theorem, using normalized types ending in 1; it does not assert a negative result for a variant allowing the two roles to be reversed.

## Statement

For a normalized type family \((t_k:k<\omega)\), call a ladder sequence *tail-guessing* if for every \(f:\lim(\omega_1)\to\omega\) there is a limit \(\beta\), of color \(k=f(\beta)\), such that for every \(\eta<\beta\) some \(\alpha<\beta\) of color \(k\) satisfies
\[
\operatorname{type}(C_\alpha[n_k],C_\beta[n_k])=t_k
\quad\text{and}\quad C_\alpha(n_k)>\eta .
\]
The order of the two prefixes here matters. In ZFC, bounded widths suffice, by the published theorem. Under \(\mathsf{PFA}(\omega_1)\), bounded widths are also necessary, and remain necessary after any countable forcing over that model. This includes new type and ladder sequences in the extension.

In particular there are width-unbounded normalized families with bounded depth and reach for which ZFC proves stationary rectangles of matches, but the extra tail-coordinate requirement consistently fails. For example use \(t_k=01\,0^{k+1}1^{k+1}\). Here \(d_k=r_k=1\).

## Ground-model auxiliary forcing

Allow any countable ground forcing \(\mathbb R\), including trivial forcing. Work below a condition forcing that \(\dot C\) is a ladder sequence and the widths of the normalized \(\dot t\) are unbounded; replace \(\mathbb R\) by that cone. Normalize notation so that for a type of width \(n\), depth \(d\) and reach \(r\) one has
\[
t=\sigma0^{n-r}1^{n-d},
\]
where \(\sigma\) includes the \(d\) internal 1s and ends at the last of them. For a separated type use \(d=r=0\) and \(\sigma\) empty.

A **record** \((\gamma,k,p,h)\) has \(\gamma\in\lim(\omega_1)\), \(k\in\omega\), \(p\in\mathbb R\) deciding \(t=\dot t_k\) and the \((n+1)\)-prefix \(a=\dot C_\gamma[n+1]\), and a ground ordinal \(h\) with \(a(d)\le h<\gamma\). Its tag is \((k,p)\). Tags interact if their natural colors agree and their \(\mathbb R\)-conditions are compatible; interacting tags decide the same type.

A **flag** for a tag deciding \(t\) has an increasing \(d\)-tuple \(b\) of markers, a cutoff \(c>\max b\) (no lower bound if \(d=0\)), a threshold \(h\ge c\), and an ordinal bound \(u\le\omega_1\), with \(h<u\). The cutoff and threshold are countable. It forbids an interacting record at \(\alpha\) precisely if \(\alpha\le u\), its tail coordinate \(a(n)>h\), and the first \(n\) points are strictly below \(c\), disjoint from \(b\), and realize \(\sigma0^{n-r}\) against \(b\) as the 1-side. For \(d=0\) the merge requirement is just that all \(n\) lower points precede \(c\). Every record requires its exact flag \(b=a[d]\), \(c=a(d)\), the chosen \(h\), and \(u=\gamma\). A record cannot violate its own exact flag because its \(d\)-th ladder point is not below its cutoff. The test \(\alpha\le u\) is intentionally non-strict for auxiliary flags.

Conditions have finitely many ordinals as **cuts**, finitely many records and finitely many flags. They include every required exact flag and permit no flag–record conflict. For every cut \(\delta<\gamma\) and record at \(\gamma\), require at least one of:
1. both \(h\ge\delta\) and \(a(n-1)\ge\delta\);
2. there is a same-tag record at \(\alpha\le\delta\) with identical \((n+1)\)-prefix and identical \(h\).

The order is reverse inclusion. As in the countable-forcing proof for ordinary guessing, several records at one vertex are permitted; the eventual coloring picks just one.

## Density and strong properness

For each \(\gamma\) and \(v\in\mathbb R\), it is dense to place a record at \(\gamma\) with \(p\le v\). For the existing cuts below \(\gamma\), let \(\delta\) be the largest, or \(0\) if there are none. First extend \(v\) to decide a ladder point \(C_\gamma(j)\ge\delta\); then decide a fresh color \(k\), not used by any record or flag, of width \(n_k>j\), and decide the required \((n_k+1)\)-prefix. Choose \(h=\max(\delta,a(d_k))<\gamma\). The new record has the first guard for all cuts below it and its exact flag does not conflict with anything. Unbounded widths, not unbounded depth or reach, supply the fresh color.

Let \(M\) be a large countable elementary model containing all parameters. Put \(\delta=M\cap\omega_1\). Adding cut \(\delta\) to a condition in \(M\) is valid. Given an arbitrary extension \(w\) of this master candidate, reduce it into \(M\) as follows.

* Keep cuts and records below \(\delta\).
* If \(w\) has records at \(\delta\), make a simultaneous copy at one limit ordinal \(\bar\delta<\delta\) above **every countable ordinal below \(\delta\) occurring in the finite data of \(w\)**. In particular it is above all flag bounds \(u<\delta\) and all thresholds of the records being copied. Keep tags, full decided prefixes and thresholds unchanged. The deciding conditions belong to \(M\) by countability of \(\mathbb R\); the decisions and copied thresholds are finite data in \(M\), and \(\delta\) witnesses the existence of a suitable ordinal above any given bound. Thus elementarity yields one \(\bar\delta\) simultaneously realizing all these decisions.
* Drop every flag with \(h\ge\delta\), since no inner record can have \(a(n)>h\). All remaining flags have \(b,c,h\) entirely below \(\delta\) because \(c\le h\). Keep them but replace any \(u\ge\delta\) by \(\omega_1\). Add the exact flags for the copy, with bound \(\bar\delta\).

The reduction is valid. For retained records below \(\delta\) the flag tests are unchanged. The same is true for replacing a record at \(\delta\) by its copy: if a retained original flag had \(u<\delta\), then \(\bar\delta>u\); if \(u\ge\delta\), the original test \(\delta\le u\) was already enabled. Dropped flags cannot hit the copied tail coordinate either. A copied exact flag is weaker than the clipped version of its original when tested against any record. Guards at retained cuts remain valid for the copy by preserving the data and retaining all witnesses below the cut. The reduction lies in \(M\).

If \(s\in M\) extends the reduction, take the coordinatewise union of \(s\) and \(w\). A \(w\)-flag versus an \(s\)-record was already tested via its clipped version, or the high threshold makes conflict impossible. An \(s\)-flag versus an outer \(w\)-record at \(\gamma\ge\delta\) also cannot conflict: if the flag has a countable bound \(u\) then \(u<\delta\) and the ordinal test fails. If it has bound \(\omega_1\), its cutoff is below \(\delta\); the first guard at \(\delta\) rules out any outer prefix with last point at least \(\delta\), and otherwise a same-tag same-data proxy in \(s\) gives the identical effective test. For \(\gamma=\delta\) use the copy itself as proxy. When an old guard points to a proxy at \(\delta\), use the copy in its place. Inner \(w\)-records are already in \(s\).

For new cuts of \(s\) below an outer \(w\)-record, either the first guard at \(\delta\) works at the smaller cut or the same proxy does (if the proxy is above the new cut, use its guard in \(s\)). Exact flags are present for all records. Therefore the union is a condition, proving strong properness of the ground poset of size \(\omega_1\).

## Extracting the countercoloring

Use \(\mathsf{PFA}(\omega_1)\) in the ground model to take a filter for all the dense sets indexed by \((\gamma,v)\). In the \(\mathbb R\)-extension, for each \(\gamma\) pick a record from the union whose deciding condition is in the actual generic filter. This is possible since those deciding conditions are dense in \(\mathbb R\) for each \(\gamma\). Give \(\gamma\) that color \(k\) and its threshold \(h_\gamma<\gamma\).

If an oriented match at \(\alpha<\beta\) of this color had \(C_\alpha(n_k)>h_\beta\), the chosen records would interact, and the exact flag at \(\beta\) would forbid the record at \(\alpha\): all lower points are below the first terminal upper point \(C_\beta(d_k)\), and the shorter word is exactly \(\sigma0^{n_k-r_k}\). Such a conflict cannot occur in the union of a filter. Thus each \(\beta\) has an actual bounded threshold, ruling out tail-guessing. This does not rule out the ordinary strong matching from the stationary-rectangle theorem.

## Scope and priority

The published bounded-width theorem includes the extra oriented tail clause. The published unbounded-depth obstruction and this repository's unbounded-reach obstruction address ordinary guessing; neither handles unbounded-width types with bounded depth and reach. The present proof uses a distinct two-sided flag: the cutoff constrains incoming prefixes and the high-tail threshold suppresses outgoing cross-model interactions. It does not settle the separate slow-growth graph problem.

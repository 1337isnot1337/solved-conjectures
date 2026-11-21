# Shallit 2014 Problem 11: excluded as already resolved

Checked 2026-11-21. This target is closed to this campaign. It contributes **zero** new solutions and no award claim.

## Original cash offer and exact mathematical scope

Jeffrey Shallit’s [2014 sponsor slides](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf), printed slides 36–37, define finite-state transduction and offer £20 for deciding whether the Thue–Morse word is prime. Write $`x\ge y`$ when a deterministic sequential finite-state transducer sends the infinite word $`x`$ to $`y`$. A prime, or atom, degree is a nonperiodic degree with no nonperiodic degree strictly below it. The transitions may output arbitrary finite words, including the empty word. There is no bound on the number of states.

The offer is a personal monetary offer, rather than a donation in the solver’s name. Its award/payment status was not checked with the sponsor, because the full problem already has a prior solution.

## Decisive prior source

The freshly opened [Endrullis primary research page](https://joerg.endrullis.de/research/finite-state-transducers/) marks both of the following as solved:

- In “A Simple Question,” deleting every third letter of the period-doubling word produces a word that does not transduce back.
- In “Open questions,” the exact question whether the Thue–Morse degree is an atom has the answer no.

The page credits **Marcel Horbach with ChatGPT**, citing *A strict finite-state transducer image of the Thue–Morse word*, unpublished, 2026. Its linked [October 2026 note](https://joerg.endrullis.de/assets/research/transducer-degrees-note.pdf), *Results on the transducer degrees, formalized in Lean 4* by Claude (Anthropic) and Jörg Endrullis, states the result in §4.6, Theorem 4.9, printed page 8. The note separately credits this theorem to Horbach.

Using the note’s zero-based conventions,


```math
P(n)=1-(\nu_2(n+1)\bmod 2),\qquad
Q(2k)=P(3k),\qquad Q(2k+1)=P(3k+1).
```


The theorem gives


```math
P\ge Q,\qquad Q\not\ge P,\qquad 0<Q<P\equiv M,
```


where $`M`$ is the Thue–Morse word. The original note’s §1 defines the same unrestricted sequential FST model as the sponsor problem, explicitly allowing empty outputs. Thus this is a resolution of the full question, not a finite state-count check or a restricted transducer case.

The note advertises Lean declarations `Transducts.Q_lt_P` in `Transducts.QvsP` and `Transducts.M_gt_Q` in `Transducts.TableR7`. This screen inspected their stated scope and the informal proof sketch. It did **not** download or rebuild the external Lean project, and does not certify that build independently.

## Elementary scope check: the strict image is not periodic

The nonperiodicity clause is essential: a strict image in the periodic bottom degree would not refute primality. Here it can be checked directly. Put $`a(k)=P(3k)`$. Fix any proposed positive eventual period $`d`$, and let $`h=\nu_2(d)`$. Choose arbitrarily large $`j>h`$ whose parity is different from that of $`h`$. Choose $`c=1`$ if $`j`$ is even and $`c=5`$ if $`j`$ is odd. Then $`c2^j\equiv1\pmod3`$, so


```math
k=\frac{c2^j-1}{3}
```


is a nonnegative integer tending to infinity. We have


```math
\nu_2(3k+1)=j,
\qquad
\nu_2(3(k+d)+1)=\nu_2(c2^j+3d)=h.
```


Hence $`a(k)\ne a(k+d)`$. No $`d`$ is an eventual period of $`a`$. Since every arithmetic subsequence of an ultimately periodic word is ultimately periodic, $`Q`$ is not ultimately periodic either.

The equivalence $`M\equiv P`$ comes from taking successive bit differences in one direction and running parity in the other. Therefore $`Q\ge M`$ would imply $`Q\ge P`$, contradicting Horbach’s theorem. This confirms that the cited result addresses the exact sponsor target.

## Audit correction and repository record

An initial reservation used stale search excerpts that continued to display the old open-question wording, together with the sponsor’s incomplete [2014-talk update list](https://cs.uwaterloo.ca/~shallit/talks.html). The fresh full primary page contains the resolution notices. This invalidates that initial eligibility assessment.

Initial reservation: [issue 223, comment 7068797192](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068797192). The [corrective follow-up, comment 7068840502](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068840502), withdraws the reservation and credits the prior resolution. The preliminary block-transition idea was stopped before further development; it is not a contribution to the solved bounty.

**Status:** already resolved by prior work; excluded. **Campaign completion credit:** 0. No sponsor contact, submission, payment request, or award claim was made.

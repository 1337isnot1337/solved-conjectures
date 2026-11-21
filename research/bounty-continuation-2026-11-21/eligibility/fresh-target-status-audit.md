# Fresh target status checks after the threshold proof

Checked 21 November 2026. Coordination:
[issue 223, comment 7069204391](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069204391).
This is an exclusion record, not another solution or prize claim.

## Withdrawn Scott offers

The [Ridgway Scott Foundation's maintained hub](https://people.cs.uchicago.edu/~ridg/prizes/prizes.html)
states that its zero-gradient and inf-sup prizes are closed until further
notice. Its indexed primary text was retrieved directly through web search;
a separate direct fetch returned HTTP 502. The older PPL 115 and PPL 148
records still present the offers as open. The sponsor's closure controls this
selection decision. Closure does not establish a mathematical resolution or
payment of either award.

## Green 15: an exact public prior-art conflict

The original question asks for a Lipschitz function from the natural numbers
to the integers whose graph has no nontrivial three-term arithmetic
progression. See [Green's primary problem list](https://people.maths.ox.ac.uk/greenbj/papers/open-problems.pdf),
Problem 15.

Shallit's [18 November 2026 paper](https://arxiv.org/abs/2611.24441),
[full text](https://arxiv.org/html/2611.24441v1), gives an explicit infinite
word on six positive integers and claims it has no additive square. Its
statement and explicit construction were inspected. The paper is also linked
from [Shallit's maintained publications page](https://cs.uwaterloo.ca/~shallit/papers.html).

The match is exact: for bounded integer letters $`x_i`$, put
$`f(n)=\sum_{i\lt n}x_i`$. Bounded letters make $`f`$ Lipschitz. A nontrivial
three-term progression in the graph has indices $`a,a+h,a+2h`$ with
$`h>0`$, and its second-coordinate equation says that the two consecutive
length-$`h`$ blocks have equal sums. Thus the claimed word would solve the
whole graph problem, not a fixed-size restriction.

This audit has not independently certified every step of Shallit's word
construction. It records an inspectable, dated proof with exactly the needed
conclusion, and therefore excludes a fresh-priority attack here pending that
proof's assessment. It does not count a new proof by this campaign or infer
that any platform reward was accepted or paid for Green 15.

## Already accepted platform targets

The following current primary platform pages explicitly record accepted Lean
results and payment. They are not reserved for new work:

| Target | Displayed decision |
| --- | --- |
| [Erdős 624](https://conjectures.io/problems/erdos624-erdos-624) | Approved 19 November 2026; paid. |
| [Erdős 653](https://conjectures.io/problems/erdos653-erdos-653) | Proved; approved 16 September 2026; paid. |
| [Erdős 579](https://conjectures.io/problems/erdos579-erdos-579) | Formal result accepted 6 October 2026; paid. |
| [Green 39](https://conjectures.io/problems/green39-green-39) | Disproved; approved 22 September 2026; paid. |
| [Green 51, half-density target](https://conjectures.io/problems/green51-green-51-one-half) | Half-density target proved; approved 9 September 2026; paid. |

These are reports of the platform's decisions. The underlying Lean dependency
closures were not rebuilt in this selection pass.

## Selected lane

The separate [Erdős 600 target note](../erdos600/target-and-augmentation.md)
records the fresh reservation and mathematical attempt. No fees, submissions,
private-log uploads, account changes, or financial transfers occurred.

# Cut-distance stability of the Vega comparison

An independent research pass found the following sharper parameter rows in the [reviewed Vega proof](VEGA-TEMPLATES.md), which apply directly to the graphon route for [Erdős Problem 23](https://www.erdosproblems.com/23). The unrestricted conjecture is still open.

Run the same contradiction argument with a proposed upper bound b, an edge-mass cap e_0, tau=(11b-1/4-e_0)/6 and r=18 tau. Let t_0 be a lower bound for 2 sqrt(tau). The required contradiction threshold is 98b-22 e_0. The two outer-light endpoint upper bounds are

    (1-2r-t_0)² + 5r t_0 - 30 tau,       .535 - 35 tau.

They use t_0²<4 tau, 5r<1, and the square-completion check (.5-r)²/4+r(.5-2r)/2<.057. The outer-heavy bounds are the two endpoint values at c=.17 and c=.5 of

    3.33 c² - 2.5 c + 1.25 - 27(5b-e_0)/2,

and, in the small-core case, 2.48(.17)²+18.5 e_0-77.5 b. All are strictly less than the contradiction threshold in each row below.

| b | e_0 | t_0 | Threshold | Light endpoints | Heavy endpoints and small core |
| --- | --- | --- | --- | --- | --- |
| .039873 | .15985 | .13845 | .390854 | .390712889774, .367275 | .3877845, .2990475, -.0612605 |
| .039885 | .1599075 | .1386 | .390765 | .389737621725, .366840 | .38775075, .29901375, -.06112675 |

Thus a middle-band graph is safe whenever a Vega preimage on the same weighted vertices would require deleting at most .000127 of its actual edges. Use their graph intersection as the preimage; missing edges of the original graph are never charged.

On a common probability space, with cut norm defined by the supremum on products of two measurable sets, unordered edge densities differ by at most half the norm. Minimum unordered monochromatic mass differs by at most the norm, because each cut's loss is the average of the integrals over its two same-side squares. Relabeling or taking common measure-preserving pullbacks does not change the minima. A middle-band graphon less than .000115 in cut distance from the cut-metric closure of Vega preimages can therefore be compared with a finite preimage of edge mass at most .15985+.000115/2=.1599075. Its minimum is at most .039885, and adding the cut distance stays at or below .04. The [circular-three estimate](CIRCULAR-THREE.md) gives the same cut-distance conclusion for the circular preimage closure, with surplus slack. This is a **weak-metric neighborhood** rather than an assumption of pointwise edge-edit proximity.

These estimates are a supplement to the independently reviewed proof at [a05d756](https://github.com/1337isnot1337/solved-conjectures/commit/a05d756), not part of the scope claimed in its publication PR.

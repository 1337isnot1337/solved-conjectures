# Independent review of subcritical cycle-deletion failure

21 November 2026. Reviewed [the explicit barrier construction](subcritical-cycle-deletion-counterexample.md), SHA256 `06520ca34c322e66004f591d2cee83bfd9a4dbb13213ce93adf30873ac9f0031`.

The construction passes this written review. It gives a finite static barrier meeting every contact deadline at speed $`19/10`$, whose remainder fails a deadline after its attached circle is deleted. Both barriers are nonconfining. This is an obstruction to an unrestricted deletion rule, not a resolution or refutation of the critical-speed prize. No Lean verification or bounty completion is reported.

## Every original deadline

The geometry is explicit for every integer $`H\ge1000`$. With $`A=2H/5`$, the leading wall is the unit circle centered at $`(A,0)`$ and its vertical arms from heights $`\pm1`$ to $`\pm H`$. The $`2H`$ later unit segments are disjoint, lie near $`(2A,0)`$, and have total length exactly $`2H`$. The retained junction endpoints ensure that the remainder is compact.

For any reached point, its Euclidean distance from the origin is at most elapsed time plus one. I checked the upper bound on arm length inside a radius-$`u`$ disk by dividing by $`u`$ before the tip radius and using the constant arm-length bound afterwards. This gives the stated coefficient $`10/\sqrt{29}`$. Counting the entire circle is an upper bound even before all of it is touched.

No leading wall is contacted before $`A-2`$. For later times $`t\ge398`$, the strict inequality $`10/\sqrt{29}<15/8`$ leaves slope margin $`1/40`$ below $`19/10`$. The displayed bounds give $`t/40\ge199/20>79/8>2\pi+15/8`$. Thus the leading wall alone meets every deadline, not just asymptotically. Adding the remote segments can only reduce contact with that leading wall.

To approach a remote segment in the original geometry, a path must cross $`x=A`$ at height of magnitude greater than $`H`$. Between heights $`-1`$ and $`1`$, the path would enter the circle's bounded interior; all remaining crossings between the tips meet an arm or junction. This line-crossing argument applies to paths beginning at any point of the initial unit disk, rather than just at its center.

At a crossing $`z=(A,y)`$, the prefix and suffix lengths are bounded below by $`|z|-1`$ and $`|z-(2A,0)|-1`$. Since the two center distances are equal, the arrival time at any remote segment is at least $`T_*=2\sqrt{A^2+H^2}-2`$. The note explicitly handles approximating endpoints, so the bound applies to closure contact as well as to an attained path endpoint.

I recomputed the total-length slack:

```math
\frac{19}{10}T_*-(4H-2+2\pi)
=\left(\frac{19\sqrt{29}}{25}-4\right)H-\frac95-2\pi.
```

The rational bounds $`\sqrt{29}>16/3`$ and $`\pi<4`$ make this positive throughout the claimed range. Before $`T_*`$ only the leading wall is contacted; at and after $`T_*`$ the entire barrier length fits within the budget. These two intervals prove all original deadlines.

## The failed deadline after deletion

After deleting the circle, each remote segment can be approached by starting at $`(0,3/4)`$, moving horizontally above every remote segment, then descending along a vertical line just to the right of the selected segment. The horizontal route crosses the former circle's location between the retained arms. A positive offset smaller than half the segment spacing keeps the vertical route between adjacent segments. This remains possible for each finite $`H`$, however small that spacing becomes.

For every endpoint height between $`-1/2`$ and $`1/2`$, the route length is strictly less than $`2A+2`$. Letting the offset tend to zero puts the entire remote segment in the reached-set closure at that common time. Thus the contacted length is at least $`2H`$, while the budget is only $`(19/10)(4H/5+2)`$. Their difference is $`12H/25-19/5>0`$.

The construction therefore survives the all-times admissibility check that defeated the earlier straight-arm example. Its accelerated remote contacts have delay growing linearly with $`H`$ despite the removed circle's fixed perimeter.

## Scope

The negative horizontal ray stays open in both configurations, so neither confines the fire. Removing the remote segments together with the circle removes the demonstrated budget violation. Neither the argument nor its conclusion rules out a deletion theorem that assumes confinement or optimality and permits coordinated removal of additional walls. The positive-clearance assumption of the isolated-loop theorem fails at the arm junctions, so that theorem is unaffected.

The general fact that deletion can invalidate later walls is already discussed in Bressan–Chiri. The reviewed note makes no new-priority claim for that phenomenon. Its contribution to this investigation is an exact subcritical, all-deadlines obstruction to the specific proposed unconditional rule.

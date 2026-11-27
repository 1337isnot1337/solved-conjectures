# Robust counting and model limits

## Online hitting with outliers

The counting proof does not depend on a graph once the
requests are specified. Suppose that each request is a
nonempty set of at most r options, that an algorithm may
select one option per request, and that it may only select
options from that request. On every unhit request, increment
all its option counters and select an option of maximum
counter. Leave hit requests alone.

For any prefix, let U count selections. If a comparator of
size k intersects all but B requests in that prefix, then

```math
U\le B+rk+\sqrt{r^2k^2+2Brk}.
```

When k is positive, at most B unhit requests have no
comparator option. If b is their actual number, assign all
other unhit requests to a comparator option that they
contain. The same counting audit as in the graph proof
gives (U−b)² at most 2rkU. Now increase b to its upper bound B
in the solved quadratic. If k is zero, the hypothesis
requires B at least the total number of requests and the
claim follows immediately.

The point of this bound is the simultaneous treatment of
comparator size and outliers. Replacing each outlier with a
new comparator option and using an ordinary bound linear in
r would multiply the outlier term by r. In the graph model
there are at most dk outliers because each later optimal
dominator sees only d earlier vertices.

## No cost-independent weighted analogue

In the weighted version, start with one isolated vertex of
weight M. The algorithm must select it. Next reveal one
adjacent vertex of weight 1. The arrival degree is one and
the optimal weighted dominating set at that prefix costs 1.
At most one membership change cannot swap the old vertex
for the new one, so the algorithm still pays at least M.
This rules out any bound depending only on arrival degree
for the weighted 1-stable model, even if the entire stream
were known in advance.

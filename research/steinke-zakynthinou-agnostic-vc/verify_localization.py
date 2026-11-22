"""Check the finite Gibbs, support, sensitivity, and histogram identities."""
from itertools import combinations, product
from math import exp, log, sqrt


def kl(p, q):
    return sum(mass * log(mass / q[h]) for h, mass in p.items())


def objective(h, anchor, sample, threshold):
    mistakes = sum(h[x] != y for x, y in sample)
    anchor_mistakes = sum(anchor[x] != y for x, y in sample)
    distance = sum(h[x] != anchor[x] for x, _ in sample)
    return mistakes - anchor_mistakes + 3 * max(0, distance - threshold), distance


def trace_gibbs(hypotheses, anchor, sample, eta, threshold):
    reps = {}
    for h in hypotheses:
        reps.setdefault(tuple(h[x] for x, _ in sample), h)
    weights = {h: exp(-eta * objective(h, anchor, sample, threshold)[0]) for h in reps.values()}
    return {h: w / sum(weights.values()) for h, w in weights.items()}


def deletion_checks():
    count = 0
    hypotheses = list(product(range(2), repeat=3))
    families = [hypotheses, [h for h in hypotheses if sum(h) <= 1], hypotheses[1::2]+hypotheses[:1]]
    for family in families:
        for xs in ((0, 1, 2, 2), (1, 1, 1, 1), (1, 2, 1, 2)):
            for ys in product(range(2), repeat=len(xs)):
                sample = list(zip(xs, ys))
                for eta, threshold in ((0.25, 1.5), (1.0, 0), (1.1, 3)):
                    anchor = family[-1]
                    q = trace_gibbs(family, anchor, sample, eta, threshold)
                    distance = sum(v * objective(h, anchor, sample, threshold)[1] for h,v in q.items())
                    assert 2*distance <= 3*threshold + log(len(q))/eta + 1e-10
                    for i, (x, _) in enumerate(sample):
                        sub = sample[:i]+sample[i+1:]
                        p = trace_gibbs(family, anchor, sub, eta, threshold)
                        assert p.keys() <= q.keys()
                        mass = sum(q[h] for h in p)
                        assert mass >= 1/(1+exp(4*eta))-1e-12
                        lost = [h for h in q if h not in p]
                        for h in lost:
                            assert sum(all(g[u] == h[u] for u,_ in sub) and g[x] != h[x] for g in p) == 1
                        conditional = {h:q[h]/mass for h in p}
                        diff = {h:objective(h, anchor, sub, threshold)[0] -
                                  objective(h, anchor, sample, threshold)[0] for h in p}
                        assert all(abs(d) <= 4*(h[x] != anchor[x]) for h,d in diff.items())
                        assert abs(kl(p,q) + log(mass) - kl(p,conditional)) < 1e-10
                        count += 1
    return count


def tree_law(loss, temperatures):
    # Leaves in a full balanced tree in left-to-right order.
    states = [(v,{i:1.0}) for i,v in enumerate(loss)]
    for tau in reversed(temperatures):
        parents = []
        for j in range(0,len(states),2):
            children = states[j:j+2]
            weights = [exp(-value/tau) for value,_ in children]
            total = sum(weights)
            probs = {h:w*p/total for w,(_,dist) in zip(weights,children) for h,p in dist.items()}
            parents.append((-tau*log(total/2),probs))
        states = parents
    return states[0]


def tree_checks():
    count = 0
    base = [2,4,0,3,1,5,2,0]
    temperatures = (4,2,1)
    value, old = tree_law(base,temperatures)
    assert sum(old[h]*v for h,v in enumerate(base)) <= value + 1e-12
    assert value <= min(base)+sum(temperatures)*log(2)
    for mask in product(range(2),repeat=8):
        updated, new = tree_law([v+x for v,x in zip(base,mask)],temperatures)
        assert -1e-12 <= updated-value <= 1+1e-12
        for h in old:
            assert exp(-1)-1e-12 <= new[h]/old[h] <= exp(1)+1e-12
        step = 1e-5
        plus,_ = tree_law([v+step*x for v,x in zip(base,mask)],temperatures)
        assert abs((plus-value)/step - sum(old[h]*x for h,x in enumerate(mask))) < 1e-5
        count += 1
    return count


def histogram_checks():
    count = 0
    true = (0.04,0.22,0.74)
    pilot = 10
    for first in range(pilot+1):
        for second in range(pilot+1-first):
            counts = (first,second,pilot-first-second)
            noise = (0.8,2.1,1.2)
            law = [(n+g)/(pilot+sum(noise)) for n,g in zip(counts,noise)]
            missing = sum(p for p,n in zip(true,counts) if n < pilot*p/2)
            for size in range(4):
                for subset in combinations(range(3),size):
                    assert sum(true[i] for i in subset) <= 2*(1+sum(noise)/pilot)*sum(law[i] for i in subset)+missing+1e-12
                    count += 1
    # At shape three, unit-scale gamma affinity under a shift by u is e^(-u/2)(1+u/2).
    for u in (0.001,0.05,0.2,1,3):
        affinity = exp(-u/2)*(1+u/2)
        assert 2*(1-affinity) <= (u/2)**2 + 1e-12
    return count


if __name__ == '__main__':
    print(f'{deletion_checks()} deletions, {tree_checks()} tree tilts, '
          f'{histogram_checks()} histogram events, and five gamma shifts passed.')

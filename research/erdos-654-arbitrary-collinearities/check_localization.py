"""Check the local carrier charges and the disk-escape step with exact arithmetic."""
from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations
from math import gcd


def check(condition, description):
    if not condition:
        raise AssertionError(description)


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def normalized_line(a, b, c):
    factor = gcd(a, gcd(b, c))
    if a < 0 or (a == 0 and b < 0):
        factor = -factor
    return a // factor, b // factor, c // factor


def side_and_axis(p, q):
    u, v = q[0] - p[0], q[1] - p[1]
    carrier = normalized_line(v, -u, u * p[1] - v * p[0])
    axis = normalized_line(2*u, 2*v, d2(p,(0,0)) - d2(q,(0,0)))
    return carrier, axis


def meet(line1, line2):
    a, b, c = line1
    d, e, f = line2
    det = a*e - b*d
    if det:
        return Fraction(b*f - c*e, det), Fraction(c*d - a*f, det)
    return None


def on(line, point):
    a, b, c = line
    return a*point[0] + b*point[1] + c == 0


def verify_fixture(points):
    n = len(points)
    check(len(set(points)) == n, "fixture sites must be distinct")
    sites = range(n)
    edges = {e:side_and_axis(*(points[i] for i in e)) for e in combinations(sites,2)}
    disks = set()
    for a,b in combinations(points,2):
        center = Fraction(a[0]+b[0],2), Fraction(a[1]+b[1],2)
        disks.add((center,d2(center,a)))
    circles = Counter()
    from_centers = {i:set() for i in sites}
    for a,b,c in combinations(sites,3):
        center = meet(edges[a,b][1],edges[a,c][1])
        if center is None:
            continue
        circle = center,d2(center,points[a])
        disks.add(circle)
        circles[circle] += 1
        if center in points:
            from_centers[points.index(center)].add(frozenset((a,b,c)))
    check(max(circles.values()) == 1, "invalid fixture: four cocircular sites")
    for i,p in enumerate(points):
        shells = defaultdict(list)
        for j,q in enumerate(points):
            if j!=i:
                shells[d2(p,q)].append(j)
        by_distance = {frozenset(shell) for shell in shells.values() if len(shell)==3}
        check(by_distance == from_centers[i], "circumcenter vs pinned radius classes")

    totals = Counter()
    for count in range(n+1):
        for subset in combinations(sites,count):
            base = frozenset(subset)
            totals["base subsets"]+=1
            axes = defaultdict(list)
            carriers = defaultdict(set)
            for edge in combinations(subset,2):
                carrier, axis = edges[edge]
                carriers[carrier].update(edge)
                axes[axis].append(edge)
            for pairs in axes.values():
                check(len({edges[e][0] for e in pairs})==1, "unique carrier of one axis")
                check(len({v for e in pairs for v in e})==2*len(pairs), "disjoint reflections")
                if len(pairs)>1:
                    totals["multiple-pair axes"]+=1
            for pin in sites:
                triples = [t for t in from_centers[pin] if t<=base]
                for cap in range(1,n+1):
                    charges = set()
                    for triple in triples:
                        sides = list(combinations(sorted(triple),2))
                        small = [edge for edge in sides if len(carriers[edges[edge][0]])<=cap]
                        if small:
                            edge = small[0]
                            check(on(edges[edge][1],points[pin]), "pin misses small-side axis")
                            key = "incidence",edge
                            totals["small-carrier charges"]+=1
                        else:
                            line1,line2 = (edges[edge][0] for edge in sides[:2])
                            vertex = meet(line1,line2)
                            check(vertex in [points[i] for i in triple], "two large sides miss vertex")
                            key = "intersection",vertex
                            totals["large-carrier charges"]+=1
                        check(key not in charges,"collision in a per-pin charge")
                        charges.add(key)
                    totals["pin/base/cutoff checks"]+=1

    # Every smallest disk containing k>=2 sites is supported by a diameter or
    # three boundary sites. Check every tied choice; distances stay rational.
    disk_data=[]
    for center,radius2 in disks:
        distances=[d2(center,p) for p in points]
        disk_data.append((radius2,distances,sum(v<=radius2 for v in distances)))
    for k in range(2,n+1):
        least = min(r for r,distances,pop in disk_data if pop>=k)
        for r,distances,pop in disk_data:
            if r!=least or pop<k:
                continue
            inside=[i for i in sites if distances[i]<=r]
            for pins in combinations(inside,k):
                for R in range(1,7):
                    first={j for j in sites if distances[j]>(R+2)**2*r}
                    outer={j for j in sites if distances[j]>R**2*r}
                    lhs=sum(len(triple & first) for i in pins for triple in from_centers[i])
                    rhs=3*sum(triple<=outer for i in pins for triple in from_centers[i])
                    check(lhs<=rhs, "escape count inequality")
                    check(all(triple<=outer for i in pins for triple in from_centers[i]
                              if triple & first), "far base lost a mate")
                    totals["smallest-disk escape checks"]+=1
                    totals["strict escaping pairs"]+=lhs
    return totals


if __name__=="__main__":
    totals=Counter()
    for sites in (
        [(0,0),(5,0),(3,4),(-4,3),(1,0),(2,0),(11,0),(-9,0),(4,-8)],
        [(0,0),(5,0),(3,4),(-4,3),(8,2),(1,12),(-9,5),(-6,-8),(7,-11),(0,1)],
    ):
        totals.update(verify_fixture(sites))
    for key in ("multiple-pair axes","large-carrier charges","small-carrier charges",
                "strict escaping pairs"):
        check(totals[key]>0, "fixture does not exercise "+key)
    for key,count in sorted(totals.items()):
        print(f"{key}: {count}")

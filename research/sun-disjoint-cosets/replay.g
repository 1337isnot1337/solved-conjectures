# Reconstruct right cosets from group arithmetic, then invert to left cosets.
# Arguments to ReplayPacking are a SmallGrp order and ID, and [index, mask] pairs.
ReplayPacking := function(n, id, entries)
    local group, elements, left, entry, chosen, a, subgroup, original, gcds, k;
    group := SmallGroup(n, id);
    elements := AsSSortedList(group);
    left := [];
    for entry in entries do
        if Length(entry) <> 2 or not IsPosInt(entry[2]) or entry[2] >= 2^n then
            Error("invalid index and mask pair");
        fi;
        chosen := Filtered([1..n], i -> QuoInt(entry[2], 2^(i-1)) mod 2 = 1);
        original := Set(elements{chosen});
        a := original[1];
        subgroup := Subgroup(group, List(original, g -> g/a));
        if Index(group, subgroup) <> entry[1] or AsSet(RightCoset(subgroup,a)) <> original then
            Error("the mask is not a right coset of the claimed index");
        fi;
        Add(left, Set(original, Inverse));
    od;
    k := Length(left);
    if k < 2 or ForAny(Combinations([1..k],2), ij ->
            not IsEmpty(Intersection(left[ij[1]], left[ij[2]]))) then
        Error("at least two pairwise disjoint cosets required");
    fi;
    gcds := List(Combinations([1..k],2), ij -> Gcd(entries[ij[1]][1],entries[ij[2]][1]));
    return rec(number := k, maximumGcd := Maximum(gcds), counterexample := Maximum(gcds) < k);
end;

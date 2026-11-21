# GAP with SmallGrp. Run from an empty output directory.
# Example: gap -A -q -c 'orders:=[72];; Read("/path/to/counterexample.g"); QUIT;'
WriteCounterexampleData := function(n, id)
    local group, elements, stream, class, representative, index, subgroup, coset, mask;
    group := SmallGroup(n, id);
    if IsNilpotentGroup(group) then return; fi;
    elements := AsSSortedList(group);
    stream := OutputTextFile(Concatenation(String(n), "-", String(id), ".dat"), false);
    SetPrintFormattingStatus(stream, false);
    mask := set -> Sum(AsList(set), x -> 2^(PositionSorted(elements, x) - 1));
    AppendTo(stream, "GROUP ", id, " ", n, " ", Position(elements, One(group)) - 1,
             " ", StructureDescription(group), "\n");
    for class in ConjugacyClassesSubgroups(group) do
        representative := Representative(class);
        index := Index(group, representative);
        if index = 1 then continue; fi;
        AppendTo(stream, "ANCHOR ", index, " ", mask(representative), "\n");
        for subgroup in AsList(class) do
            for coset in RightCosets(group, subgroup) do
                AppendTo(stream, index, " ", mask(coset), "\n");
            od;
        od;
    od;
    CloseStream(stream);
end;
for n in orders do
    for id in [1..NrSmallGroups(n)] do WriteCounterexampleData(n, id); od;
od;

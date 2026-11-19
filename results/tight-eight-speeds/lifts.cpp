// Complete the prime-grid search by testing all primitive lifts modulo 6p.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <optional>
#include <set>
#include <string>
#include <vector>

#ifndef SPEED_COUNT
#define SPEED_COUNT 8
#endif
constexpr int count = SPEED_COUNT;
static_assert(count==8 || count==9);
using Tuple = std::array<int,count>;
using Word = std::uint64_t;
using Mask = std::vector<Word>;

int fold(int value, int modulus) {
    int r = value % modulus;
    return std::min(r,modulus-r); // all callers supply nonnegative integers
}

// For d dividing q, count how many of the d translates can be spoiled
// by entries that are nonzero modulo d. The proof supplies a base time
// at which the remaining entries have strict distance above 1/(count+1).
bool shift_witness(const Tuple& residues, int q) {
    for (int d=2; d<=q; ++d) {
        if (q%d) continue;
        int excluded=0;
        for (int c:residues) if (c%d) {
            int g=std::gcd(c,d);
            excluded+=g*((2*(d/g)+count)/(count+1));
        }
        if (excluded>0 && excluded<d) return true;
    }
    return false;
}

struct Grid {
    int q, words;
    std::vector<std::vector<Mask>> masks;

    Grid(int p, int modulus) : q(modulus), words((p*q+63)/64),
        masks(p/2+1,std::vector<Mask>(q,Mask(words))) {
        for (int x=1; x<=p/2; ++x) for (int c=0; c<q; ++c) {
            for (int k=0; k<q; ++k) for (int t=0; t<p; ++t) {
                int phase = q*x*t+p*c*k;
                int bit = k*p+t;
                if ((count+1)*fold(phase,p*q)>p*q)
                    masks[x][c][bit/64] |= Word(1)<<(bit%64);
            }
        }
    }

    bool witness(const Tuple& speeds, const Tuple& residues) const {
        for (int word=0; word<words; ++word) {
            Word common = ~Word(0);
            for (int i=0; i<count && common; ++i)
                common &= masks[speeds[i]][residues[i]][word];
            if (common) return true;
        }
        return false;
    }

    void assign(const Tuple& speeds, int i, Tuple& residues, int divisor,
                std::vector<Tuple>& survivors) const {
        if (i==count) {
            if (divisor!=1) return;
            if constexpr (count==9) {
                // q is 2 or 3 here. Each exceptional speed spoils at most one shift.
                if (std::count_if(residues.begin(),residues.end(),[](int x){return x!=0;})<q) return;
            }
            if (!witness(speeds,residues)) survivors.push_back(residues);
            return;
        }
        for (int c=0; c<q; ++c) {
            residues[i]=c;
            assign(speeds,i+1,residues,std::gcd(divisor,c),survivors);
        }
    }

    bool surviving_extension(const Tuple& speeds, const Tuple& base, int i, Tuple& lift) const {
        if (i==count) return !shift_witness(lift,q) && !witness(speeds,lift);
        for (int c=base[i]; c<q; c+=6) {
            lift[i]=c;
            if (surviving_extension(speeds,base,i+1,lift)) return true;
        }
        return false;
    }

    std::vector<Tuple> primitive_survivors(const Tuple& speeds) const {
        std::vector<Tuple> survivors;
        Tuple residues{};
        assign(speeds,0,residues,q,survivors);
        return survivors;
    }
};

void add_multiplicities(const std::vector<int>& support, std::size_t i, int used,
                        Tuple& tuple, std::set<Tuple>& output) {
    if (i==support.size()) {
        if (used==count) output.insert(tuple);
        return;
    }
    int remaining = static_cast<int>(support.size()-i-1);
    for (int end=used+1; end<=count-remaining; ++end) {
        std::fill(tuple.begin()+used,tuple.begin()+end,support[i]);
        add_multiplicities(support,i+1,end,tuple,output);
    }
}

std::set<Tuple> expanded_supports(const std::set<Tuple>& sets, const Grid& base) {
    std::set<Tuple> result;
    for (const Tuple& s:sets) for (int bits=1; bits<(1<<count); ++bits) {
        std::vector<int> support;
        for (int i=0; i<count; ++i) if (bits & (1<<i)) support.push_back(s[i]);
        bool witnessed=false;
        for (int word=0; word<base.words && !witnessed; ++word) {
            Word common=~Word(0);
            for (int x:support) common &= base.masks[x][0][word];
            witnessed=common!=0;
        }
        if (!witnessed) {
            Tuple tuple{};
            add_multiplicities(support,0,0,tuple,result);
        }
    }
    return result;
}

std::set<Tuple> aligned_residues(const Tuple& speeds, int p) {
    std::set<Tuple> result;
    for (int a=1; a<p; ++a) {
        Tuple signed_shape{};
        for (int i=0; i<count; ++i) for (int j=1; j<=count; ++j) {
            if (fold(a*j,p)==speeds[i]) signed_shape[i]=(a*j%p<=p/2 ? j : -j);
        }
        std::set<int> indices;
        for (int x:signed_shape) indices.insert(std::abs(x));
        if (indices.size()!=count || indices.contains(0)) continue;
        for (int unit:{1,5}) {
            Tuple residues{};
            for (int i=0; i<count; ++i) residues[i]=(unit*signed_shape[i]%6+6)%6;
            result.insert(residues);
        }
    }
    return result;
}

int main(int argc, char** argv) {
    if (argc!=2) return 2;
    int p=std::stoi(argv[1]);
    Grid base(p,1), two(p,2), three(p,3), six(p,6);
    std::optional<Grid> twelve, eighteen;
    if constexpr (count==9) {
        twelve.emplace(p,12);
        eighteen.emplace(p,18);
    }
    std::set<Tuple> sets;
    Tuple tuple;
    while (std::cin>>tuple[0]) {
        for (int i=1; i<count; ++i) if (!(std::cin>>tuple[i])) return 2;
        if (tuple.front()<1 || tuple.back()>p/2 || !std::is_sorted(tuple.begin(),tuple.end())
            || std::adjacent_find(tuple.begin(),tuple.end())!=tuple.end()) return 2;
        sets.insert(tuple);
    }
    if (sets.empty()) return 2;
    auto candidates=expanded_supports(sets,base);
    int matches=0;
    for (const auto& speeds:candidates) {
        auto mod2=two.primitive_survivors(speeds);
        if (mod2.empty()) continue;
        auto mod3=three.primitive_survivors(speeds);
        if (mod3.empty()) continue;
        auto aligned=aligned_residues(speeds,p);
        for (const auto& a:mod2) for (const auto& b:mod3) {
            Tuple residues;
            for (int i=0; i<count; ++i) residues[i]=(3*a[i]+4*b[i])%6;
            if (six.witness(speeds,residues)) continue;
            if (aligned.contains(residues)) {
                ++matches;
                continue;
            }
            if constexpr (count==9) {
                Tuple lift{};
                if (shift_witness(residues,6)
                    || !twelve->surviving_extension(speeds,residues,0,lift)
                    || !eighteen->surviving_extension(speeds,residues,0,lift)) continue;
            }
            return 1;
        }
    }
    if (!matches) return 2; // the consecutive tuple is always present
    std::cout<<p<<" passed ("<<candidates.size()<<" folded multisets).\n";
}

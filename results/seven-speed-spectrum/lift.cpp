// Exhaust binary lifts. Each bit of a pair of words represents one of 128 children.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <set>
#include <stdexcept>
#include <string>

using Speeds = std::array<int,7>;
using Word = std::uint64_t;
using Children = std::array<Word,2>;

struct Search {
    Children matching[128][128]{};
    std::set<Speeds> finite_directions;

    Search() {
        for (int fixed=0; fixed<128; ++fixed) for (int child=0; child<128; ++child)
            matching[fixed][fixed&child][child/64] |= Word(1)<<(child%64);
    }

    void record(Speeds speeds) {
        std::sort(speeds.begin(),speeds.end());
        if (!speeds.front() || std::adjacent_find(speeds.begin(),speeds.end())!=speeds.end()) return;
        int divisor=0;
        for (int x:speeds) divisor=std::gcd(divisor,x);
        for (int& x:speeds) x/=divisor;
        finite_directions.insert(speeds);
    }

    void visit(const Speeds& speeds, int modulus, int depth) {
        if (depth==10) throw std::runtime_error("unresolved residue class");
        int next=2*modulus;
        Children live{~Word(0),~Word(0)};
        if (modulus%2==0) {
            auto odd=std::find_if(speeds.begin(),speeds.end(),[](int x){return x%2;});
            if (odd==speeds.end()) return;
            // Multiplication by 1+modulus toggles all odd entries together.
            unsigned pivot=1u<<(odd-speeds.begin());
            live=matching[pivot][0];
        }
        Speeds phase=speeds;
        for (int t=1; t<=modulus && (live[0] || live[1]); t+=2) {
            int fixed=0, required=0, short_child=0;
            bool short_vector=true;
            Speeds small;
            for (int i=0; i<7; ++i) {
                int low=std::min(phase[i],next-phase[i]);
                int high=modulus-low;
                if (7*low<next) { fixed|=1<<i; required|=1<<i; }
                else if (7*high<next) fixed|=1<<i;
                small[i]=std::min(low,high);
                if (231*small[i]>4*next) short_vector=false;
                if (high<low) short_child|=1<<i;
                phase[i]=(phase[i]+2*speeds[i])%next;
            }
            // Each child in this mask has all seven distances at least 1/7.
            for (int j=0; j<2; ++j) live[j]&=~matching[fixed][required][j];
            Word bit=Word(1)<<(short_child%64);
            if (short_vector && (live[short_child/64]&bit)) {
                record(small);
                live[short_child/64]&=~bit;
            }
        }
        for (int word=0; word<2; ++word) {
            Word bits=live[word];
            while (bits) {
                int child=64*word+std::countr_zero(bits);
                bits&=bits-1;
                Speeds lift=speeds;
                for (int i=0; i<7; ++i) if (child&(1<<i)) lift[i]+=modulus;
                if (std::count_if(lift.begin(),lift.end(),[](int x){return x%2;})>=2)
                    visit(lift,next,depth+1);
            }
        }
    }
};

int main(int argc, char** argv) {
    if (argc!=2) return 2;
    int p=std::stoi(argv[1]);
    if (p<53 || p>300) return 2;
    Search search;
    Speeds s;
    std::size_t roots=0;
    while (std::cin>>s[0]) {
        for (int i=1; i<7; ++i) if (!(std::cin>>s[i])) return 2;
        if (!std::is_sorted(s.begin(),s.end()) || s.front()<1 || s.back()>p/2) return 2;
        search.visit(s,p,0);
        ++roots;
    }
    if (!roots) return 2;
    for (const auto& speeds:search.finite_directions) {
        for (int x:speeds) std::cout<<x<<' ';
        std::cout<<'\n';
    }
}

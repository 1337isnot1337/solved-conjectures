// Exhaust binary lifts, using one bit per child residue vector.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <set>
#include <stdexcept>
#include <string>

using Word = std::uint64_t;

template<int count, int short_num, int short_den, int depth_limit>
struct Search {
    using Speeds = std::array<int,count>;
    static constexpr int child_count=1<<count;
    using Children = std::array<Word,child_count/64>;
    Children matching[child_count][child_count]{};
    std::set<Speeds> finite_directions;

    Search() {
        for (int fixed=0; fixed<child_count; ++fixed) for (int child=0; child<child_count; ++child)
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
        if (depth==depth_limit) throw std::runtime_error("unresolved residue class");
        int next=2*modulus;
        Children live;
        live.fill(~Word(0));
        if (modulus%2==0) {
            auto odd=std::find_if(speeds.begin(),speeds.end(),[](int x){return x%2;});
            if (odd==speeds.end()) return;
            // Multiplication by 1+modulus toggles all odd entries together.
            unsigned pivot=1u<<(odd-speeds.begin());
            live=matching[pivot][0];
        }
        Speeds phase=speeds;
        for (int t=1; t<=modulus && std::any_of(live.begin(),live.end(),[](Word w){return w!=0;}); t+=2) {
            int fixed=0, required=0, short_child=0;
            bool short_vector=true;
            Speeds small;
            for (int i=0; i<count; ++i) {
                int low=std::min(phase[i],next-phase[i]);
                int high=modulus-low;
                if (count*low<next) { fixed|=1<<i; required|=1<<i; }
                else if (count*high<next) fixed|=1<<i;
                small[i]=std::min(low,high);
                if (short_den*small[i]>short_num*next) short_vector=false;
                if (high<low) short_child|=1<<i;
                phase[i]=(phase[i]+2*speeds[i])%next;
            }
            // Each child in this mask has all distances at least 1/count.
            for (int j=0; j<child_count/64; ++j) live[j]&=~matching[fixed][required][j];
            Word bit=Word(1)<<(short_child%64);
            if (short_vector && (live[short_child/64]&bit)) {
                record(small);
                live[short_child/64]&=~bit;
            }
        }
        for (int word=0; word<child_count/64; ++word) {
            Word bits=live[word];
            while (bits) {
                int child=64*word+std::countr_zero(bits);
                bits&=bits-1;
                Speeds lift=speeds;
                for (int i=0; i<count; ++i) if (child&(1<<i)) lift[i]+=modulus;
                if (std::count_if(lift.begin(),lift.end(),[](int x){return x%2;})>=2)
                    visit(lift,next,depth+1);
            }
        }
    }
};

template<int count, int short_num, int short_den, int depth_limit>
int enumerate(int p) {
    Search<count,short_num,short_den,depth_limit> search;
    std::array<int,count> s;
    std::size_t roots=0;
    while (std::cin>>s[0]) {
        for (int i=1; i<count; ++i) if (!(std::cin>>s[i])) return 2;
        if (!std::is_sorted(s.begin(),s.end()) || s.front()<1 || s.back()>p/2) return 2;
        search.visit(s,p,0);
        ++roots;
    }
    if (!roots) return 2;
    for (const auto& speeds:search.finite_directions) {
        for (int x:speeds) std::cout<<x<<' ';
        std::cout<<'\n';
    }
    return 0;
}

int main(int argc, char** argv) {
    if (argc<2 || argc>3) return 2;
    int p=std::stoi(argv[1]);
    if (p<53 || p>300) return 2;
    if (argc==2) return enumerate<7,4,231,10>(p);
    if (std::string(argv[2])=="--eight-speeds") return enumerate<8,1,92,12>(p);
    return 2;
}

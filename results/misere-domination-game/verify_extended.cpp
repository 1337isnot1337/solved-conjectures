// Independent exact minimax across every partition through a chosen total.
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <unordered_map>
#include <vector>
using Heaps=std::vector<int>;
static std::unordered_map<std::uint64_t,bool> cache;
static std::uint64_t checked=0;

static std::uint64_t key(const Heaps& a) {
    int prefix=0;
    std::uint64_t k=0;
    for (int h:a) {
        prefix+=h;
        k|=std::uint64_t(1)<<prefix;
    }
    return k;
}
static bool exact_win(const Heaps& a) {
    if (a.empty()) return true;
    const auto k=key(a);
    if (auto it=cache.find(k);it!=cache.end()) return it->second;
    for (int i=int(a.size())-1;i>=0;--i) {
        if (i+1<int(a.size()) && a[i]==a[i+1]) continue;
        Heaps other=a;
        other.erase(other.begin()+i);
        for (int remove=1;remove<=3 && remove<=a[i];++remove) {
            const int remaining=a[i]-remove;
            const int split=remove==3 ? remaining/2 : 0;
            for (int j=0;j<=split;++j) {
                Heaps b=other;
                for (int h:{j,remaining-j})
                    if (h) b.insert(std::lower_bound(b.begin(),b.end(),h),h);
                if (!exact_win(b)) return cache[k]=true;
            }
        }
    }
    return cache[k]=false;
}
static bool formula_previous_wins(const Heaps& a) {
    int sum=0,weight=0;
    std::vector<std::pair<int,int>> virtual_piles;
    for (int h:a) {
        sum+=h;
        if (h==1 || h==4 || h==5) continue;
        const int c=h<=3 ? 1 : h/2-2;
        const int t=h%2 ? 5 : 3;
        virtual_piles.emplace_back(c,t);
        weight+=c;
    }
    if (sum%2) return virtual_piles.empty();
    if (virtual_piles.empty()) return false;
    if (virtual_piles.size()==1) return weight%2 && weight>=virtual_piles[0].second;
    if (weight%2)
        return std::any_of(virtual_piles.begin(),virtual_piles.end(),[&](auto p){
            return 2*p.first-weight>=p.second;
        });
    return std::all_of(virtual_piles.begin(),virtual_piles.end(),[&](auto p){
        return 2*p.first-weight<=p.second-3;
    });
}
static void enumerate(int room,int minimum,Heaps& a) {
    if (!room) {
        if (exact_win(a)==formula_previous_wins(a)) {
            std::cerr<<"Outcome mismatch:";
            for (int h:a) std::cerr<<" "<<h;
            std::cerr<<"\n";
            std::exit(1);
        }
        ++checked;
        return;
    }
    for (int h=minimum;h<=room;++h) {
        a.push_back(h);
        enumerate(room-h,h,a);
        a.pop_back();
    }
}
int main(int argc,char**argv) {
    const int limit=argc>1 ? std::atoi(argv[1]) : 55;
    if (limit<0 || limit>63) return 2;
    Heaps a;
    for (int total=0;total<=limit;++total) enumerate(total,1,a);
    std::cout<<checked<<" partitions agree through total "<<limit<<"\n";
}

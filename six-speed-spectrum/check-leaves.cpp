// Exhaust primitive bounded parameter pairs and compute every surviving value.
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <set>
#include <vector>
using I=std::int64_t;
using Row=std::array<int,2>;
using Map=std::array<Row,6>;
using Set=std::array<I,6>;

bool critical(const Set& d) {
    auto has=[&](I x){return std::binary_search(d.begin(),d.end(),x);};
    for (I a:d) {
        if (has(2*a)&&has(3*a)&&has(4*a)&&has(5*a)) return true;
        if (has(3*a)&&has(4*a)&&has(5*a)&&has(9*a)) return true;
        for (I y:d) for (I b:{y,-y}) {
            Set t{a,std::abs(b),std::abs(a+b),std::abs(2*a+b),std::abs(3*a+b),std::abs(3*a+2*b)};
            std::sort(t.begin(),t.end());
            if (t==d) return true;
        }
    }
    return false;
}

struct Grid {
    int q;
    std::vector<std::vector<std::uint64_t>> times;
    explicit Grid(int den):q(den),times(q,std::vector<std::uint64_t>(q/128+1)) {
        for (int x=0;x<q;++x) for (int t=1;2*t<=q;++t) {
            int r=x*t%q;
            if (6*std::min(r,q-r)>=q) times[x][t/64]|=std::uint64_t(1)<<(t%64);
        }
    }
    bool witnesses(const Set& d) const {
        for (std::size_t k=0;k<times[0].size();++k) {
            std::uint64_t bits=~std::uint64_t(0);
            for (I x:d) bits &= times[x%q][k];
            if (bits) return true;
        }
        return false;
    }
};

I distance(const Set& d,I t,I q) {
    I m=q;
    for (I x:d) { I r=x*t%q; m=std::min(m,std::min(r,q-r)); }
    return m;
}

int main() {
    std::vector<Grid> grids;
    for (int q:{6,35,60,101,127,199,251,503}) grids.emplace_back(q);
    std::set<Set> candidates;
    int id;
    while (std::cin>>id) {
        Map a;
        int limit2=0;
        for (auto& r:a) {
            if (!(std::cin>>r[0]>>r[1])) return 2;
            limit2=std::max(limit2,33*33*(r[0]*r[0]+r[1]*r[1]));
        }
        for (int x=0;x*x<=limit2;++x) for (int v=0;x*x+v*v<=limit2;++v) {
            if (std::gcd(x,v)!=1) continue;
            for (int y:{v,-v}) {
                Set d;
                for (int j=0;j<6;++j) d[j]=std::abs(a[j][0]*x+a[j][1]*y);
                if (std::any_of(grids.begin(),grids.end(),[&](const Grid& g){return g.witnesses(d);})) continue;
                std::sort(d.begin(),d.end());
                if (!d[0] || std::adjacent_find(d.begin(),d.end())!=d.end()) continue;
                I g=0;
                for (I z:d) g=std::gcd(g,z);
                for (I& z:d) z/=g;
                candidates.insert(d);
            }
        }
    }
    for (const Set& d:candidates) {
        if (critical(d)) continue;
        bool hit=false;
        for (I x:d) {
            for (I k=1;k<=3*x;k+=6) if (distance(d,k,6*x)>=x) { hit=true; break; }
            if (hit) break;
        }
        if (hit) continue;
        I n=0,den=1;
        for (int i=0;i<6;++i) for (int j=0;j<i;++j) {
            I q=d[i]+d[j];
            for (I t=0;2*t<=q;++t) {
                I m=distance(d,t,q);
                if (m*den>n*q) { n=m; den=q; }
            }
        }
        I g=std::gcd(n,den);
        for (I z:d) std::cout<<z<<' ';
        std::cout<<n/g<<' '<<den/g<<'\n';
    }
}

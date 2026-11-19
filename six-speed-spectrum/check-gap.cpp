// Necessary repeat-line test for planes of loneliness strictly below 2/11.
#include <algorithm>
#include <array>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <stdexcept>
using Five=std::array<int,5>;
using Six=std::array<int,6>;
constexpr std::array<Five,2> tight{{{1,2,3,4,5},{1,3,4,5,9}}};

bool survives(const Six& w,const Six& z) {
    bool independent=false;
    for (int i=0;i<6;++i) for (int j=0;j<i;++j) {
        if (w[i]*z[j]!=w[j]*z[i]) independent=true;
        for (int e:{-1,1}) {
            const int a=w[i]+e*w[j], b=z[i]+e*z[j];
            if (a==0 && b==0) return false;
            Six d;
            for (int k=0;k<6;++k) d[k]=std::abs(a*z[k]-b*w[k]);
            if (std::find(d.begin(),d.end(),0)!=d.end()) continue;
            std::sort(d.begin(),d.end());
            if (std::unique(d.begin(),d.end())!=d.begin()+5) return false;
            int g=0;
            for (int k=0;k<5;++k) g=std::gcd(g,d[k]);
            Five v;
            for (int k=0;k<5;++k) v[k]=d[k]/g;
            if (std::find(tight.begin(),tight.end(),v)==tight.end()) return false;
        }
    }
    return independent;
}

int main() {
    int pairs=0;
    for (const Five& base:tight) for (int a:base) {
        Six w;
        std::copy(base.begin(),base.end(),w.begin()); w[5]=a;
        for (const Five& other:tight) for (int b:other) {
            Six perm;
            std::copy(other.begin(),other.end(),perm.begin()); perm[5]=b;
            std::sort(perm.begin(),perm.end());
            do {
                for (int mask=0;mask<32;++mask) {
                    Six z=perm;
                    for (int j=1;j<6;++j) if (mask&(1<<(j-1))) z[j]=-z[j];
                    ++pairs;
                    if (survives(w,z)) {
                        for (int j:w) std::cout<<j<<' ';
                        for (int j:z) std::cout<<j<<' ';
                        std::cout<<'\n';
                    }
                }
            } while (std::next_permutation(perm.begin(),perm.end()));
        }
    }
    if (pairs!=1152000) throw std::runtime_error("incomplete enumeration");
}

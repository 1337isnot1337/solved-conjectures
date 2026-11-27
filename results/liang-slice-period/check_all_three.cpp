#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

using A = std::array<int,3>;
using V = std::vector<int>;
struct Game { const char* name; V removal, moves; A bound, period; };

int main() {
    constexpr int N=150, W=N+1;
    for (const Game& g : {
        Game{"0.3102",{1,2},{1,4},{3,12,3},{5,20,5}},
        Game{"0.3122",{1,2},{1,3,4},{16,10,6},{7,7,7}},
        Game{"0.3123",{1,2,4},{1,3,4},{20,18,12},{7,7,7}},
        Game{"0.3312",{1,2,3},{1,2,4},{19,15,8},{6,3,3}}
    }) {
        std::vector<std::uint8_t> p(W*W*W);
        auto at = [&](int a,int b,int c) -> std::uint8_t& {
            return p[(a*W+b)*W+c];
        };
        // No sort or fold is used while defining these direct outcomes.
        for (int sum=1;sum<=3*N;++sum) {
            for(int a=std::max(0,sum-2*N);a<=std::min(N,sum);++a){
                for(int b=std::max(0,sum-a-N);b<=std::min(N,sum-a);++b){
                    const int c=sum-a-b;
                    const A x{a,b,c};
                    bool losing=true;
                    for(int i=0;i!=3&&losing;++i){
                        const int h=x[i];
                        if(std::find(g.removal.begin(),g.removal.end(),h)!=g.removal.end()){
                            auto z=x;z[i]=0;
                            if(at(z[0],z[1],z[2]))losing=false;
                        }
                        for(int k:g.moves)if(h>k){
                            auto z=x;z[i]=h-k;
                            if(at(z[0],z[1],z[2]))losing=false;
                        }
                    }
                    at(a,b,c)=losing;
                }
            }
        }
        std::size_t tested=0;
        for(int a=0;a<=N;++a)for(int b=a;b<=N;++b)for(int c=b;c<=N;++c){
            A q{a,b-a,c-b};
            for(int i=0;i!=3;++i)if(q[i]>=g.bound[i]){
                q[i]=g.bound[i]+(q[i]-g.bound[i])%g.period[i];
            }
            if(at(a,b,c)!=at(q[0],q[0]+q[1],q[0]+q[1]+q[2])) {
                std::cerr<<g.name<<" mismatch on "<<a<<","<<b<<","<<c<<"\n";
                return 1;
            }
            ++tested;
        }
        std::cout<<g.name<<": "<<W*W*W<<" labeled DP states, "<<tested
                 <<" unbounded-reduction predictions compared on sorted states\n";
    }
}

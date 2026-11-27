// Independent direct unsorted minimax, then coverage and certificate checks.
// Build with: c++ -O2 -std=c++17 check_independent.cpp -o check-independent
#include <algorithm>
#include <array>
#include <cstdlib>
#include <iostream>
#include <vector>

using Triple = std::array<int, 3>;
constexpr int maxsize = 148;
constexpr int side = maxsize + 1;
std::vector<unsigned char> p(side*side*side);
unsigned char& at(int x, int y, int z) { return p[(x*side+y)*side+z]; }
std::vector<int> choices(int h) {
    std::vector<int> output;
    if (h > 0 && h < 4) output.push_back(0);
    if (h > 1) output.push_back(h-1);
    if (h > 2) output.push_back(h-2);
    if (h > 4) output.push_back(h-4);
    return output;
}
void demand(bool yes) { if (!yes) { std::cerr<<"FAIL\n"; std::exit(1); } }

bool reduced(Triple x) {
    std::sort(x.begin(), x.end());
    Triple g{x[0],x[1]-x[0],x[2]-x[1]};
    const Triple a{19,15,8}, period{6,3,3};
    for(int i=0;i<3;++i) if(g[i]>=a[i]) g[i]=a[i]+(g[i]-a[i])%period[i];
    return at(g[0],g[0]+g[1],g[0]+g[1]+g[2]);
}
int main() {
    std::array<std::vector<int>,side> edges;
    for(int n=0;n<side;++n) edges[n]=choices(n);
    for(int x=0;x<side;++x) for(int y=0;y<side;++y) for(int z=0;z<side;++z) {
        bool earlier=false;
        for(int u:edges[x]) earlier |= at(u,y,z);
        for(int v:edges[y]) earlier |= at(x,v,z);
        for(int w:edges[z]) earlier |= at(x,y,w);
        at(x,y,z)=(x+y+z!=0)&&!earlier;
    }
    for(int x=0;x<side;++x) for(int y=0;y<side;++y) for(int z=0;z<side;++z)
        demand(reduced({x,y,z}) == at(x,y,z));
    int essential=0;
    for (int a=0;a<29;++a) for(int b=0;b<22;++b) for(int c=0;c<15;++c) {
        Triple h{a,a+b,a+b+c};
        bool P=h[2]>0;
        for (int i=0;i<3;++i) for (int z:edges[h[i]]) {
            Triple o=h; o[i]=z;
            P &= !reduced(o);
        }
        demand(P==reduced(h));
        ++essential;
    }
    for (int h=21;h+13<side;h+=6) {
        demand(!at(h,h,h+1));
        for (int t=h+7;t<side;t+=6) demand(at(h,h,t));
    }
    std::cout<<side*side*side<<" direct ordered triples; "<<essential<<" exact transfer witnesses.\n";
}

#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int gp(int n, const array<unsigned,9>& arc,
       const array<vector<unsigned>,10>& levels) {
    int d[9][9];
    for(int s=0;s<n;++s) {
        fill(d[s],d[s]+n,20);
        d[s][s]=0;
        unsigned visited=1u<<s, frontier=visited;
        int k=0;
        while(frontier) {
            unsigned next=0;
            for(unsigned z=frontier;z;z&=z-1)
                next|=arc[countr_zero(z)];
            next&=~visited;
            ++k;
            for(unsigned z=next;z;z&=z-1) d[s][countr_zero(z)]=k;
            visited|=next;
            frontier=next;
        }
    }
    bool bad[512]={};
    std::array<unsigned,84> mask;
    unsigned count=0;
    for(int a=0;a<n;++a) for(int b=a+1;b<n;++b) for(int c=b+1;c<n;++c) {
        if ((d[a][b]+d[b][c]==d[a][c] && d[a][c]<20) ||
            (d[a][c]+d[c][b]==d[a][b] && d[a][b]<20) ||
            (d[b][a]+d[a][c]==d[b][c] && d[b][c]<20) ||
            (d[b][c]+d[c][a]==d[b][a] && d[b][a]<20) ||
            (d[c][a]+d[a][b]==d[c][b] && d[c][b]<20) ||
            (d[c][b]+d[b][a]==d[c][a] && d[c][a]<20)) {
            unsigned tr=(1u<<a)|(1u<<b)|(1u<<c);
            bad[tr]=true;
            mask[count++]=tr;
        }
    }
    for(int k=n;k>=4;--k)
        for(auto s:levels[k]){
            bool ok=true;
            for(unsigned j=0;j<count;++j) if((s&mask[j])==mask[j]){ok=false;break;}
            if(ok)return k;
        }
    if(n>=3) for(auto s:levels[3]) if(!bad[s])return 3;
    return min(n,2);
}

int main(int argc,char** argv) {
    string g;
    uint64_t graph_count=0, eval=0, gap=0, full=0, universal_gp=0;
    int maxm=argc>1?stoi(argv[1]):40;
    int minm=argc>2?stoi(argv[2]):0;
    while(cin>>g) {
        int n=g[0]-63;
        if(n<2||n>9)continue;
        vector<pair<int,int>> edges;
        int k=0;
        for(int j=1;j<n;j++)for(int i=0;i<j;i++){
            if(((g[1+k/6]-63)>>(5-k%6))&1)edges.emplace_back(i,j);
            k++;
        }
        if(int(edges.size())>maxm || int(edges.size())<minm) continue;
        ++graph_count;
        array<unsigned,9> arc={};
        for(auto [a,b]:edges)arc[a]|=1u<<b;
        array<vector<unsigned>,10> levels;
        for(unsigned s=0;s<(1u<<n);++s)levels[popcount(s)].push_back(s);
        unsigned spectrum=0;
        uint64_t end=1ull<<(edges.size()-1);
        for(uint64_t i=0;i<end;i++){
            if(i){
                auto [a,b]=edges[countr_zero(i)];
                arc[a]^=1u<<b; arc[b]^=1u<<a;
            }
            spectrum|=1u<<gp(n,arc,levels);
            eval++;
            if(spectrum==((1u<<(n+1))-4)){++universal_gp;break;}
        }
        unsigned minv=countr_zero(spectrum),maxv=bit_width(spectrum)-1;
        unsigned interval=((1u<<(maxv+1))-1)^((1u<<minv)-1);
        if(spectrum!=interval){
            cout<<"gap "<<g<<" edges "<<edges.size()<<" spectrum";
            for(unsigned i=0;i<=maxv;i++) if(spectrum&(1u<<i))cout<<" "<<i;
            cout<<endl;
            ++gap;
        } else ++full;
    }
    cout<<graph_count<<" graphs, "<<eval<<" distinct orientation evaluations, "
       <<gap<<" gaps, "<<universal_gp<<" full-range certificates."<<endl;
    return gap!=0;
}

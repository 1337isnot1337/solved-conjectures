// Diagnostic for triangle edge replacement. Input is ordinary graph6 from nauty geng.
// Build: c++ -O3 -std=c++17 screen_tight.cpp -o screen_tight
// Example: geng -cq -d3 -D3 12 | ./screen_tight --test
// The optional test compares induced-cycle search with exhaustive vertex subsets.
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
using U=uint64_t;
int pc(U w){return __builtin_popcountll(w);}
int bit(U w){return __builtin_ctzll(w);}
struct Graph {
  int n;
  std::array<U,64> nbs{};
  std::vector<U> cycles;
  std::vector<U> touch;
  Graph(const std::string& s):n(s[0]-63) {
    assert(n>=1 && n<=40);
    int pos=0;
    for(int i=1;i<n;i++) for(int j=0;j<i;j++,pos++){
      if(((s[1+pos/6]-63)>>(5-pos%6))&1) {
        nbs[i]|=U(1)<<j; nbs[j]|=U(1)<<i;
      }
    }
  }
  bool walk(int s,int v,U path,int stop) {
    U avail=nbs[v]&~path&~((U(1)<<s)-1);
    while(avail){
      int w=bit(avail); avail&=avail-1;
      U known=nbs[w]&path;
      U add=path|(U(1)<<w);
      if(known==(U(1)<<v)){
        if(walk(s,w,add,stop))return true;
      } else if(known==((U(1)<<s)|(U(1)<<v))&&s!=v){
        if(pc(add)>stop)return true;
        cycles.push_back(add);
      }
    }
    return false;
  }
  bool big(int stop){
    cycles.clear();touch.clear();
    for(int i=0;i<n;i++)
      if(walk(i,i,U(1)<<i,stop))return true;
    std::sort(cycles.begin(),cycles.end());
    cycles.erase(std::unique(cycles.begin(),cycles.end()),cycles.end());
    std::sort(cycles.begin(),cycles.end(),[](U a,U b){return pc(a)>pc(b);});
    for(U c:cycles){
      U t=c;
      for(U z=c;z;z&=z-1)t|=nbs[bit(z)];
      touch.push_back(t);
    }
    return combine(0,0,0,stop);
  }
  bool combine(size_t k,U used,int have,int stop) const {
    if(have>stop)return true;
    if(have+n-pc(used)<=stop)return false;
    for(;k<cycles.size();k++)if(!(cycles[k]&used))
      if(combine(k+1,used|touch[k],have+pc(cycles[k]),stop))return true;
    return false;
  }
  bool valid(U s)const{
    for(U t=s;t;t&=t-1)if(pc(nbs[bit(t)]&s)!=2)return false;
    return true;
  }
  std::array<int,4> profile(int u,int v)const{
    std::array<int,4> p{-999,-999,-999,-999};
    for(U s=0;s<(U(1)<<n);s++){
      int state=(2*((s>>u)&1))+((s>>v)&1);
      int k=pc(s);
      if(k>p[state]&&valid(s))p[state]=k;
    }
    return p;
  }
  void del(int u,int v){nbs[u]^=U(1)<<v;nbs[v]^=U(1)<<u;}
};

int main(int argc,char**argv){
  bool self=argc>1&&std::string(argv[1])=="--test";
  int seen=0,n=0,tight=0,total_edges=0,near=0,safe=0,flip=0;
  for(std::string s;std::getline(std::cin,s);){
    if(s.empty()||s[0]=='>')continue;
    Graph g(s);
    n=g.n;++seen;
    if(self){
      int a=0,b=0;
      for(U m=0;m<(U(1)<<n);m++)if(g.valid(m))a=std::max(a,pc(m));
      while(g.big(b))++b;
      assert(a==b);
    }
    if(g.big(n/2))continue;
    ++tight;
    auto check=g.profile(0,1);
    assert(*std::max_element(check.begin(),check.end())<=n/2);
    std::cout<<"candidate "<<n<<" "<<s<<" max "<<*std::max_element(check.begin(),check.end())<<"\n";
    for(int u=0;u<n;u++)for(int v=u+1;v<n;v++)if((g.nbs[u]>>v)&1){
      total_edges++;
      const auto a=g.profile(u,v);
      g.del(u,v);
      const auto b=g.profile(u,v);
      g.del(u,v);
      const int eq=std::max(a[0],a[3]);
      const int removed=*std::max_element(b.begin(),b.end());
      const int expanded=std::max(eq+2,removed);
      if(eq<n/2)near++;
      if(removed==n/2&&a[0]==n/2)safe++;
      if(expanded<n/2+1){
        flip++;
        std::cout<<"FLIP "<<s<<" "<<u<<" "<<v<<" "<<eq<<" "<<removed<<" "<<expanded<<"\n";
      }
    }
  }
  std::cerr<<"n "<<n<<" seen "<<seen<<" tight-or-bad "<<tight<<" edges "<<total_edges
           <<" opposite-only "<<near<<" safe "<<safe<<" flips "<<flip<<"\n";
}

// Four-heap finite transfer and all-shift witness certificate.
// Build: c++ -O2 -std=c++17 check_four.cpp -o check-four
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <vector>
using V=std::array<int,4>;
constexpr V B{39,19,15,10}, T{6,6,3,3};
constexpr std::array<int,3> Q{1,2,4};
constexpr int Max=113;
std::array<std::array<int,5>, Max+5> binom{};
std::vector<unsigned char> tab;
void need(bool okay) { if(!okay) {std::cerr<<"certificate obstruction\n"; std::exit(1);} }
int index(V h) {
  int n=0;
  for(int i=0;i<4;i++)n+=binom[h[i]+i][i+1];
  return n;
}
V from(V g) {for(int i=1;i<4;i++)g[i]+=g[i-1];return g;}
V to(V h) {for(int i=3;i>0;i--)h[i]-=h[i-1];return h;}
template<class F> bool direct(V h,F child){
  if(h[3]==0)return false;
  for(int i=0;i<4;i++){
    int n=h[i]; if(n==0)continue;
    if(n<=3){V o=h;o[i]=0;std::sort(o.begin(),o.end());if(child(o))return false;}
    for(int d:Q)if(n>d){V o=h;o[i]-=d;std::sort(o.begin(),o.end());if(child(o))return false;}
  }
  return true;
}
bool pred(V h){
  V v=to(h);
  for(int i=0;i<4;i++)if(v[i]>=B[i])v[i]=B[i]+(v[i]-B[i])%T[i];
  return tab[index(from(v))];
}
int main(){
  for(int n=0;n<int(binom.size());n++){
    binom[n][0]=1;
    for(int k=1;k<=4&&n;k++)binom[n][k]=binom[n-1][k-1]+binom[n-1][k];
  }
  tab.resize(binom[Max+4][4]);
  for(int d=0;d<=Max;d++)for(int c=0;c<=d;c++)for(int b=0;b<=c;b++)for(int a=0;a<=b;a++)
    tab[index({a,b,c,d})]=direct({a,b,c,d},[](V child){return tab[index(child)];});
  int count=0;
  for(int a=0;a<B[0]+T[0]+4;a++)for(int b=0;b<B[1]+T[1]+4;b++)
    for(int c=0;c<B[2]+T[2]+4;c++)for(int d=0;d<B[3]+T[3]+4;d++){
      V h=from({a,b,c,d});
      need(pred(h)==direct(h,pred));
      count++;
    }
  need(count==531454);
  std::cout<<count<<" four-heap transfer states\n";
  int used=0;
  for(int a=0;a<=44;a++)for(int phase=0;phase<6;phase++) {
    if(a==0)continue;
    int h=60+a+phase;
    bool found=false;
    for(int j=0;j<=12&&!found;j++)for(int k=j;k<=12&&!found;k++){
      V l{0,h+a,h+j,h+k};std::sort(l.begin(),l.end());
      V r{a,h,h+j,h+k};
      if(pred(l)!=pred(r)){
        found=true;used++;
      }
    }
    need(found);
  }
  need(used==264);
  std::cout << used << " lifted shift classes separated by two-heap contexts." << std::endl;
}

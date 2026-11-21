// Exact search of 3*b^2=4*s^8-t^4 via eighth powers in Z[omega].
// A bound on s covers all t,b for this family, subject to the UFD reduction
// documented in README.md. It is not a global nonexistence proof.
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <string>
using I=__int128_t;
struct E { I a,b; }; // a+b*omega, omega^2+omega+1=0.
E mul(E x,E y) { return {x.a*y.a-x.b*y.b,x.a*y.b+x.b*y.a-x.b*y.b}; }
I gcdI(I a,I b) { if(a<0)a=-a;if(b<0)b=-b;while(b){I r=a%b;a=b;b=r;}return a; }
std::string str(I n) {if(!n)return"0";bool neg=n<0;if(neg)n=-n;std::string s;while(n){s+=char('0'+n%10);n/=10;}if(neg)s+='-';std::reverse(s.begin(),s.end());return s;}
bool square(I n,I& r) {
  if(n<=0)return false;
  static constexpr int mods[]={64,63,65,11,17,19};
  static std::array<std::array<bool,65>,6> residues{};
  static bool init=false;
  if(!init){for(int j=0;j<6;++j)for(int a=0;a<mods[j];++a)residues[j][a*a%mods[j]]=true;init=true;}
  for(int j=0;j<6;++j)if(!residues[j][n%mods[j]])return false;
  r=(I)sqrtl((long double)n);while(r*r<n)++r;while(r*r>n)--r;return r*r==n;
}
int main(int argc,char**argv) {
  int limit=argc>1?atoi(argv[1]):100000000;
  if(limit<1||limit>100000000){std::cerr<<"s bound must be in 1..100000000\n";return 2;}
  int bound=(int)sqrtl(4.L*limit/3)+1;
  E units[]={{1,0},{-1,0},{0,1},{0,-1},{1,1},{-1,-1}};
  uint64_t bases=0,tests=0,hits=0;
  for(int a=1;a<=bound;++a)for(int b=0;2*b<=a;++b) {
    int64_t s=int64_t(a)*a-int64_t(a)*b+int64_t(b)*b;
    if(s>limit||s%2==0||s%3==0||std::gcd(a,b)!=1)continue;
    ++bases;E v{a,b};v=mul(v,v);v=mul(v,v);v=mul(v,v);
    I s4=I(s)*s*s*s,A=-2*s4;
    for(E eps:units) {
      E alpha=mul(eps,v);I trace=2*alpha.a-alpha.b,t;++tests;
      if(!square(trace,t)||alpha.b==0||gcdI(A,alpha.b)!=1)continue;
      I B=alpha.b,C=I(s)*t;
      ++hits;
      std::cout<<"{\"x\":[\""<<str(A)<<"\",\""<<str(B)<<"\"],\"y\":[\""<<str(A)<<"\",\""<<str(-B)<<"\"],\"z\":[\""<<str(C)<<"\",\""<<str(C)<<"\"],\"p\":3,\"q\":3,\"r\":4,\"s\":"<<s<<",\"t\":\""<<str(t)<<"\",\"eisenstein_base\":["<<a<<","<<b<<"]}\n"<<std::flush;
    }
  }
  std::cerr<<"s_bound="<<limit<<" eisenstein_bases="<<bases<<" unit_tests="<<tests<<" hits="<<hits<<"\n";
}

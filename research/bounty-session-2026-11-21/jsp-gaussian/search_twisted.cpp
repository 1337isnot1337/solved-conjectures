#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <string>
using I = __int128_t;
using U = __uint128_t;
std::string str(I n) { if(n==0)return "0"; bool neg=n<0;if(neg)n=-n;std::string s;while(n){s+=char('0'+n%10);n/=10;}if(neg)s+='-';std::reverse(s.begin(),s.end());return s; }
I ipow(I a,int n){I p=1;while(n--){p*=a;}return p;}
bool square(I n,I& s){if(n<0)return false;s=(I)sqrtl((long double)n);while(s*s<n)++s;while(s*s>n)--s;return s*s==n;}
int main(int argc,char**argv){
  long long amax=argc>1?atoll(argv[1]):1000000;
  int bmax=argc>2?atoi(argv[2]):100;
  const int mods[]={64,63,65,11,17,19,23,31};
  std::array<std::array<bool,65>,8> qr{};
  for(int j=0;j<8;++j)for(int k=0;k<mods[j];++k)qr[j][(2*k*k)%mods[j]]=true;
  for(int r: {7,9,11,13,15,17,19}) for(int b=3;b<=bmax;b+=2){
    I bp=ipow(b,r);if(bp>((I)1<<120))continue;
    for(int sign:{-1,1}) {
      std::array<std::array<bool,65>,8> pass{};
      for(int j=0;j<8;++j){int m=mods[j];int rem=(int)(bp%m);for(int t=0;t<m;++t){int v=((t*t%m)*t+sign*rem)%m;if(v<0)v+=m;pass[j][t]=qr[j][v]||qr[j][(m-v)%m];}}
      for(long long a=3;a<=amax;a+=2){
        bool ok=true;for(int j=0;j<8;++j)if(!pass[j][a%mods[j]]){ok=false;break;}if(!ok)continue;
        if(std::gcd(a,(long long)b)!=1)continue;
        I v=ipow(a,3)+sign*bp;if(v==0)continue;bool neg=v<0;if(neg)v=-v;
        I c;if(square(v/2,c))std::cout<<"{\"a\":"<<a<<",\"b\":"<<b<<",\"r\":"<<r<<",\"sign\":"<<sign<<",\"negative\":"<<(neg?"true":"false")<<",\"c\":\""<<str(c)<<"\"}\n"<<std::flush;
      }
    }
    std::cerr<<"done r="<<r<<" b="<<b<<"\n";
  }
}

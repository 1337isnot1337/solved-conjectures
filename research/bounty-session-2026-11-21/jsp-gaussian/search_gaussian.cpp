#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>
using I=__int128_t;
struct G{I a,b;};
G mul(G x,G y){return {x.a*y.a-x.b*y.b,x.a*y.b+x.b*y.a};}
G sub(G x,G y){return {x.a-y.a,x.b-y.b};}
G power(G x,int n){G y{1,0};while(n--)y=mul(y,x);return y;}
I norm(G x){return x.a*x.a+x.b*x.b;}
I near(I x,I d){return x>=0?(x+d/2)/d:-((-x+d/2)/d);}
bool coprime(G x,G y){while(norm(y)){I d=norm(y);G q{near(x.a*y.a+x.b*y.b,d),near(x.b*y.a-x.a*y.b,d)};G r=sub(x,mul(q,y));x=y;y=r;}return norm(x)==1;}
std::string str(I n){if(!n)return"0";bool neg=n<0;if(neg)n=-n;std::string s;while(n){s+=char('0'+n%10);n/=10;}if(neg)s+='-';std::reverse(s.begin(),s.end());return s;}
bool sq(I n,I& s){if(n<0)return false;s=(I)sqrtl((long double)n);while(s*s<n)++s;while(s*s>n)--s;return s*s==n;}
bool gsquare(G z,G& x){I n;if(!sq(norm(z),n)||(n+z.a)%2)return false;if(!sq((n+z.a)/2,x.a)||!sq((n-z.a)/2,x.b))return false;if(z.b<0)x.b=-x.b;return mul(x,x).a==z.a&&mul(x,x).b==z.b;}
int mod(I n,int m){int x=n%m;return x<0?x+m:x;}
int main(int argc,char**argv){
 int ymax=argc>1?atoi(argv[1]):500,cmax=argc>2?atoi(argv[2]):10;
 int ronly=argc>3?atoi(argv[3]):0;
 int q=argc>4?atoi(argv[4]):3;
 std::array<uint64_t,64> masks{};
 std::array<bool,25> s5{};std::array<bool,169>s13{};
 for(int a=0;a<64;++a)for(int b=0;b<64;++b)masks[(a*a-b*b+4096)%64]|=1ull<<((2*a*b)%64);
 for(int a=0;a<5;++a)for(int b=0;b<5;++b)s5[((a*a-b*b+25)%5)*5+(2*a*b)%5]=true;
 for(int a=0;a<13;++a)for(int b=0;b<13;++b)s13[((a*a-b*b+169)%13)*13+(2*a*b)%13]=true;
 struct Cube{G val;int a,b;uint8_t a64,b64,a5,b5,a13,b13;};
 std::vector<Cube> cubes;
 for(int a=-ymax;a<=ymax;++a)for(int b=-ymax;b<=ymax;++b)if(a*a+b*b>1){G v=power({a,b},q);cubes.push_back({v,a,b,(uint8_t)mod(v.a,64),(uint8_t)mod(v.b,64),(uint8_t)mod(v.a,5),(uint8_t)mod(v.b,5),(uint8_t)mod(v.a,13),(uint8_t)mod(v.b,13)});}
 for(int r:{5,6,7,8,9,10,11,12,13,14,15,17,19}){if(ronly&&r!=ronly)continue;if(2*r+2*q>=q*r)continue;
  for(int u=0;u<=cmax;++u)for(int v=0;v<=cmax;++v)if(u*u+v*v>1){
   G c{u,v},z=power(c,r);if(fabsl((long double)z.a)>1e18L||fabsl((long double)z.b)>1e18L)continue;
   int a64=mod(z.a,64),b64=mod(z.b,64),a5=mod(z.a,5),b5=mod(z.b,5),a13=mod(z.a,13),b13=mod(z.b,13);
   for(const auto& y:cubes){int aa=(a64-y.a64+64)&63,bb=(b64-y.b64+64)&63;if(!((masks[aa]>>bb)&1))continue;
    if(!s5[((a5-y.a5+5)%5)*5+(b5-y.b5+5)%5])continue;
    if(!s13[((a13-y.a13+13)%13)*13+(b13-y.b13+13)%13])continue;
    G w=sub(z,y.val),x;if(!gsquare(w,x)||norm(x)<=1)continue;G by{y.a,y.b};
    if(!coprime(by,c)||!coprime(x,by)||!coprime(x,c))continue;
    std::cout<<"{\"x\":[\""<<str(x.a)<<"\",\""<<str(x.b)<<"\"],\"y\":["<<y.a<<","<<y.b<<"],\"z\":["<<u<<","<<v<<"],\"q\":"<<q<<",\"r\":"<<r<<"}\n"<<std::flush;
   }
  }
  std::cerr<<"done r="<<r<<"\n";
 }
}

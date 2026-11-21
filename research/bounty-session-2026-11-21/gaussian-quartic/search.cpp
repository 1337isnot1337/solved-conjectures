#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <set>
#include <string>
#include <utility>
#include <vector>

using I = __int128_t;
using U = __uint128_t;
struct G { I a, b; };
G mul(G x, G y) { return {x.a*y.a-x.b*y.b,x.a*y.b+x.b*y.a}; }
G power(G x,int n) { G a{1,0}; while(n){if(n&1)a=mul(a,x);n>>=1;if(n)x=mul(x,x);}return a; }
U norm(G x) { return U(x.a*x.a+x.b*x.b); }
std::string decimal(I x) { if(x==0)return "0";bool neg=x<0;if(neg)x=-x;std::string r;while(x){r.push_back(char('0'+x%10));x/=10;}if(neg)r.push_back('-');std::reverse(r.begin(),r.end());return r; }
std::string fmt(G x) { return "["+decimal(x.a)+","+decimal(x.b)+"]"; }
I rounded(I x,I d) { return x>=0?(x+d/2)/d:-((-x+d/2)/d); }
G gcdg(G x,G y) { while(norm(y)){I d=I(norm(y));G q{rounded(x.a*y.a+x.b*y.b,d),rounded(x.b*y.a-x.a*y.b,d)};G t=mul(q,y);G r{x.a-t.a,x.b-t.b};x=y;y=r;}return x; }
bool coprime(G x,G y) { return norm(gcdg(x,y))==1; }
U root(U n) { U r=U(sqrtl((long double)n));while(r*r>n)--r;while((r+1)*(r+1)<=n)++r;return r; }
int mod(I x,int m){int r=int(x%m);return r<0?r+m:r;}
bool squares[256];
bool gaussian_squares[64][64];
bool gaussian_square(G v,G &out) {
  if(!gaussian_squares[mod(v.a,64)][mod(v.b,64)])return false;
  U n=norm(v);
  if(!squares[(unsigned)(n&255)])return false;
  U r=root(n);if(r*r!=n)return false;
  I t=I(r)+v.a;if(t<0||t%2)return false;
  U xx=root(U(t/2));if(xx*xx!=U(t/2))return false;
  I ss=I(r)-v.a;if(ss<0||ss%2)return false;
  U yy=root(U(ss/2));if(yy*yy!=U(ss/2))return false;
  out={I(xx),v.b<0?-I(yy):I(yy)};
  G chk=mul(out,out);return chk.a==v.a&&chk.b==v.b;
}
G rotate(G v,int k){while(k--)v={-v.b,v.a};return v;}
struct ZPower { G z,p; int r; };
int main(int argc,char**argv){
 int ymax=argc>1?std::atoi(argv[1]):300,zmax=argc>2?std::atoi(argv[2]):12;
 for(int x=0;x<256;x++)squares[x*x%256]=true;
 for(int x=0;x<64;x++)for(int y=0;y<64;y++)gaussian_squares[mod(x*x-y*y,64)][2*x*y%64]=true;
 std::vector<ZPower> zs;
 for(int r:{5,7,9,11,13})for(int a=1;a<=zmax;a++)for(int b=0;b<=a;b++){
  G z{a,b};if(norm(z)<=1)continue;
  for(int conjugate=0;conjugate<(b&&a!=b?2:1);conjugate++)for(int u=0;u<4;u++){
   G w=rotate({a,conjugate?-b:b},u),p=power(w,r);
   if(std::abs((long double)p.a)>1.0e18L||std::abs((long double)p.b)>1.0e18L)continue;
   zs.push_back({w,p,r});
  }
 }
 uint64_t tested=0,found=0;
 for(int a=1;a<=ymax;a++)for(int b=0;b<=a;b++){
  G y{a,b};if(norm(y)<=1)continue;G p=power(y,4);
  for(auto z:zs){
   tested++;G v{z.p.a-p.a,z.p.b-p.b},x;
   if(!gaussian_square(v,x)||norm(x)<=1)continue;
   if(!coprime(y,z.z)||!coprime(x,y)||!coprime(x,z.z))continue;
   G xx=power(x,2),yy=power(y,4),zz=power(z.z,z.r);
   if(xx.a+yy.a!=zz.a||xx.b+yy.b!=zz.b)std::abort();
   std::cout<<"{\"x\":"<<fmt(x)<<",\"y\":"<<fmt(y)<<",\"z\":"<<fmt(z.z)<<",\"exponents\":[2,4,"<<z.r<<"]}"<<std::endl;found++;
  }
 }
 std::cerr<<"tested="<<tested<<" raw_hits="<<found<<" ymax="<<ymax<<" zmax="<<zmax<<"\n";
}

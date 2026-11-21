#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
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
int mod(I n,int m){int x=n%m;return x<0?x+m:x;}
bool gcube(G z,G& x){
 I n=norm(z),s=(I)cbrtl((long double)n);while(s*s*s<n)++s;while(s*s*s>n)--s;if(s*s*s!=n)return false;
 long double rad=sqrtl((long double)s),arg=atan2l((long double)z.b,(long double)z.a),pi=acosl(-1.L);
 for(int k=0;k<3;++k){long double t=(arg+2*pi*k)/3;I a=llroundl(rad*cosl(t)),b=llroundl(rad*sinl(t));for(int u=-1;u<=1;++u)for(int v=-1;v<=1;++v){G y{a+u,b+v};G yy=power(y,3);if(yy.a==z.a&&yy.b==z.b){x=y;return true;}}}return false;
}
int main(int argc,char**argv){
 int ymax=argc>1?atoi(argv[1]):300,cmax=argc>2?atoi(argv[2]):20,ronly=argc>3?atoi(argv[3]):0;
 constexpr int ms[3]={13,19,31};std::array<std::array<bool,961>,3> residue{};
 for(int j=0;j<3;++j)for(int a=0;a<ms[j];++a)for(int b=0;b<ms[j];++b){G z=power({a,b},3);residue[j][mod(z.a,ms[j])*ms[j]+mod(z.b,ms[j])]=true;}
 struct Cube{G val;int a,b;uint8_t residues[6];};std::vector<Cube> cubes;
 for(int a=-ymax;a<=ymax;++a)for(int b=-ymax;b<=ymax;++b)if(a*a+b*b>1){G v=power({a,b},3);Cube c{v,a,b,{}};for(int j=0;j<3;++j){c.residues[2*j]=mod(v.a,ms[j]);c.residues[2*j+1]=mod(v.b,ms[j]);}cubes.push_back(c);}
 for(int r:{4,5,7,8,9,10,11,13,14,15,16,17,19}){if(ronly&&r!=ronly)continue;
  for(int u=0;u<=cmax;++u)for(int v=0;v<=cmax;++v)if(u*u+v*v>1){
   G c{u,v},z=power(c,r);if(fabsl((long double)z.a)>1e18L||fabsl((long double)z.b)>1e18L)continue;
   int zr[6];for(int j=0;j<3;++j){zr[2*j]=mod(z.a,ms[j]);zr[2*j+1]=mod(z.b,ms[j]);}
   for(const auto& y:cubes){bool ok=true;for(int j=0;j<3;++j){int m=ms[j],a=(zr[2*j]-y.residues[2*j]+m)%m,b=(zr[2*j+1]-y.residues[2*j+1]+m)%m;if(!residue[j][a*m+b]){ok=false;break;}}if(!ok)continue;
    G w=sub(z,y.val),x;if(!gcube(w,x)||norm(x)<=1)continue;G by{y.a,y.b};if(!coprime(by,c)||!coprime(x,by)||!coprime(x,c))continue;
    std::cout<<"{\"x\":[\""<<str(x.a)<<"\",\""<<str(x.b)<<"\"],\"y\":["<<y.a<<","<<y.b<<"],\"z\":["<<u<<","<<v<<"],\"p\":3,\"q\":3,\"r\":"<<r<<"}\n"<<std::flush;
   }
  }
  std::cerr<<"done r="<<r<<"\n";
 }
}

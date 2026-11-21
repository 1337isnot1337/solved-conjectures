#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
using I=__int128_t;
struct G { I a,b; };
G mul(G x,G y) { return {x.a*y.a-x.b*y.b,x.a*y.b+x.b*y.a}; }
G sub(G x,G y) { return {x.a-y.a,x.b-y.b}; }
I norm(G z) { return z.a*z.a+z.b*z.b; }
I absI(I z) { return z<0?-z:z; }
bool powcap(G z,int n,G& out) {
  out={1,0};
  while(n--) { out=mul(out,z); if(absI(out.a)>100000000000000000LL || absI(out.b)>100000000000000000LL) return false; }
  return true;
}
G power(G z,int n) { G out{1,0};while(n--)out=mul(out,z);return out; }
int mod(I x,int m) { int r=x%m;return r<0?r+m:r; }
I near(I x,I d) { return x>=0?(x+d/2)/d:-((-x+d/2)/d); }
bool coprime(G x,G y) {
  while(norm(y)) { I d=norm(y);G q{near(x.a*y.a+x.b*y.b,d),near(x.b*y.a-x.a*y.b,d)};G r=sub(x,mul(q,y));x=y;y=r; }
  return norm(x)==1;
}
std::string str(I n) {if(!n)return"0";bool neg=n<0;if(neg)n=-n;std::string s;while(n){s+=char('0'+n%10);n/=10;}if(neg)s+='-';std::reverse(s.begin(),s.end());return s;}
bool gcube(G z,G& x) {
  I n=norm(z),s=(I)cbrtl((long double)n);
  while(s*s*s<n)++s;while(s*s*s>n)--s;if(s*s*s!=n)return false;
  long double rad=sqrtl((long double)s),arg=atan2l((long double)z.b,(long double)z.a),pi=acosl(-1.L);
  for(int k=0;k<3;++k) {
    long double t=(arg+2*pi*k)/3;I a=llroundl(rad*cosl(t)),b=llroundl(rad*sinl(t));
    for(int u=-1;u<=1;++u)for(int v=-1;v<=1;++v){G y{a+u,b+v},c=power(y,3);if(c.a==z.a&&c.b==z.b){x=y;return true;}}
  }
  return false;
}
int main(int argc,char**argv) {
  int q=argc>1?atoi(argv[1]):4,ymax=argc>2?atoi(argv[2]):200,cmax=argc>3?atoi(argv[3]):20,ronly=argc>4?atoi(argv[4]):0, sumonly=argc>5?atoi(argv[5]):0;
  if(q!=4&&q!=5){std::cerr<<"q must be 4 or 5\n";return 2;}
  constexpr int ms[5]={13,19,31,37,43};
  std::array<std::array<bool,1849>,5> cubes{};
  for(int j=0;j<5;++j)for(int a=0;a<ms[j];++a)for(int b=0;b<ms[j];++b){G z=power({a,b},3);cubes[j][mod(z.a,ms[j])*ms[j]+mod(z.b,ms[j])]=true;}
  struct Y { G val;int a,b;uint8_t residues[10]; };
  std::vector<Y> ys;
  for(int a=-ymax;a<=ymax;++a)for(int b=-ymax;b<=ymax;++b) {
    // Fourth powers permit associate reduction; conjugation permits a>=b>=0.
    if(q==4&&(a<b||b<0))continue;
    if(a*a+b*b<=1)continue;G v;if(!powcap({a,b},q,v))continue;
    Y y{v,a,b,{}};for(int j=0;j<5;++j){y.residues[2*j]=mod(v.a,ms[j]);y.residues[2*j+1]=mod(v.b,ms[j]);}ys.push_back(y);
  }
  uint64_t pairs=0,roots=0,hits=0;
  for(int r:{4,5,6,7,8,9,10,11,12,13,14,15,16,17,19}) {
    if(r<q||(ronly&&r!=ronly))continue;
    for(int sg : {1,-1}) {
    if(sg<0&&(q!=4||r%4))continue;
    if(sumonly&&sg>0)continue;
    for(int u=-cmax;u<=cmax;++u)for(int v=-cmax;v<=cmax;++v) {
      // For odd q, common units can be absorbed into both cube and qth power.
      if(q==5&&(u<=0||v<0))continue;
      if(u*u+v*v<=1)continue;
      G z;if(!powcap({u,v},r,z))continue;
      z.a*=sg;z.b*=sg;
      int zr[10];for(int j=0;j<5;++j){zr[2*j]=mod(z.a,ms[j]);zr[2*j+1]=mod(z.b,ms[j]);}
      for(const auto& y:ys) {
        ++pairs;bool ok=true;
        for(int j=0;j<5;++j){int m=ms[j],a=(zr[2*j]-y.residues[2*j]+m)%m,b=(zr[2*j+1]-y.residues[2*j+1]+m)%m;if(!cubes[j][a*m+b]){ok=false;break;}}
        if(!ok)continue;++roots;G x;if(!gcube(sub(z,y.val),x)||norm(x)<=1)continue;
        G by{y.a,y.b},bz{u,v};if(!coprime(by,bz)||!coprime(x,by)||!coprime(x,bz))continue;
        ++hits;
        if(sg>0)std::cout<<"{\"x\":[\""<<str(x.a)<<"\",\""<<str(x.b)<<"\"],\"y\":["<<y.a<<","<<y.b<<"],\"z\":["<<u<<","<<v<<"],\"p\":3,\"q\":"<<q<<",\"r\":"<<r<<"}\n"<<std::flush;
        else std::cout<<"{\"x\":["<<y.a<<","<<y.b<<"],\"y\":["<<u<<","<<v<<"],\"z\":[\""<<str(-x.a)<<"\",\""<<str(-x.b)<<"\"],\"p\":"<<q<<",\"q\":"<<r<<",\"r\":3}\n"<<std::flush;
      }
    }
    }
    std::cerr<<"q="<<q<<" r="<<r<<" cumulative_pairs="<<pairs<<" root_tests="<<roots<<" hits="<<hits<<"\n"<<std::flush;
  }
}

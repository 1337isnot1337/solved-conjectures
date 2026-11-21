#define main gaussian_grid_main
#include "search_gaussian.cpp"
#undef main

G rotate(G z,int k){for(int j=0;j<k;++j)z={-z.b,z.a};return z;}
bool divisible(G a,G b){I d=norm(b);return (a.a*b.a+a.b*b.b)%d==0&&(a.b*b.a-a.a*b.b)%d==0;}
G exact_div(G a,G b){I d=norm(b),r=a.a*b.a+a.b*b.b,s=a.b*b.a-a.a*b.b;if(r%d||s%d)std::abort();return {r/d,s/d};}
struct FP{G p;int e;};
std::vector<int> spf,split_a;
std::vector<FP> factor(G z){
 int n=(int)norm(z);std::vector<int> ps;while(n>1){int p=spf[n];ps.push_back(p);while(n%p==0)n/=p;}
 std::vector<FP> out;
 for(int p:ps){std::vector<G> gs;if(p==2)gs.push_back({1,1});else if(p%4==3)gs.push_back({p,0});else{int a=split_a[p],b=llround(sqrt((double)p-a*a));gs.push_back({a,b});gs.push_back({a,-b});}
  for(auto q:gs){int e=0;while(divisible(z,q)){z=exact_div(z,q);++e;}if(e)out.push_back({q,e});}
 }
 if(norm(z)!=1)std::abort();return out;
}
I limited_power(I a,int k,I limit){I out=1;for(int j=0;j<k;++j){if(a&&out>limit/a)return limit+1;out*=a;}return out;}
bool integer_root(I n,int k,I& x){if(n<0)return false;x=(I)powl((long double)n,1.L/k);while(limited_power(x,k,n)<n)++x;while(limited_power(x,k,n)>n)--x;return limited_power(x,k,n)==n;}
bool gaussian_root(G h,int k,G& z){
 I n;if(!integer_root(norm(h),k,n))return false;
 I maxa;sq(n,maxa);
 for(I a=0;a<=maxa;++a){I b;if(!sq(n-a*a,b))continue;
  for(int conjugate=0;conjugate<2;++conjugate)for(int unit=0;unit<4;++unit){
   G candidate=rotate({a,conjugate?-b:b},unit),p=power(candidate,k);
   if(p.a==h.a&&p.b==h.b){z=candidate;return true;}
  }
 }
 return false;
}
std::string fmt(G z){return "[\""+str(z.a)+"\",\""+str(z.b)+"\"]";}
int main(int argc,char**argv){
 const int bound=argc>1?atoi(argv[1]):1000,kmax=argc>2?atoi(argv[2]):15;
 const int maxnorm=2*bound*bound;
 spf.resize(maxnorm+1);split_a.resize(maxnorm+1);
 for(int p=2;p<=maxnorm;++p)if(!spf[p]){spf[p]=p;if(1LL*p*p<=maxnorm)for(int n=p*p;n<=maxnorm;n+=p)if(!spf[n])spf[n]=p;}
 for(int a=1;a*a<=maxnorm;++a)for(int b=1;b<=a&&a*a+b*b<=maxnorm;++b){int p=a*a+b*b;if(spf[p]==p)split_a[p]=a;}
 std::vector<std::array<bool,64>> powers64(kmax+1);
 for(int k=4;k<=kmax;++k)for(int t=0;t<64;++t){int v=1;for(int i=0;i<k;++i)v=v*t%64;powers64[k][v]=true;}
 uint64_t tested=0,hits=0;
 for(int a=1;a<=bound;++a)for(int b=0;b<=a;++b){
  G y{a,b};if(norm(y)<=1)continue;auto fs=factor(y);std::vector<G> allocations{{1,0}};
  for(auto f:fs){std::vector<G> next;
   if(norm(f.p)==2){if(f.e<2){allocations.clear();break;}for(auto u:allocations){next.push_back(mul(u,power(f.p,2)));next.push_back(mul(u,power(f.p,3*f.e-2)));}}
   else {G all=power(f.p,3*f.e);for(auto u:allocations){next.push_back(u);next.push_back(mul(u,all));}}
   allocations.swap(next);
  }
  for(int yu=0;yu<4;++yu){G yy=rotate(y,yu),yy3=power(yy,3);
   for(auto u0:allocations)for(int unit=0;unit<4;++unit){G u=rotate(u0,unit),v=exact_div(yy3,u);++tested;
    if((u.a+v.a)%2||(u.b+v.b)%2)continue;
    G h{(u.a+v.a)/2,(u.b+v.b)/2},x{(v.a-u.a)/2,(v.b-u.b)/2};
    if(norm(x)<=1||norm(h)<=1)continue;
    I hn=norm(h);int hn64=mod(hn,64);
    for(int k=4;k<=kmax;++k){if(!powers64[k][hn64])continue;G z;if(!gaussian_root(h,k,z)||norm(z)<=1)continue;
     if(!coprime(x,yy)||!coprime(x,z)||!coprime(yy,z))continue;
     G xp=power(x,2),zp=power(z,2*k);if(xp.a+yy3.a!=zp.a||xp.b+yy3.b!=zp.b)std::abort();
     std::cout<<"{\"x\":"<<fmt(x)<<",\"y\":"<<fmt(yy)<<",\"z\":"<<fmt(z)<<",\"p\":2,\"q\":3,\"r\":"<<2*k<<"}\n"<<std::flush;++hits;
    }
   }
  }
  if(b==a&&a%100==0)std::cerr<<"a="<<a<<" tested="<<tested<<" hits="<<hits<<"\n";
 }
 std::cerr<<"completed bound="<<bound<<" kmax="<<kmax<<" tested="<<tested<<" hits="<<hits<<"\n";
}

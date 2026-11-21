#define main grid_search_main
#include "search.cpp"
#undef main

G divide_exact(G a,G b){I d=I(norm(b)),re=a.a*b.a+a.b*b.b,im=a.b*b.a-a.a*b.b;if(re%d||im%d)std::abort();return {re/d,im/d};}
bool divisible(G a,G b){I d=I(norm(b));return (a.a*b.a+a.b*b.b)%d==0&&(a.b*b.a-a.a*b.b)%d==0;}
struct FP {G p;int exponent;};
std::vector<int> spf;
std::vector<G> splits;
std::vector<FP> factors(G z){
 int n=int(norm(z));std::vector<int> ps;while(n>1){int p=spf[n];ps.push_back(p);while(n%p==0)n/=p;}
 std::vector<FP> out;
 for(int p:ps){std::vector<G> gs;if(p==2)gs.push_back({1,1});else if(p%4==3)gs.push_back({p,0});else{gs.push_back(splits[p]);gs.push_back({splits[p].a,-splits[p].b});}
  for(G q:gs){int e=0;while(divisible(z,q)){z=divide_exact(z,q);e++;}if(e)out.push_back({q,e});}
 }
 if(norm(z)!=1)std::abort();return out;
}
int main(int argc,char**argv){
 const int bound=argc>1?std::atoi(argv[1]):1000,r=argc>2?std::atoi(argv[2]):5;
 const int m=2*bound*bound;
 spf.resize(m+1);for(int p=2;p<=m;p++)if(!spf[p]){spf[p]=p;if(1LL*p*p<=m)for(int x=p*p;x<=m;x+=p)if(!spf[x])spf[x]=p;}
 splits.resize(m+1);for(int a=1;a*a<=m;a++)for(int b=1;b<=a&&a*a+b*b<=m;b++){int p=a*a+b*b;if(spf[p]==p)splits[p]={a,b};}
 for(int x=0;x<256;x++)squares[x*x%256]=true;
 for(int x=0;x<64;x++)for(int y=0;y<64;y++)gaussian_squares[mod(x*x-y*y,64)][2*x*y%64]=true;
 uint64_t tested=0,hits=0;
 for(int a=1;a<=bound;a++)for(int b=0;b<=a;b++){
  G z{a,b};if(norm(z)<=1)continue;G zp=power(z,r);
  if(std::abs((long double)zp.a)>1.0e18L||std::abs((long double)zp.b)>1.0e18L)continue;
  auto fs=factors(z);std::vector<G> us{{1,0}};
  for(auto f:fs){std::vector<G> nu;
   if(norm(f.p)==2){for(auto u:us){nu.push_back(mul(u,power(f.p,2)));nu.push_back(mul(u,power(f.p,f.exponent*r-2)));}}
   else {G all=power(f.p,f.exponent*r);for(auto u:us){nu.push_back(u);nu.push_back(mul(u,all));}}
   us.swap(nu);
  }
  for(int zu=0;zu<4;zu++){
   G zz=rotate(z,zu),zzp=rotate(zp,(zu*r)%4);
   for(auto u0:us)for(int uunit=0;uunit<4;uunit++){
    G u=rotate(u0,uunit),v=divide_exact(zzp,u);tested++;
    if((u.a+v.a)%2||(u.b+v.b)%2)continue;
    G x{(u.a+v.a)/2,(u.b+v.b)/2},ysq{(u.b-v.b)/2,-(u.a-v.a)/2},y;
    if(!gaussian_square(ysq,y)||norm(x)<=1||norm(y)<=1)continue;
    if(!coprime(x,y)||!coprime(x,zz)||!coprime(y,zz))continue;
    G xx=power(x,2),yy=power(y,4),rhs=power(zz,r);
    if(xx.a+yy.a!=rhs.a||xx.b+yy.b!=rhs.b)std::abort();
    std::cout<<"{\"x\":"<<fmt(x)<<",\"y\":"<<fmt(y)<<",\"z\":"<<fmt(zz)<<",\"exponents\":[2,4,"<<r<<"]}"<<std::endl;hits++;
   }
  }
 }
 std::cerr<<"factor_pairs="<<tested<<" raw_hits="<<hits<<" zmax="<<bound<<" exponent="<<r<<"\n";
}

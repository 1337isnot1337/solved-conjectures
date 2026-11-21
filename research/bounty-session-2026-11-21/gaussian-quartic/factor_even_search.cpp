#define main grid_search_main
#include "search.cpp"
#undef main
#include <complex>

// Norm filtering is exact; non-square root proposals use a floating estimate
// and exact verification. Their finite negative coverage is not certified.
bool power_residues[8][3][29][29];
int residue_moduli[3]={7,11,29};
bool limited_power(U a,int k,U n,U &out){out=1;for(int j=0;j<k;j++){if(a&&out>n/a)return false;out*=a;}return true;}
bool gaussian_kth_power(G w,int k,G &out){
 if(k==2)return gaussian_square(w,out);
 for(int j=0;j<3;j++){int m=residue_moduli[j];if(!power_residues[k][j][mod(w.a,m)][mod(w.b,m)])return false;}
 U n=norm(w);if(!n)return false;
 U rt=U(powl((long double)n,1.0L/k)),v;
 while(!limited_power(rt,k,n,v))--rt;
 while(limited_power(rt+1,k,n,v))++rt;
 if(!limited_power(rt,k,n,v)||v!=n)return false;
 const long double radius=sqrtl((long double)rt), angle=atan2l((long double)w.b,(long double)w.a), pi=acosl(-1.0L);
 for(int branch=0;branch<k;branch++){
  long double a=(angle+2*pi*branch)/k;
  long long rx=llroundl(radius*cosl(a)),ry=llroundl(radius*sinl(a));
  for(int dx=-2;dx<=2;dx++)for(int dy=-2;dy<=2;dy++){G z{rx+dx,ry+dy},p=power(z,k);if(p.a==w.a&&p.b==w.b){out=z;return true;}}
 }return false;
}

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
 for(int k=2;k<=7;k++)for(int j=0;j<3;j++){int modp=residue_moduli[j];for(int a=0;a<modp;a++)for(int b=0;b<modp;b++){G p=power({a,b},k);power_residues[k][j][mod(p.a,modp)][mod(p.b,modp)]=true;}}
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
    G x{(u.a+v.a)/2,(u.b+v.b)/2},half{(u.a-v.a)/2,(u.b-v.b)/2};
    if(norm(x)<=1)continue;
    for(int k=2;k<=7;k++){
     if(2*k*r<=4*k+2*r)continue;
     for(int sign:{1,-1}){
      G yk=sign==1?rotate(half,3):half,y;
      if(!gaussian_kth_power(yk,k,y)||norm(y)<=1)continue;
      if(!coprime(x,y)||!coprime(x,zz)||!coprime(y,zz))continue;
      G xx=power(x,2),yy=power(y,2*k),rhs=power(zz,r);
      if(xx.a+sign*yy.a!=rhs.a||xx.b+sign*yy.b!=rhs.b)std::abort();
      if(sign==1)std::cout<<"{\"x\":"<<fmt(x)<<",\"y\":"<<fmt(y)<<",\"z\":"<<fmt(zz)<<",\"exponents\":[2,"<<2*k<<","<<r<<"]}"<<std::endl;
      else std::cout<<"{\"x\":"<<fmt(y)<<",\"y\":"<<fmt(zz)<<",\"z\":"<<fmt(x)<<",\"exponents\":["<<2*k<<","<<r<<",2]}"<<std::endl;
      hits++;
     }
    }
   }
  }
 }
 std::cerr<<"general_factor_pairs="<<tested<<" raw_hits="<<hits<<" zmax="<<bound<<" exponent="<<r<<"\n";
}

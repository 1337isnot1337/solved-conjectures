#include <algorithm>
#include <array>
#include <cassert>
#include <cstdlib>
#include <cstdint>
#include <iostream>
#include <limits>

#include <vector>
using I=std::int64_t;
using W=__int128_t;
constexpr I P=I(1)<<39;
constexpr I J=256;
constexpr I D=J*J;
constexpr I near_r=P/64;
constexpr I cutoff=16000;

static W ceilwide(W n,W d){assert(n>=0 && d>0);return n/d+(n%d!=0);}
static I narrow(W n){
 assert(n>=std::numeric_limits<I>::min() && n<=std::numeric_limits<I>::max());
 return I(n);
}
static I ceildiv(W n,W d){return narrow(ceilwide(n,d));}
static I floor_signed(W n,W d){assert(d>0); if(n>=0)return narrow(n/d);return narrow(-ceilwide(-n,d));}
static W sq(I x){return W(x)*x;}
static I floorroot(W n){
 assert(n>=0);
 if(n==0)return 0;
 const auto hi=std::uint64_t(n>>64),lo=std::uint64_t(n);
 int bits=hi?128-__builtin_clzll(hi):64-__builtin_clzll(lo);
 W x=W(1)<<((bits+1)/2);
 for(;;){
  W y=(x+n/x)/2;
  if(y>=x){I h=narrow(x);assert(sq(h)<=n && sq(h+1)>n);return h;}
  x=y;
 }
}
static I ceilroot(W n){ I h=floorroot(n);return h+(sq(h)!=n); }
struct Z{ I re,im; };
static I abs_hi(Z a){ return ceilroot(sq(a.re)+sq(a.im)); }
static I abs_lo(Z a){ return floorroot(sq(a.re)+sq(a.im)); }
static Z add(Z a,Z b){return {a.re+b.re,a.im+b.im};}
static Z multiply(Z a,Z b){
 return {floor_signed(W(a.re)*b.re-W(a.im)*b.im,P),
         floor_signed(W(a.re)*b.im+W(a.im)*b.re,P)};
}
struct Disc{Z c;I e,upper;};
static Disc mk(Z z,I e,I bound){return{z,e,std::min(abs_hi(z)+e,bound)};}

struct Box{I xl,xh,yl,yh;};
static bool covered_elsewhere(Box b){
 if(sq(b.xl)+sq(b.yl)>=sq(2*P))return true;
 if(sq(b.xh-P)+sq(b.yh)<=sq(near_r))return true;
 return false;
}

struct Test{I re,im,u;};
static bool tangent_works(const std::vector<Test>& t,I k) {
 const I plus=D+k*k, minus=D-k*k;
 for(auto z:t)
  if(W(plus)*z.u-W(minus)*z.re-W(2*J*k)*z.im>W(D/2)*P) return false;
 return true;
}

static bool certify(Box b){
 const I R=abs_lo({b.xl,b.yl});
 if(R<=P)return false;
 const Z z0{(b.xl+b.xh)/2,(b.yl+b.yh)/2};
 const Z h0{z0.re-P,z0.im};
 const I rad=ceilroot(sq(b.xh-z0.re)+sq(b.yh-z0.im));
 const I h0_abs=abs_hi(h0);
 const I hmax=abs_hi({b.xh-P,b.yh});
 const I zmax=abs_hi({b.xh,b.yh});
 const I tail_target=(hmax<=P/4 ? P/10 : P/256);
 const W z0_sq=sq(z0.re)+sq(z0.im);

 std::vector<Disc> A;
 std::vector<Disc> B;
 auto use=[&](Disc v){
   Disc a=mk(add(h0,v.c),rad+v.e,zmax);
   if(W(20)*a.upper>W(3)*P) A.push_back(a);
   if(W(20)*zmax*v.upper>W(3)*P*P) B.push_back(v);
 };
 use(mk({P,0},0,P));
 Z q{P,0}; I U=P;
 for(I n=1;;++n){
   if(n>cutoff)return false;

   // Approximate w_0^n; iteration multiplies by the exact 1/z_0,
   // rounding each coordinate with absolute error less than 1/P.
   q={floor_signed((W(q.re)*z0.re+W(q.im)*z0.im)*P,z0_sq),
      floor_signed((W(q.im)*z0.re-W(q.re)*z0.im)*P,z0_sq)};
   U=ceildiv(W(U)*P,R);  // Upper bound for P times min |z|^(-n).
   if(n==1)continue;
   I V=P;
   if(U<P)V=narrow(std::min<W>(P,ceilwide(W(hmax)*U,P-U)));
   if(V<=tail_target){
     use(mk({0,0},V,V));
     break;
   }
   const I E=2*n+ceildiv(W(n)*U*rad,R);
   const I qabs=abs_hi(q);
   const Z om{P-q.re,-q.im};
   const I L=abs_lo(om);
   if(L<=E){
     use(mk({0,0},V,V));
     continue;
   }
   // Centre approximate v_0=h_0 q/(1-q), with exact division
   // from integer coordinates and root bounds for the disk error.
   const W qr=(W(q.re)*om.re+W(q.im)*om.im);
   const W qi=(W(q.im)*om.re-W(q.re)*om.im);
   const W norm=sq(om.re)+sq(om.im);
   const W ev=2+ceilwide(W(rad)*(qabs+E),L-E)
               +ceilwide(W(h0_abs)*E*P,W(L-E)*L);
   if(ev>=V){use(mk({0,0},V,V));continue;}
   const Z v0{floor_signed(W(h0.re)*qr-W(h0.im)*qi,norm),
              floor_signed(W(h0.im)*qr+W(h0.re)*qi,norm)};
   assert(abs_hi(v0)<=2*P+2);
   use(mk(v0,narrow(ev),V));
 }

 std::vector<Test> tests;
 for(auto a:A)for(auto v:B){
   if(W(20)*a.upper*v.upper<=W(3)*P*P)continue;
   Z q=multiply(a.c,v.c);
   I e=2+ceildiv(W(abs_hi(a.c))*v.e+W(abs_hi(v.c))*a.e+W(a.e)*v.e,P);
   tests.push_back({q.re,q.im,abs_hi(q)+2*e});
 }
 I k0=std::min(I(160),std::max(I(0),I((W(J)*z0.im+W(3)*P/2)/(W(3)*P))));
 for(I j=0;j<=160;++j){
   if(k0+j<=160 && tangent_works(tests,k0+j))return true;
   if(j && k0-j>=0 && tangent_works(tests,k0-j))return true;
 }
 return false;
}

static std::array<std::uint64_t,25> leaves{}, splits{}, outside{};
static void visit(Box b,int depth){
 if(covered_elsewhere(b)){++outside[depth];return;}
 if(certify(b)){++leaves[depth];return;}
 if(depth>=19){
  std::cerr<<"Unresolved "<<(double)b.xl/P<<' '<<(double)b.yl/P<<' '
           <<(double)b.xh/P<<' '<<(double)b.yh/P<<'\n';
  std::exit(1);
 }
 ++splits[depth];
 I x=(b.xl+b.xh)/2,y=(b.yl+b.yh)/2;
 visit({b.xl,x,b.yl,y},depth+1);visit({x,b.xh,b.yl,y},depth+1);
 visit({b.xl,x,y,b.yh},depth+1);visit({x,b.xh,y,b.yh},depth+1);
}
int main(){
 visit({P,2*P,0,2*P},0);
 std::uint64_t lc=0, sc=0, oc=0;
 std::cout<<"depth certified subdivided covered-analytically\n";
 for(int j=0;j<25;++j) if(leaves[j]||splits[j]||outside[j]){
  std::cout<<j<<" "<<leaves[j]<<" "<<splits[j]<<" "<<outside[j]<<"\n";
  lc+=leaves[j];sc+=splits[j];oc+=outside[j];
 }
 assert(sc*4+1==lc+sc+oc);
 std::cout<<"Total "<<lc<<" "<<sc<<" "<<oc<<"\n";
}

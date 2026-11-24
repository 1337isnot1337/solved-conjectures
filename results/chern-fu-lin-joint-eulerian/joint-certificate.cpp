#include <cassert>
#include <fstream>
#include <gmpxx.h>
#include <iostream>
#include <vector>
using P=std::vector<mpz_class>;
P mult(const P &a,const P &b) {
 P res(a.size()+b.size()-1);
 for(int i=0;i<int(a.size());++i) for(int j=0;j<int(b.size());++j)
   mpz_addmul(res[i+j].get_mpz_t(),a[i].get_mpz_t(),b[j].get_mpz_t());
 return res;
}
int main(int argc, char **argv) {
 assert(argc==2);
 std::ifstream is(argv[1]);
 unsigned long Dx,Dt,Dz,k;
 is>>Dx>>Dt>>Dz>>k;
 assert(is);
 std::vector<P> p;
 for(int t=0;t<10;++t) {
  P a(7);
  int n;is>>n;
  for(int i=0;i<n;++i) {
    unsigned long c,x,y,z;mpz_class coef;
    is>>c>>x>>y>>z>>coef;
    assert(is && c<=6);
    coef <<= k*(x+(Dx+1)*(y+(Dt+1)*z));
    a[c]+=coef;
  }
  while(a.size()>1 && a.back()==0) a.pop_back();
  p.push_back(std::move(a));
 }
 assert(p[0].size()==7 && p[1].size()==4 && p[2].size()==4);
 P h(19);
 std::vector<P> pn{{1}},pd{{1}};
 for(int j=1;j<=6;++j) {
  pn.push_back(mult(pn.back(),p[1]));
  pd.push_back(mult(pd.back(),p[2]));
 }
 for(int i=0;i<=6;++i) {
  assert(p[i+3].size()==1);
  P x=mult(pn[i],pd[6-i]);
  for(int j=0;j<int(x.size());++j)
    mpz_addmul(h[j].get_mpz_t(),x[j].get_mpz_t(),p[i+3][0].get_mpz_t());
 }
 for(int j=18;j>=6;--j) {
  for(int i=0;i<j;++i) {
    h[i]*=p[0][6];
    if(i>=j-6) mpz_submul(h[i].get_mpz_t(),h[j].get_mpz_t(),p[0][i-(j-6)].get_mpz_t());
  }
  h[j]=0;
 }
 for(int i=0;i<6;++i) {if(h[i]!=0) std::cerr<<"failure at "<<i<<" bits "<<mpz_sizeinbase(h[i].get_mpz_t(),2)<<"\n";assert(h[i]==0);}
 std::cout<<"Exact encoded polynomial remainder is zero.\n";
}

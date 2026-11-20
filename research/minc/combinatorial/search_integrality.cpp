#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <random>
#include <vector>

// Exploratory exact-integer permanent evaluations, not an exhaustive proof.
using U = unsigned long long;
U permanent(const std::vector<int>& a, int n) {
  std::vector<U> dp(1u<<n,0); dp[0]=1;
  for(unsigned mask=1;mask<(1u<<n);++mask) {
    int row=__builtin_popcount(mask)-1;
    for(unsigned bits=mask;bits;bits&=bits-1) {
      int col=__builtin_ctz(bits); int v=a[row*n+col];
      if(v) dp[mask]+=v*dp[mask^(1u<<col)];
    }
  }
  return dp.back();
}
int collisions(const std::vector<int>& a) {
  int c=0; for(int x:a)c+=x*(x-1)/2; return c;
}
void print(const std::vector<int>& a,int n){
 for(int i=0;i<n;i++){for(int j=0;j<n;j++)std::cout<<a[i*n+j]<<(j==n-1?'\n':' ');}
}
int main(int argc,char**argv){
 if(argc<5){std::cerr<<"usage: search_integrality n k threshold steps [seed] [simple]\n";return 2;}
 int n=atoi(argv[1]),k=atoi(argv[2]); U threshold=strtoull(argv[3],0,10);
 int steps=atoi(argv[4]); unsigned seed=argc>5?atoi(argv[5]):20261120;
 bool simple=argc>6?atoi(argv[6]):false; std::mt19937 rng(seed);
 if(n>14||n<2||k<2||k>n)return 3;
 U best=~0ull; std::vector<int> bestA;
 int proposals=0,accepted=0;
 for(int restart=0; restart<10; ++restart){
  std::vector<int>a(n*n,0),p(n);std::iota(p.begin(),p.end(),0);
  if(simple){for(int i=0;i<n;i++)for(int j=0;j<k;j++)a[i*n+(i+j)%n]=1;}
  else for(int r=0;r<k;r++){std::shuffle(p.begin(),p.end(),rng);for(int i=0;i<n;i++)a[i*n+p[i]]++;}
  U cur=permanent(a,n);
  for(int it=0;it<steps;it++){
   int i=rng()%n,j=rng()%n,l=rng()%n,m=rng()%n;
   if(i==l||j==m||a[i*n+j]==0||a[l*n+m]==0)continue;
   if(simple&&(a[i*n+m]||a[l*n+j]))continue;
   a[i*n+j]--;a[l*n+m]--;a[i*n+m]++;a[l*n+j]++;
   U next=permanent(a,n);proposals++;
   double temp=0.02*std::pow(0.01,double(it)/steps);
   double delta=std::log(double(next)/cur);
   if(next<=cur || std::generate_canonical<double,53>(rng)<std::exp(-delta/temp)){
    cur=next;accepted++;
   }else{a[i*n+j]++;a[l*n+m]++;a[i*n+m]--;a[l*n+j]--;}
   if(cur<best){best=cur;bestA=a;std::cout<<"best "<<n<<' '<<k<<' '<<best<<" collisions "<<collisions(a)<<" restart "<<restart<<" step "<<it<<'\n'<<std::flush;}
   if(cur<threshold){std::cout<<"COUNTEREXAMPLE CANDIDATE\n";print(a,n);return 0;}
  }
 }
 std::cout<<"finished proposals "<<proposals<<" accepted "<<accepted<<" min "<<best<<" collisions "<<collisions(bestA)<<'\n';print(bestA,n);
 return 0;
}

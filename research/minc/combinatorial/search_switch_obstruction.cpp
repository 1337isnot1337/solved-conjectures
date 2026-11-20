#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <random>
#include <vector>
using U=unsigned long long;
struct PG{U p;std::vector<U>g;};
PG permgrad(const std::vector<int>&a,int n){
 unsigned N=1u<<n;std::vector<U>dp(N,0),adj(N,0),g(n*n,0);dp[0]=1;adj.back()=1;
 for(unsigned s=1;s<N;s++){
  int i=__builtin_popcount(s)-1;
  for(unsigned b=s;b;b&=b-1){int j=__builtin_ctz(b);dp[s]+=a[i*n+j]*dp[s^(1u<<j)];}
 }
 for(unsigned t=N-1;t;t--){unsigned s=t-1;int i=__builtin_popcount(s);
  for(unsigned b=(N-1)^s;b;b&=b-1){int j=__builtin_ctz(b);adj[s]+=a[i*n+j]*adj[s|(1u<<j)];g[i*n+j]+=dp[s]*adj[s|(1u<<j)];}
 }
 return {dp.back(),g};
}
struct Score{double score;long long delta;U per;int x,y;};
Score evaluate(const std::vector<int>&b,int m){
 auto pg=permgrad(b,m);std::vector<int>sub((m-1)*(m-1));
 for(int i=1;i<m;i++)for(int j=1;j<m;j++)sub[(i-1)*(m-1)+j-1]=b[i*m+j];
 auto sg=permgrad(sub,m-1);long long best=INT64_MAX;int bx=-1,by=-1;
 for(int i=1;i<m;i++)for(int j=1;j<m;j++)if(b[i*m+j]){
  long long d=(long long)pg.g[j]+(long long)pg.g[i*m]-(long long)sg.g[(i-1)*(m-1)+j-1]-(long long)pg.p;
  if(d<best){best=d;bx=i;by=j;}
 }
 U p=2*pg.p+pg.g[0];return {double(best)/p,best,p,bx,by};
}
void printA(const std::vector<int>&b,int m){
 std::cout<<m+1<<'\n';
 for(int i=0;i<m;i++){for(int j=0;j<m;j++)std::cout<<b[i*m+j]<<' ';std::cout<<(i==0)<<'\n';}
 for(int j=0;j<m;j++)std::cout<<(j==0)<<' ';std::cout<<2<<'\n';
}
int main(int argc,char**argv){
 int m=argc>1?atoi(argv[1]):9,steps=argc>2?atoi(argv[2]):10000,restarts=argc>3?atoi(argv[3]):10;
 if(m<3||m>18)return 2;
 std::mt19937 rng(20261120);Score global{-1,0,0,0,0};std::vector<int>bestB;
 for(int z=0;z<restarts;z++){
  std::vector<int>b(m*m,0);for(int i=0;i<m;i++)for(int j=0;j<3;j++)b[i*m+(i+j)%m]=1;b[0]=0;
  Score cur=evaluate(b,m);
  for(int t=0;t<steps;t++){
   int i=rng()%m,r=rng()%m,j=rng()%m,s=rng()%m;
   if(i==r||j==s||!b[i*m+j]||!b[r*m+s]||b[i*m+s]||b[r*m+j])continue;
   b[i*m+j]--;b[r*m+s]--;b[i*m+s]++;b[r*m+j]++;
   Score next=evaluate(b,m);double temp=0.03*pow(0.005,double(t)/steps);
   if(next.score>=cur.score||std::generate_canonical<double,53>(rng)<exp((next.score-cur.score)/temp))cur=next;
   else{b[i*m+j]++;b[r*m+s]++;b[i*m+s]--;b[r*m+j]--;}
   if(cur.score>global.score){global=cur;bestB=b;std::cout<<"best m "<<m<<" score "<<global.score<<" delta "<<global.delta<<" per "<<global.per<<" restart "<<z<<" step "<<t<<'\n'<<std::flush;}
   if(global.delta>0){std::cout<<"OBSTRUCTION\n";printA(bestB,m);return 0;}
  }
 }
 std::cout<<"finished best score "<<global.score<<" delta "<<global.delta<<" per "<<global.per<<'\n';printA(bestB,m);return 0;
}

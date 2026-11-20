#define main cubic_search_main
#include "search_switch_obstruction.cpp"
#undef main

Score evaluate_general(const std::vector<int>&b,int m,int k){
 int n=m+1;std::vector<int>a(n*n,0);
 for(int i=0;i<m;i++)for(int j=0;j<m;j++)a[i*n+j]=b[i*m+j];
 for(int i=0;i<k-2;i++){a[i*n+m]=1;a[m*n+i]=1;}a[m*n+m]=2;
 auto ag=permgrad(a,n);auto bg=permgrad(b,m);
 long long best=INT64_MAX;int bx=-1,by=-1;
 for(int i=k-2;i<m;i++)for(int j=k-2;j<m;j++)if(b[i*m+j]){
  long long d=-(long long)bg.p-(long long)ag.g[i*n+j]+(long long)ag.g[m*n+j]+(long long)ag.g[i*n+m]+2*(long long)bg.g[i*m+j];
  if(d<best){best=d;bx=i;by=j;}
 }
 return {double(best)/ag.p,best,ag.p,bx,by};
}
void print_general(const std::vector<int>&b,int m,int k){
 std::cout<<m+1<<'\n';
 for(int i=0;i<m;i++){for(int j=0;j<m;j++)std::cout<<b[i*m+j]<<' ';std::cout<<(i<k-2)<<'\n';}
 for(int j=0;j<m;j++)std::cout<<(j<k-2)<<' ';std::cout<<2<<'\n';
}
int main(int argc,char**argv){
 int m=argc>1?atoi(argv[1]):9,k=argc>2?atoi(argv[2]):4,steps=argc>3?atoi(argv[3]):10000,restarts=argc>4?atoi(argv[4]):10;
 if(m<k||m>16||k<3||k>m)return 2;
 std::mt19937 rng(20261120);Score global{-1,0,0,0,0};std::vector<int>bestB;
 for(int z=0;z<restarts;z++){
  std::vector<int>b(m*m,0);for(int i=0;i<m;i++)for(int j=0;j<k;j++)b[i*m+(i+j)%m]=1;for(int i=0;i<k-2;i++)b[i*m+i]=0;
  Score cur=evaluate_general(b,m,k);
  for(int t=0;t<steps;t++){
   int i=rng()%m,r=rng()%m,j=rng()%m,s=rng()%m;
   if(i==r||j==s||!b[i*m+j]||!b[r*m+s]||b[i*m+s]||b[r*m+j])continue;
   b[i*m+j]--;b[r*m+s]--;b[i*m+s]++;b[r*m+j]++;
   Score next=evaluate_general(b,m,k);double temp=0.02*pow(0.001,double(t)/steps);
   if(next.score>=cur.score||std::generate_canonical<double,53>(rng)<exp((next.score-cur.score)/temp))cur=next;
   else{b[i*m+j]++;b[r*m+s]++;b[i*m+s]--;b[r*m+j]--;}
   if(cur.score>global.score){global=cur;bestB=b;std::cout<<"best m "<<m<<" k "<<k<<" score "<<global.score<<" delta "<<global.delta<<" per "<<global.per<<" restart "<<z<<" step "<<t<<'\n'<<std::flush;}
   if(global.delta>0){std::cout<<"OBSTRUCTION\n";print_general(bestB,m,k);return 0;}
  }
 }
 std::cout<<"finished best score "<<global.score<<" delta "<<global.delta<<" per "<<global.per<<'\n';print_general(bestB,m,k);return 0;
}

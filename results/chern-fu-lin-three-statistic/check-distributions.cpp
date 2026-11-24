#include <iostream>
#include <cstring>
#include <vector>
#include <algorithm>
#include <cstdint>
using namespace std;
int N; bool z;
vector<vector<int>> diffs;
vector<long long> totals;
int highest(int mask){return mask ? 31-__builtin_clz(mask):0;}
int lowest(int mask){return mask ? __builtin_ctz(mask):0;}
int gap_count(int *w,int n){
 // earliest ending triple
 int lim=n+1, seen=0;
 int sm=0,lg=0; // bits y straddled by some valid descent top in previous 21
 for(int p=0;p<n;p++){
   int v=w[p];
   if((!z?(sm>>v):(lg>>v))&1){lim=p+1;break;}
   int h=seen & ~((1<<(v+1))-1);
   if(h){
      int l=lowest(h), r=highest(h);
      sm |= ~((1<<(l+1))-1);
      lg |= ((1<<r)-1) & ~((1<<(v+1))-1);
   }
   seen |= 1<<v;
 }
 int pre=0,suf=(1<<(n+1))-2;
 for(int p=0;p+1<lim && p+1<n;p++){
   int v=w[p];
   suf^=1<<v;
   int h=pre & ~((1<<(v+1))-1);
   if(__builtin_popcount((unsigned)h)>=2){
      int mask=((1<<highest(h))-1)&~((1<<(lowest(h)+1))-1);
      if(mask&suf) return p+1;
   }
   pre|=1<<v;
 }
 return lim;
}
void dfs(int*w,int n,int lm,int rr,int rrN,int ip,int prevmax){
 ++totals[n];
 int idx=(lm*((n+1)*(n+1))+rrN*(n+1)+ip);
 diffs[n][idx]+=z?-1:1;
 if(n==N)return;
 int k=gap_count(w,n), q[20];
 copy(w,w+n,q+1);q[0]=n+1;
 for(int g=0;g<k;g++){
   if(g){q[g-1]=q[g];q[g]=n+1;}
   int mask=(1<<g)-1;
   int l=(lm&mask)+((lm&~mask)<<1)+(g==0);
   int r=(1<<g)+((rr&~mask)<<1);
   dfs(q,n+1,l,r,__builtin_popcount((unsigned)r),ip+(n!=0&&g<=prevmax),g);
 }
}
int main(int argc,char**argv){
 N=argc>1?atoi(argv[1]):12;
 diffs.resize(N+1); totals.resize(N+1);
 for(int n=0;n<=N;n++) diffs[n].resize((1<<n)*(n+1)*(n+1));
 int w[20];
 for(z=false;!z;z=true)dfs(w,0,0,0,0,0,0);
 dfs(w,0,0,0,0,0,0);
 for(int n=0;n<=N;n++){
   int base=n+1,D=0;for(int i=0;i<(int)diffs[n].size();i++)if(diffs[n][i]){
      if(D<10)cout<<n<<" "<<(i/(base*base))<<" "<<((i/base)%base)<<" "<<(i%base)<<" "<<diffs[n][i]<<endl;
      D++;
   }
   cout<<n<<" n count "<<totals[n]<<" distinct diff "<<D<<endl;
 }
}

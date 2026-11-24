#include <algorithm>
#include <array>
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <vector>
using namespace std;
int adj[6], f[6], par[6], orderx[6], n, states[64], mtab[7][4], min_gap[7][4], eq[7][4];
int mat(int s) {
 if(!s)return 0;
 if(states[s]>=0)return states[s];
 int b=__builtin_ctz((unsigned)s),t=s^(1<<b),ret=mat(t);
 for(int v=0;v<n;v++)if((t&adj[b])>>v&1)ret=max(ret,1+mat(t^(1<<v)));
 return states[s]=ret;
}
void calc(int i, int &ans){
 if(i==n){
  int a[6]={};
  for(int u=0;u<n;u++)for(int v=u+1;v<n;v++)if(adj[u]>>v&1){
   int d=abs(f[u]-f[v]); if(d>1)return;
   if(d){a[u]|=1<<v;a[v]|=1<<u;}
  }
  int s=1,recent=1;
  while(recent){
   int l=0;for(int u=0;u<n;u++)if(recent>>u&1)l|=a[u];
   recent=l&~s;s|=recent;
  }
  if(s==(1<<n)-1)ans++;
  return;
 }
 int u=orderx[i];
 for(int d=-1;d<=1;d++){f[u]=f[par[u]]+d;calc(i+1,ans);}
}
int main(){
 for(n=2;n<=6;n++){
  vector<pair<int,int>> e;
  for(int u=0;u<n;u++)for(int v=u+1;v<n;v++)e.push_back({u,v});
  for(int G=0;G<(1<<e.size());G++){
   fill(adj,adj+6,0);
   for(int i=0;i<int(e.size());i++)if(G>>i&1){auto [u,v]=e[i];adj[u]|=1<<v;adj[v]|=1<<u;}
   int seen=1,l=1,c=0,color[6]={}; orderx[0]=0;
   for(int i=0;i<l;i++){
    int u=orderx[i];
    for(int v=0;v<n;v++)if(adj[u]>>v&1){
     if(!(seen>>v&1)){seen|=1<<v;par[v]=u;orderx[l++]=v;color[v]=1-color[u];}
     if(color[v]==color[u])c++;
    }
   }
   if(l<n)continue;
   fill(states,states+64,-1);
   int m=mat((1<<n)-1),ast=0;
   calc(1,ast);
   int bnd=(1<<m)+(1<<(n-m))-2;
   mtab[n][m]++;int a=0;for(int i=0;i<n;i++)a+=color[i];
   bool eqexpected=c==0&&min(a,n-a)==m&&__builtin_popcount((unsigned)G)==m*(n-m);
   assert(ast>=bnd && (ast==bnd)==eqexpected);
   if(ast==bnd)eq[n][m]++;else if(!min_gap[n][m]||ast-bnd<min_gap[n][m])min_gap[n][m]=ast-bnd;
  }
 }
 int cnt=0;for(int n=2;n<=6;n++)for(int m=1;m<=n/2;m++){printf("%d %d %d %d %d\n",n,m,mtab[n][m],eq[n][m],min_gap[n][m]);cnt+=mtab[n][m];}
 printf("checked %d labeled connected graphs\n",cnt);
}

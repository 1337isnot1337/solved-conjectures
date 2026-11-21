#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <numeric>
#include <random>
#include <set>
#include <string>
#include <vector>
using namespace std;
using U=uint64_t;

U permanent(const vector<unsigned>& rows,int n){
 vector<U>d(1u<<n);d[0]=1;
 for(unsigned m=0;m<(1u<<n);m++){
  int r=__builtin_popcount(m);if(r==n||!d[m])continue;
  unsigned a=rows[r]&~m;
  while(a){unsigned b=a&-a;a-=b;d[m|b]+=d[m];}
 }
 return d.back();
}
struct Problem{
 int n,r,k; vector<unsigned> original,freeRows,bestRows,opts;vector<int>chosen,order,colsum,degree;
 vector<array<int,8>> suffix;vector<U>h;U best,threshold,leaves=0,pruned=0;bool found=false;
 U eval(int pos,unsigned used){
  if(pos==r)return h[used];U z=0;unsigned a=freeRows[pos]&~used;
  while(a){unsigned b=a&-a;a-=b;z+=eval(pos+1,used|b);}return z;
 }
 void dfs(int t){
  if(found)return;
  if(t==(int)order.size()){
   for(int x:degree)if(x!=k)return;
   ++leaves;U v=eval(0,0);if(v<best){best=v;bestRows=freeRows;}
   if(v<threshold){found=true;cerr<<"COUNTEREXAMPLE "<<v<<" < "<<threshold<<"\n";}return;
  }
  int j=order[t],s=colsum[j];
  for(unsigned mask=0;mask<(1u<<r);mask++){
   if(__builtin_popcount(mask)!=s)continue;
   // Rows with identical assigned prefixes are exchangeable. Keep only
   // the choice taking an initial segment of each equal-prefix group.
   bool canonical=true;
   for(int i=1;i<r;i++)if(freeRows[i]==freeRows[i-1] && (mask>>(i-1)&1)<(mask>>i&1)){canonical=false;break;}
   if(!canonical)continue;
   bool valid=true;for(int i=0;i<r;i++){int d=degree[i]+((mask>>i)&1); if(d>k || d+suffix[t+1][0]<k){valid=false;break;}}
   if(!valid){++pruned;continue;}
   for(int i=0;i<r;i++)if(mask>>i&1){degree[i]++;freeRows[i]|=1u<<j;}
   dfs(t+1);
   for(int i=0;i<r;i++)if(mask>>i&1){degree[i]--;freeRows[i]^=1u<<j;}
  }
 }
 void run(const vector<unsigned>&a,const vector<int>&sel,U target){
  original=a;chosen=sel;n=a.size();r=sel.size();k=__builtin_popcount(a[0]);threshold=target;best=permanent(a,n);
  vector<bool>used(n);for(int i:sel)used[i]=true;
  vector<unsigned>fixed;for(int i=0;i<n;i++)if(!used[i])fixed.push_back(a[i]);
  vector<U>d(1u<<n);d[0]=1;
  for(unsigned m=0;m<(1u<<n);m++){
   int l=__builtin_popcount(m);if(l==(int)fixed.size()||!d[m])continue;
   unsigned b=fixed[l]&~m;
   while(b){unsigned c=b&-b;b-=c;d[m|c]+=d[m];}
  }
  h.assign(1u<<n,0);for(unsigned m=0;m<(1u<<n);m++)if(__builtin_popcount(m)==r)h[m]=d[((1u<<n)-1)^m];
  freeRows.assign(r,0);bestRows.clear();degree.assign(r,0);colsum.assign(n,0);order.clear();
  for(int j=0;j<n;j++){
   for(int i:sel)colsum[j]+=(a[i]>>j)&1;
   if(colsum[j]==r){for(int i=0;i<r;i++){degree[i]++;freeRows[i]|=1u<<j;}}
   else if(colsum[j])order.push_back(j);
  }
  sort(order.begin(),order.end(),[&](int x,int y){return colsum[x]>colsum[y];});
  suffix.assign(order.size()+1,{});for(int t=(int)order.size()-1;t>=0;t--)suffix[t][0]=suffix[t+1][0]+1;
  leaves=pruned=0;found=false;
  dfs(0);
  cout<<"rows";for(int i:sel)cout<<" "<<i;cout<<" leaves "<<leaves<<" pruned "<<pruned<<" min "<<best<<" target "<<target<<"\n";
  if(found){auto b=a;for(int i=0;i<r;i++)b[sel[i]]=bestRows[i];for(auto row:b){for(int j=0;j<n;j++)cout<<((row>>j)&1);cout<<"\n";}if(permanent(b,n)!=best)throw runtime_error("verification failed");}
 }
};
int main(int argc,char**argv){
 if(argc<4){cerr<<"usage matrix_file r target [representatives|all]\n";return 1;}
 ifstream f(argv[1]);vector<unsigned>a;string line;while(f>>line){unsigned row=0;for(int j=0;j<(int)line.size();j++)if(line[j]=='1')row|=1u<<j;a.push_back(row);}
 int n=a.size(),r=stoi(argv[2]);U target=stoull(argv[3]);bool all=argc>4&&string(argv[4])=="all";
 int k=__builtin_popcount(a[0]);for(auto row:a)if(__builtin_popcount(row)!=k)throw runtime_error("row sum");for(int j=0;j<n;j++){int s=0;for(auto row:a)s+=(row>>j)&1;if(s!=k)throw runtime_error("column sum");}
 cout<<"n "<<n<<" k "<<k<<" permanent "<<permanent(a,n)<<"\n";
 set<vector<int>>types;vector<int>sel(r);iota(sel.begin(),sel.end(),0);
 while(true){vector<int>hist(r+1);for(int j=0;j<n;j++){int s=0;for(int i:sel)s+=(a[i]>>j)&1;hist[s]++;}
  if(all||types.insert(hist).second){Problem p;p.run(a,sel,target);cout.flush();if(p.found)return 0;}
  int x=r-1;while(x>=0&&sel[x]==n-r+x)x--;if(x<0)break;sel[x]++;for(int y=x+1;y<r;y++)sel[y]=sel[y-1]+1;
 }
}

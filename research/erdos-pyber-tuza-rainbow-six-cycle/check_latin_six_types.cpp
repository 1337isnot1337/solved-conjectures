#include <array>
#include <algorithm>
#include <iostream>
using namespace std;
int c[6][6], used[6];
long long total, freec, parity, bad;
array<int,6> word[720];
void check(){
  ++total;
  int to[6][6];
  for(int x=0;x<6;x++)for(int y=0;y<6;y++)to[c[x][y]][x]=y;
  bool p=false;
  for(int mask=1;mask<64;mask+=2) if(__builtin_popcount((unsigned)mask)==3){
    bool ok=true;
    for(int x=0;x<6&&ok;x++)for(int y=x;y<6;y++){
      int a=((mask>>x)^(mask>>y))&1; // row 0 is normalized, 0 lies in mask
      int b=(1^(mask>>c[x][y]))&1;
      if(a!=b){ok=false;break;}
    }
    if(ok){p=true;break;}
  }
  parity+=p;
  for(int k=0;k<720;k++){
    for(int x=0;x<6;x++){
      int y=x;for(int a:word[k])y=to[a][y];
      if(y==x){if(p)++bad;return;}
    }
  }
  ++freec;
  if(!p){
    ++bad;
    for(auto &row:c){for(auto z:row)cout<<z;cout<<"\n";}
    cout<<"\n";
  }
}
void dfs(){
 int bi=-1,bj=-1,bs=7,bmask=0;
 for(int i=1;i<6;i++)for(int j=i;j<6;j++)if(c[i][j]<0){
    int mask=63&~(used[i]|used[j]),s=__builtin_popcount((unsigned)mask);
    if(!s)return;
    if(s<bs){bs=s;bi=i;bj=j;bmask=mask;}
 }
 if(bi<0){check();return;}
 while(bmask){
   int bit=bmask&-bmask; bmask^=bit;
   c[bi][bj]=c[bj][bi]=__builtin_ctz((unsigned)bit);
   used[bi]|=bit;used[bj]|=bit;
   dfs();
   used[bi]&=~bit;used[bj]&=~bit;
   c[bi][bj]=c[bj][bi]=-1;
 }
}
int main(){
 array<int,6> w={0,1,2,3,4,5};int n=0;
 do{word[n++]=w;}while(next_permutation(w.begin(),w.end()));
 for(auto &row:c)fill(row,row+6,-1);
 for(int i=0;i<6;i++){ c[0][i]=c[i][0]=i;used[0]|=1<<i;used[i]|=1<<i;}
 dfs();
 cout<<total<<" total, "<<freec<<" rainbow-closed-walk-free, "<<parity<<" parity, "<<bad<<" unsupported\n";
}

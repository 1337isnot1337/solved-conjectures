// Exact exploration of Cavey--Lee arXiv:2501.17765, Definitions (6)--(8).
// This is a counterexample search, not a proof from finite verification.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <limits>
#include <map>
#include <string>
#include <tuple>
#include <vector>
using namespace std;
struct Entry { int y,a; bool decorated; };
struct Path {int start,len;};
vector<Path> paths;
vector<Entry> entries;
vector<int> vertices;
bool occupied[4096]{};
map<tuple<int,int,int>,uint64_t> poly;
uint64_t count_leaves=0;
int stride=64, adj=0;
int pair_dinv(const Entry&a,const Entry&b){
  if(a.a==b.a) return (a.y<b.y&&!a.decorated)||(b.y<a.y&&!b.decorated);
  if(a.a==b.a+1) return a.y<=b.y&&!b.decorated;
  if(b.a==a.a+1) return b.y<=a.y&&!a.decorated;
  return 0;
}
void choose_path(int index,int area,int dinv,int diagonals);
void walk(int index,int x,int y,int end,int area,int dinv,int diagonals,int vertex_start){
  if(x==end&&y==end){
    for(int i=vertex_start;i<(int)vertices.size();i++) occupied[vertices[i]]=true;
    choose_path(index+1,area,dinv,diagonals);
    for(int i=vertex_start;i<(int)vertices.size();i++) occupied[vertices[i]]=false;
    return;
  }
  if(x<y && !occupied[y*stride+x+1]){
    vertices.push_back(y*stride+x+1);
    walk(index,x+1,y,end,area,dinv,diagonals,vertex_start);
    vertices.pop_back();
  }
  if(y<end){
    for(int d=0;d<=1;d++){
      if(x+d>end || occupied[(y+1)*stride+x+d]) continue;
      Entry e{y,y-x,(bool)d}; int increment=0;
      for(const Entry& f:entries) increment+=pair_dinv(e,f);
      entries.push_back(e); vertices.push_back((y+1)*stride+x+d);
      walk(index,x+d,y+1,end,area+e.a,dinv+increment,diagonals+d,vertex_start);
      vertices.pop_back(); entries.pop_back();
    }
  }
}
void choose_path(int index,int area,int dinv,int diagonals){
  if(index==(int)paths.size()){
    if(count_leaves==numeric_limits<uint64_t>::max()){
      cerr<<"enumeration count overflow\n"; exit(5);
    }
    ++poly[{area,dinv+adj,diagonals}]; ++count_leaves; return;
  }
  auto p=paths[index];
  if(occupied[p.start*stride+p.start]) return;
  int offset=vertices.size();
  vertices.push_back(p.start*stride+p.start);
  walk(index,p.start,p.start,p.start+p.len,area,dinv,diagonals,offset);
  vertices.pop_back();
}
int main(int argc,char**argv){
  vector<int> lambda;
  for(int i=1;i<argc;i++) lambda.push_back(stoi(argv[i]));
  if(lambda.empty()) return 2;
  if(!is_sorted(lambda.begin(),lambda.end(),greater<int>())) return 3;
  if(lambda.back()<=0 || lambda[0]+lambda.size()-1>=stride) return 4;
  int width=lambda[0]; vector<int> mu=lambda;
  vector<bool> nontrivial(width,false);
  while(!mu.empty()){
    int j=width-mu[0], L=mu[0]+mu.size()-1;
    paths.push_back({j,L}); nontrivial[j]=true; adj+=width-1-j;
    vector<int> next;
    for(int i=1;i<(int)mu.size();i++) if(mu[i]>1) next.push_back(mu[i]-1);
    mu=next;
  }
  reverse(paths.begin(),paths.end());
  for(int j=0;j<width;j++) if(!nontrivial[j]) occupied[j*stride+j]=true;
  choose_path(0,0,0,0);
  cerr<<"leaves "<<count_leaves<<" monomials "<<poly.size()<<"\n";
  for(auto [key,c]:poly){auto[a,b,d]=key;cout<<a<<' '<<b<<' '<<d<<' '<<c<<'\n';}
}

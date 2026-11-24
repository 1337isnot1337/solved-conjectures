// Independent checker for the RUP-only certificate emitted by verify.py.
// verify.py separately checks the initial clause multiset against the CNF.
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>
using namespace std;
using U=uint64_t;
struct Clause {
    U p[2]{}, n[2]{}; bool active=true;
    Clause(const vector<int>& c) {
        for(int x:c) {int k=abs(x)-1; (x>0?p:n)[k/64]|=U(1)<<(k%64);}
    }
};
vector<Clause> db;
map<vector<int>,vector<int>> positions;
bool rup(const vector<int>& c){
    U t[2]{},f[2]{};
    for(int x:c){int k=abs(x)-1; (x>0?f:t)[k/64]|=U(1)<<(k%64);}
    bool changed=true;
    while(changed){changed=false;
        for(const auto& d:db){if(!d.active)continue;
            if((d.p[0]&t[0])||(d.n[0]&f[0])||(d.p[1]&t[1])||(d.n[1]&f[1]))continue;
            U a=(d.p[0]|d.n[0])&~(t[0]|f[0]),b=(d.p[1]|d.n[1])&~(t[1]|f[1]);
            if(!a&&!b)return true;
            if((!a&&!(b&(b-1)))||(!b&&!(a&(a-1)))){
                int j=a?0:1;U v=a?a:b;
                if(d.p[j]&v)t[j]|=v;else f[j]|=v;
                changed=true;
            }
        }
    }return false;
}
void add(const vector<int>& c){positions[c].push_back(db.size());db.emplace_back(c);}
int main(int argc,char**argv){
    if(argc!=2)return 2;
    ifstream in(argv[1]);if(!in)return 2;
    string line;int initial=0,checks=0,deletes=0,absent_deletes=0;
    bool empty=false,proof_started=false;
    while(getline(in,line)){
        if(line.empty())return 2;
        istringstream s(line);char type='a';
        if(line[0]=='i'||line[0]=='d')s>>type;
        vector<int> c;int x;bool ended=false;
        while(s>>x){if(x==0){ended=true;break;}if(x < -112||x > 112)return 2;c.push_back(x);}
        string trailing;if(!ended||s>>trailing)return 2;
        sort(c.begin(),c.end());c.erase(unique(c.begin(),c.end()),c.end());
        for(int v:c)if(binary_search(c.begin(),c.end(),-v))return 2;
        if(type=='i'){if(proof_started)return 2;++initial;add(c);continue;}
        proof_started=true;
        if(type=='d'){
            auto it=positions.find(c);
            if(it!=positions.end()&&!it->second.empty()){
                db[it->second.back()].active=false;it->second.pop_back();
            }else ++absent_deletes; // a deletion of an absent clause has no effect
            ++deletes;continue;
        }
        if(!rup(c)){cerr<<"not RUP at step "<<checks+1<<": "<<line<<endl;return 1;}
        ++checks;add(c);if(c.empty()){empty=true;break;}
    }
    if(!empty)return 1;
    cout<<"verified "<<initial<<" initial clauses, "<<checks<<" RUP additions, "
        <<deletes<<" deletions ("<<absent_deletes<<" absent), empty clause\n";
}

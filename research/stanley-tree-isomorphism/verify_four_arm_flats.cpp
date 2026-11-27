// Exhaust every path-equality row space of rank at most three on the binary
// tree with five leaves. See FOUR-ARM-FLATS.md for the exact modular bound.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <map>
#include <set>
#include <stdexcept>
#include <unordered_set>
#include <utility>
#include <vector>

constexpr int prime = 101;
constexpr int edge_count = 7;
using Row = std::array<int, edge_count>;
using Key = std::array<std::uint64_t, 3>;
std::array<int, prime> inverses{};

int residue(int value) {
    int result = value % prime;
    return result < 0 ? result + prime : result;
}

void add_multiple(Row& target, const Row& basis, int multiple) {
    for (int col = 0; col < edge_count; ++col)
        target[col] = residue(target[col] + multiple * basis[col]);
}

std::uint64_t encode(const Row& row) {
    std::uint64_t key = 0; // 101^7 fits in 64 bits.
    for (int entry : row) key = key * prime + entry;
    return key;
}

struct KeyHash {
    std::size_t operator()(const Key& key) const {
        return key[0] * 0x9e3779b97f4a7c15ULL + key[1] * 0x31eae9f2a13ULL + key[2];
    }
};

struct RowSpace {
    std::vector<Row> basis;
    std::vector<int> pivots;

    Row remainder(Row row) const {
        for (std::size_t i = 0; i < basis.size(); ++i)
            add_multiple(row, basis[i], -row[pivots[i]]);
        return row;
    }

    bool insert(Row row) {
        row = remainder(row);
        int pivot = 0;
        while (pivot < edge_count && !row[pivot]) ++pivot;
        if (pivot == edge_count) return false;
        int scale = inverses[row[pivot]];
        for (int& entry : row) entry = residue(entry * scale);
        for (Row& other : basis) add_multiple(other, row, -other[pivot]);

        auto pos = std::lower_bound(pivots.begin(), pivots.end(), pivot);
        auto index = pos - pivots.begin();
        pivots.insert(pos, pivot);
        basis.insert(basis.begin() + index, row);
        return true;
    }

    Key key() const {
        Key result{};
        for (std::size_t i = 0; i < basis.size(); ++i) result[i] = encode(basis[i]);
        return result;
    }
};

using Graph = std::array<std::vector<std::pair<int,int>>, 8>;
struct Path { Row edges; int weight; };

void collect_paths(const Graph& graph, int start, int vertex, int parent,
                   Row edges, std::vector<Path>& paths) {
    if (vertex > start) {
        int weight = (vertex < 3 ? 1 : -1) * (start < 3 ? 1 : -1);
        paths.push_back({edges, weight});
    }
    for (auto [next, id] : graph[vertex]) {
        if (next == parent) continue;
        Row extended = edges;
        extended[id] = 1;
        collect_paths(graph, start, next, vertex, extended, paths);
    }
}

std::set<Row> candidate_equalities(const std::vector<Path>& paths) {
    std::set<Row> differences;
    for (std::size_t i = 0; i < paths.size(); ++i) {
        for (std::size_t j = 0; j < i; ++j) {
            Row difference{};
            for (int col = 0; col < edge_count; ++col)
                difference[col] = paths[i].edges[col] - paths[j].edges[col];
            auto [small, large] = std::minmax_element(difference.begin(), difference.end());
            if (*small >= 0 || *large <= 0) continue; // Strictly positive lengths.
            for (int& entry : difference) entry = residue(entry);
            RowSpace line;
            line.insert(difference);
            differences.insert(line.basis.front());
        }
    }
    return differences;
}

bool has_star_coefficients(const std::vector<Path>& paths, const RowSpace& flat) {
    std::map<std::uint64_t, int> classes;
    for (const auto& path : paths) {
        auto key = encode(flat.remainder(path.edges));
        if (key == 0) return false; // A nonempty path would have zero length.
        classes[key] += path.weight;
    }
    int minus_two = 0, plus_one = 0;
    for (const auto& entry : classes) {
        switch (entry.second) {
            case -2: ++minus_two; break;
            case 1: ++plus_one; break;
            case 0: break; // A truly invisible distance.
            default: return false;
        }
    }
    return minus_two == 4 && plus_one == 6;
}

int main() {
    for (int i = 1; i < prime; ++i) {
        for (int j = 1; j < prime; ++j) {
            if (i*j % prime == 1) { inverses[i] = j; break; }
        }
    }
    Graph graph;
    const std::array<std::pair<int,int>, edge_count> edges{{
        {0,3}, {0,4}, {1,5}, {2,6}, {2,7}, {0,1}, {1,2}
    }};
    for (int id = 0; id < edge_count; ++id) {
        auto [a,b] = edges[id];
        graph[a].push_back({b,id});
        graph[b].push_back({a,id});
    }
    std::vector<Path> paths;
    for (int start = 0; start < 8; ++start) collect_paths(graph, start, start, -1, {}, paths);
    const auto equalities = candidate_equalities(paths);
    if (paths.size() != 28 || equalities.size() != 207) throw std::runtime_error("initial census");

    const std::array<std::size_t,4> expected{{1,207,17336,705602}};
    std::vector<RowSpace> frontier(1);
    for (int rank = 0; rank <= 3; ++rank) {
        if (frontier.size() != expected[rank]) throw std::runtime_error("flat census");
        std::size_t hits = 0;
        for (const auto& flat : frontier)
            if (has_star_coefficients(paths, flat)) ++hits;
        std::cout << "rank " << rank << ": " << frontier.size()
                  << " row spaces, " << hits << " matching sign patterns\n";
        if (hits) throw std::runtime_error("possible competitor");
        if (rank == 3) break;
        std::unordered_set<Key, KeyHash> seen;
        std::vector<RowSpace> next;
        for (const auto& flat : frontier) {
            for (const auto& equality : equalities) {
                RowSpace extended = flat;
                if (extended.insert(equality) && seen.insert(extended.key()).second)
                    next.push_back(std::move(extended));
            }
        }
        frontier.swap(next);
    }
}

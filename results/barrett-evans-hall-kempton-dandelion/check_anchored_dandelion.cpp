// Exhaust the diameter-three domain on a specified order from 4 through 20.
// A set bit records a forced edge. Unassigned pairs can take either colour.
#include "dandelion_schur.hpp"
#include <array>
#include <vector>

using Graph = std::array<Bits, MAX>;
constexpr int attachments[] = {2, 3, 4, 5, 6, 7, 10, 12, 14};

void add_edge(Graph& graph, int i, int j) {
    graph[i] |= 1u << j;
    graph[j] |= 1u << i;
}

struct AnchorSearch {
    int order;
    std::array<int, 16> counts{};
    long long type_vectors = 0, representatives = 0, nodes = 0;
    long long double_leaves = 0, spectral_bounds = 0;

    // The red path is 0,1,2,3. Its complement is the path 2,0,3,1.
    // Reordering by the latter and interchanging colours preserves the target.
    bool canonical() const {
        constexpr int complement_path[] = {2, 0, 3, 1};
        for (int symmetry = 1; symmetry < 4; ++symmetry) {
            std::array<int, 16> image{};
            for (int mask : attachments) {
                int transformed = 0;
                for (int i = 0; i < 4; ++i) {
                    int index = (symmetry & 2) ? complement_path[i] : i;
                    if (symmetry & 1) index = 3 - index;
                    int bit = (mask >> index) & 1;
                    if (symmetry & 2) bit = 1 - bit;
                    transformed |= bit << i;
                }
                image[transformed] = counts[mask];
            }
            if (image < counts) return false;
        }
        return true;
    }

    bool forces_two_leaves(const Graph& red, const Graph& blue) const {
        bool red_leaf = false, blue_leaf = false;
        for (int v = 0; v < order; ++v) {
            red_leaf |= __builtin_popcount(blue[v]) == order - 2;
            blue_leaf |= __builtin_popcount(red[v]) == order - 2;
        }
        return red_leaf && blue_leaf;
    }

    static bool interchangeable(const Graph& red, const Graph& blue, int j, int k) {
        Bits others = ~((1u << j) | (1u << k));
        return (((red[j] ^ red[k]) | (blue[j] ^ blue[k])) & others) == 0;
    }

    bool finish_edges(const Graph& red, const Graph& blue) {
        ++nodes;
        if (forces_two_leaves(red, blue)) {
            ++double_leaves;
            return true;
        }
        L a, b;
        a.build(red.data(), order);
        b.build(blue.data(), order);
        if (prove(a,b) || prove(b,a)) {
            ++spectral_bounds;
            return true;
        }

        int pivot = -1, best_score = -1;
        std::vector<int> chosen;
        for (int i = 4; i < order; ++i) {
            Bits assigned = red[i] | blue[i] | (1u << i);
            for (int j = 4; j < order; ++j) {
                if ((assigned >> j) & 1u) continue;
                std::vector<int> group;
                for (int k = 4; k < order; ++k) {
                    if (!((assigned >> k) & 1u) && interchangeable(red, blue, j, k))
                        group.push_back(k);
                }
                // This integer score only selects an order for exhaustive branching.
                int differences = __builtin_popcount((red[i] ^ red[j]) & 15u)
                                + __builtin_popcount((blue[i] ^ blue[j]) & 15u);
                int score = (1 + differences) * static_cast<int>(group.size());
                if (score > best_score) {
                    pivot = i;
                    chosen = group;
                    best_score = score;
                }
            }
        }
        if (pivot < 0) return false;  // An actual completed graph was uncertified.
        for (std::size_t reds = 0; reds <= chosen.size(); ++reds) {
            Graph next_red = red, next_blue = blue;
            for (std::size_t j = 0; j < chosen.size(); ++j)
                add_edge(j < reds ? next_red : next_blue, pivot, chosen[j]);
            if (!finish_edges(next_red, next_blue)) return false;
        }
        return true;
    }

    bool assign_types(int vertex, int first, const Graph& red, const Graph& blue) {
        if (vertex == order) {
            ++type_vectors;
            if (!canonical()) return true;
            ++representatives;
            return finish_edges(red, blue);
        }
        for (int i = first; i < 9; ++i) {
            int mask = attachments[i];
            Graph next_red = red, next_blue = blue;
            for (int anchor = 0; anchor < 4; ++anchor)
                add_edge((mask >> anchor) & 1 ? next_red : next_blue, vertex, anchor);
            ++counts[mask];
            bool ok = assign_types(vertex + 1, i, next_red, next_blue);
            --counts[mask];
            if (!ok) return false;
        }
        return true;
    }

    bool run() {
        Graph red{}, blue{};
        for (int i = 0; i < 4; ++i)
            for (int j = i + 1; j < 4; ++j)
                add_edge(j == i + 1 ? red : blue, i, j);
        return assign_types(4, 0, red, blue);
    }
};

int main(int argc, char** argv) {
    const int order = argc == 2 ? std::atoi(argv[1]) : 0;
    if (order < 4 || order > 20) return 2;
    AnchorSearch search{order};
    bool ok = search.run();
    std::printf("n=%d complete=%d types=%lld representatives=%lld nodes=%lld "
                "double_leaf=%lld spectral=%lld\n",
                order, ok, search.type_vectors, search.representatives,
                search.nodes, search.double_leaves, search.spectral_bounds);
    return ok ? 0 : 1;
}

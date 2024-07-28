#include <vector>

namespace clanguml_examples::vector {
void emplace() {
    std::vector<int> v;
    v.emplace(v.end(), 1);
}
}  // namespace clanguml_examples::vector

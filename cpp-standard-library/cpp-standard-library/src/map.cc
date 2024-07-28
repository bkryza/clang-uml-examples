#include <map>

namespace clanguml_examples::map {
void emplace() {
    std::map<int, int> m;
    m.emplace(1, 2);
}
}  // namespace clanguml_examples

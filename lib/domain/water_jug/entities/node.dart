class Node {
  const Node(this.first, this.second);

  final int first;
  final int second;

  int operator [](int index) {
    if (index == 0) {
      return first;
    }
    if (index == 1) {
      return second;
    }
    throw Exception('Incorrect index ($index) of Node');
  }

  @override
  String toString() {
    return '[$first,$second]';
  }

  @override
  bool operator ==(Object other) {
    if (other is Node) {
      return other.first == first && other.second == second;
    }
    return false;
  }

  @override
  int get hashCode => first.hashCode * first.hashCode + second.hashCode * second.hashCode;
}

import 'dart:math';

const bool printGraph = false;
const bool printEdges = false;
const bool printPath = true;

/*
first = 3
second = 5
wish = 4

0 - 0

 */

class DecisionFinder {
  void find({
    required int first,
    required int second,
    required int wished,
  }) {
    final graph = _buildGraph(first: first, second: second);
    final path = _findPath(graph, [0, 0], wished);
  }

  /// checked
  Map<List<int>, List<List<int>>> _buildGraph({
    required int first,
    required int second,
  }) {
    final gcd = _findGreatestCommonDivisor(first: first, second: second);
    final Map<List<int>, List<List<int>>> graph = {};
    for (int i = 0; i < (first / gcd + 1).toInt(); i++) {
      for (int k = 0; k < (second / gcd + 1).toInt(); k++) {
        graph[[i * gcd, k * gcd]] = _createEdges(first: i, second: k, firstMax: first, secondMax: second);
      }
    }
    if (printGraph) {
      print('GRAPH: $graph');
    }
    return graph;
  }

  /// checked
  List<List<int>> _createEdges({
    required first,
    required second,
    required firstMax,
    required secondMax,
  }) {
    final List<List<int>> edges = [];

    /// 1. If jugs are not empty - we can make them empty
    if (first != 0) {
      edges.add([0, second]);
    }
    if (second != 0) {
      edges.add([first, 0]);
    }

    /// 2. If jugs are not full - we can fill them
    if (first != firstMax) {
      edges.add([firstMax, second]);
    }
    if (second != secondMax) {
      edges.add([first, secondMax]);
    }

    /// 3. From a not empty jug we can transfer water to another
    if (first != 0 && secondMax - second >= first) {
      edges.add([0, second + first]);
    }
    if (second != 0 && firstMax - first >= second) {
      edges.add([first + second, 0]);
    }

    /// 4. Moreover, if there is not enough space in the incomplete one, then both jugs will remain non-empty
    if (second != 0 && firstMax - first > 0 && firstMax - first < second) {
      edges.add([firstMax, second - (firstMax - first)]);
    }
    if (first != 0 && secondMax - second > 0 && secondMax - second < first) {
      edges.add([first - (secondMax - second), secondMax]);
    }
    if (printEdges) {
      print('EDGES: $edges');
    }
    return edges;
  }

  /// checked
  int _findGreatestCommonDivisor({
    required int first,
    required int second,
  }) {
    int biggest = max(first, second);
    int smallest = min(first, second);
    while (biggest != smallest) {
      final int first = biggest - smallest;
      final int second = smallest;
      biggest = max(first, second);
      smallest = min(first, second);
    }
    return biggest;
  }

  List<List<int>>? _findPath(Map<List<int>, List<List<int>>> graph, List<int> node, int wishedAmount, [List<List<int>> path = const []]) {
    if (path.isEmpty) {
      path = [node];
    } else {
      path.add(node);
    }
    if (node[0] == wishedAmount || node[1] == wishedAmount) {
      return path;
    }
    if (!graph.containsKey(node)) {
      return null;
    }
    List<List<int>>? shortestPath;
    for (final List<int> graphNode in graph[node]!) {
      if (!path.contains(graphNode)) {
        final newPath = _findPath(graph, node, wishedAmount, path);
        if (newPath != null) {
          if (shortestPath == null || newPath.length < shortestPath.length) {
            shortestPath = newPath;
          }
        }
      }
    }
    if (printPath) {
      print('PATH: $shortestPath');
    }
    return shortestPath;
  }
}

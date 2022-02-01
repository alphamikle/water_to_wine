import 'dart:math';

import 'package:water_jug/domain/water_jug/entities/node.dart';

class DecisionFinder {
  int _syncLimitCounter = 0;

  Future<List<Node>?> findShortestPath({
    required int first,
    required int second,
    required int wished,
  }) async {
    final int startTimestamp = DateTime.now().microsecondsSinceEpoch;
    final graph = await _buildGraph(first: first, second: second);
    final path = await _findPath(graph, const Node(0, 0), wished);
    final durationInMs = (DateTime.now().microsecondsSinceEpoch - startTimestamp) / 1000;
    print('[${durationInMs}ms] SHORTEST PATH: $path');
    return path;
  }

  Future<Map<Node, List<Node>>> _buildGraph({
    required int first,
    required int second,
  }) async {
    final Map<Node, List<Node>> graph = {};
    final gcd = await _findGreatestCommonDivisor(first: first, second: second);
    for (int f = 0; f < (first / gcd + 1).toInt(); f++) {
      for (int s = 0; s < (second / gcd + 1).toInt(); s++) {
        await _asyncWindow();
        graph[Node(f * gcd, s * gcd)] = _createEdges(first: f, second: s, firstMax: first, secondMax: second);
      }
    }
    return graph;
  }

  List<Node> _createEdges({
    required first,
    required second,
    required firstMax,
    required secondMax,
  }) {
    final Set<Node> edges = {};

    /// 1. If jugs are not empty - we can make them empty
    if (first != 0) {
      edges.add(Node(0, second));
    }
    if (second != 0) {
      edges.add(Node(first, 0));
    }

    /// 2. If jugs are not full - we can fill them
    if (first != firstMax) {
      edges.add(Node(firstMax, second));
    }
    if (second != secondMax) {
      edges.add(Node(first, secondMax));
    }

    /// 3. From a not empty jug we can transfer water to another
    if (first != 0 && secondMax - second >= first) {
      edges.add(Node(0, second + first));
    }
    if (second != 0 && firstMax - first >= second) {
      edges.add(Node(first + second, 0));
    }

    /// 4. Moreover, if there is not enough space in the incomplete one, then both jugs will remain non-empty
    if (first != 0 && secondMax - second > 0 && secondMax - second < first) {
      edges.add(Node(first - (secondMax - second), secondMax));
    }
    if (second != 0 && firstMax - first > 0 && firstMax - first < second) {
      edges.add(Node(firstMax, second - (firstMax - first)));
    }
    return edges.toList();
  }

  Future<int> _findGreatestCommonDivisor({
    required int first,
    required int second,
  }) async {
    int biggest = max(first, second);
    int smallest = min(first, second);
    while (biggest != smallest) {
      final int first = biggest - smallest;
      final int second = smallest;
      biggest = max(first, second);
      smallest = min(first, second);
      await _asyncWindow();
    }
    if (biggest % 2 == 0 && first % 2 == 0 && second % 2 == 0) {
      return 1;
    }
    return biggest;
  }

  Future<List<Node>?> _findPath(Map<Node, List<Node>> graph, Node node, int wishedAmount, [List<Node> path = const []]) async {
    path = [...path, node];
    if (node[0] == wishedAmount || node[1] == wishedAmount) {
      return path;
    }
    if (!graph.containsKey(node)) {
      return null;
    }
    List<Node>? shortestPath;
    for (final Node graphNode in graph[node]!) {
      await _asyncWindow();
      if (!path.contains(graphNode)) {
        final newPath = await _findPath(graph, graphNode, wishedAmount, path);
        if (newPath != null) {
          if (shortestPath == null || newPath.length < shortestPath.length) {
            shortestPath = newPath;
          }
        }
      }
    }
    return shortestPath;
  }

  Future<void> _asyncWindow() async {
    _syncLimitCounter++;
    if (_syncLimitCounter == 100) {
      await Future<void>.delayed(Duration.zero);
      _syncLimitCounter = 0;
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug/domain/water_jug/logic/decision_finder.dart';

void main() {
  group('Decision finder tests', () {
    test('1', () async {
      final finder = DecisionFinder();
      final path = await finder.findShortestPath(first: 3, second: 5, wished: 4);
      expect(path?.length, 7);
    });

    test('2', () async {
      final finder = DecisionFinder();
      final path = await finder.findShortestPath(first: 2, second: 6, wished: 4);
      expect(path?.length, 2);
    });

    test('3', () async {
      final finder = DecisionFinder();
      final path = await finder.findShortestPath(first: 2, second: 6, wished: 4);
      expect(path?.length, 2);
    });
  });
}

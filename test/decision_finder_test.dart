import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug/domain/water_jug/logic/decision_finder.dart';

void main() {
  group('Decision finder tests', () {
    test('Easy level', () {
      final finder = DecisionFinder();
      final path = finder.findShortestPath(first: 3, second: 5, wished: 4);
      expect(path?.length, 7);
    });
  });
}

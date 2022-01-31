import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug/domain/water_jug/logic/decision_finder.dart';

void main() {
  group('Decision finder tests', () {
    test('Easy level', () {
      final finder = DecisionFinder();
      finder.find(first: 3, second: 10, wished: 4);
      expect(1, 1);
    });
  });
}

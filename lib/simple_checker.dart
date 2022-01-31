import 'package:water_jug/domain/water_jug/logic/decision_finder.dart';

void main() {
  final finder = DecisionFinder();
  finder.find(first: 2, second: 10, wished: 4);
}

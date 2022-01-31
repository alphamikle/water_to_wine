import 'package:water_jug/domain/water_jug/logic/decision_finder.dart';

void main([List<String>? arguments]) {
  final finder = DecisionFinder();
  if (arguments?.contains('--good') ?? false) {
    print('PATH: ${finder.findShortestPath(first: 3, second: 5, wished: 4)}');
  } else {
    print('PATH: ${finder.findShortestPath(first: 4, second: 12, wished: 8)}');
  }
}

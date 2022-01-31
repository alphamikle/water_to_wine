abstract class Durations {
  static const Duration animationDuration = Duration(milliseconds: 250);
  static const Duration jugFillingDuration = Duration(seconds: 1);
  static Duration get jugFillingDelay => jugFillingDuration * 1.05;
}

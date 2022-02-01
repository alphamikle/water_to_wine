abstract class Durations {
  static const Duration maxComputationTime = Duration(milliseconds: 300);
  static const Duration defaultSnackBarDuration = Duration(seconds: 4);
  static const Duration animationDuration = Duration(milliseconds: 250);
  static const Duration jugFillingDuration = Duration(seconds: 1);
  static Duration get jugFillingDelay => jugFillingDuration * 1.05;
}

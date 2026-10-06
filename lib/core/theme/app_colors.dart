import 'package:flutter/material.dart';

/// Semantic health palette shared by every feature.
abstract final class AppColors {
  static const Color seed = Color(0xFF0F766E);

  static const Color healthy = Color(0xFF16A34A);
  static const Color suspected = Color(0xFFF59E0B);
  static const Color infected = Color(0xFFDC2626);
  static const Color recovered = Color(0xFF2563EB);

  static const Color riskLow = Color(0xFF16A34A);
  static const Color riskModerate = Color(0xFFEAB308);
  static const Color riskHigh = Color(0xFFEA580C);
  static const Color riskCritical = Color(0xFFDC2626);

  static const Color _clusterLight = Color(0xFF7F1D1D);
  static const Color _clusterDark = Color(0xFFFCA5A5);

  /// Outline colour for infection clusters; must contrast with both the
  /// surface and the red infected tiles it surrounds.
  static Color cluster(Brightness brightness) =>
      brightness == Brightness.dark ? _clusterDark : _clusterLight;
}

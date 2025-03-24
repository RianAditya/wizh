// core/theme/app_spacing.dart
import 'package:flutter/material.dart';

class AppSpacing {
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Vertical spacing constants
  static const SizedBox xsVertical = SizedBox(height: xs);
  static const SizedBox sVertical = SizedBox(height: s);
  static const SizedBox mVertical = SizedBox(height: m);
  static const SizedBox lVertical = SizedBox(height: l);
  static const SizedBox xlVertical = SizedBox(height: xl);
  static const SizedBox xxlVertical = SizedBox(height: xxl);

  /// Horizontal spacing constants
  static const SizedBox xsHorizontal = SizedBox(width: xs);
  static const SizedBox sHorizontal = SizedBox(width: s);
  static const SizedBox mHorizontal = SizedBox(width: m);
  static const SizedBox lHorizontal = SizedBox(width: l);
  static const SizedBox xlHorizontal = SizedBox(width: xl);
  static const SizedBox xxlHorizontal = SizedBox(width: xxl);
}
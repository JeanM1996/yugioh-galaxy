import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, String>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<String> {
  ThemeNotifier() : super('light');

  Future<void> initTheme() async {
    /// Actualizar colores
    colors = state == 'light' ? lightColors : darkColors;
  }

  Future<void> switchTheme() async {
    /// Obtener thema actual
    final theme = state;

    /// Actualizar colores
    colors = theme == 'light' ? darkColors : lightColors;
  }
}

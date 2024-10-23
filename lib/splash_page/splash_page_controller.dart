import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/splash_page/splash_page_state.dart';

class SplashPageController extends StateNotifier<SplashPageState> {
  SplashPageController() : super(SplashPageState());

  dynamic setIsLoading({required bool value}) {
    state = state.copyWith(isLoading: value);
  }
}

final splashPageController =
    StateNotifierProvider<SplashPageController, SplashPageState>((ref) {
  return SplashPageController();
});

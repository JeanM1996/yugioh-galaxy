import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/main/domain/select_option.dart';
import 'package:yugiohgalaxy/features/main/widgets/navbar_bottom/navbar_bottom_state.dart';

final navbarBottomControllerProvider =
    StateNotifierProvider<NavbarBottomController, NavbarBottomState>((ref) {
  return NavbarBottomController();
});

class NavbarBottomController extends StateNotifier<NavbarBottomState> {
  NavbarBottomController() : super(NavbarBottomState());

  /// Dado [currentOption]
  /// Obtiene animación del NavigationBar
  void updateSelection(SelectOption currentOption) {
    var option = currentOption;
    state = state.copyWith(option: option);
  }
}

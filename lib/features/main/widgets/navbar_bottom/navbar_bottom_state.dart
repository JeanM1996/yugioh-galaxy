import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/features/main/domain/select_option.dart';

class NavbarBottomState {
  SelectOption? option;

  NavbarBottomState({this.option});

  NavbarBottomState copyWith({
    SelectOption? option,
  }) {
    return NavbarBottomState(
      option: option ??
          SelectOption(label: "Inicio", value: 1, icon: iconsPaths.iconHome),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/constants.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/main/domain/select_option.dart';
import 'package:yugiohgalaxy/features/main/widgets/navbar_bottom/navbar_bottom_controller.dart';
import 'package:yugiohgalaxy/features/main/widgets/navigation_button.dart';

class NavbarBottomPage extends ConsumerStatefulWidget {
  const NavbarBottomPage({
    required this.pageState,
    super.key,
    this.navigationBarColor,
  });

  /// opción inicial del navigation bar
  final int pageState;

  /// color del container del navigation bar
  final Color? navigationBarColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarBottomState();
}

class _NavbarBottomState extends ConsumerState<NavbarBottomPage> {
  String role = 'user';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getInitData);
  }

  dynamic getInitData() async {
    ref.watch(navbarBottomControllerProvider).option =
        SelectOption(label: '', value: widget.pageState);

    setState(() {});
  }

  List<SelectOption> setNavbar() {
    return constants.userOptions.map((option) {
      return SelectOption(
        label: (option['name'] ?? '') as String,
        value: option['index'],
        icon: (option['icon'] ?? '') as String,
        description: (option['icon'] ?? '') as String,
        semanticLabel: (option['semanticLabel'] ?? '') as String,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(navbarBottomControllerProvider.notifier);
    final state = ref.watch(navbarBottomControllerProvider);
    return Material(
      color: colors.blue,
      elevation: 10,
      surfaceTintColor: colors.blue,
      type: MaterialType.card,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      shadowColor: Colors.black,
      borderOnForeground: false,
      child: Container(
        height: 65,
        padding: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        color: colors.blue,
        child: NavigationButton(
          answer:
              state.option ?? SelectOption(label: '', value: widget.pageState),
          options: setNavbar(),
          onSelect: (SelectOption currentOption) => onUpdateSelection(
            context: context,
            controller: controller,
            currentOption: currentOption,
          ),
        ),
      ),
    );
  }
}

/// Dado un [controller], [context], [currentOption]
/// Obtiene animación y navegación del NavigationBar
Future<void> onUpdateSelection({
  required NavbarBottomController controller,
  required BuildContext context,
  required SelectOption currentOption,
}) async {
  controller.updateSelection(currentOption);

  switch (currentOption.value) {
    case 0:
      context.pushReplacement(
        Routes.homeRoute,
      );
    case 1:
      context.pushReplacement(
        Routes.arquetipesRoute,
        extra: {},
      );
    case 2:
      context.pushReplacement(
        Routes.banCardRoute,
        extra: {},
      );

    default:
  }
}

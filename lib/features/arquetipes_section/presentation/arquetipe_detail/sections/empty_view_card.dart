import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/container_icon.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';

//EmptyViewCards: class to show the empty view cards
class EmptyViewCards extends ConsumerWidget {
  const EmptyViewCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(arquetipeDetailController);
    return Column(
      children: [
        Container(
          height: context.height(.5),
          padding: context.all(.05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.whiteGrey.withOpacity(.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerIcon(
                    iconColor: colors.blue,
                    icon: state.isSearching
                        ? iconsPaths.iconMagnifier
                        : iconsPaths.iconWarningOrange,
                    color: colors.blue.withOpacity(.05),
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    state.isSearching
                        ? Lang.of(context).idNoFoundTitle
                        : Lang.of(context).idNoElementsTitle,
                    textColor: colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Figtree',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    state.isSearching
                        ? Lang.of(context).idNoFoundMessage
                        : Lang.of(context).idNoElementsMessage,
                    textColor: colors.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    height: 1.25,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.height(.02),
        ),
      ],
    );
  }
}

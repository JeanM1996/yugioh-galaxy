import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_state.dart';

//CardsListView: class to show the cards list
class CardsListView extends ConsumerWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(arquetipeDetailController);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.cards.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colors.paper.withOpacity(.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () => _onTapCard(state, index, context),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Image.network(
                      state.cards[index].cardImages[0].imageUrl,
                      width: 100,
                      height: 100,
                      errorBuilder: (context, error, stackTrace) =>
                          CircleAvatar(
                        backgroundColor: colors.wine,
                        child: CustomText(
                          '${state.bannedCards[index].name[0].toUpperCase()} ${state.bannedCards[index].name[1].toUpperCase()}',
                          textColor: colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              //with yugioh icon
                              : AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  child: SvgPicture.asset(
                                    iconsPaths.iconYugiohGalaxy,
                                    width: 50,
                                    height: 50,
                                    //change the color filter opactiy to change the color of the icon
                                    colorFilter: ColorFilter.mode(
                                      colors.black.withOpacity(
                                        loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!,
                                      ),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    onTap: () => _onTapCard(state, index, context),
                    title: Text(state.cards[index].name),
                    subtitle: Text(state.cards[index].type),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  dynamic _onTapCard(
    ArquetipeDetailState state,
    int index,
    BuildContext context,
  ) async {
    const bool = true;
    if (bool) {
      print('Card id: ${state.cards[index].id}');
      context.push(
        Routes.cardRoute,
        extra: Map<String, dynamic>.from(
          {'id': state.cards[index].name},
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_controller.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_state.dart';

//BannedListView: class to show the banned list view
class BannedListView extends ConsumerWidget {
  const BannedListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bannedListController);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.bannedCards.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: colors.paper.withOpacity(.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            onTap: () => _onTapCard(state, index, context),
            leading: Image.network(
              state.bannedCards[index].cardImages.first.imageUrl,
              width: 50,
              height: 50,
            ),
            title: CustomText(
              state.bannedCards[index].name,
              textColor: colors.black,
              fontWeight: FontWeight.w700,
            ),
            subtitle: CustomText(
              state.bannedCards[index].type,
              textColor: colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }

  dynamic _onTapCard(
    BannedListState state,
    int index,
    BuildContext context,
  ) async {
    const bool = true;
    if (bool) {
      await context.push(
        Routes.cardRoute,
        extra: Map<String, dynamic>.from(
          {'id': state.bannedCards[index].name},
        ),
      );
    }
  }
}

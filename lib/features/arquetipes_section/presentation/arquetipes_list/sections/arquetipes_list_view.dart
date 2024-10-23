import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_state.dart';

//ArquetipesListView: class to show the arquetipes list view of arquetipes
class ArquetipesListView extends ConsumerWidget {
  const ArquetipesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(arquetipesListController);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.arquetipes.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: colors.paper.withOpacity(.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            onTap: () => _onTapCard(state, index, context),
            leading: CircleAvatar(
              backgroundColor: colors.wine,
              child: CustomText(
                '${state.arquetipes[index].archetypeName[0].toUpperCase()}${state.arquetipes[index].archetypeName[1].toUpperCase()}',
                textColor: colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            title: CustomText(
              state.arquetipes[index].archetypeName,
              textColor: colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }

  dynamic _onTapCard(
    ArquetipesListState state,
    int index,
    BuildContext context,
  ) async {
    const bool = true;
    if (bool) {
      context.push(
        Routes.arquetipeDetailRoute,
        extra: Map<String, dynamic>.from(
          {'id': state.arquetipes[index].archetypeName},
        ),
      );
    }
  }
}

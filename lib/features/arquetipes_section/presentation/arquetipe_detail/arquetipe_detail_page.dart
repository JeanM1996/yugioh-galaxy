import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/circular_progress.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/tokens.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/image_paths.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/sections/card_list_view.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/sections/empty_view_card.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/sections/search_card.dart';

//ArquetipeDetailPage: class to show the arquetipe detail page
class ArquetipeDetailPage extends ConsumerStatefulWidget {
  const ArquetipeDetailPage(this.information, {super.key});
  final Map information;
  @override
  ConsumerState<ArquetipeDetailPage> createState() =>
      _ArquetipeDetailPageState();
}

class _ArquetipeDetailPageState extends ConsumerState<ArquetipeDetailPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, _initData);
    super.initState();
  }

  // ignore: long-method, logic required for messages
  Future<void> _initData() async {
    const bool = true;
    if (bool) {
      final controller = ref.watch(arquetipeDetailController.notifier);
      controller.setLoading(true);
      await controller.getArquetipeCards(widget.information['id']);
      await controller.getBannedCards('tcg');
      await controller.getBannedCards('ocg');
      await controller.getBannedCards('goat');
      await controller.excludeUsingBanList();
      controller.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(arquetipeDetailController.notifier);
    final state = ref.watch(arquetipeDetailController);

    return Flexible(
      fit: FlexFit.tight,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: state.isLoading
                ? const CircularProgress()
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePaths.imgyugiohCard),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              colors.blue.withOpacity(0.75),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding: context.all(.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Arquetipo: ${widget.information['id']}',
                              textColor: colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                            const SizedBox(height: 10),
                            if (state.cards.isEmpty)
                              const EmptyViewCards()
                            else
                              const CardsListView(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              height: 50,
              width: context.width(.9),
              child: SearchCard(
                _searchController,
                controller,
                state,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

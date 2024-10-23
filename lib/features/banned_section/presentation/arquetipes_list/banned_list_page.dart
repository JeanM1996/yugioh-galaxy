import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/circular_progress.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/tokens.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/image_paths.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_controller.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/sections/banned_list_view.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/sections/empty_view_banned.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/sections/search_banned.dart';

//BannedListPage: class to show the banned list page
class BannedListPage extends ConsumerStatefulWidget {
  const BannedListPage(this.information, {super.key});
  final Map information;
  @override
  ConsumerState<BannedListPage> createState() => _BannedListPageState();
}

class _BannedListPageState extends ConsumerState<BannedListPage> {
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
      final controller = ref.watch(bannedListController.notifier);
      controller.setLoading(true);
      await controller.getBannedCards();
      controller.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(bannedListController.notifier);
    final state = ref.watch(bannedListController);

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
                            image: AssetImage(imagePaths.imgBackground),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              colors.background.withOpacity(0.7),
                              BlendMode.dstATop,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding: context.all(.05),
                        child: state.bannedCards.isEmpty
                            ? const EmptyViewBanned()
                            : const BannedListView(),
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
              child: SearchBanned(
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

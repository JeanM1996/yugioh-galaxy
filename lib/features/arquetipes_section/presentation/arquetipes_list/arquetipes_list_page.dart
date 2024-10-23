import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/circular_progress.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/tokens.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/image_paths.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/sections/arquetipes_list_view.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/sections/empty_view_arquetipes.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/sections/search_arquetipes.dart';

//ArquetipesListPage: class to show the arquetipes list page
class ArquetipesListPage extends ConsumerStatefulWidget {
  const ArquetipesListPage(this.information, {super.key});
  final Map information;
  @override
  ConsumerState<ArquetipesListPage> createState() => _ArquetipesListPageState();
}

class _ArquetipesListPageState extends ConsumerState<ArquetipesListPage> {
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
      final controller = ref.watch(arquetipesListController.notifier);
      controller.setLoading(true);
      await controller.getArquetipes();
      controller.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(arquetipesListController.notifier);
    final state = ref.watch(arquetipesListController);

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
                        height: context.height(.99) + 500,
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
                        child: state.arquetipes.isEmpty
                            ? const EmptyViewArquetipes()
                            : const ArquetipesListView(),
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
              child: SearchArquetipes(
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_state.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';

//SearchCard: widget to show the search card text field
class SearchCard extends ConsumerWidget {
  const SearchCard(
    this.textController,
    this.controller,
    this.state, {
    super.key,
  });
  final TextEditingController textController;
  final ArquetipeDetailController controller;
  final ArquetipeDetailState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: colors.black.withOpacity(.1),
            blurRadius: 25,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 26),
            height: 50,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.search,
                color: colors.gray,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              controller: textController,
              decoration: InputDecoration(
                hintText: Lang.of(context).search,
                hintStyle: TextStyle(
                  color: colors.gray,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) => controller.searchCard(value),
            ),
          ),
          if (state.isSearching)
            InkWell(
              onTap: () => _clearSearch(controller),
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                height: 50,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: colors.gray,
                  ),
                ),
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }

  dynamic _clearSearch(
    ArquetipeDetailController controller,
  ) {
    textController.clear();
    controller.clearSearch();
  }
}

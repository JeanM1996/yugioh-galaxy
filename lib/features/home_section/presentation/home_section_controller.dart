import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/home_section/presentation/home_section_state.dart';

class HomeSectionController extends StateNotifier<HomeSectionState> {
  HomeSectionController() : super(HomeSectionState());
}

final homeSectionController =
    StateNotifierProvider<HomeSectionController, HomeSectionState>((ref) {
  return HomeSectionController();
});

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_banned_cards_use_case.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_controller.dart';

import '../../../arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller_test.mocks.dart';

// ignore_for_file: invalid_use_of_protected_member
@GenerateMocks([
  GetBannedCardsUseCase,
])
void main() {
  final getBannedCards = MockGetBannedCardsUseCase();
  final arquetipeDetailListController = BannedListController(getBannedCards);

  test('setLoading', () {
    const value = true;
    arquetipeDetailListController.setLoading(value);
    expect(arquetipeDetailListController.state.isLoading, value);
  });

  test('searchCard', () {
    const query = 'test';
    arquetipeDetailListController.searchCard(query);
    expect(arquetipeDetailListController.state.isSearching, true);
  });

  //get banned cards
  test('get Banned Cards', () async {
    final cards = <CardInfoModel>[];
    when(getBannedCards.execute('tcg')).thenAnswer((_) async => Right(cards));
    when(getBannedCards.execute('ocg')).thenAnswer((_) async => Right(cards));
    when(getBannedCards.execute('goat')).thenAnswer((_) async => Right(cards));
    final result = await arquetipeDetailListController.getBannedCards();
    expect(result, null);
  });

  //clear search
  test('clearSearch', () {
    arquetipeDetailListController.clearSearch();
    expect(
      arquetipeDetailListController.state.bannedCards,
      arquetipeDetailListController.state.auxBannedCards,
    );
  });

  //set loading
  test('setLoading', () {
    const value = true;
    arquetipeDetailListController.setLoading(value);
    expect(arquetipeDetailListController.state.isLoading, value);
  });
}

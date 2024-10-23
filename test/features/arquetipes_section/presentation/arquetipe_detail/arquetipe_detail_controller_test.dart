import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_arquetipe_cards_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_banned_cards_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_controller.dart';

import 'arquetipe_detail_controller_test.mocks.dart';

// ignore_for_file: invalid_use_of_protected_member
@GenerateMocks([
  GetArquetipeCardsUseCase,
  GetBannedCardsUseCase,
])
void main() {
  final getArquetipeCards = MockGetArquetipeCardsUseCase();
  final getBannedCards = MockGetBannedCardsUseCase();
  final arquetipeDetailListController =
      ArquetipeDetailController(getArquetipeCards, getBannedCards);

  test('setLoading', () {
    const value = true;
    arquetipeDetailListController.setLoading(value);
    expect(arquetipeDetailListController.state.isLoading, value);
  });

  test('get Arquetipe Cards', () async {
    final cards = <CardInfoModel>[];
    when(getArquetipeCards.execute('')).thenAnswer((_) async => Right(cards));
    final result = await arquetipeDetailListController.getArquetipeCards('');
    expect(result, null);
  });

  test('searchCard', () {
    const query = 'test';
    arquetipeDetailListController.searchCard(query);
    expect(arquetipeDetailListController.state.isSearching, true);
  });

  //get banned cards
  test('get Banned Cards', () async {
    final cards = <CardInfoModel>[];
    when(getBannedCards.execute('')).thenAnswer((_) async => Right(cards));
    final result = await arquetipeDetailListController.getBannedCards('');
    expect(result, null);
  });

  //exclude
  test('excludeUsingBanList', () {
    arquetipeDetailListController.excludeUsingBanList();
    expect(
      arquetipeDetailListController.state.cards,
      arquetipeDetailListController.state.auxCards,
    );
  });

  //clear search
  test('clearSearch', () {
    arquetipeDetailListController.clearSearch();
    expect(
      arquetipeDetailListController.state.cards,
      arquetipeDetailListController.state.auxCards,
    );
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_banned_cards_use_case.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_state.dart';

// BamnedListController:  BannedListController to manage the state of the BannedListState
class BannedListController extends StateNotifier<BannedListState> {
  BannedListController(
    this.getBannedCardsUseCase,
  ) : super(
          BannedListState(),
        );
  //Define the use case
  final GetBannedCardsUseCase getBannedCardsUseCase;

  //getBannedCards: get the banned cards
  Future getBannedCards() async {
    final resultTgc = await getBannedCardsUseCase.execute('tcg');
    final resultOcg = await getBannedCardsUseCase.execute('ocg');
    final resultGoat = await getBannedCardsUseCase.execute('goat');

    final tgcCards = resultTgc.fold(
      (failure) => <CardInfoModel>[],
      (cards) => cards,
    );
    final ocgCards = resultOcg.fold(
      (failure) => <CardInfoModel>[],
      (cards) => cards,
    );

    final goatCards = resultGoat.fold(
      (failure) => <CardInfoModel>[],
      (cards) => cards,
    );

    final bannedCards = <CardInfoModel>[];
    bannedCards.addAll(tgcCards);
    bannedCards.addAll(ocgCards);
    bannedCards.addAll(goatCards);

    state = state.copyWith(
      bannedCards: bannedCards,
      auxBannedCards: bannedCards,
    );
  }

  //searchCard: search the card

  void searchCard(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        bannedCards: state.auxBannedCards,
        isSearching: false,
      );
    } else {
      final filteredCards = state.auxBannedCards
          .where(
            (card) => card.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      state = state.copyWith(
        bannedCards: filteredCards,
        isSearching: true,
      );
    }
  }

  //clearSearch: clear the search

  void clearSearch() {
    state = state.copyWith(
      bannedCards: state.auxBannedCards,
      isSearching: false,
    );
  }

//setLoading: set the loading state
  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

//bannedListController: provider to manage the state of the banned list
final bannedListController =
    StateNotifierProvider.autoDispose<BannedListController, BannedListState>(
        (ref) {
  return BannedListController(
    ref.read(getBannedCardsUseCaseProvider),
  );
});

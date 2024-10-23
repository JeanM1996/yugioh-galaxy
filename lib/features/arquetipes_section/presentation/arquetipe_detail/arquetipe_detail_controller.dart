import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_arquetipe_cards_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_banned_cards_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_state.dart';

//ArquetipeDetailController: class to manage the state of the arquetipe detail
class ArquetipeDetailController extends StateNotifier<ArquetipeDetailState> {
  ArquetipeDetailController(
    this.getArquetipeCardsUseCase,
    this.getBannedCardsUseCase,
  ) : super(
          ArquetipeDetailState(),
        );
//Define the use cases
  final GetArquetipeCardsUseCase getArquetipeCardsUseCase;
  final GetBannedCardsUseCase getBannedCardsUseCase;

  //getArquetipeCards: get the arquetipe cards
  Future getArquetipeCards(String id) async {
    final result = await getArquetipeCardsUseCase.execute(id);
    result.fold(
      (failure) {
        state = state.copyWith(
          cards: [],
          auxCards: [],
          isLoading: false,
        );
      },
      (cards) {
        state = state.copyWith(
          cards: cards,
          auxCards: cards,
          isLoading: false,
        );
      },
    );
  }

  //searchCard: search a card by query
  void searchCard(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        cards: state.auxCards,
        isSearching: false,
      );
    } else {
      final filteredCards = state.auxCards
          .where(
            (card) => card.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      state = state.copyWith(
        cards: filteredCards,
        isSearching: true,
      );
    }
  }
  //setLoading: set the loading state

  void setLoading(bool value) {
    state = state.copyWith(
      isLoading: value,
    );
  }

  //clearSearch: clear the search

  void clearSearch() {
    state = state.copyWith(
      cards: state.auxCards,
      isSearching: false,
    );
  }

  //getBannedCards: get the banned cards

  Future getBannedCards(String banList) async {
    final result = await getBannedCardsUseCase.execute(banList);
    result.fold(
      (failure) {
        state = state.copyWith(
          bannedCards: state.cards.isNotEmpty ? [...state.bannedCards] : [],
          isLoading: false,
        );
      },
      (cards) {
        state = state.copyWith(
          bannedCards:
              state.cards.isNotEmpty ? [...state.bannedCards, ...cards] : cards,
          isLoading: false,
        );
      },
    );
  }

  //excludeUsingBanList: exclude the banned cards from the list
  Future excludeUsingBanList() async {
    final bannedCards = state.bannedCards;
    final filteredCards = state.cards
        .where(
          (card) => !bannedCards.any((bannedCard) => bannedCard.id == card.id),
        )
        .toList();
    state = state.copyWith(
      cards: filteredCards,
      auxCards: filteredCards,
    );
  }
}

//arquetipeDetailController: provider to manage the state of the arquetipe detail
final arquetipeDetailController = StateNotifierProvider.autoDispose<
    ArquetipeDetailController, ArquetipeDetailState>((ref) {
  return ArquetipeDetailController(
    ref.read(getArquetipeCardsUseCaseProvider),
    ref.read(getBannedCardsUseCaseProvider),
  );
});

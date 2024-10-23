import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_card_by_id_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/card_detail/card_detail_state.dart';

// CardDetailController: contains the controller of the card detail
class CardDetailController extends StateNotifier<CardDetailState> {
  CardDetailController(
    this.getCardByIdUseCase,
  ) : super(CardDetailState());

  //Define the use case
  final GetCardByIdUseCase getCardByIdUseCase;

  //getCardById: get the card by id
  Future getCardById(String id) async {
    final result = await getCardByIdUseCase.execute(id);
    result.fold(
      (l) {
        state = state.copyWith();
      },
      (cards) {
        state = state.copyWith(
          card: cards,
        );
      },
    );
  }

  //setLoading: set the loading state
  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  //showOriginalCard: show the original card
  void showOriginalCard(bool value) {
    state = state.copyWith(showOriginalCard: value);
  }
}

//cardDetailController: provider to manage the state of the card detail
final cardDetailController =
    StateNotifierProvider.autoDispose<CardDetailController, CardDetailState>(
        (ref) {
  return CardDetailController(
    ref.read(getCardByIdUseCaseProvider),
  );
});

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_card_by_id_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/card_detail/card_detail_controller.dart';

import 'card_detail_controller_test.mocks.dart';

// ignore_for_file: invalid_use_of_protected_member
@GenerateMocks([
  GetCardByIdUseCase,
])
void main() {
  final getCardDetailUseCase = MockGetCardByIdUseCase();
  final cardDetailController = CardDetailController(getCardDetailUseCase);

  test('setLoading', () {
    const value = true;
    cardDetailController.setLoading(value);
    expect(cardDetailController.state.isLoading, value);
  });

  test('get Card by id', () async {
    const card = CardInfoModel.empty;
    when(getCardDetailUseCase.execute(''))
        .thenAnswer((_) async => const Right(card));
    final result = await cardDetailController.getCardById('');
    expect(result, null);
  });

  //set loading
  test('setLoading', () {
    const value = true;
    cardDetailController.setLoading(value);
    expect(cardDetailController.state.isLoading, value);
  });

  //show original card
  test('showOriginalCard', () {
    const value = true;
    cardDetailController.showOriginalCard(value);
    expect(cardDetailController.state.showOriginalCard, value);
  });
}

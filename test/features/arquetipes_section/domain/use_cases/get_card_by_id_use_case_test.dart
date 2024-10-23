import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_card_by_id_use_case.dart';

import 'get_arquetipes_use_case_test.mocks.dart';

void main() {
  final repository = MockArquetipeSectionRepository();
  final useCase = GetCardByIdUseCaseImpl(repository);

  test('Execute method test', () {
    when(repository.getCardDetail(''))
        .thenAnswer((_) async => const Right(CardInfoModel.empty));
    final result = useCase.execute('');
    expect(result, isA<Future<Either<CommonFailure, CardInfoModel>>>());
  });
}

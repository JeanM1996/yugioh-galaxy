import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/repositories/arquetipes_section_repository.dart';

import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_arquetipes_use_case.dart';

import 'get_arquetipes_use_case_test.mocks.dart';

@GenerateMocks([ArquetipeSectionRepository])
void main() {
  final repository = MockArquetipeSectionRepository();
  final useCase = GetArquetipesUseCaseImpl(repository);

  test('Execute method test', () {
    when(repository.getArquetipes()).thenAnswer((_) async => const Right([]));
    final result = useCase.execute();
    expect(
      result,
      isA<Future<Either<CommonFailure, List<ArquetipeListModel>>>>(),
    );
  });
}

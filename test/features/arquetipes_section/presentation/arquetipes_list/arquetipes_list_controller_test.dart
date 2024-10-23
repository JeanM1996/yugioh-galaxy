import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_arquetipes_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_controller.dart';

import 'arquetipes_list_controller_test.mocks.dart';

// ignore_for_file: invalid_use_of_protected_member
@GenerateMocks([
  GetArquetipesUseCase,
])
void main() {
  final getArquetipesUseCase = MockGetArquetipesUseCase();
  final arquetipesListController =
      ArquetipesListController(getArquetipesUseCase);

  test('setLoading', () {
    const value = true;
    arquetipesListController.setLoading(value);
    expect(arquetipesListController.state.isLoading, value);
  });

  test('getArquetipes', () async {
    final arquetipes = <ArquetipeListModel>[];
    when(getArquetipesUseCase.execute())
        .thenAnswer((_) async => Right(arquetipes));
    final result = await arquetipesListController.getArquetipes();
    expect(result, null);
  });

  test('searchArquetipes', () {
    const query = 'test';
    arquetipesListController.searchArquetipes(query);
    expect(arquetipesListController.state.isSearching, true);
  });

  test('clearSearch', () {
    arquetipesListController.clearSearch();
    expect(
      arquetipesListController.state.arquetipes,
      arquetipesListController.state.auxArquetipes,
    );
  });

  test('setLoading', () {
    const value = true;
    arquetipesListController.setLoading(value);
    expect(arquetipesListController.state.isLoading, value);
  });
}

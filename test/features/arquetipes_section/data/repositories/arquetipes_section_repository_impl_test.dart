import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/data_sources/arquetipes_section_data_source.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/repositories/arquetipes_section_repository_impl.dart';

import 'arquetipes_section_repository_impl_test.mocks.dart';

@GenerateMocks([ArquetipeSectionDataSource])
void main() {
  final dataSource = MockArquetipeSectionDataSource();
  final repository = ArquetipeSectionRepositoryImpl(dataSource);

  test('Test getCardDetail', () async {
    when(dataSource.getCardDetail('')).thenAnswer(
      (_) async => HttpServiceResponse(
        success: true,
        message: 'OK',
        body: jsonEncode({
          'statusCode': 200,
          'error': false,
          'data': '',
        }),
      ),
    );
    final result = await repository.getCardDetail('');
    expect(result.isRight(), false);
  });

  test('Test getArquetipes', () async {
    when(dataSource.getArquetipes()).thenAnswer(
      (_) async => HttpServiceResponse(
        success: true,
        message: '',
        body: jsonEncode({
          'statusCode': 200,
          'error': false,
          'data': {'count': 0, 'data': []},
        }),
      ),
    );
    final result = await repository.getArquetipes();
    expect(result.isLeft(), true);
  });

  test('Test getCardArquetipes', () async {
    when(dataSource.getCardArquetipes('1')).thenAnswer(
      (_) async => HttpServiceResponse(
        success: true,
        message: 'OK',
        body: jsonEncode({
          'statusCode': 200,
          'error': false,
          'data': {'count': 0, 'data': []},
        }),
      ),
    );
    final result = await repository.getCardArquetipes('1');
    expect(result.isRight(), false);
  });

  //banlist
  test('Test getBanlist', () async {
    when(dataSource.getCardsFromBanlist('')).thenAnswer(
      (_) async => HttpServiceResponse(
        success: true,
        message: 'OK',
        body: jsonEncode({
          'statusCode': 200,
          'error': false,
          'data': {'count': 0, 'data': []},
        }),
      ),
    );
    final result = await repository.getCardsFromBanlist('');
    expect(result.isRight(), false);
  });
}

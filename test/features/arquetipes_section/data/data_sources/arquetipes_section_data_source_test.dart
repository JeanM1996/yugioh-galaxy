import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/data_sources/arquetipes_section_data_source.dart';

import '../../../../core/data/network/http_client_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  late ArquetipeSectionDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ArquetipeSectionDataSourceImpl(mockHttpClient);
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Get Arquetipes', () async {
    // Arrange
    final expectedResponse = HttpServiceResponse(
      success: true,
      message: '',
      body: '',
    );

    when(
      mockHttpClient.get(
        endpoint: '/archetypes.php',
      ),
    ).thenAnswer(
      (_) async => expectedResponse,
    );
    // Act
    final result = await dataSource.getArquetipes();

    // Assert
    expect(result, isA<HttpServiceResponse>());
  });

  test('Get Card Detail', () async {
    // Arrange
    final expectedResponse = HttpServiceResponse(
      success: true,
      message: '',
      body: '',
    );

    when(
      mockHttpClient.get(
        endpoint: '/cardinfo.php?name=1',
      ),
    ).thenAnswer(
      (_) async => expectedResponse,
    );
    // Act
    final result = await dataSource.getCardDetail('1');

    // Assert
    expect(result, isA<HttpServiceResponse>());
  });

  test('Get Card Arquetipes', () async {
    // Arrange
    final expectedResponse = HttpServiceResponse(
      success: true,
      message: '',
      body: '',
    );

    when(
      mockHttpClient.get(
        endpoint: '/cardinfo.php?archetype=1',
      ),
    ).thenAnswer(
      (_) async => expectedResponse,
    );
    // Act
    final result = await dataSource.getCardArquetipes('1');

    // Assert
    expect(result, isA<HttpServiceResponse>());
  });

  test('Get Cards From Banlist', () async {
    // Arrange
    final expectedResponse = HttpServiceResponse(
      success: true,
      message: '',
      body: '',
    );

    when(
      mockHttpClient.get(
        endpoint: '/cardinfo.php?banlist=1',
      ),
    ).thenAnswer(
      (_) async => expectedResponse,
    );
    // Act
    final result = await dataSource.getCardsFromBanlist('1');

    // Assert
    expect(result, isA<HttpServiceResponse>());
  });
}

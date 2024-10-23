import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';

final arquetipeSectionDataSourceProvider = Provider<ArquetipeSectionDataSource>(
  (ref) => ArquetipeSectionDataSourceImpl(HttpClient()),
);

//Abstract class definition
abstract class ArquetipeSectionDataSource {
  Future<HttpServiceResponse> getCardDetail(String id);
  Future<HttpServiceResponse> getArquetipes();
  Future<HttpServiceResponse> getCardArquetipes(String id);
  Future<HttpServiceResponse> getCardsFromBanlist(String id);
}

//Implementation
class ArquetipeSectionDataSourceImpl extends ArquetipeSectionDataSource {
  ArquetipeSectionDataSourceImpl(this.httpClient);
  final HttpClient httpClient;
  //Method implementation for getCardDetail
  @override
  Future<HttpServiceResponse> getCardArquetipes(String id) {
    return httpClient.get(
      endpoint: '/cardinfo.php?archetype=$id',
    );
  }

  //Method implementation for getArquetipes
  @override
  Future<HttpServiceResponse> getArquetipes() {
    return httpClient.get(
      endpoint: '/archetypes.php',
    );
  }

  @override
  Future<HttpServiceResponse> getCardDetail(String id) {
    return httpClient.get(
      endpoint: '/cardinfo.php?name=$id',
    );
  }

  //Method implementation for getCardsFromBanlist
  @override
  Future<HttpServiceResponse> getCardsFromBanlist(String id) {
    return httpClient.get(
      endpoint: '/cardinfo.php?banlist=$id',
    );
  }
}

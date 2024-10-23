import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';

final homeSectionDataSourceProvider = Provider<HomeSectionDataSource>(
  (ref) => HomeSectionDataSourceImpl(HttpClient()),
);

abstract class HomeSectionDataSource {}

@Injectable(as: HomeSectionDataSource)
class HomeSectionDataSourceImpl extends HomeSectionDataSource {
  HomeSectionDataSourceImpl(this.httpClient);
  final HttpClient httpClient;
}

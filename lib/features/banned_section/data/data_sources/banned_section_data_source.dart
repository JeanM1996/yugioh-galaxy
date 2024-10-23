import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';

final bannedSectionDataSourceProvider = Provider<BannedSectionDataSource>(
  (ref) => BannedSectionDataSourceImpl(HttpClient()),
);

abstract class BannedSectionDataSource {}

class BannedSectionDataSourceImpl extends BannedSectionDataSource {
  BannedSectionDataSourceImpl(this.httpClient);
  final HttpClient httpClient;
}

// ignore_for_file: unnecessary_lambdas

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/data_sources/arquetipes_section_data_source.dart';
import 'package:yugiohgalaxy/features/banned_section/domain/repositories/banned_section_repository.dart';

final bannedSectionRepositoryProvider = Provider<BannedSectionRepository>(
  (ref) => BannedSectionRepositoryImpl(
    ref.read(arquetipeSectionDataSourceProvider),
  ),
);

class BannedSectionRepositoryImpl implements BannedSectionRepository {
  BannedSectionRepositoryImpl(this.dataSource);

  final ArquetipeSectionDataSource dataSource;
}

// ignore_for_file: unnecessary_lambdas

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/home_section/data/data_sources/home_section_data_source.dart';
import 'package:yugiohgalaxy/features/home_section/domain/repositories/home_section_repository.dart';

final homeSectionRepositoryProvider = Provider<HomeSectionRepository>(
  (ref) => HomeSectionRepositoryImpl(ref.read(homeSectionDataSourceProvider)),
);

class HomeSectionRepositoryImpl implements HomeSectionRepository {
  HomeSectionRepositoryImpl(this.dataSource);

  final HomeSectionDataSource dataSource;
}

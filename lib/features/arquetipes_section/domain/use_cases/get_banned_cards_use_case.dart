import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/repositories/arquetipes_section_repository_impl.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/repositories/arquetipes_section_repository.dart';

// defining the provider
final getBannedCardsUseCaseProvider = Provider<GetBannedCardsUseCase>(
  (ref) => GetBannedCardsUseCaseImpl(
    ref.read(arquetipeSectionRepositoryProvider),
  ),
);

//  implementing the use case

abstract class GetBannedCardsUseCase {
  Future<Either<CommonFailure, List<CardInfoModel>>> execute(String id);
}

class GetBannedCardsUseCaseImpl implements GetBannedCardsUseCase {
  GetBannedCardsUseCaseImpl(this.repository);

  final ArquetipeSectionRepository repository;

  @override
  Future<Either<CommonFailure, List<CardInfoModel>>> execute(String id) {
    return repository.getCardsFromBanlist(id);
  }
}

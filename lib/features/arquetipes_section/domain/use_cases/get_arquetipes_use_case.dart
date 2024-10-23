import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/repositories/arquetipes_section_repository_impl.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/repositories/arquetipes_section_repository.dart';

// defining the provider
final getArquetipesUseCaseProvider = Provider<GetArquetipesUseCase>(
  (ref) => GetArquetipesUseCaseImpl(
    ref.read(arquetipeSectionRepositoryProvider),
  ),
);

// implementing the use case
abstract class GetArquetipesUseCase {
  Future<Either<CommonFailure, List<ArquetipeListModel>>> execute();
}

class GetArquetipesUseCaseImpl implements GetArquetipesUseCase {
  GetArquetipesUseCaseImpl(this.repository);

  final ArquetipeSectionRepository repository;

  @override
  Future<Either<CommonFailure, List<ArquetipeListModel>>> execute() {
    return repository.getArquetipes();
  }
}

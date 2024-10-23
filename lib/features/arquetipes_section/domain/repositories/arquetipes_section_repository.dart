import 'package:dartz/dartz.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';

//ArquetipeSectionRepository: abstract class to define the methods to be implemented
abstract class ArquetipeSectionRepository {
  //Method to get card detail
  Future<Either<CommonFailure, CardInfoModel>> getCardDetail(
    String id,
  );
  //Method to get arquetipes
  Future<Either<CommonFailure, List<ArquetipeListModel>>> getArquetipes();
  //Method to get card arquetipes
  Future<Either<CommonFailure, List<CardInfoModel>>> getCardArquetipes(
    String id,
  );
  //Method to get cards from banlist
  Future<Either<CommonFailure, List<CardInfoModel>>> getCardsFromBanlist(
    String id,
  );
}

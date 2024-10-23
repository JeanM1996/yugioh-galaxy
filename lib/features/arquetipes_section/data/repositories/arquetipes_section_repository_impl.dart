// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/domain/failures/common_failure.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/data/data_sources/arquetipes_section_data_source.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/repositories/arquetipes_section_repository.dart';

// defining the provider
final arquetipeSectionRepositoryProvider = Provider<ArquetipeSectionRepository>(
  (ref) => ArquetipeSectionRepositoryImpl(
    ref.read(arquetipeSectionDataSourceProvider),
  ),
);

// implementing the repository
class ArquetipeSectionRepositoryImpl implements ArquetipeSectionRepository {
  ArquetipeSectionRepositoryImpl(this.dataSource);

  final ArquetipeSectionDataSource dataSource;

  //Method to get card detail
  @override
  Future<Either<CommonFailure, CardInfoModel>> getCardDetail(
    String id,
  ) async {
    try {
      final result = await dataSource.getCardDetail(id);

      if (result.success!) {
        final json = result.body!;

        final enconded = jsonDecode(json);
        final data = enconded['data'];

        final card = CardInfoModel.fromMap(data.first);

        return right(card);
      }
      throw Exception();
    } catch (e) {
      return left(
        const CommonFailure.server(code: 500, message: 'Bad request'),
      );
    }
  }

  //Method to get card arquetipes
  @override
  Future<Either<CommonFailure, List<CardInfoModel>>> getCardArquetipes(
    String id,
  ) async {
    try {
      final result = await dataSource.getCardArquetipes(id);

      if (result.success!) {
        final json = result.body!;

        final enconded = jsonDecode(json);
        final data = enconded['data'];

        final cards = data
            .map((e) => CardInfoModel.fromMap(e))
            .toList()
            .cast<CardInfoModel>();
        return right(cards);
      }
      throw Exception();
    } catch (e) {
      return left(
        const CommonFailure.server(code: 500, message: 'Bad request'),
      );
    }
  }

  //Method to get arquetipes

  @override
  Future<Either<CommonFailure, List<ArquetipeListModel>>>
      getArquetipes() async {
    try {
      final result = await dataSource.getArquetipes();

      if (result.success!) {
        /**[{"archetype_name":"-Eyes Dragon"},{"archetype_name":"\"C\""},{"archetype_name":"@Ignister"},{"archetype_name":"A-to-Z"},{"archetype_name":"A.I."},{"archetype_name":"ABC"},{"archetype_name":"Abyss Actor"},{"archetype_name":"Abyss Script"},{"archetype_name":"Abyss-"},{"archetype_name":"Adamancipator"},{"archetype_name":"Advanced Crystal Beast"},{"archetype_name":"Adventurer Token"},{"archetype_name":"Aesir"},{"archetype_name":"Aether"},{"archetype_name":"Albaz Dragon"},{"archetype_name":"Alien"},{"archetype_name":"Alligator"},{"archetype_name":"Allure Queen"},{"archetype_name":"Ally of Justice"} */
        final json = result.body!;
        final encoded = jsonDecode(json);

        final arquetipes = encoded
            .map((e) => ArquetipeListModel.fromMap(e))
            .toList()
            .cast<ArquetipeListModel>();
        return right(arquetipes);
      }
      throw Exception();
    } catch (e) {
      return left(
        const CommonFailure.server(code: 500, message: 'Bad request'),
      );
    }
  }

//Method to get cards from banlist
  @override
//banned
  Future<Either<CommonFailure, List<CardInfoModel>>> getCardsFromBanlist(
    String id,
  ) async {
    try {
      final result = await dataSource.getCardsFromBanlist(id);

      if (result.success!) {
        final json = result.body!;
        final encoded = jsonDecode(json);
        final data = encoded['data'];
        final List<CardInfoModel> banlist = data
            .map((e) => CardInfoModel.fromMap(e))
            .toList()
            .cast<CardInfoModel>();

        return right(banlist);
      }
      throw Exception();
    } catch (e) {
      return left(
        const CommonFailure.server(code: 500, message: 'Bad request'),
      );
    }
  }
}

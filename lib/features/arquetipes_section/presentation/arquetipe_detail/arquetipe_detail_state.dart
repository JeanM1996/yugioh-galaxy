// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';

// ArquetipeDetailState: contains the state of the arquetipe detail
class ArquetipeDetailState {
  final List<CardInfoModel> cards;
  final List<CardInfoModel> auxCards;
  final bool isSearching;
  final bool isLoading;

  final List<CardInfoModel> bannedCards;

  ArquetipeDetailState({
    this.cards = const [],
    this.auxCards = const [],
    this.isSearching = false,
    this.isLoading = false,
    this.bannedCards = const [],
  });

  ArquetipeDetailState copyWith({
    List<CardInfoModel>? cards,
    List<CardInfoModel>? auxCards,
    bool? isSearching,
    bool? isLoading,
    List<CardInfoModel>? bannedCards,
  }) {
    return ArquetipeDetailState(
      cards: cards ?? this.cards,
      auxCards: auxCards ?? this.auxCards,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
      bannedCards: bannedCards ?? this.bannedCards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cards': cards.map((x) => x.toMap()).toList(),
      'auxCards': auxCards.map((x) => x.toMap()).toList(),
      'isSearching': isSearching,
      'isLoading': isLoading,
      'bannedCards': bannedCards.map((x) => x.toMap()).toList(),
    };
  }

  factory ArquetipeDetailState.fromMap(Map<String, dynamic> map) {
    return ArquetipeDetailState(
      cards: List<CardInfoModel>.from(
        (map['cards'] as List<int>).map<CardInfoModel>(
          (x) => CardInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      auxCards: List<CardInfoModel>.from(
        (map['auxCards'] as List<int>).map<CardInfoModel>(
          (x) => CardInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isSearching: map['isSearching'] as bool,
      isLoading: map['isLoading'] as bool,
      bannedCards: List<CardInfoModel>.from(
        (map['bannedCards'] as List<int>).map<CardInfoModel>(
          (x) => CardInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArquetipeDetailState.fromJson(String source) =>
      ArquetipeDetailState.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return 'ArquetipeDetailState(cards: $cards, auxCards: $auxCards, isSearching: $isSearching, isLoading: $isLoading, bannedCards: $bannedCards)';
  }

  @override
  bool operator ==(covariant ArquetipeDetailState other) {
    if (identical(this, other)) return true;

    return listEquals(other.cards, cards) &&
        listEquals(other.auxCards, auxCards) &&
        other.isSearching == isSearching &&
        other.isLoading == isLoading &&
        listEquals(other.bannedCards, bannedCards);
  }

  @override
  int get hashCode {
    return cards.hashCode ^
        auxCards.hashCode ^
        isSearching.hashCode ^
        isLoading.hashCode ^
        bannedCards.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';

//BannedListState: contains the banned list state
class BannedListState {
  BannedListState({
    this.bannedCards = const [],
    this.auxBannedCards = const [],
    this.isSearching = false,
    this.isLoading = false,
  });

  final List<CardInfoModel> bannedCards;
  final List<CardInfoModel> auxBannedCards;
  final bool isSearching;
  final bool isLoading;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bannedCards': bannedCards.map((x) => x.toMap()).toList(),
      'auxBannedCards': auxBannedCards.map((x) => x.toMap()).toList(),
      'isSearching': isSearching,
      'isLoading': isLoading,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'BannedListState(bannedCards: $bannedCards, auxBannedCards: $auxBannedCards, isSearching: $isSearching, isLoading: $isLoading)';
  }

  @override
  bool operator ==(covariant BannedListState other) {
    if (identical(this, other)) return true;

    return listEquals(other.bannedCards, bannedCards) &&
        listEquals(other.auxBannedCards, auxBannedCards) &&
        other.isSearching == isSearching &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode {
    return bannedCards.hashCode ^
        auxBannedCards.hashCode ^
        isSearching.hashCode ^
        isLoading.hashCode;
  }

  BannedListState copyWith({
    List<CardInfoModel>? bannedCards,
    List<CardInfoModel>? auxBannedCards,
    bool? isSearching,
    bool? isLoading,
  }) {
    return BannedListState(
      bannedCards: bannedCards ?? this.bannedCards,
      auxBannedCards: auxBannedCards ?? this.auxBannedCards,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory BannedListState.fromMap(Map<String, dynamic> map) {
    return BannedListState(
      bannedCards: List<CardInfoModel>.from(
        (map['bannedCards'] as List<int>).map<CardInfoModel>(
          (x) => CardInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      auxBannedCards: List<CardInfoModel>.from(
        (map['auxBannedCards'] as List<int>).map<CardInfoModel>(
          (x) => CardInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isSearching: map['isSearching'] as bool,
      isLoading: map['isLoading'] as bool,
    );
  }

  factory BannedListState.fromJson(String source) =>
      BannedListState.fromMap(json.decode(source) as Map<String, dynamic>);
}

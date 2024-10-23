// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';

//CardDetailState: contains the card detail state
class CardDetailState {
  CardDetailState({
    this.card = CardInfoModel.empty,
    this.isLoading = false,
    this.showOriginalCard = false,
  });

  final CardInfoModel card;
  final bool isLoading;
  final bool showOriginalCard;

  CardDetailState copyWith({
    CardInfoModel? card,
    bool? isLoading,
    bool? showOriginalCard,
  }) {
    return CardDetailState(
      card: card ?? this.card,
      isLoading: isLoading ?? this.isLoading,
      showOriginalCard: showOriginalCard ?? this.showOriginalCard,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'card': card.toMap(),
      'isLoading': isLoading,
      'showOriginalCard': showOriginalCard,
    };
  }

  factory CardDetailState.fromMap(Map<String, dynamic> map) {
    return CardDetailState(
      card: CardInfoModel.fromMap(map['card'] as Map<String, dynamic>),
      isLoading: map['isLoading'] as bool,
      showOriginalCard: map['showOriginalCard'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardDetailState.fromJson(String source) =>
      CardDetailState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CardDetailState(card: $card, isLoading: $isLoading, showOriginalCard: $showOriginalCard)';

  @override
  bool operator ==(covariant CardDetailState other) {
    if (identical(this, other)) return true;

    return other.card == card &&
        other.isLoading == isLoading &&
        other.showOriginalCard == showOriginalCard;
  }

  @override
  int get hashCode =>
      card.hashCode ^ isLoading.hashCode ^ showOriginalCard.hashCode;
}

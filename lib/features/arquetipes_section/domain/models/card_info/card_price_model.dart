import 'dart:convert';

//CardPriceModel: contains the price of the card
class CardPriceModel {
  CardPriceModel({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPriceModel.fromMap(Map<String, dynamic> map) {
    return CardPriceModel(
      cardmarketPrice: map['cardmarket_price'] as String,
      tcgplayerPrice: map['tcgplayer_price'] as String,
      ebayPrice: map['ebay_price'] as String,
      amazonPrice: map['amazon_price'] as String,
      coolstuffincPrice: map['coolstuffinc_price'] as String,
    );
  }

  factory CardPriceModel.fromJson(String source) =>
      CardPriceModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String cardmarketPrice;
  final String tcgplayerPrice;
  final String ebayPrice;
  final String amazonPrice;
  final String coolstuffincPrice;

  CardPriceModel copyWith({
    String? cardmarketPrice,
    String? tcgplayerPrice,
    String? ebayPrice,
    String? amazonPrice,
    String? coolstuffincPrice,
  }) {
    return CardPriceModel(
      cardmarketPrice: cardmarketPrice ?? this.cardmarketPrice,
      tcgplayerPrice: tcgplayerPrice ?? this.tcgplayerPrice,
      ebayPrice: ebayPrice ?? this.ebayPrice,
      amazonPrice: amazonPrice ?? this.amazonPrice,
      coolstuffincPrice: coolstuffincPrice ?? this.coolstuffincPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardmarket_price': cardmarketPrice,
      'tcgplayer_price': tcgplayerPrice,
      'ebay_price': ebayPrice,
      'amazon_price': amazonPrice,
      'coolstuffinc_price': coolstuffincPrice,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CardPriceModel(cardmarketPrice: $cardmarketPrice, tcgplayerPrice: $tcgplayerPrice, ebayPrice: $ebayPrice, amazonPrice: $amazonPrice, coolstuffincPrice: $coolstuffincPrice)';
  }

  @override
  bool operator ==(covariant CardPriceModel other) {
    if (identical(this, other)) return true;

    return other.cardmarketPrice == cardmarketPrice &&
        other.tcgplayerPrice == tcgplayerPrice &&
        other.ebayPrice == ebayPrice &&
        other.amazonPrice == amazonPrice &&
        other.coolstuffincPrice == coolstuffincPrice;
  }

  @override
  int get hashCode {
    return cardmarketPrice.hashCode ^
        tcgplayerPrice.hashCode ^
        ebayPrice.hashCode ^
        amazonPrice.hashCode ^
        coolstuffincPrice.hashCode;
  }
}

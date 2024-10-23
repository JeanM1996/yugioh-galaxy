import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_price_model.dart';

void main() {
  test('test constructor', () {
    final cardPrice = CardPriceModel(
      cardmarketPrice: 'cardmarketPrice',
      tcgplayerPrice: 'tcgplayerPrice',
      ebayPrice: 'ebayPrice',
      amazonPrice: 'amazonPrice',
      coolstuffincPrice: 'coolstuffincPrice',
    );
    expect(cardPrice.cardmarketPrice, 'cardmarketPrice');
  });

//test to map
  test('test to map', () {
    final cardPrice = CardPriceModel(
      cardmarketPrice: 'cardmarketPrice',
      tcgplayerPrice: 'tcgplayerPrice',
      ebayPrice: 'ebayPrice',
      amazonPrice: 'amazonPrice',
      coolstuffincPrice: 'coolstuffincPrice',
    );
    final map = cardPrice.toMap();
    expect(map['cardmarket_price'], 'cardmarketPrice');
  });

//test from map
  test('test from map', () {
    final map = <String, dynamic>{
      'cardmarket_price': 'cardmarketPrice',
      'tcgplayer_price': 'tcgplayerPrice',
      'ebay_price': 'ebayPrice',
      'amazon_price': 'amazonPrice',
      'coolstuffinc_price': 'coolstuffincPrice',
    };
    final card = CardPriceModel.fromMap(map);
    expect(card.cardmarketPrice, 'cardmarketPrice');
  });

//test to string
  test('test to string', () {
    final cardPrice = CardPriceModel(
      cardmarketPrice: 'cardmarketPrice',
      tcgplayerPrice: 'tcgplayerPrice',
      ebayPrice: 'ebayPrice',
      amazonPrice: 'amazonPrice',
      coolstuffincPrice: 'coolstuffincPrice',
    );
    expect(cardPrice.toString(), isA<String>());
  });
}

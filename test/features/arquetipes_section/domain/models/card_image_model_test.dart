import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_image_model.dart';

void main() {
  test('test constructor', () {
    final image = CardImageModel(
      id: 1,
      imageUrl: 'imageUrl',
      imageUrlCropped: 'imageUrlCropped',
      imageUrlSmall: 'imageUrlSmall',
    );
    expect(image.id, 1);
    expect(image.imageUrl, 'imageUrl');
    expect(image.imageUrlCropped, 'imageUrlCropped');
    expect(image.imageUrlSmall, 'imageUrlSmall');
  });

//test to map
  test('test to map', () {
    final image = CardImageModel(
      id: 1,
      imageUrl: 'imageUrl',
      imageUrlCropped: 'imageUrlCropped',
      imageUrlSmall: 'imageUrlSmall',
    );
    final map = image.toMap();
    expect(map['id'], 1);
    expect(map['image_url'], 'imageUrl');
    expect(map['image_url_cropped'], 'imageUrlCropped');
    expect(map['image_url_small'], 'imageUrlSmall');
  });

//test from map
  test('test from map', () {
    final map = <String, dynamic>{
      'id': 1,
      'image_url': 'imageUrl',
      'image_url_cropped': 'imageUrlCropped',
      'image_url_small': 'imageUrlSmall',
    };
    final image = CardImageModel.fromMap(map);
    expect(image.id, 1);
    expect(image.imageUrl, 'imageUrl');
    expect(image.imageUrlCropped, 'imageUrlCropped');
    expect(image.imageUrlSmall, 'imageUrlSmall');
  });

//test to string
  test('test to string', () {
    final image = CardImageModel(
      id: 1,
      imageUrl: 'imageUrl',
      imageUrlCropped: 'imageUrlCropped',
      imageUrlSmall: 'imageUrlSmall',
    );
    expect(
      image.toString(),
      isA<String>(),
    );
  });
}

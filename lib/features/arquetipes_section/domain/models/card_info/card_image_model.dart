// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//CardImageModel: contains the image of the card
class CardImageModel {
  final int id;
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;
  CardImageModel({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  CardImageModel copyWith({
    int? id,
    String? imageUrl,
    String? imageUrlSmall,
    String? imageUrlCropped,
  }) {
    return CardImageModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUrlSmall: imageUrlSmall ?? this.imageUrlSmall,
      imageUrlCropped: imageUrlCropped ?? this.imageUrlCropped,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': imageUrl,
      'image_url_small': imageUrlSmall,
      'image_url_cropped': imageUrlCropped,
    };
  }

  factory CardImageModel.fromMap(Map<String, dynamic> map) {
    return CardImageModel(
      id: map['id'] as int,
      imageUrl: map['image_url'] as String,
      imageUrlSmall: map['image_url_small'] as String,
      imageUrlCropped: map['image_url_cropped'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardImageModel.fromJson(String source) =>
      CardImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardImageModel(id: $id, imageUrl: $imageUrl, imageUrlSmall: $imageUrlSmall, imageUrlCropped: $imageUrlCropped)';
  }

  @override
  bool operator ==(covariant CardImageModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.imageUrlSmall == imageUrlSmall &&
        other.imageUrlCropped == imageUrlCropped;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        imageUrlSmall.hashCode ^
        imageUrlCropped.hashCode;
  }
}

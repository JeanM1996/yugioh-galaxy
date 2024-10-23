import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';

// ArquetipesListState: contains the state of the arquetipes list
class ArquetipesListState {
  ArquetipesListState({
    this.arquetipes = const [],
    this.auxArquetipes = const [],
    this.isSearching = false,
    this.isLoading = false,
  });

  factory ArquetipesListState.fromMap(Map<String, dynamic> map) {
    return ArquetipesListState(
      arquetipes: List<ArquetipeListModel>.from(
        (map['arquetipes'] as List<int>).map<ArquetipeListModel>(
          (x) => ArquetipeListModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      auxArquetipes: List<ArquetipeListModel>.from(
        (map['auxArquetipes'] as List<int>).map<ArquetipeListModel>(
          (x) => ArquetipeListModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isSearching: map['isSearching'] as bool,
      isLoading: map['isLoading'] as bool,
    );
  }

  factory ArquetipesListState.fromJson(String source) =>
      ArquetipesListState.fromMap(json.decode(source) as Map<String, dynamic>);
  final List<ArquetipeListModel> arquetipes;
  final List<ArquetipeListModel> auxArquetipes;
  final bool isSearching;
  final bool isLoading;

  ArquetipesListState copyWith({
    List<ArquetipeListModel>? arquetipes,
    List<ArquetipeListModel>? auxArquetipes,
    bool? isSearching,
    bool? isLoading,
  }) {
    return ArquetipesListState(
      arquetipes: arquetipes ?? this.arquetipes,
      auxArquetipes: auxArquetipes ?? this.auxArquetipes,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'arquetipes': arquetipes.map((x) => x.toMap()).toList(),
      'auxArquetipes': auxArquetipes.map((x) => x.toMap()).toList(),
      'isSearching': isSearching,
      'isLoading': isLoading,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AdvisorsListState(arquetipes: $arquetipes, auxArquetipes: $auxArquetipes, isSearching: $isSearching, isLoading: $isLoading)';
  }

  @override
  bool operator ==(covariant ArquetipesListState other) {
    if (identical(this, other)) return true;

    return listEquals(other.arquetipes, arquetipes) &&
        listEquals(other.auxArquetipes, auxArquetipes) &&
        other.isSearching == isSearching &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode {
    return arquetipes.hashCode ^
        auxArquetipes.hashCode ^
        isSearching.hashCode ^
        isLoading.hashCode;
  }
}

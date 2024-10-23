// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeSectionState {
  final int countNotifications;
  final int countRequests;
  HomeSectionState({
    this.countNotifications = 0,
    this.countRequests = 0,
  });

  HomeSectionState copyWith({
    int? countNotifications,
    int? countRequests,
  }) {
    return HomeSectionState(
      countNotifications: countNotifications ?? this.countNotifications,
      countRequests: countRequests ?? this.countRequests,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countNotifications': countNotifications,
      'countRequests': countRequests,
    };
  }

  factory HomeSectionState.fromMap(Map<String, dynamic> map) {
    return HomeSectionState(
      countNotifications: map['countNotifications'] as int,
      countRequests: map['countRequests'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeSectionState.fromJson(String source) =>
      HomeSectionState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HomeSectionState(countNotifications: $countNotifications, countRequests: $countRequests)';

  @override
  bool operator ==(covariant HomeSectionState other) {
    if (identical(this, other)) return true;

    return other.countNotifications == countNotifications &&
        other.countRequests == countRequests;
  }

  @override
  int get hashCode => countNotifications.hashCode ^ countRequests.hashCode;
}

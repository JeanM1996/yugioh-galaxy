import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/main/domain/select_option.dart';

void main() {
  test('SelectOption constructor ...', () {
    final selectOption = SelectOption(
      label: 'label',
      value: 'value',
      icon: 'icon',
      description: 'description',
    );

    expect(selectOption.label, 'label');
    expect(selectOption.value, 'value');
    expect(selectOption.icon, 'icon');
    expect(selectOption.description, 'description');
  });

  test('SelectOption fromJson ...', () {
    final map = {
      'label': 'label',
      'value': 'value',
      'icon': 'icon',
      'description': 'description',
    };

    final selectOption = SelectOption.fromJson(map);

    expect(selectOption.label, 'label');
    expect(selectOption.value, 'value');
    expect(selectOption.icon, 'icon');
    expect(selectOption.description, 'description');
  });

  test('SelectOption toJson ...', () {
    final selectOption = SelectOption(
      label: 'label',
      value: 'value',
      icon: 'icon',
      description: 'description',
    );

    final map = selectOption.toJson();

    expect(map['label'], 'label');
    expect(map['value'], 'value');
    expect(map['icon'], 'icon');
    expect(map['description'], 'description');
  });
}

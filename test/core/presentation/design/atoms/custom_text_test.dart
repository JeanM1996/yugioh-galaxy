import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';

void main() {
  testWidgets('Widget test ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      localizationsDelegates: [
        Lang.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es', ''),
      ],
      home: Scaffold(
          body: CustomText(
        'text',
      )),
    ));

    expect(find.byType(CustomText), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/core/presentation/design/molecules/rounded_container.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';

void main() {
  testWidgets('Widget test ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        Lang.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
      ],
      home: Scaffold(
          body: RoundedContainer(
        child: Container(),
      )),
    ));

    expect(find.byType(RoundedContainer), findsOneWidget);
  });
}

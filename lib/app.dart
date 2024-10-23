import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/theme.dart' as t;
import 'package:yugiohgalaxy/core/presentation/utils/networking/connection_status_singleton.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/theme_notifier.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  StreamSubscription? _connectionChangeStream;
  bool isOffline = false;
  @override
  void initState() {
    // The promptForPushNotificationsWithUserResponse function will
    //show the iOS or Android push notification prompt.
    //We recommend removing the following code and instead
    //using an In-App Message to prompt for notification permission

    final connectionStatus = ConnectionStatusSingleton.getInstance();

    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    super.initState();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
      if (isOffline) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Lang.of(context).idNoInternet),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        /// Listener theme
        ref.watch(themeProvider);
        return GestureDetector(
          onTap: () => {
            FocusManager.instance.primaryFocus?.unfocus(),
            SystemChannels.textInput.invokeMethod('TextInput.hide'),
          },
          child: MaterialApp.router(
            title: 'Yugioh Galaxy',
            theme: t.Theme().theme,
            routerConfig: ref.watch(goRouterProvider),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              Lang.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('es', 'ES'),
            ],
          ),
        );
      },
    );
  }
}

import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';

/// This class will be contain all the [constantsValues] used by the application

class Constants {
  //pagination elements
  final int paginationElements = 10000;

  final List<Map<String, dynamic>> userOptions = [
    {
      'name': 'Home',
      'icon': iconsPaths.iconYugiohGalaxy,
      'index': 0,
      'semanticLabel': 'opt_home',
    },
    {
      'name': 'Arquetipos',
      'icon': iconsPaths.iconCardsAvailable,
      'index': 1,
      'semanticLabel': 'opt_arquetipes',
    },
    {
      'name': 'Banlist',
      'icon': iconsPaths.iconCardsBanned,
      'index': 2,
      'semanticLabel': 'opt_banlist',
    },
  ];
}

/// Export the [constantsValues]
final Constants constants = Constants();

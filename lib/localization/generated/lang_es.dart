import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LangEs extends Lang {
  LangEs([String locale = 'es']) : super(locale);

  @override
  String get home => 'Inicio';

  @override
  String get banCard => 'Cartas bloqueadas';

  @override
  String get idNoInternet => 'Sin acceso a internet';

  @override
  String get idNoInternetMessage => 'Comprueba tus conexiones';

  @override
  String get idOk => 'Entendido';

  @override
  String get idNoFoundTitle => 'No se encontraron resultados';

  @override
  String get idNoFoundMessage => 'Intenta buscando nuevamente con otro tipo de palabras';

  @override
  String get idNoElementsTitle => 'No hay elementos';

  @override
  String get idNoElementsMessage => 'No hay elementos para mostrar';

  @override
  String get search => 'Buscar';

  @override
  String get arquetipes => 'Arquetipos';

  @override
  String get banlist => 'Lista de Cartas prohibidas';

  @override
  String get arquetipeDetail => 'Detalles del arquetipo';

  @override
  String get cardDetail => 'Detalles de la carta';
}

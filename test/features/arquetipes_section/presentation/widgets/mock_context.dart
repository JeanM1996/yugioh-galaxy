import 'package:flutter/widgets.dart';
import 'package:mockito/mockito.dart';

class MockContext extends Mock implements BuildContext {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'MockContext';
  }
}

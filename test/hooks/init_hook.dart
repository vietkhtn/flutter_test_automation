import 'dart:async';
import 'package:gherkin/gherkin.dart';

class InitHook extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before a priority of 2
  @override
  int get priority => 1;

  /// Run before any scenario in a test run have executed
  @override
  Future<void> onBeforeRun(TestConfiguration config) async {
    print(
        "================================ HOOK BEFORE RUN ================================");
  }

  /// Run after all scenarios in a test run have completed
  @override
  Future<void> onAfterRun(TestConfiguration config) async {
    print(
        "================================ HOOK AFTER RUN ================================");
  }
}

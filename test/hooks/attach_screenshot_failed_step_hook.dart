import 'dart:convert';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:meta/meta.dart';

class AttachScreenhotOnFailedStepHook extends Hook {
  @override
  Future<void> onAfterStep(
      World world, String step, StepResult stepResult) async {
    if (stepResult.result == StepExecutionResult.error ||
        stepResult.result == StepExecutionResult.fail) {
      final screenshotData = await _takeScreenshot(world);
      world.attach(screenshotData, 'image/png', step);
    }
  }

  @protected
  Future<String> _takeScreenshot(World world) async {
    final bytes = await (world as FlutterWorld).driver?.screenshot();
    return base64Encode(bytes ?? []);
  }
}

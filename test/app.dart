import 'package:flutter_test_automation/main.dart' as flutter_test_automation;
import 'package:flutter_driver/driver_extension.dart';
import 'dart:developer';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  flutter_test_automation.main();

  test('Test - Main function return Normally', () {
    expect(() => flutter_test_automation.main(), returnsNormally);
  });
}

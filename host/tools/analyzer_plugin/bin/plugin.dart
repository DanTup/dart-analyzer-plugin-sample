import 'dart:isolate';

import '../lib/src/lint_analyzer_plugin_start.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}

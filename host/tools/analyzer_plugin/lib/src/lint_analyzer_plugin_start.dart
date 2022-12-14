import 'dart:isolate';

import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/starter.dart';
import 'lint_analyzer_plugin.dart';

void start(List<String> args, SendPort sendPort) {
  ServerPluginStarter(
    LintAnalyzerPlugin(resourceProvider: PhysicalResourceProvider.INSTANCE),
  ).start(sendPort);
}

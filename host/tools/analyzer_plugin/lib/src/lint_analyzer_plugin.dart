import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';

class LintAnalyzerPlugin extends ServerPlugin {
  LintAnalyzerPlugin({required super.resourceProvider});

  @override
  Future<void> analyzeFile(
      {required AnalysisContext analysisContext, required String path}) async {
    channel.sendNotification(
      AnalysisErrorsParams(path, [
        AnalysisError(
          AnalysisErrorSeverity.INFO,
          AnalysisErrorType.LINT,
          Location(path, 0, 10, 1, 1, endLine: 1, endColumn: 11),
          'This is the description of our lint',
          'my_lint_code',
          correction: 'A correction message',
          hasFix: false,
        ),
      ]).toNotification(),
    );
  }

  @override
  List<String> get fileGlobsToAnalyze => ['*.dart'];

  @override
  String get name => "Danny's plugin";

  @override
  String get version => '1.0.0';
}

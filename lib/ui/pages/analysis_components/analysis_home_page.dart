import 'package:flutter/material.dart';
import 'package:reglfit/ui/pages/analysis_components/analysis_page.dart';

class AnalysisHomePage extends StatefulWidget {
  const AnalysisHomePage({super.key});

  @override
  State<AnalysisHomePage> createState() => _AnalysisHomePageState();
}

class _AnalysisHomePageState extends State<AnalysisHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnalysisPage(),
    );
  }
}

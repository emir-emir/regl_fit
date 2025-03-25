import 'package:flutter/material.dart';
import 'package:reglfit/ui/pages/login_components/slider.dart';

import 'content_container.dart';

class ContentHomePage extends StatefulWidget {
  const ContentHomePage({super.key});

  @override
  State<ContentHomePage> createState() => _ContentHomePageState();
}

class _ContentHomePageState extends State<ContentHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContentContainerPage(),
    );
  }
}

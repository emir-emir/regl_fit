import 'package:flutter/material.dart';

import 'lekelenmeler.dart';

class FollowHomePage extends StatefulWidget {
  const FollowHomePage({super.key});

  @override
  State<FollowHomePage> createState() => _FollowHomePageState();
}

class _FollowHomePageState extends State<FollowHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lekelenmeler(),
    );
  }
}

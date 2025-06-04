import 'package:flutter/material.dart';

import '../widgets/choose_theme_body.dart' show ChooseThemeBody;

class ChooseThemePage extends StatelessWidget {
  const ChooseThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseThemeBody(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/config/assets/app_images.dart';
import 'choose_theme_column.dart';

class ChooseThemeBody extends StatelessWidget {
  const ChooseThemeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.chooseTheme),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const ChooseThemeColumn(),
      ],
    );
  }
}

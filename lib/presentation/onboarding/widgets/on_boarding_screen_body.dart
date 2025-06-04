import 'package:e_commerce/core/config/assets/app_images.dart';
import 'package:e_commerce/presentation/onboarding/widgets/on_boarding_column.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.onBoarding),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(color: Colors.black.withOpacity(0.12)),
        const OnBoardingColumn(),
      ],
    );
  }
}

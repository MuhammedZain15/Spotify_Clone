import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/common/widgets/app_bar/basic_app_bar.dart';
import 'package:e_commerce/core/config/assets/app_vectors.dart';
import 'package:e_commerce/presentation/choose_theme/bloc/theme_cubit.dart';
import 'package:e_commerce/presentation/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        actions: [
          IconButton(
            onPressed: () {
              final currentTheme = context.read<ThemeCubit>().state;
              context.read<ThemeCubit>().toggleTheme(
                currentTheme == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
            icon: Icon(context.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
        title: SvgPicture.asset(
          AppVectors.appLogo,
          width: 100.0.w,
          height: 38.0.h,
        ),
      ),
      body: const HomePageBody(),
    );
  }
}

import 'package:e_commerce/core/config/theme/app_theme.dart';
import 'package:e_commerce/presentation/auth/pages/signup_or_signin_page.dart';
import 'package:e_commerce/presentation/choose_theme/bloc/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'common/helper/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  final supbaseUrl = dotenv.env['SUPABASE_URL'];

  final supbaseKey = dotenv.env['SUPABASE_KEY'];
  await Supabase.initialize(url: supbaseUrl ?? "", anonKey: supbaseKey ?? "");
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 849),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ThemeCubit())],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, mode) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode,
              home: const SignupOrSigninPage(),
            );
          },
        ),
      ),
    );
  }
}

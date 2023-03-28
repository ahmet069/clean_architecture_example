import 'package:clean_architecture_example/src/config/router/app_router.dart';
import 'package:clean_architecture_example/src/presentation/bloc/bloc/user_bloc.dart';
import 'package:clean_architecture_example/src/presentation/bloc/post/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

final router = AppRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.injector<UserBloc>()),
        BlocProvider(create: (_) => di.injector<PostBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Edita',
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

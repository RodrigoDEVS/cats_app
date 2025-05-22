import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatos_app/presentation/screens/bloc/home_page_bloc.dart';
import 'package:gatos_app/presentation/theme/app_theme.dart';
import 'package:gatos_app/presentation/widgets/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomePageBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme().getTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

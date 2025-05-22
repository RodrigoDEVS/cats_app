import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatos_app/presentation/screens/bloc/home_page_bloc.dart';
import 'package:gatos_app/presentation/screens/home_page.dart';
import 'package:gatos_app/presentation/theme/app_theme.dart';
import 'package:gatos_app/presentation/widgets/splash_screen.dart';

import 'data/datasources/cats_api_source.dart';
import 'data/repositories/cats_repository_impl.dart';
import 'domain/usecases/get_breeds.dart';

void main() {
  // Inyección de dependencias
  final catsApiSource = CatsApiSource();
  final catsRepository = CatsRepositoryImpl(catsApiSource);
  final getBreedsUseCase = GetBreeds(catsRepository);
  runApp(MyApp(getBreedsUseCase: getBreedsUseCase));
}

class MyApp extends StatelessWidget {
  final GetBreeds getBreedsUseCase;
  const MyApp({super.key, required this.getBreedsUseCase});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageBloc(getBreedsUseCase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme().getTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

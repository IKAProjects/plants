import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants/src/data/plant_repository.dart';
import 'package:provider/provider.dart';
import '../di.dart';
import 'src/ui/blocs/plant_bloc/plant_bloc.dart';
import 'src/ui/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlantRepository>(
          create: (_) => getIt<PlantRepository>(),
        ),
        BlocProvider<PlantBloc>(
          create: (context) => PlantBloc(context.read<PlantRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plants',
        theme: ThemeData(
          fontFamily: 'Sf Pro',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        home: const Splash(),
      ),
    );
  }
}
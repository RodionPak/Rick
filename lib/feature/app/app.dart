import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ricki/feature/app/routing/routing.dart';

import '../../Core/Internal/si.dart';
import '../detail_screen_character/ui/bloc/detail_character_bloc.dart';
import '../home_page/ui/state/home_page_bloc.dart' show HomePageBloc;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = RoutesInit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:buildListProviders(locator: getIt),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: _router.router,
      ),
    );
  }
}

List<BlocProvider> buildListProviders({required GetIt locator}) {
  return <BlocProvider>[
    BlocProvider<HomePageBloc>(
      create: (context) => locator<HomePageBloc>(),
    ),
    BlocProvider<DetailCharacterBloc>(
      create: (context) => locator<DetailCharacterBloc>(),
    ),
  ];
}

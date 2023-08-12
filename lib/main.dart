import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(RickAndMortyApp(appRouter: AppRouter(),));
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}


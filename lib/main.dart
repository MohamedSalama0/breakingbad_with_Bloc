import 'package:breakingbad_with_bloc/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBadApp(appRouter:AppRouter(),));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}


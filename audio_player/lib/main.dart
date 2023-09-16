import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/audio_controller.dart';

import 'controller/routes/routes.dart';
import 'controller/routes/routes_name.dart';
import 'util/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: ThemeData(
          primarySwatch: AppColors.firstColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppColors.secondWhiteColor,
                displayColor: AppColors.secondWhiteColor,
              ),
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RoutesName.homeScreen,
      ),
    );
  }
}

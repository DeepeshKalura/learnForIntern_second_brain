import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/audio_controller.dart';
import 'controller/notification_controller.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initial();
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
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RoutesName.homeScreen,
      ),
    );
  }
}

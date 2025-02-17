import 'package:flexicharge/app/app.locator.dart';
import 'package:flexicharge/app/setup_dialog_ui.dart';
import 'package:flexicharge/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';

/// `main()` is the entry point of the app. It is the first function that
/// is called when the app is launched
main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  setupBottomSheetUi();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
                // White text
                color: FlexiChargeTheme.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Lato",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
            bodyText2: TextStyle(
                // Black text
                color: FlexiChargeTheme.black,
                fontWeight: FontWeight.w700,
                fontFamily: "ITCAvantGardeStd",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
          )),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

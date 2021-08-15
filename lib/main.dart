import 'package:asthma_management/core/providers/providers.dart';
import 'package:asthma_management/core/routes/route_generator.dart';
import 'package:asthma_management/core/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (BuildContext context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AmProviders.providers,
      child: GetMaterialApp(
        // locale: DevicePreview.of(context).locale,
        // builder: DevicePreview.appBuilder,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // locale: Locale('en', 'US'),
        supportedLocales: [
          const Locale('en', 'US'), // English
          // Thai
        ],
        debugShowCheckedModeBanner: false,
        title: 'Asthma Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
         routes: RouteNames.routes,
         initialRoute: RouteNames.splashScreen
      ),
    );
  }
}

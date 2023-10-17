import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fresh_and_local/features/language_selection/view_model/language_selection_view_model.dart';
import 'package:fresh_and_local/localization/generated/l10n.dart';
import 'package:fresh_and_local/utils/routes/routes.dart';
import 'package:fresh_and_local/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LanguageSelectionViewModel languageSelectionViewModel = LanguageSelectionViewModel();
  await languageSelectionViewModel.fetchLocale();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    languageSelectionViewModel: languageSelectionViewModel,
  ));
}

class MyApp extends StatelessWidget {
  final LanguageSelectionViewModel languageSelectionViewModel;
  const MyApp({Key? key, required this.languageSelectionViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => languageSelectionViewModel),
      ],
      child: ChangeNotifierProvider<LanguageSelectionViewModel>(
        create: (BuildContext context) => languageSelectionViewModel,
        child: Consumer<LanguageSelectionViewModel>(
            builder: (context, language, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "fresh and local",
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              disabledColor: Colors.grey,
            ),
            locale: language.locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            initialRoute: RoutesName.languageSelection,
            onGenerateRoute: Routes.generateRoute,
          );
        }),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    // TODO: implement createHttpClient
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

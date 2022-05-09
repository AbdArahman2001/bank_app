import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/providers/cards_provider.dart';
import 'package:bank_app_flutter/providers/home_provider.dart';
import 'package:bank_app_flutter/route_helper/route_helper.dart';
import 'package:bank_app_flutter/screens/cards/cards_screen.dart';
import 'package:bank_app_flutter/screens/custom_screen/name_expenses_custom_screen.dart';
import 'package:bank_app_flutter/screens/salary/following_the_rules_screen.dart';
import 'package:bank_app_flutter/screens/home_screen.dart';
import 'package:bank_app_flutter/screens/launch_screen.dart';
import 'package:bank_app_flutter/screens/cards/monthly_income_screen.dart';
import 'package:bank_app_flutter/screens/salary/table_of_salary.dart';
import 'package:bank_app_flutter/screens/video.dart';
import 'package:bank_app_flutter/storage/db_provider.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await EasyLocalization.ensureInitialized();
  UserPreferences.instance;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<CardsProvider>(
          create: (context) => CardsProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        startLocale: Locale('ar'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.MAIN_COLOR,
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.MAIN_COLOR,
              fontFamily: "Segoe UI"),
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: RouteHelper.routeHelper.navKey,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 400,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      routes: {
        LaunchScreen.routeName: (context) => LaunchScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        TableOfSaralyScreen.routeName: (context) => TableOfSaralyScreen(),
        FollowingTheRulesScreen.routeName: (context) =>
            FollowingTheRulesScreen(),
        MonthlyIncomeScreen.routeName: (context) => MonthlyIncomeScreen(),
        CardsScreen.routeName: (context) => CardsScreen(),
        NameExpensesCustomScreen.routeName: (context) => NameExpensesCustomScreen(),
        VideoScreen.routeName: (context) => VideoScreen(),
      },
      home: LaunchScreen(),
    );
  }
}

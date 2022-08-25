import 'package:bank/screens/salary/test_subscription_screen.dart';

import '../screens/purchase_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'screens/subscription_success.dart';
import 'screens/account_info.dart';
import '../../../prefs/UserPreferences.dart';
import '../../../providers/cards_provider.dart';
import '../../../providers/home_provider.dart';
import '../../../route_helper/route_helper.dart';
import '../../../screens/cards/cards_screen.dart';
import '../../../screens/custom_screen/name_expenses_custom_screen.dart';
import '../../../screens/custom_screen/video_story.dart';
import '../../../screens/signin.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/subscription_screen.dart';
import '../../../screens/salary/following_the_rules_screen.dart';
import '../../../screens/launch_screen.dart';
import '../../../screens/cards/monthly_income_screen.dart';
import '../../../screens/salary/table_of_salary.dart';
import '../../../screens/video.dart';
import '../../../storage/db_provider.dart';
import '../../../utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        TestSubscriptionScreen.routeName :(context)=>TestSubscriptionScreen(),
        PurchaseScreen.routeName : (context)=>PurchaseScreen(),
        SubscriptionSuccess.routeName: (context) => SubscriptionSuccess(),
        AccountInfo.routeName: (context) => AccountInfo(),
        SignIn.routeName: (context) => SignIn(),
        SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
        LaunchScreen.routeName: (context) => LaunchScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        TableOfSaralyScreen.routeName: (context) => TableOfSaralyScreen(),
        FollowingTheRulesScreen.routeName: (context) =>
            FollowingTheRulesScreen(),
        MonthlyIncomeScreen.routeName: (context) => MonthlyIncomeScreen(),
        CardsScreen.routeName: (context) => CardsScreen(),
        NameExpensesCustomScreen.routeName: (context) =>
            NameExpensesCustomScreen(),
        //VideoScreen.routeName: (context) => VideoScreen(),
        VideoStoryScreen.routeName: (context) => VideoStoryScreen('main'.tr()),
      },
      home: LaunchScreen(),
    );
  }
}



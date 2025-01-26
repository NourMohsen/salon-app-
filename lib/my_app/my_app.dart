import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/responsive/responsive.dart';
import '../../my_app/deep_link.dart';
import '../config/cubit/global_cubit/global_cubit.dart';
import '../config/cubit/global_cubit/global_states.dart';
import '../config/resources/app_themes.dart';
import '../config/routes/routes_generator.dart';
import '../config/routes/routes_names.dart';
import '../core/services/injector_service.dart';
import 'app_reference.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    DeepLinkManager.instance.initDeepLink();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    ResponsiveManager.init(context);
    AppReference.getDeviceInfo(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => GlobalCubit(),
        child:  BlocBuilder<GlobalCubit,GlobalState>(
              buildWhen: (previous, current) => current is ToggleThemeData,
              builder: (context, state){
                var cubit = BlocProvider.of<GlobalCubit>(context);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Salon App',
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  darkTheme: AppThemes.darkTheme,
                  themeMode: cubit.isDarkTheme() ? ThemeMode.dark : ThemeMode.light,
                  theme: AppThemes.lightTheme,
                  onGenerateRoute:AppRouteGenerator.onGenerateRoute,
                  initialRoute: prefsService.loadUserData() != null ? AppRoutesNames.rHomeScreen : AppRoutesNames.rLoginScreen,
                  navigatorKey: navigatorKey,
                );
              }

          ),
        );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();






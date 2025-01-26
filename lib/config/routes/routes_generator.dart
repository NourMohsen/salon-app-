import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/injector_service.dart';
import '../../features/auth/auth.dart';
import '../../features/salon/salon.dart';
import 'routes_names.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutesNames.rLoginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(authRepository),
            child: const LoginScreen(),
          ),
        );

        case AppRoutesNames.rVerificationScreen:
        return MaterialPageRoute(
          builder: (_) {
            String phoneNumber =  settings.arguments as String;
            return BlocProvider(
    create: (context) => AuthCubit(authRepository),
    child: VerificationScreen(
    phoneNumber: phoneNumber,
    ),
    );}
    );

        case AppRoutesNames.rRegisterScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
    create: (context) => AuthCubit(authRepository),
    child: const CompleteRegisterScreen(),
    );}
    );
              case AppRoutesNames.rHomeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
    create: (context) => SalonCubit(homeRepository),
    child: const HomeScreen(),
    );}
    );

        case AppRoutesNames.rSalonDetailsScreen:
        return MaterialPageRoute(
          builder: (_) {
            int salonId = settings.arguments as int;
            return BlocProvider(
              create: (context) => SalonCubit(homeRepository)..getSalonDetails(salonId)..getServices(),
              child:  const SalonDetailsScreen(),
            );
          });
      default:
        return unDefinedRoute();
    }
  }
}

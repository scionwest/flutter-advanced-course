import 'package:flutter/material.dart';
import 'package:myapp/presentation/forgot_password/forgot_password.dart';
import 'package:myapp/presentation/login/login.dart';
import 'package:myapp/presentation/main/main.dart';
import 'package:myapp/presentation/onboarding/onboarding.dart';
import 'package:myapp/presentation/register/register.dart';
import 'package:myapp/presentation/resources/strings_manager.dart';
import 'package:myapp/presentation/splash/splash.dart';
import 'package:myapp/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboard';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot-password';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/store-details';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:loginn/demointro.dart' as _i1;
import 'package:loginn/Screens/FirstPage.dart' as _i5;
import 'package:loginn/Screens/HomePage.dart' as _i4;
import 'package:loginn/Screens/SignIn.dart' as _i2;
import 'package:loginn/Screens/SignUp.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Demointro.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Demointro(),
      );
    },
    SignIn.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignIn(),
      );
    },
    SignUp.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    FirstRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.FirstPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          Demointro.name,
          path: '/',
        ),
        _i6.RouteConfig(
          SignIn.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          SignUp.name,
          path: '/register',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i6.RouteConfig(
          FirstRoute.name,
          path: '/First',
        ),
      ];
}

/// generated route for
/// [_i1.Demointro]
class Demointro extends _i6.PageRouteInfo<void> {
  const Demointro()
      : super(
          Demointro.name,
          path: '/',
        );

  static const String name = 'Demointro';
}

/// generated route for
/// [_i2.SignIn]
class SignIn extends _i6.PageRouteInfo<void> {
  const SignIn()
      : super(
          SignIn.name,
          path: '/login',
        );

  static const String name = 'SignIn';
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i6.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/register',
        );

  static const String name = 'SignUp';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.FirstPage]
class FirstRoute extends _i6.PageRouteInfo<void> {
  const FirstRoute()
      : super(
          FirstRoute.name,
          path: '/First',
        );

  static const String name = 'FirstRoute';
}

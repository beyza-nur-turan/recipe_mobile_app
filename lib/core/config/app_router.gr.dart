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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:loginn/demointro.dart' as _i1;
import 'package:loginn/Screens/SignIn.dart' as _i2;
import 'package:loginn/Screens/SignUp.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Demointro.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Demointro(),
      );
    },
    SignIn.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignIn(),
      );
    },
    SignUp.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          Demointro.name,
          path: '/',
        ),
        _i4.RouteConfig(
          SignIn.name,
          path: '/login',
        ),
        _i4.RouteConfig(
          SignUp.name,
          path: '/register',
        ),
      ];
}

/// generated route for
/// [_i1.Demointro]
class Demointro extends _i4.PageRouteInfo<void> {
  const Demointro()
      : super(
          Demointro.name,
          path: '/',
        );

  static const String name = 'Demointro';
}

/// generated route for
/// [_i2.SignIn]
class SignIn extends _i4.PageRouteInfo<void> {
  const SignIn()
      : super(
          SignIn.name,
          path: '/login',
        );

  static const String name = 'SignIn';
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i4.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/register',
        );

  static const String name = 'SignUp';
}

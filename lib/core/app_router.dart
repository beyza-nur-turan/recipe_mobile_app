//import 'package:auto_route_generator/builder.dart';
//import 'package:auto_route_generator/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:loginn/Screens/FirstPage.dart';
import 'package:loginn/Screens/HomePage.dart';
import 'package:loginn/Screens/SignIn.dart';
import 'package:loginn/Screens/SignUp.dart';
import '../demointro.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')      
class AppRouter extends $AppRouter { 
   
   
 @override      
 List<AutoRoute> get routes => [      
  AutoRoute(page: Demointro,path: "/",initial: true ),              
    AutoRoute(page: SignIn,path: "/login"),   
    AutoRoute(page: SignUp,path: "/register")  , 
    AutoRoute(page: HomePage,path: "/Home")   ,
    AutoRoute(page: FirstPage,path: "/First",)     
  ];    
  
}
class $AppRouter {}
   




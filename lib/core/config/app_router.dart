import 'package:auto_route/auto_route.dart';
import 'package:loginn/Screens/FirstPage.dart';
import 'package:loginn/Screens/HomePage.dart';
import 'package:loginn/Screens/SignIn.dart';
import 'package:loginn/Screens/SignUp.dart';
import '../../demointro.dart';
// @CupertinoAutoRouter              
// @AdaptiveAutoRouter              
// @CustomAutoRouter              
@AdaptiveAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: Demointro,path: "/",initial: true ),              
    AutoRoute(page: SignIn,path: "/login"),   
    AutoRoute(page: SignUp,path: "/register")  , 
    AutoRoute(page: HomePage,path: "/Home")   ,
    AutoRoute(page: FirstPage,path: "/First",)   

  ],              
)              
class $AppRouter {}


import 'package:podcast_app/presentation/pages/home/home_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:podcast_app/presentation/pages/home/home_page.dart';
@MaterialAutoRouter(  
  replaceInRouteName: 'Page,Route',  
  routes: <AutoRoute>[  
    AutoRoute(page: MyHomePage, path:'/', initial: true),  
    ],  
)  
class $RootRouter {
}
import 'package:todo_app/app/modules/details/details_page.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/details/:listName', child: (_, args) => DetailsPage(listName: args.params['listName'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

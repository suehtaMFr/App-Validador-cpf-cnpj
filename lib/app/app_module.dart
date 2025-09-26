import 'package:flutter_modular/flutter_modular.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  // @override
  // Future<void> binds(Injector i) async {
  //   // TODO: implement binds
  //   super.binds(i);
  // }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module("/", module: HomeModule());
  }
}

import 'package:app_verificador/modules/cpf/cpf_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../modules/home/home_module.dart';
import 'package:app_verificador/modules/cpf/cpf_service.dart';

class AppModule extends Module {

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module("/", module: HomeModule());
    r.module("/cpf", module: CpfModule());
  }
}

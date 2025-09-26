import 'package:flutter_modular/flutter_modular.dart';
import 'cnpj_page.dart';

class CNPJModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => CnpjPage());
  }
}
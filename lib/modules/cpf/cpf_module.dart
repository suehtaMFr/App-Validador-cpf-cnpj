import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cpf_page.dart';

class CpfModule extends Module{
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => CpfPage());
  }
}
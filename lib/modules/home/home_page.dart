import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""
            "Verificador",
            style: TextStyle(color: Colors.white, fontSize: 30)
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(120, 60),
            ),
            onPressed: () {
              //Modular.to.pushNamed("/CPF/");
            },
            child: Text(
              "CPF",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
              ),
            )
          ),
          const SizedBox(width: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(120, 60),
              ),
              onPressed: () {
                //Modular.to.pushNamed("/CNPJ/");
              },
              child: Text(
                "CNPJ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              )
          ),
        ],),
      ),
    );
  }
}

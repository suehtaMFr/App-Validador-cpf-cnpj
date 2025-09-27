import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cpf_service.dart';
import 'package:brasil_fields/brasil_fields.dart';

List<String> atualizacao(String cpf_digitado){
  List<String> out; // vou montar a minha lines
  out = List.generate(22, (_) => "");
  int tamanho_do_cpf = cpf_digitado.length;
  String parte_do_cpf = cpf_digitado, texto_montado, copia_cpf = cpf_digitado;
  int soma_cpf = 0;
  for(int i=0, multiplicador = 1, posicao_lines =0;i<tamanho_do_cpf-3;i++) {
    if(cpf_digitado[i]=='.') {
      parte_do_cpf = parte_do_cpf.substring(1);
      continue;
    }
    texto_montado = '$parte_do_cpf\n';
    int digito = int.parse(cpf_digitado[i]);
    int vezes = digito*multiplicador;
    soma_cpf+=vezes;
    texto_montado += '$digito * $multiplicador = $vezes soma = $soma_cpf';
    out[posicao_lines] = texto_montado;
    posicao_lines++; multiplicador++;
    parte_do_cpf = parte_do_cpf.substring(1);
  }
  int digito_verificador1 = soma_cpf%11;
  if(digito_verificador1==10) digito_verificador1 = 0;
  texto_montado = '1º digito verificador = soma % 11\n';
  texto_montado+= '1º digito verificador = $soma_cpf % 11\n';
  texto_montado+= '1º digito verificador = $digito_verificador1\n';
  out[9] = texto_montado;
  soma_cpf = 0;
  parte_do_cpf = cpf_digitado;
  copia_cpf = parte_do_cpf;

  for(int i=0, multiplicador = 0,posicao_lines = 10;i<tamanho_do_cpf-1;i++) {
    if(cpf_digitado[i]=='.' || cpf_digitado[i]=='-') {
      parte_do_cpf = parte_do_cpf.substring(1);
      continue;
    }
    texto_montado = '$parte_do_cpf\n';
    int digito = int.parse(cpf_digitado[i]);
    int vezes = digito*multiplicador;
    soma_cpf+=vezes;
    texto_montado += '$digito * $multiplicador = $vezes soma = $soma_cpf';
    out[posicao_lines] = texto_montado;
    posicao_lines++; multiplicador++;
    parte_do_cpf = parte_do_cpf.substring(1);
  }
  int digito_verificador2 = soma_cpf%11;
  if(digito_verificador2==10) digito_verificador2 = 0;

  texto_montado = '2º digito verificador = soma % 11\n';
  texto_montado+= '2º digito verificador = $soma_cpf % 11\n';
  texto_montado+= '2º digito verificador = $digito_verificador2\n';
  out[20] = texto_montado;
  if(digito_verificador1==int.parse(cpf_digitado[12]) && digito_verificador2==int.parse(cpf_digitado[13])){
    texto_montado = "CPF Valido = $copia_cpf\n";
  }
  else{
    texto_montado = "CPF Invalido\n";
  }
  out[21] = texto_montado;
  return out;
}


class CpfPage extends StatefulWidget {
  List<String> lines = [];
  CpfPage({super.key}) {
    lines = List.generate(22, (_) => "");
  }

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final newTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "CPF",
            style: TextStyle(color: Colors.black, fontSize: 30)
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                controller: newTextCtrl,
                keyboardType: TextInputType.phone,
                maxLength: 14,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o CPF',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(80, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.lines = atualizacao(newTextCtrl.text);
                    });
                  },
                  child: Text(
                    "Verificar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  )
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView(
              children: [
              for (int i = 0; i < 9; i++) ...[
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.lines[i],
                      //"1234",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
              Container(//-------------------------------------explicação 1
                height: 100,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.lines[10],
                    // "123",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),

              for (int i = 10; i < 20; i++) ...[
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.lines[i],
                      // "123",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
              Container(//-------------------------------------explicação 2
                height: 100,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.lines[20],
                    // "123",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.lines[21],
                    // "123",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]
            ),
            ),
          ],
        ),
      ],
      ),
    );
  }
}



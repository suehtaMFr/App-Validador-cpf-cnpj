import 'package:flutter/foundation.dart';

class CpfService extends ChangeNotifier{
  List<String> lines = [" "];

  void atualizar(String cpf_digitado){
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
    parte_do_cpf = cpf_digitado + '-$digito_verificador1';
    copia_cpf = parte_do_cpf;

    for(int i=0, multiplicador = 0,posicao_lines = 10;i<tamanho_do_cpf-3;i++) {
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
    int digito_verificador2 = soma_cpf%11;
    if(digito_verificador2==10) digito_verificador2 = 0;

    texto_montado = '2º digito verificador = soma % 11\n';
    texto_montado+= '2º digito verificador = $soma_cpf % 11\n';
    texto_montado+= '2º digito verificador = $digito_verificador2\n';

    if(digito_verificador1==int.parse(cpf_digitado[12]) && digito_verificador2==int.parse(cpf_digitado[13])){
      texto_montado += "CPF Valido = $copia_cpf\n";
    }
    else{
      texto_montado += "CPF Invalido\n";
    }
    out[21] = texto_montado;
    lines = out;
    notifyListeners();
  }
}

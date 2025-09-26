import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CnpjPage extends StatefulWidget {

  List <String> cnpj = [];

   CnpjPage({super.key}){
    cnpj = List.generate(28, (_) => "");
  }

  @override
  State<CnpjPage> createState() => _CnpjPageState();
}

final cnpjController  = TextEditingController();

class _CnpjPageState extends State<CnpjPage> {
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""
            "CNPJ",
            style: TextStyle(color: Colors.white, fontSize: 30)
        ),
        backgroundColor: Colors.black,

      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [ Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
        
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter(),
                ],
                maxLength: 18,
                controller: cnpjController ,
                decoration: InputDecoration(
                  labelText: 'Digite o CNPJ',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                ),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                TextButton(
                  onPressed: (){setState(() {
        
                    String controler = cnpjController.text;
        
                    int soma = 0;
        
                    int multiplicacao = int.parse(controler[0])*5;
        
                    String text = "${controler[0]} * 5 = $multiplicacao";
                    widget.cnpj[0] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[1])*4;
                    text = "${controler[1]} * 4 = $multiplicacao";
                    widget.cnpj[1] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[3])*3;
                    text = "${controler[3]} * 3 = $multiplicacao";
                    widget.cnpj[2] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[4])*2;
                    text = "${controler[4]} * 2 = $multiplicacao";
                    widget.cnpj[3] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[5])*9;
                    text = "${controler[5]} * 9 = $multiplicacao";
                    widget.cnpj[4] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[7])*8;
                    text = "${controler[7]} * 8 = $multiplicacao";
                    widget.cnpj[5] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[8])*7;
                    text = "${controler[8]} * 7 = $multiplicacao";
                    widget.cnpj[6] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[9])*6;
                    text = "${controler[9]} * 6 = $multiplicacao";
                    widget.cnpj[7] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[11])*5;
                    text = "${controler[11]} * 5 = $multiplicacao";
                    widget.cnpj[8] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[12])*4;
                    text = "${controler[12]} * 4 = $multiplicacao";
                    widget.cnpj[9] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[13])*3;
                    text = "${controler[13]} * 3 = $multiplicacao";
                    widget.cnpj[10] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[14])*2;
                    text = "${controler[14]} * 2 = $multiplicacao";
                    widget.cnpj[11] = text;
                    soma+= multiplicacao;
        
        
                    int resto = soma % 11;
                    if(resto == 0 || resto == 1){
                      resto = 0;
                    }
                    else {
                      resto = 11 - resto ;
                    }


                    controler+= "-$resto";
                    text = "A soma é igual á $soma\n o 1º digito verificador é  $soma % 11 = $resto";
                    widget.cnpj[12] = text;
        
        
                    soma = 0;

                    multiplicacao = int.parse(controler[0])*6;
                    text = "${controler[0]} * 6 = $multiplicacao";
                    widget.cnpj[13] = text;
                    soma+= multiplicacao;// primeiro

                    multiplicacao = int.parse(controler[1])*5;
                    text = "${controler[1]} * 5 = $multiplicacao";
                    widget.cnpj[14] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[3])*4;
                    text = "${controler[3]} * 4 = $multiplicacao";
                    widget.cnpj[15] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[4])*3;
                    text = "${controler[4]} * 3 = $multiplicacao";
                    widget.cnpj[16] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[5])*2;
                    text = "${controler[5]} * 2 = $multiplicacao";
                    widget.cnpj[17] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[7])*9;
                    text = "${controler[7]} * 9 = $multiplicacao";
                    widget.cnpj[18] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[8])*8;
                    text = "${controler[8]} * 8 = $multiplicacao";
                    widget.cnpj[19] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[9])*7;
                    text = "${controler[9]} * 7 = $multiplicacao";
                    widget.cnpj[20] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[11])*6;
                    text = "${controler[11]} * 6 = $multiplicacao";
                    widget.cnpj[21] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[12])*5;
                    text = "${controler[12]} * 5 = $multiplicacao";
                    widget.cnpj[22] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[13])*4;
                    text = "${controler[13]} * 4 = $multiplicacao";
                    widget.cnpj[23] = text;
                    soma+= multiplicacao;

                    multiplicacao = int.parse(controler[14])*3;
                    text = "${controler[14]} * 3 = $multiplicacao";
                    widget.cnpj[24] = text;
                    soma+= multiplicacao;
        
                    multiplicacao = int.parse(controler[16])*2;
                    text = "${controler[16]} * 2 = $multiplicacao";
                    widget.cnpj[25] = text;
                    soma+= multiplicacao;
        
                    int resto2 = soma % 11;
        
                    if(resto2 == 0 || resto2 == 1){
                      resto2 = 0;
                    }
                    else {
                      resto2 = 11 - resto2 ;
                    }

                    text = "A soma é igual á $soma\n o 2º digito verificador é  $soma % 11 = $resto";
                    widget.cnpj[26] = text;

                    controler+= "$resto";
                    if(resto == int.parse(controler[16]) && resto2 == int.parse(controler[17])){
                      text = "Cnpj Valido";
                    }
                    else {
                      text = "Cnpj Invalido";
                    }
                    widget.cnpj[27] = text;


                    }
                   );
                  },
        
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white ,
                    minimumSize: const Size(120, 60),
                  ),
        
                  child: Text('Calcular', style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 15,
        
        
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 20),
        
            SizedBox(
              height: 500,
              child: ListView(
                children: [
        
                  for(int count = 0;count < 12; count++ )...[
        
                    Container(
                      color: Colors.white,
                      height: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.cnpj[count],
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
        
                  Container(
                    color: Colors.blueAccent,
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.cnpj[12],
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
        
                  for(int count = 13;count < 26; count++ )...[
        
                    Container(
                      color: Colors.white,
                      height: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.cnpj[count],
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
        
                  Container(
                    color: Colors.blueAccent,
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.cnpj[26],
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
        
                  Container(
                    color: Colors.blueAccent,
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.cnpj[27],
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
       ]
      ),
    );
  }
}

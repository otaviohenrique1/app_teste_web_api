import 'package:app_teste_web_api/components/botao.dart';
import 'package:app_teste_web_api/components/campo_texto.dart';
import 'package:app_teste_web_api/models/cep_model.dart';
import 'package:app_teste_web_api/services/busca_cep_service.dart';
import 'package:app_teste_web_api/utils/validator.dart';
import 'package:flutter/material.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _campoCepController = TextEditingController();
  String cep = "";

  @override
  void dispose() {
    _campoCepController.dispose();
    super.dispose();
  }

  void onSubmitForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        cep = _campoCepController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String cepTeste = "12630001";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta CEP"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CampoTexto(
                          hintText: "Valor de A",
                          controller: _campoCepController,
                          keyboardType: TextInputType.number,
                          validator: validaCampoVazio,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Botao(
                    onPressed: onSubmitForm,
                    label: "Buscar",
                  ),
                ),
                StreamBuilder<CepModel>(
                  stream: Stream.fromFuture(buscaCep(cep)),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var dados = snapshot.data!;
                      if (dados.cep == "") {
                        return Column(
                          children: [
                            Text("cep: $cepTeste"),
                            const Text("Cep nao existe"),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Text("cep: ${dados.cep}"),
                          Text("logradouro: ${dados.logradouro}"),
                          Text("complemento: ${dados.complemento}"),
                          Text("bairro: ${dados.bairro}"),
                          Text("localidade: ${dados.localidade}"),
                          Text("uf: ${dados.uf}"),
                          Text("ibge: ${dados.ibge}"),
                          Text("gia: ${dados.gia}"),
                          Text("ddd: ${dados.ddd}"),
                          Text("siafi: ${dados.siafi}"),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

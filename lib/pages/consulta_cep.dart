import 'package:app_teste_web_api/models/cep_model.dart';
import 'package:app_teste_web_api/services/busca_cep_service.dart';
import 'package:flutter/material.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  @override
  Widget build(BuildContext context) {
    String cep = "12630001";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta CEP"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              StreamBuilder<CepModel>(
                stream: Stream.fromFuture(buscaCep(cep)),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var dados = snapshot.data!;
                    if (dados.cep == "") {
                      return Column(
                        children: [
                          Text("cep: $cep"),
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
    );
  }
}

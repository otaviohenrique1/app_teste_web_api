import 'dart:convert';
import 'package:app_teste_web_api/models/cep_model.dart';
import 'package:http/http.dart' as http;

Future<CepModel> buscaCep(String cep) async {
  final response =
      await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
  if (response.statusCode == 200) {
    return CepModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Erro');
  }
}
// viacep.com.br/ws/01001000/json/

Stream<CepModel> buscaCep2(String cep) async* {
  final response =
      await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
  if (response.statusCode == 200) {
    yield CepModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

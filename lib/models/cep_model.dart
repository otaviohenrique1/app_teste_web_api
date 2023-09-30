class CepModel {
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: (json['cep'] == null) ? "" : json['cep'],
      logradouro: (json['logradouro'] == null) ? "" : json['logradouro'],
      complemento: (json['complemento'] == null) ? "" : json['complemento'],
      bairro: (json['bairro'] == null) ? "" : json['bairro'],
      localidade: (json['localidade'] == null) ? "" : json['localidade'],
      uf: (json['uf'] == null) ? "" : json['uf'],
      ibge: (json['ibge'] == null) ? "" : json['ibge'],
      gia: (json['gia'] == null) ? "" : json['gia'],
      ddd: (json['ddd'] == null) ? "" : json['ddd'],
      siafi: (json['siafi'] == null) ? "" : json['siafi'],
    );
  }

  /*
    Exemplo de retorno da api
    {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }
  */
}

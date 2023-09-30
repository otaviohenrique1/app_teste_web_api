bool validaValor(String? value) {
  return (value == null || value.isEmpty);
}

String? validaCampoVazio(String? value) {
  if (validaValor(value)) {
    return "Campo vazio";
  }
  return null;
}

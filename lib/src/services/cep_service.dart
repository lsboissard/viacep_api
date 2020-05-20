import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cep_model.dart';

class CepService {
  static Future<Cep> fetchCep(String cep) async {
    final res = await http.get('http://viacep.com.br/ws/$cep/json');
    if (res.statusCode == 200) {
      return Cep.fromJson(json.decode(res.body));
    } else {
      throw 'Não foi possível localizar o endereço.';
    }
  }
}

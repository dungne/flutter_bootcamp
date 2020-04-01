import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'A6A9C7FE-2EF5-46AD-8681-C975BF68ACDC';

class CoinData {

  CoinData();

  Future getCoinData(String coin, String currency) async {
    http.Response response = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$apiKey');

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}

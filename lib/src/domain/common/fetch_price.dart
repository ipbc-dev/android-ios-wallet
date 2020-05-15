import 'dart:convert';
import 'package:http/http.dart';
import 'package:cake_wallet/src/domain/common/crypto_currency.dart';
import 'package:cake_wallet/src/domain/common/fiat_currency.dart';
import 'package:cake_wallet/src/domain/common/currency_formatter.dart';

const fiatApiAuthority = 'pro-api.coinmarketcap.com';
const fiatApiPath = 'v1/cryptocurrency/quotes/latest';

Future<double> fetchPriceFor({CryptoCurrency crypto, FiatCurrency fiat}) async {
  double price = 0.0;


  try {


      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'X-CMC_PRO_API_KEY': 'xxxxkey',
      };
      
    final fiatStringified = fiat.toString();
    final uri =
        Uri.https(fiatApiAuthority, fiatApiPath, {'symbol': 'TUBE',  'convert': fiatStringified});
    print('uri: ${uri.toString()}');
    final response = await get(uri.toString() , headers: requestHeaders );

    print('response: ${response}');
    print('responseCode: ${response.statusCode}');

    if (response.statusCode != 200) {
      return 0.0;
    }

    final responseJSON = json.decode(response.body) as Map<String, dynamic>;
    final data = responseJSON['data'] as Map<String, dynamic>;

    price = data['TUBE']['quote'][fiatStringified]['price'] as double;

    print (data);

    /*for (final item in data) {
      if (item['symbol'] == 'TUBE') {
        price = item['quote'][fiatStringified]['price'] as double;
        break;
      }
    }*/

    return price;
  } catch (e) {
    return price;
  }
}

import 'package:bloc_multistate/data/network/response.dart';

import '../api/api_provider.dart';
import '../models/network_response.dart';

class CurrencyRepository {
Future<MyResponse> getCurrencies() async {
    return ApiProvider.fetchTransactions();
  }
}

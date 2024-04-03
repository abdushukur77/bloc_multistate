import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/models/network_response.dart';
import '../models/data_model.dart';
import '../network/response.dart';

class ApiProvider {
  static Future<MyResponse> fetchTransactions() async {
    const apiUrl = "https://banking-api.free.mockoapp.net/transactions-incomes";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<TransactionsModel> transactions = jsonResponse
            .map(
              (data) => TransactionsModel.fromJson(
            data,
          ),
        )
            .toList();
        return MyResponse(data: transactions);
      } else {
        return MyResponse(errorText: "NO'MALUM XATOLIK");
      }
    } catch (e) {
      return MyResponse(errorText: 'Error: $e');
    }
  }
}

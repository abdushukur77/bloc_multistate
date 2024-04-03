


class TransactionsModel {
  final String transferDate;
  final List<Data> data;

  TransactionsModel({
    required this.transferDate,
    required this.data,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      transferDate: json['transfer_date'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  final int transactionCode;
  final String date;
  final int incomeId;
  final int amount;
  final int cardId;
  final Sender sender;

  Data({
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
    required this.sender,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      transactionCode: json['transaction_code'].toInt() as int? ?? 0,
      date: json['date'] as String? ?? '',
      incomeId: json['income_id'].toInt() as int? ?? 0,
      amount: json['amount'].toInt() as int? ?? 0,
      cardId: json['card_id'].toInt() as int? ?? 0,
      sender: Sender.fromJson(json['sender']),
    );
  }
}

class Sender {
  final String brandImage;
  final String name;
  final String location;

  Sender({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      brandImage: json['brand_image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }
}

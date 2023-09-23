class TransactionModel {
  int? id;
  int? type;
  double? commission;
  int? sum;
  String? date;
  double? result;

  TransactionModel({this.id, this.type, this.commission, this.sum, this.date});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    commission = json['commission'];
    sum = json['sum'];
    date = json['date'];
    result = (sum ?? 0) * (1 - (commission ?? 0)/100);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['type'] = type;
    json['commision'] = commission;
    json['sum'] = sum;
    json['date'] = date;
    json['result'] = result;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

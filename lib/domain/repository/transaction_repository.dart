import 'package:transaction/data/db_provider.dart';
import 'package:transaction/domain/models/transaction_model.dart';

class TransactionRepository{

  List<TransactionModel> transaction = [];

  Future<List<TransactionModel>> getAll () async {
    List<Map<String, dynamic>> transitions = await DBProvider.instance.select();
    List<TransactionModel> lst = [];
    for(var elm in transitions){
      lst.add(TransactionModel.fromJson(elm));
    }
    transaction = lst;
    return lst;
  }

  Future<List<TransactionModel>> remove (int id) async {
    await DBProvider.instance.delete(id: id);
    transaction.removeWhere((element) => element.id == id);
    return transaction;
  }

}
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction/data/db_provider.dart';
import 'package:transaction/domain/models/transaction_model.dart';
import 'package:transaction/domain/repository/transaction_repository.dart';
import 'package:transaction/utils/get_it.dart';

part 'transaction_state.dart';

part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState.loading());

  final TransactionRepository _transactionRepository = getIt<TransactionRepository>();

  Future<void> getData() async {
    List<TransactionModel> lst = await _transactionRepository.getAll();
    int income = 0;
    int trans = 0;
    int outcome = 0;

    for (var element in lst) {
      if (element.type == 1) {
        income++;
      } else if (element.type == 0) {
        trans++;
      } else if (element.type == 2) {
        outcome++;
      }
    }
    emit(TransactionState.loaded(lst, income.toDouble(), trans.toDouble(), outcome.toDouble()));
  }

  Future<void> removeTransaction(int id) async {
    List<TransactionModel> lst = await _transactionRepository.remove(id);
    int income = 0;
    int trans = 0;
    int outcome = 0;

    for (var element in lst) {
      if (element.type == 1) {
        income++;
      } else if (element.type == 0) {
        trans++;
      } else if (element.type == 2) {
        outcome++;
      }
    }
    emit(TransactionState.loaded(lst, income.toDouble(), trans.toDouble(), outcome.toDouble()));
  }

}

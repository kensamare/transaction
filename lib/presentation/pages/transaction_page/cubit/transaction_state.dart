part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loaded(List<TransactionModel> lst, double income, double trans, double outcome) = _Loaded;
  const factory TransactionState.loading() = _Loading;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/api_provider.dart';
import '../../data/models/data_model.dart';
import '../../data/network/response.dart';
import 'data_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit() : super(LoadingBankState()) {
    getAllData();
  }

  Future<void> getAllData() async {
    emit(LoadingBankState());
    MyResponse myResponse = await ApiProvider.fetchTransactions();
    if (myResponse.errorText.isEmpty) {
      emit(SuccessBankState(data: myResponse.data as List<TransactionsModel>));
    } else {
      emit(ErrorBankState(errorText: myResponse.errorText));
    }
  }
}
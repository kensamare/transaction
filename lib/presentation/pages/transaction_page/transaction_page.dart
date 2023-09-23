import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction/domain/models/transaction_model.dart';
import 'package:transaction/presentation/pages/transaction_detail_page/transaction_detail_page.dart';
import 'package:transaction/presentation/pages/transaction_page/cubit/transaction_cubit.dart';
import 'package:transaction/presentation/pages/transaction_page/widgets/pie_chart.dart';
import 'package:transaction/presentation/pages/transaction_page/widgets/transaction_card.dart';
import 'package:transaction/presentation/pages/transaction_page/widgets/transaction_tabs.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TransactionModel model = TransactionModel.fromJson({
    "id": 1,
    "sum": 1000,
    "type": 1,
    "date": "11.12.2022",
    "commision": 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..getData(),
      child: Scaffold(
        body: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Placeholder(),
              loading: ()=>const Center(child: CupertinoActivityIndicator(),),
              loaded: (lst, income, trans, outcome) => DefaultTabController(
                length: 2,
                child: SafeArea(
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(
                              child: TransactionTab(),
                            ),
                            Tab(
                              child: TransactionTab(
                                isList: false,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                itemCount: lst.length,
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (ctx) => TransactionDetailPage(model: lst[index], onRemove: (){
                                         context.read<TransactionCubit>().removeTransaction(lst[index].id!);
                                         Navigator.of(context).pop();
                                        }),
                                      ),
                                    );
                                  },
                                  child: TransactionCard(
                                    model: lst[index],
                                  ),
                                ),
                              ),
                              PieChartTransaction(
                                dataMap: {"Пополнения": income, "Переводы": trans, "Снятие": outcome},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}

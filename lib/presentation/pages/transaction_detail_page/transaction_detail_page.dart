import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transaction/domain/models/transaction_model.dart';
import 'package:transaction/presentation/pages/transaction_detail_page/widgets/detail_card.dart';
import 'package:transaction/presentation/widgets/pj_button.dart';
import 'package:transaction/utils/pj_colors.dart';
import 'package:transaction/utils/utils.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionModel model;
  final Function() onRemove;

  const TransactionDetailPage({super.key, required this.model, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали транзакции'),
        elevation: 0,
        backgroundColor: getColors(model.type ?? 0),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200.h,
            width: 375.w,
            decoration: BoxDecoration(color: getColors(model.type ?? 0), boxShadow: [
              BoxShadow(
                offset: Offset(0, 5.h),
                color: PjColors.black.withOpacity(0.15),
                blurRadius: 5.r,
              )
            ]),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    typeName(model.type ?? 0) ?? '',
                    style: TextStyle(
                      fontSize: 30.w,
                      fontWeight: FontWeight.w600,
                      color: PjColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RotatedBox(
                    quarterTurns: model.type == 1 ? 2 : 0,
                    child: SvgPicture.asset(
                      'assets/icons/${getAssets(model.type ?? 0)}',
                      color: PjColors.white,
                      width: 50.w,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    model.result.toString(),
                    style: TextStyle(
                      fontSize: 30.w,
                      fontWeight: FontWeight.w600,
                      color: PjColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            spacing: 15.w,
            runSpacing: 15.w,
            children: [
              DetailCard(value: model.sum.toString(), title: 'Сумма'),
              DetailCard(value: model.commission.toString(), title: 'Комиссия'),
              DetailCard(
                value: model.date.toString(),
                title: 'Дата исполнения транзакции',
                fullWidth: true,
              ),
            ],
          ),
          Spacer(),
          PjButton(text: 'Отменить транзакцию', isWhite: true, onPressed: onRemove,),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction/domain/models/transaction_model.dart';
import 'package:transaction/utils/pj_colors.dart';
import 'package:transaction/utils/utils.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel model;

  const TransactionCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '№${model.id}',
                  style: TextStyle(
                    fontSize: 15.w,
                    color: PjColors.borderGrey,
                  ),
                ),
                Text(
                  '${model.type == 1 ? '+ ' : '- '}${model.result?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w600,
                    color: getColors(model.type ?? 0),
                  ),
                ),
                Text(
                  typeName(model.type ?? 0),
                  style: TextStyle(
                    fontSize: 15.w,
                    color: PjColors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            RotatedBox(
              quarterTurns: model.type == 1 ? 2 : 0,
              child: SvgPicture.asset(
                'assets/icons/${getAssets(model.type ?? 0)}',
                color: getColors(model.type ?? 0),
                width: 30.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
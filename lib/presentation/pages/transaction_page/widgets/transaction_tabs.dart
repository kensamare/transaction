import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transaction/utils/pj_colors.dart';

class TransactionTab extends StatelessWidget {
  final bool isList;
  const TransactionTab({super.key, this.isList = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/${isList ? 'left_right_arrows.svg' : 'donat.svg'}', width: 15.w,),
          SizedBox(width: 15.w,),
          Text(isList ? 'Транзакции' : 'Статистика', style: TextStyle(
            fontSize: 15.w,
            color: PjColors.black,
          ),),
        ],
      ),
    );
  }
}

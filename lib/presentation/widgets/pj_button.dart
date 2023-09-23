import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction/utils/pj_colors.dart';

class PjButton extends StatelessWidget {
  final bool isWhite;
  final String text;
  final Color borderColor;
  final Function()? onPressed;

  const PjButton({required this.text, this.isWhite = false, this.onPressed, this.borderColor = PjColors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.w,
        width: isWhite ? 343.w : 280.w,
        decoration: BoxDecoration(
            color: isWhite ? PjColors.white : PjColors.violet,
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(color: borderColor, width: isWhite ? 1.w : 0)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.w,
              color: isWhite ? borderColor : PjColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String value;
  final bool fullWidth;
  const DetailCard({super.key, required this.value, required this.title, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? 343.w : 164.w,
      height: 80.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.w,
              ),),
              SizedBox(
                width: 30.w,
              ),
              Text(value, style: TextStyle(
                fontSize: 18.w,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

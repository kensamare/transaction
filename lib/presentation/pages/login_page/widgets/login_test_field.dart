import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction/utils/pj_colors.dart';

class LoginTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isError;
  const LoginTextField({super.key, required this.controller, required this.hint, required this.validator, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w400,
          color: PjColors.black),
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
            color: PjColors.grey),
        isDense: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide(color: PjColors.borderGrey, width: 1.0.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide(color: PjColors.borderGrey, width: 1.0.w),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(
                1.w)),
            borderSide: BorderSide(
                color: PjColors.borderGrey, width: 1.0.w)),
        focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.w)),
            borderSide: BorderSide(
                color: PjColors.borderGrey, width: 1.0.w)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.w)),
            borderSide: BorderSide(
                color: PjColors.red, width: 1.0.w)),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.w)),
            borderSide: BorderSide(
                color: PjColors.red, width: 1.0.w)),
        errorStyle: isError
            ? TextStyle(
          fontSize: 12.w,
          fontWeight: FontWeight.w400,
          color: PjColors.red,
        )
            : TextStyle(
          height: 0,
        ),
      ),
      validator: validator,
    );
  }
}

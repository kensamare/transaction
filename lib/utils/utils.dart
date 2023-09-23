import 'package:flutter/material.dart';
import 'package:transaction/utils/pj_colors.dart';

String typeName(int type) {
  switch (type) {
    case 0:
      return 'Перевод';
    case 1:
      return 'Пополнение';
    case 2:
      return 'Снятие';
    default:
      return '';
  }
}

Color getColors(int type) {
  switch (type) {
    case 0:
      return PjColors.blue;
    case 1:
      return PjColors.green;
    case 2:
      return PjColors.red;
    default:
      return PjColors.black;
  }
}

String getAssets(int type) {
  switch (type) {
    case 0:
      return 'left_right_arrows.svg';
    case 1:
      return 'arrow.svg';
    case 2:
      return 'arrow.svg';
    default:
      return '';
  }
}
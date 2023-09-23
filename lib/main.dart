import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction/data/db_provider.dart';
import 'package:transaction/domain/repository/transaction_repository.dart';
import 'package:transaction/presentation/pages/login_page/login_page.dart';
import 'package:transaction/presentation/pages/transaction_page/transaction_page.dart';
import 'package:transaction/utils/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider.instance.database;
  getIt.registerLazySingleton(() => TransactionRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child){
        return MaterialApp(
          title: 'TransactionAPP',
          home: child,
        );
      },
      child: TransactionPage(),
    );
  }
}

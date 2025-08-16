import 'package:bloc_dio_get_it/core/dependency_injection.dart';
import 'package:bloc_dio_get_it/features/users/presentation/page/users_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(MaterialApp(home: UsersPage()));
}

import 'dart:developer';

import 'package:bloc_dio_get_it/core/dependency_injection.dart';
import 'package:bloc_dio_get_it/features/users/presentation/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UsersBloc>()..add(GetUsersEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Users")),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (_, state) {
            log("state: ${state.status}");
            if (state.status == UsersStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == UsersStatus.success) {
              return ListView.builder(
                itemCount: state.users?.length ?? 0,
                itemBuilder: (__, index) {
                  return ListTile(
                    title: Text(state.users![index].firstnName??'-'),
                    subtitle: Text(state.users![index].email??'-'),
                  );
                },
              );
            }
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          },
        ),
      ),
    );
  }
}

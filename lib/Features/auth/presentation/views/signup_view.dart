import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_state.dart';
import 'package:iqra_library_app/Features/auth/presentation/views/widgets/auth_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is Authenticated) {
            GoRouter.of(context).go('/homeView');
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: AuthForm(isLogin: false),
        ),
      ),
    );
  }
}

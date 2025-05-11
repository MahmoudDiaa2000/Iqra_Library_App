import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_state.dart';
import 'package:iqra_library_app/Features/auth/presentation/views/widgets/auth_form.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is Authenticated) {
            GoRouter.of(context).go(AppRouter.kHomeView);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo + App Name
              Column(
                children: [
                  const Icon(Icons.auto_stories_outlined, size: 100),
                  Text(
                    'IQRA ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Login Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const AuthForm(isLogin: true),
              ),

              const SizedBox(height: 20),

              // Create Account Text Button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSignUpView);
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

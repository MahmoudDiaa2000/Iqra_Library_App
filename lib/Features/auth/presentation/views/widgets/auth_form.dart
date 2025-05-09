import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_event.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;

  const AuthForm({super.key, required this.isLogin});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            validator:
                (value) =>
                    value != null && value.contains('@')
                        ? null
                        : 'Enter a valid email',
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => password = value,
            validator:
                (value) =>
                    value != null && value.length >= 6
                        ? null
                        : 'Min 6 characters',
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final authBloc = context.read<AuthBloc>();
                if (widget.isLogin) {
                  authBloc.add(
                    AuthLoginRequested(email: email, password: password),
                  );
                } else {
                  authBloc.add(
                    AuthRegisterRequested(
                      email: email,
                      password: password,
                      username: email,
                    ),
                  );
                }
              }
            },
            child: Text(widget.isLogin ? 'Login' : 'Sign Up'),
          ),
        ],
      ),
    );
  }
}

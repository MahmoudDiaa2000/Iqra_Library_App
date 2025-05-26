import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_event.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_state.dart';

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
  bool _isPasswordHidden = true;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },

      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',


                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
                validator: (value) =>
                value != null && value.contains('@')
                    ? null
                    : 'Enter a valid email',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden ? Icons.visibility_off : Icons
                          .visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),
                obscureText: _isPasswordHidden,
                onChanged: (value) => password = value,
                validator: (value) =>
                value != null && value.length >= 6 ? null : 'Min 6 characters',
              ),

              const SizedBox(height: 24),
              state is AuthLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ), onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final authBloc = context.read<AuthBloc>();
                  if (widget.isLogin) {
                    authBloc.add(
                      AuthLoginRequested(
                          email: email, password: password),
                    );
                  } else {
                    authBloc.add(
                      AuthRegisterRequested(
                          email: email, password: password),
                    );
                  }
                }
              },
                child: Text(widget.isLogin ? 'Login' : 'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                  ),),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 12),
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(GoogleSignInRequested());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/_logo.png',
                      height: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.isLogin
                          ? 'Login with Google'
                          : 'Sign up with Google',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}

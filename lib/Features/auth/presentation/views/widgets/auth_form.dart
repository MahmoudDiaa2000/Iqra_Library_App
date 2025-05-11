import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_event.dart';
import 'package:iqra_library_app/constants.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

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

  Future<void> _signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      context.read<AuthBloc>().add(AuthGoogleSignInRequested());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google sign-in failed: $e')),
      );
    }
  }

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
            validator: (value) =>
            value != null && value.contains('@') ? null : 'Enter a valid email',
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) =>
            value != null && value.length >= 6 ? null : 'Min 6 characters',
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(StadiumBorder(

              )),
              backgroundColor: MaterialStateProperty.all(
                  AppColors.SceandrColor),
            ),


            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final authBloc = context.read<AuthBloc>();
                if (widget.isLogin) {
                  authBloc.add(
                    AuthLoginRequested(email: email, password: password),
                  );
                } else {
                  authBloc.add(
                    AuthRegisterRequested(email: email, password: password),
                  );
                }
              }
            },
            child: Text(widget.isLogin ? 'Login' : 'Sign Up', style: TextStyle(
                color: Colors.white
            ),),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthGoogleSignInRequested());
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: Colors.grey.shade400),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              backgroundColor: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsData.google,
                  height: 24.0,
                  width: 24.0,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

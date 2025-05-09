import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:iqra_library_app/Features/auth/presentation/manager/auth_bloc/auth_event.dart';
import 'package:iqra_library_app/core/utils/app_config_provider.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                'https://unsplash.com/s/photos/profile'),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              user?.email ?? 'Unknown',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),

          SwitchListTile(
            secondary: Icon(
              Icons.dark_mode,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: context.watch<AppConfigProvider>().isDarkMode(),
            onChanged: (value) {
              final provider = context.read<AppConfigProvider>();
              provider.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          const Divider(),

          const Divider(),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
              GoRouter.of(context).go(AppRouter.kLoginView);
            },
          ),

        ],
      ),
    );
  }
}

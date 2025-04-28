import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/app_config_provider.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Diaa',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/Profile/presentation/views/profile_view.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/views/audio_book_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:iqra_library_app/Features/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeViewBody(),
    SearchView(),
    AudioBookView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Theme
            .of(context)
            .bottomNavigationBarTheme
            .selectedItemColor,
        unselectedItemColor: Theme
            .of(context)
            .bottomNavigationBarTheme
            .unselectedItemColor,
        backgroundColor: Theme
            .of(context)
            .bottomNavigationBarTheme
            .backgroundColor,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Audiobooks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

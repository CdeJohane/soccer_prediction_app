import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/pages/home.dart';
import 'package:soccer_app/pages/matches.dart';
import 'package:soccer_app/pages/results.dart';
import 'package:soccer_app/pages/settings.dart';
import 'package:soccer_app/pages/standings.dart';
import 'package:soccer_app/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:  (context, ref, child){
        // Call provider
        final indexNavBar = ref.watch(indexBottomNavbarProvider);

        // Set the pages
        const pages = [
          MainHome(),
          MatchesPage(),
          Results(),
          StandingsPage(),
          SettingsPage()
        ];

        const pageNames = [
          'Home',
          'Fixtures',
          'Results',
          'Standings',
          'Settings'
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(pageNames[indexNavBar]),
            automaticallyImplyLeading: false,
          ),
          body: pages[indexNavBar],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_soccer_outlined), label: 'Match'),
              BottomNavigationBarItem(icon: Icon(Icons.celebration), label: 'Results'),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Standings'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            ],
             onTap: (value) => ref
              .read(indexBottomNavbarProvider.notifier)
              .update((state) => value)
          ),
        );
      },
    );
  }
}
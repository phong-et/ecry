import 'package:ecry/ui/screens/ecry_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _tabs;
  final List<Widget> _screens = [
    EcryScreen()
    //ReportScreen(),
    //UserSettingsScreen(),
    //SettingsScreen(),
  ];
  int _selectedTabIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabs = [
      {
        'title': Text('ECRY'),
        'icon': Icon(Icons.playlist_add_check),
      },
      {
        'title': Text('Logervity'),
        'icon': Icon(Icons.person),
      },
      {
        'title': Text('Vocabulary'),
        'icon': Icon(Icons.settings),
      },
    ];
    _pageController = new PageController();
    // WidgetsBinding.instance.addObserver(this);
    // _authService = Provider.of<AuthService>(context, listen: false);
    // _fingerPrintService = Provider.of<FingerPrintService>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    //WidgetsBinding.instance.removeObserver(this);
  }

  //Animates the controlled [PageView] from the current page to the given page.
  void _navigateToPage(int index) {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
  }

  void _changeTab(int index) {
    setState(() {
      this._selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fun App'),
        centerTitle: true,
      ),
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _changeTab,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTabIndex,
        onTap: _navigateToPage,
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: tab['icon'],
                  title: tab['title'],
                ))
            .toList(),
      ),
    );
  }
}

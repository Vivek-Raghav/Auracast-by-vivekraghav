import 'package:auracast/home/home_index.dart';
import 'package:auracast/home/presentation/widgets/dot_indicator.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;

  final _homeBloc = getIt<HomeScreenBloc>();

  final List<Widget> _screens = [
    const HomePage(),
    const UserSavedCities(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 0.5))),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/home_icon.svg',
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 0 ? Colors.white : Colors.grey,
                      BlendMode.srcIn),
                ),
                onPressed: () => _onItemTapped(0),
              ),
              SizedBox(height: _homeBloc.apiResponse.length > 1 ? 10 : 0),
              if (_homeBloc.apiResponse.length > 1)
                DotIndicator(
                    length: _homeBloc.apiResponse.length,
                    currentIndex: _homeBloc.currentWeatherIndex),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/city_icon.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 1 ? Colors.white : Colors.grey,
                      BlendMode.srcIn),
                ),
                onPressed: () => _onItemTapped(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

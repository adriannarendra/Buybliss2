import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/enums.dart';
import 'package:buybliss2/screens/favourite/favourite_screen.dart';
import 'package:buybliss2/screens/home/home.dart';
import 'package:buybliss2/screens/profile/profile.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.menu,
  });

  final MenuState menu;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: MenuState.values.indexOf(menu),
      selectedItemColor: kPrimaryColor,
      // unselectedItemColor: inactiveColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        switch (MenuState.values[index]) {
          case MenuState.home:
            _navigateWithFadeTransition(context, HomeScreen());
            break;
          case MenuState.profile:
            _navigateWithFadeTransition(context, ProfileScreen());
            break;
          case MenuState.favorite:
            _navigateWithFadeTransition(context, FavouriteScreen());
          default:
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Shop Icon.svg',
            colorFilter: ColorFilter.mode(
              menu == MenuState.home ? kPrimaryColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/Shop Icon.svg',
            colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Heart Icon.svg',
            colorFilter: ColorFilter.mode(inactiveColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/Heart Icon.svg',
            colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Chat bubble Icon.svg',
            colorFilter: ColorFilter.mode(inactiveColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/Chat bubble Icon.svg',
            colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/User.svg',
            colorFilter: ColorFilter.mode(
              menu == MenuState.profile ? kPrimaryColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/User.svg',
            colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  void _navigateWithFadeTransition(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 150),
      ),
    );
  }
}
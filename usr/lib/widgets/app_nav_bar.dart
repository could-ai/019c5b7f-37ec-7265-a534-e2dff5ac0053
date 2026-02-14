import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;

  const AppNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'AI Resume Builder',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontFamily: 'Georgia', // Serif for premium feel
        ),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey[200],
          height: 1.0,
        ),
      ),
      actions: [
        _NavButton(
          label: 'Builder',
          route: '/builder',
          isActive: currentRoute == '/builder',
        ),
        _NavButton(
          label: 'Preview',
          route: '/preview',
          isActive: currentRoute == '/preview',
        ),
        _NavButton(
          label: 'Proof',
          route: '/proof',
          isActive: currentRoute == '/proof',
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class _NavButton extends StatelessWidget {
  final String label;
  final String route;
  final bool isActive;

  const _NavButton({
    required this.label,
    required this.route,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: isActive ? Colors.black : Colors.grey[600],
        textStyle: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
      child: Text(label),
    );
  }
}

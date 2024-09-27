import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatefulWidget {
  final User? user;
  final Function setUser;

  Navbar({required this.user, required this.setUser});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final _searchController = TextEditingController();

  void _handleLoginClick() {
    Navigator.pushNamed(context, '/LoginPage');
  }

  void _handleLogoutClick() async {
    await FirebaseAuth.instance.signOut();
    widget.setUser(null);
    Navigator.pushNamed(context, '/');
  }

  void _handleLogoClick() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: _handleLogoClick,
                  child: Image.asset('logo-color.png'),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Search Cars or brands eg. Swift, or Maruti',
                            ),
                          ),
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Row(
                  children: [
                    Text('English'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                const SizedBox(width: 20),
                widget.user != null
                    ? ElevatedButton(
                        onPressed: _handleLogoutClick,
                        child: const Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text('Logout'),
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: _handleLoginClick,
                        child: const Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text('Login/Register'),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 36, 99, 147),
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildOverlay(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(1.0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 36, 99, 147),
            ),
            child: Center(
              child: Text(
                'UTS Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Report'),
            onTap: () {
              Navigator.pushNamed(context, '/report');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/train.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      color: Colors.white.withOpacity(.7),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 36, 99, 147),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

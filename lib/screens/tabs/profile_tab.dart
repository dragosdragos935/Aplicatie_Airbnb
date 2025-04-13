import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            'Guest',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          _buildListTile(
            icon: Icons.person_outline,
            title: 'Personal information',
          ),
          _buildListTile(
            icon: Icons.payment,
            title: 'Payments and payouts',
          ),
          _buildListTile(
            icon: Icons.notifications_none,
            title: 'Notifications',
          ),
          _buildListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy and sharing',
          ),
          _buildListTile(
            icon: Icons.help_outline,
            title: 'Help',
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // TODO: Implement logout
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: Implement navigation
      },
    );
  }
} 
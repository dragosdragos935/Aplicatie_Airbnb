import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Open settings
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200/200?random=1',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authProvider.isAdmin ? 'Admin User' : 'Regular User',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(authProvider.isAdmin ? 'admin@admin.com' : 'user@example.com'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Edit profile
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFE3C5B),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Personal Info Section
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Personal Information'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to personal info
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payments & Payouts'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to payments
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Login & Security'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to security
            },
          ),
          const Divider(),
          // Admin Section - Only visible for admin users
          if (authProvider.isAdmin) ...[
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Host Tools',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_home_work),
              title: const Text('Add New Property'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/add-property');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Manage Properties'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/manage-properties');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_card),
              title: const Text('Add New Trip'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/add-trip');
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analytics'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/analytics');
              },
            ),
            const Divider(),
          ],
          // Support Section
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to help center
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              authProvider.logout();
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
} 
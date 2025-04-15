import 'package:flutter/material.dart';

class InboxTab extends StatelessWidget {
  const InboxTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inbox'),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: Color(0xFFFE3C5B),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Messages'),
              Tab(text: 'Offers'),
              Tab(text: 'Notifications'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Messages
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/200?random=$index',
                    ),
                  ),
                  title: Text('Host ${index + 1}'),
                  subtitle: const Text('Last message preview...'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('2h ago'),
                      if (index == 0)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFE3C5B),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    // TODO: Open chat
                  },
                );
              },
            ),
            // Offers
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_offer,
                      color: Color(0xFFFE3C5B),
                    ),
                    title: Text('Special Offer ${index + 1}'),
                    subtitle: const Text('Limited time discount!'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: View offer details
                    },
                  ),
                );
              },
            ),
            // Notifications
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    index == 0 ? Icons.check_circle : Icons.info,
                    color: index == 0 ? Colors.green : Colors.blue,
                  ),
                  title: Text('Notification ${index + 1}'),
                  subtitle: const Text('Notification details...'),
                  trailing: Text(
                    '${index + 1}h ago',
                    style: const TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    // TODO: View notification
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 
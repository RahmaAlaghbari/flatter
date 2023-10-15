import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Occupancy Rate',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '85%',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Revenue',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\$25,000',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Rate',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\$150',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Reservations',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.book),
                    title: Text('John Doe'),
                    subtitle: Text('Check-in: 2023-10-16  |  Check-out: 2023-10-20'),
                    trailing: Chip(
                      label: Text('Room 205'),
                      backgroundColor: Colors.blue,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagementPage()),
                );
              },
              child: Text('User Management'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: Center(
        child: Text('User Management Page'),
      ),
    );
  }
}

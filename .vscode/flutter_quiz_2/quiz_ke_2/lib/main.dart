import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'assets/icon/icon_menu.png',
          ))),
        ),
        backgroundColor: Colors.white,
        // elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu, color: Colors.black),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildSettingsOption(
              icon: Icons.person_outline,
              title: 'Profile settings',
              subtitle: 'Settings regarding your profile',
            ),
            _buildSettingsOption(
              icon: Icons.article_outlined,
              title: 'News settings',
              subtitle: 'Choose your favourite topics',
            ),
            _buildSettingsOption(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'When would you like to be notified',
            ),
            _buildSettingsOption(
              icon: Icons.folder_outlined,
              title: 'Subscriptions',
              subtitle: 'Currently, you are in Starter Plan',
            ),
            SizedBox(height: 40),
            Text(
              'Other',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            _buildSettingsOption(
              icon: Icons.bug_report_outlined,
              title: 'Bug report',
              subtitle: 'Report bugs very easy',
            ),
            _buildSettingsOption(
              icon: Icons.share_outlined,
              title: 'Share the app',
              subtitle: 'Share on social media networks',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: () {
          // Action on tap
        },
      ),
    );
  }
}

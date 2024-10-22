import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final String currentName;
  final String currentUsername;
  final String currentWebsite;
  final String currentBio;

  const EditProfile({
    Key? key,
    required this.currentName,
    required this.currentUsername,
    required this.currentWebsite,
    required this.currentBio,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController websiteController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    // Initializing controllers with current profile data
    nameController = TextEditingController(text: widget.currentName);
    usernameController = TextEditingController(text: widget.currentUsername);
    websiteController = TextEditingController(text: widget.currentWebsite);
    bioController = TextEditingController(text: widget.currentBio);
  }

  Future<void> _saveProfile() async {
    // Saqlangan ma'lumotlarni SharedPreferences'ga yozish
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('username', usernameController.text);
    await prefs.setString('website', websiteController.text);
    await prefs.setString('bio', bioController.text);

    // Saqlanganligini bildiruvchi SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile saved!")),
    );

    // Profil sahifasiga qaytish
    Navigator.pop(context, {
      'name': nameController.text,
      'username': usernameController.text,
      'website': websiteController.text,
      'bio': bioController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.pop(context); // Close the screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/i31.jpg'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Change profile photo logic here
                    },
                    child: Text("Change Profile Photo"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Name", nameController),
            _buildTextField("Username", usernameController),
            _buildTextField("Website", websiteController),
            _buildTextField("Bio", bioController, maxLines: 3),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle professional account switch logic
              },
              child: Text("Switch to Professional Account"),
            ),
            Divider(),
            Text(
              "Private Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildTextField("Email", TextEditingController()),
            _buildTextField("Phone", TextEditingController()),
            _buildTextField("Gender", TextEditingController()),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

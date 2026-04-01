import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? isCkecked = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login"), centerTitle: true),
        body: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Man'),
                Checkbox(
                  value: isCkecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isCkecked = value!;
                    });
                  },
                ),
                Text('Woman'),
                Checkbox(
                  value: isCkecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isCkecked = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(
  width: double.infinity, // 👉 full ngang
  height: 50,             // 👉 chiều cao
  child: ElevatedButton(
    onPressed: () {},
    child: const Text("Login"),
  ),
)
          ],
        ),
      ),
    );
  }
}

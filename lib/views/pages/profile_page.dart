import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isCkecked = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () {
              setState(() {});
            },
          ),
          Text(controller.text),
          Checkbox(
            value: isCkecked,
            onChanged: (bool? value) {
              setState(() {
                isCkecked = value!;
              });
            },
          ),
          Switch(value: isSwitched, onChanged: (bool value) {
            setState(() {
              isSwitched = value;
            });
          },)
        ],
      ),
    );
  }
}

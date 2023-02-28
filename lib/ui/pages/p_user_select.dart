import 'package:flutter/material.dart';
import 'package:flutter_interview/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserSelectionPage extends StatefulWidget {
  const UserSelectionPage({super.key});

  @override
  State<StatefulWidget> createState() => UserSelectionPageState();
}

class UserSelectionPageState extends State<UserSelectionPage> {
  UserSelectionPageState();

  @override
  void initState() {
    super.initState();
    final userProfileProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProfileProvider.fetchUserProfiles();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                const Text(
                  "Choose a profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    height: 48 / 40,
                  ),
                ),
                const Spacer(),
                GridView.count(
                  crossAxisSpacing: 48,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.75,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    ...userProfileProvider.appUsers
                        .map((e) => e.profileWidget()),
                  ],
                ),
                const Spacer(),
              ],
            )),
      ),
    );
  }
}

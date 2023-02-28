import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_interview/models/m_user_profile.dart';

class UserProvider with ChangeNotifier {
  List<UserProfile> _appUsers = [];
  List<UserProfile> get appUsers => [..._appUsers];
  set appUsers(List<UserProfile> list) {
    _appUsers = [...list];
    notifyListeners();
  }

  // Functions
  Future<void> fetchUserProfiles() async {
    // Fetch user data from json file
    String userData = await rootBundle.loadString("assets/json/users.json");
    List serialisedUserData = jsonDecode(userData);
    List<UserProfile> parsedUserList = [
      ...serialisedUserData.map((e) => UserProfile.fromMap(e))
    ];
    appUsers = parsedUserList;
    log("NEW PARSED DATA: $appUsers");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_interview/services/api.dart';
import 'package:flutter_interview/ui/styling/text_styles.dart';

class UserProfile {
  int id;
  String name, photoPath;

  UserProfile({
    required this.id,
    required this.name,
    required this.photoPath,
  });

  Widget profileWidget({bool isProfilePage = false}) => InkWell(
        onTap: () async {
          // Grab api service
          ApiService api = ApiService();
          await api.handleRequest(
            "https://unogsng.p.rapidapi.com/genres",
            RequestMethod.GET,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: isProfilePage ? 256 : 128,
              width: isProfilePage ? 256 : 128,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "assets/images/$photoPath",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: isProfilePage ? 24 : 12),
              child: Text(
                name,
                style: userProfileSelect_label,
              ),
            ),
          ],
        ),
      );

  static fromMap(Map<String, dynamic> uData) => UserProfile(
        id: uData['id'],
        name: uData['name'],
        photoPath: uData['photo'],
      );
}

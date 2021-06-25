import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Data extends ChangeNotifier {
  bool loggedin;
  String language;
  String currentname;
  String currentUrl;
  String currentdesc;
  String email;
  String userName;
  String photourl;
  String phn;
  bool fpwd = false;
  bool paid = false;
  String country;
  String dob;
  String gender;

  List li;
  Map account = {};

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void verify() async {
    _auth.authStateChanges().listen((User user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        //email = user.email;
        print('User is signed in!');
        await firestore
            .collection('users')
            .doc(user.email)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            //  print(documentSnapshot.data());
            account = Map.from(documentSnapshot.data());
            photourl = account["photourl"].toString();
            email = account["email"];
            userName = account["full_name"];
            phn = account["phoneno"];
            paid = account["paid"];
            gender = account["gender"];
            dob = account["dob"];
            country = account["country"];
          } else {
            print("not exist");
          }
        });
      }
    });
    notifyListeners();
  }

  void login() {
    loggedin = true;

    notifyListeners();
  }

  void logout() {
    loggedin = false;
    notifyListeners();
  }

  void fetchVideos(List videos) {
    li = videos;
    notifyListeners();
  }

  void updateCurrentDetails(int index) {
    if (language == "english") {
      currentUrl = li[index]["elink"];
      currentname = li[index]["ename"];
      currentdesc = li[index]["description"];
    } else {
      currentUrl = li[index]["tlink"];
      currentname = li[index]["tname"];
      currentdesc = li[index]["description"];
    }
    notifyListeners();
  }

  Future<void> updateUserPayment() {
    return users
        .doc(email)
        .update({'paid': true})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  void pwreset() {
    fpwd = !fpwd;
    notifyListeners();
  }

  void updatePayment() {
    paid = true;
    notifyListeners();
  }

  void getVideos(String l) async {
    await firestore
        .collection('users')
        .doc("videos")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //  print(documentSnapshot.data());
        Map<dynamic, dynamic> map = Map.from(documentSnapshot.data());
        li = List.from(map['exercises']);
        print(li[0]);
      } else {
        print("not exist");
      }
    });
    language = l;
    if (language == "english") {
      currentname = li[0]['ename'];
      currentUrl = li[0]["elink"];

      currentdesc = li[0]["description"];
    } else if (language == "tamil") {
      currentUrl = li[0]["tlink"];
      currentname = li[0]["tname"];
      currentdesc = li[0]["description"];
    }
    notifyListeners();
  }

  Future<void> updateUserDetails(String g, String d, String co, String p) {
    if (g == "" || g == null) g = gender;
    if (d == "" || d == null) d = dob;
    if (co == "" || co == null) co = country;
    if (p == "" || p == null) p = phn;
    return users
        .doc(email)
        .update({"gender": g, "dob": d, "country": co, "phoneno": p})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}

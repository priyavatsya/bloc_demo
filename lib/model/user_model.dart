import 'dart:convert';


List<UserModel> movieFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String movieToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "firstName":firstName ,
    "lastName": lastName,
    "avatar": avatar,
  };

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "firstName":firstName ,
    "lastName": lastName,
    "avatar": avatar,
  };


// Map<String, dynamic> toMap(){
  //   return {
  //     DbHelper.COLUMN_TITLE:title,
  //     DbHelper.COLUMN_IMAGE:image,
  //     //DbHelper.COLUMN_RELEASE_YEAR:releaseYear,
  //     //DbHelper.COLUMN_RATING:rating,
  //   };
  // }
  }
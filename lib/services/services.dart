// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../models/album.dart';
// import '../../models/albums.dart';
//
// class Services {
//   //
//   //static List<Album> albums;
//   static const String url = 'https://jsonplaceholder.typicode.com/photos';
//
//   static Future<Albums> getPhotos() async {
//     try {
//       final uri = Uri.parse(url);
//       final response = await http.get(uri);
//       if (200 == response.statusCode) {
//         Albums albums = parsePhotos(response.body);
//         return albums;
//       } else {
//         Albums albums = new Albums();
//         albums.albums = [];
//         return albums; // we are returning empty album list
//         // Handle these as you want...
//       }
//     } catch (e) {
//       Albums albums = new Albums();
//       albums.albums = [];
//       return albums;
//     }
//   }
//
//   static Albums parsePhotos(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     List<Album> albums =
//     parsed.map<Album>((json) => Album.fromJson(json)).toList();
//     Albums a = new Albums();
//     a.albums = albums;
//     return a;
//   }
// }

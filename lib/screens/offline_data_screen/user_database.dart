// import 'package:flutter/material.dart';
// import '../../card/dbHelper.dart';
// import '../../model/user_model.dart';
//
//
// class UserDatabase extends StatefulWidget {
//   UserDatabase({Key? key}) : super(key: key);
//
//   @override
//   State<UserDatabase> createState() => _UserDatabase();
// }
//
// class _UserDatabase extends State<UserDatabase> {
//   late DataBase handler;
//   Future<int> addUsers() async {
//     UserModel firstUser =
//     UserModel(firstName: "Michael", email: "michael.lawson@reqres.in", id: 7, lastName: "Lawson");
//     UserModel secondUser =
//     UserModel(firstName: "Lindsay", email:"lindsay.ferguson@reqres.in", id: 8, lastName: "Ferguson");
//     UserModel thirdUser =
//     UserModel(firstName: "Tobias",email: "tobias.funke@reqres.in", id: 9, lastName: "Funke");
//     UserModel fourthUser =
//     UserModel(firstName:"Bryon",email: "byron.fields@reqres.in", id: 10, lastName: "Fields");
//     UserModel fifthUser =
//     UserModel(firstName: "George",email: "george.edwards@reqres.in", id: 11, lastName: "Edwards");
//     UserModel sixthUser =
//     UserModel(firstName: "Rachel",email: "rachel.howell@reqres.in", id: 12, lastName: "Howell");
//
//     List<UserModel> users = [firstUser, secondUser,thirdUser,fourthUser,fifthUser,sixthUser];
//     return await handler.insertUsers(users);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     handler = DataBase();
//     handler.initializedDB().whenComplete(() async {
//       await addUsers();
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: FutureBuilder(
//           future: handler.retrieveUsers(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.all(8.0),
//                       title: Text(snapshot.data![index].firstName),
//                       subtitle: Text(snapshot.data![index].email.toString()),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

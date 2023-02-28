import 'dart:io';

import 'package:bloc_demo/blocs/homepage_bloc/app_blocs.dart';
import 'package:bloc_demo/blocs/homepage_bloc/app_events.dart';
import 'package:bloc_demo/blocs/infopage_bloc/infopage_bloc.dart';
import 'package:bloc_demo/blocs/infopage_bloc/infopage_state.dart';
import 'package:bloc_demo/model/user_model.dart';
import 'package:bloc_demo/repo/repositories.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUser extends Mock implements UserBloc {}

void main() {

  UserBloc userBloc;
  MockUser userRepository;
  setUp(() {
    userRepository = MockUser();
    //userBloc = UserBloc(userRepository: userRepository);
  });
  tearDown(() {
    //userBloc?.close();
  });


 // late MockUserRepository mockUserRepository;
  late UserRepository repository;
  late UserBloc bloc;

  setUp(() {
   // mockUserRepository = MockUserRepository();
    repository= UserRepository();
   // bloc = UserBloc(mockUserRepository);
  });


  final UserModel users = UserModel(id: 7,
    email: 'michael.lawson@reqres.in',
    firstName:'Michael' ,
    lastName:'Lawson' ,
    avatar: 'https://reqres.in/img/faces/7-image.jpg',

  );

  group('GetUserDetails', () {
    final users = UserModel(id: 7,email:'michael.lawson@reqres.in',
            firstName: 'Michael',lastName: 'Lawson');

    // // Old way of testing Blocs - like regular Streams
    // test(
    //   'when successful',
    //       () {
    //     when(mockUserRepository.getUsers())
    //         .thenAnswer((_) async => users);
    //    // final bloc = UserBloc(_userRepository)Bloc(mockUserRepository);
    //    // bloc.add((''));
    //     expectLater(
    //       bloc,
    //       emitsInOrder([
    //         NewUserInitial(),
    //         NewUserLoading(),
    //         NewUserLoaded(data),
    //       ]),
    //     );
    //       },
    // );

  });



  // void arrangeRepositoryReturnUsers() {
  //   when(() => mockRepository.getUsers()).thenAnswer((
  //       invocation) async => users);
  // }


  test(
    "Test Http request",
        () async {
      HttpOverrides.global = null;
      UserModel? users = (await repository.getUsers()) as UserModel?;
      expect(users?. id!= null, true);
    },
  );

  // group('Group testing example', () {
  //   test(
  //     "Check is request called once",
  //         () async {
  //           arrangeRepositoryReturnUsers();
  //       bloc.UserLoadingState();
  //       verify(() => mockRepository.getUsers()).called(1);
  //     },
  //   );
  //
  //   test(
  //     "Check is id=7",
  //         () async {
  //           arrangeRepositoryReturnUsers();
  //       UserModel? users = (await mockRepository.getUsers()) as UserModel?;
  //       expect((users?.id != 7), false);
  //     },
  //   );
  // });
}
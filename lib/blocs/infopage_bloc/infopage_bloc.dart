import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/infopage_model.dart';
import '../../repo/infopage_repo.dart';
//import 'infopage_events.dart';
import 'infopage_state.dart';
//import 'package:bloc_demo-master/blocs/infopage_bloc/infopage_state.dart';
//part 'infopage_state.dart';
part 'infopage_events.dart';

class NewUserBloc extends Cubit<NewUserState> {
  late final InfoPageModel data;

  NewUserBloc() : super (NewUserState());

  void getUserDetails(String name, String job) async {
    await Future.delayed(const Duration(seconds: 5), () async {
    data = await InfoPageRepo().fetchDetails(name, job);
    emit(NewUserLoaded(data));
    });
  }

  void add(SendData sendData) async {
    late final InfoPageModel result;
   // await Future.delayed(const Duration(seconds: 3), () async {

    try{
      result = await InfoPageRepo().fetchDetails(sendData.name, sendData.job);
      print(result);
      emit(NewUserLoaded(result));

    }catch(e){
      print(e);
    }
   }
}



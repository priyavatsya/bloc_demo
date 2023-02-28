import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/infopage_bloc/infopage_bloc.dart';
import '../../blocs/infopage_bloc/infopage_state.dart';
import '../../model/infopage_model.dart';
import '../../widgets/components/error_screen.dart';
import '../../widgets/components/spacer.dart';
import '../../widgets/utils/constant.dart';
import '../../widgets/widgets/list_tile.dart';
import '../../widgets/widgets/search_btn.dart';
import '../../widgets/widgets/text_form_field.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late FocusNode nameFocus;
  late FocusNode jobFocus;
  late FocusNode searchBtnFocus;
  late TextEditingController nameController;
  late TextEditingController jobController;

  @override
  void initState() {
    super.initState();
  //  getUserDetails();
    nameFocus = FocusNode();
    jobFocus = FocusNode();
    searchBtnFocus = FocusNode();
    nameController = TextEditingController();
    jobController = TextEditingController();
  }

  @override
  void dispose() {
   // getUserDetails();
    nameFocus.dispose();
    jobFocus.dispose();
    searchBtnFocus.dispose();
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {

    return BlocListener<NewUserBloc, NewUserState>(
      listener: (context, state) => _handleNewUserState(state),
    child:Scaffold(
      appBar: AppBar(
        title: const Text("POST request"),
        ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildInitialLayout(),
           ],
         ),
       )
    );
  }

  _handleNewUserState(NewUserState newUserState) {
    if (newUserState is NewUserLoaded) {
      print(newUserState);
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListTileBuilder(newUserState.data)),
            );

     }else if(newUserState is NewUserLoading){
       return const Center(child: CircularProgressIndicator());

     }else if(newUserState is NewUserError){
      return const ErrorScreenBuilder();

    // }else{
    //   return buildInitialLayout();
    }

  }

  Widget buildInitialLayout() => Center(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputField(
            focusNode: nameFocus,
            textController: nameController,
            label: "Name",
            icons: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          HeightSpacer(myHeight: kSpacing),
          InputField(
            focusNode: jobFocus,
            textController: jobController,
            label: "Designation",
            icons: const Icon(Icons.work, color: Colors.blue),
          ),
          HeightSpacer(myHeight: kSpacing),
          SearchButtonBuilder(
            focusNode: searchBtnFocus,
            name: nameController,
            job: jobController,
          ),
        ],
      ),
    ),
  );

  // Widget buildLoadedlayout(InfoPageModel data){
  //   return Center(
  //       child: Padding(
  //         padding: kHPadding * 2,
  //         child: ListTileBuilder(data),
  //
  //       ));
  // }
}
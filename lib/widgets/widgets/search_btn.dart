import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/infopage_bloc/infopage_bloc.dart';
import '../utils/constant.dart';

class SearchButtonBuilder extends StatelessWidget {
  const SearchButtonBuilder(
      {Key? key,
        //required this.focusNode,
        required this.name,
        required this.job, required this.focusNode})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController name;
  final TextEditingController job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
       // height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            //primary: Colors.blue,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: kBorderRadius,
            ),
          ),
           // onPressed: (){
           //   Navigator.push(
           //     context,
           //     MaterialPageRoute(builder: (context) => ListTile()),
           //   );
           // },
           onPressed: ()=> BlocProvider.of<NewUserBloc>(context)
               .add(SendData(name.text, job.text)),
          child: Text(
            "Search",
            style: TextStyle(color: Colors.white, fontSize: kfontSize),
          ),
        ),
      ),
    );
  }
}
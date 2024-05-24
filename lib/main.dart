import 'package:flutter/material.dart';
import 'package:formulario_flutter/screens/form_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Formulario Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FormScreen(),
    );
  }
}
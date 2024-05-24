import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí puedes manejar la información del formulario
      print('Nombre: $_name');
      print('Email: $_email');
      print('Fecha de nacimiento: ${_selectedDate.toLocal()}'.split(' ')[0]);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                label: 'Nombre',
                onSaved: (value) => _name = value!,
              ),
              
              SizedBox(height: 9,),
              CustomTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Seleccionar fecha'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


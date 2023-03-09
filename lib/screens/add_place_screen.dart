import 'dart:io';
import '../widgets/image_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/great_places.dart';
class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place')
      ),
      body:  Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
          Expanded(child: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
               TextField(decoration: const InputDecoration(labelText: 'Title'),controller: _titleController), const SizedBox(height: 10,), ImageInput(_selectImage)
            ]),
          ))),
          //https://api.flutter.dev/flutter/material/ButtonStyle-class.html refer for elevated button styling
          ElevatedButton.icon(onPressed: _savePlace, style: ElevatedButton.styleFrom(elevation: 0, tapTargetSize: MaterialTapTargetSize.shrinkWrap, backgroundColor: Theme.of(context).colorScheme.secondary),icon: const Icon(Icons.add), label: const Text('Add Place'))
        ]),
    );
  }
}
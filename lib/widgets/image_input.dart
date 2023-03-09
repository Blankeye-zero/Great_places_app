import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput(this.onSelectImage);
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  Future<void> _takePicture () async{
    final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
       _storedImage = File(imageFile!.path); 
    });
    final appDir = await getApplicationDocumentsDirectory(); // from path_provider.dart
    final fileName = basename(imageFile!.path); // from path.dart
    final savedImage = _storedImage!.copySync('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(_storedImage!,
                  fit: BoxFit.cover, width: double.infinity)
              : const Text('No image Taken', textAlign: TextAlign.center,),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton(
          onPressed: _takePicture,
          style: TextButton.styleFrom(
              textStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary)),
          child: const Text('Take Picture'),
        )),
      ],
    );
  }
}

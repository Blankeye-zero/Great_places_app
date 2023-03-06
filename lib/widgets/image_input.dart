import 'dart:io';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, this.storedImage});

  final storedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
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
          child: widget.storedImage != null
              ? Image.file(widget.storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : const Text('No image Taken', textAlign: TextAlign.center,),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              textStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary)),
          child: const Text('Take Picture'),
        )),
      ],
    );
  }
}

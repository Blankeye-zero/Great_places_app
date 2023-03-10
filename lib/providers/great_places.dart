import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier{
  // Observable. updates state on every listening widget/component

  final List<Place> _items = [];
  // List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage){
    final newPlace = Place(id: DateTime.now().toString(), image: pickedImage, title:pickedTitle, location: PlaceLocation(latitude: 0.0, longitude: 0.0, address: ''));
    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert('places', {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path});
  }
}
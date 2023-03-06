import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier{
  // Observable. updates state on every listening widget/component

  final List<Place> _items = [];
  // List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}
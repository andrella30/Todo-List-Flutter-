import 'package:flutter/material.dart';

class ConstsApp {
  static Icon icones(String index) {
    switch (index) {
      case 'All':
        return 
          Icon(Icons.add_box, color: Colors.blue, size: 30);
        
        break;
      case 'Work':
        return 
          Icon(Icons.card_travel, color: Colors.blue, size: 30);
        
        break;
      case 'Study':
        return 
          Icon(Icons.library_books, color: Colors.blue, size: 30);
        
        break;
      case 'Home':
        return 
          Icon(Icons.home, color: Colors.blue, size: 30);
        
        break;
    }
  }


   static  List<Icon> icons = [
    Icon(Icons.add_box, color: Colors.blue, size: 30),
    Icon(Icons.card_travel, color: Colors.yellow, size: 30),
    Icon(Icons.library_books, color: Colors.purple, size: 30),
    Icon(Icons.home, color: Colors.red, size: 30),
  ];
}

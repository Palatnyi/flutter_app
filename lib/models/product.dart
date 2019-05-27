import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String address;
  final String imageUrl;
  final double price;
  bool isFavourite = false;

  String userId;
  String email;
  String id;

  Product({@required this.title,
      @required this.description,
      this.address,
      @required this.price,
      @required this.imageUrl,
      this.isFavourite = false,
      @required this.userId,
      @required this.email,
      @required this.id});
}

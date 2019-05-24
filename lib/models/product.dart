import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String address;
  final String imageUrl;
  final double price;
  bool isFavourite = false;

  String id;
  String email;

  Product({
    @required this.title,
    @required this.description,
    this.address,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
    @required this.id,
    @required this.email
  });
}

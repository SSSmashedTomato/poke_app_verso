import 'package:flutter/material.dart';

class Pokemon {
  String? id;
  String name = '';
  final String url;
  final String? category;
  String weight = '';
  String height = '';
  final String? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefence;
  int? speed;
  List<String?> types = [];
  List<String?> moves = [];
  Color? pokemonTypeColor = Colors.red;
  String? type;

  Pokemon({
    this.id = '000',
    required this.name,
    required this.url,
    this.type,
    this.category,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefence,
    this.speed,
    this.pokemonTypeColor,
  });

  // the following method is used to retrieve pokemo color based on type
  Color getTypeColor(String type) {
    if (type == 'normal') {
      return const Color.fromRGBO(170, 166, 127, 1);
    }
    if (type == 'grass') {
      return const Color.fromRGBO(116, 203, 72, 1);
    }
    if (type == 'fire') {
      return const Color.fromRGBO(245, 125, 49, 1);
    }
    if (type == 'water') {
      return const Color.fromRGBO(100, 147, 235, 1);
    }
    if (type == 'bug') {
      return const Color.fromRGBO(167, 183, 35, 1);
    }
    if (type == 'electric') {
      return const Color.fromRGBO(249, 207, 48, 1);
    }
    if (type == 'ghost') {
      return const Color.fromRGBO(112, 85, 155, 1);
    }
    if (type == 'psychic') {
      return const Color.fromRGBO(251, 85, 132, 1);
    }
    if (type == 'steel') {
      return const Color.fromRGBO(183, 185, 208, 1);
    }
    if (type == 'rock') {
      return Color.fromARGB(214, 90, 80, 35);
    }
    if (type == 'poison') {
      return const Color.fromRGBO(112, 85, 155, 1);
    }
    if (type == 'ground') {
      return const Color.fromARGB(255, 214, 174, 87);
    }
    if (type == 'ice') {
      return const Color.fromRGBO(93, 150, 255, 1);
    }
    if (type == 'fairy') {
      return const Color.fromARGB(123, 224, 95, 166);
    }
    if (type == 'dark') {
      return const Color.fromARGB(193, 0, 0, 0);
    }
    if (type == 'fighting') {
      return const Color.fromARGB(193, 197, 194, 8);
    }
    if (type == 'dragon') {
      return const Color.fromARGB(193, 53, 206, 206);
    } else {
      return Color.fromARGB(255, 88, 16, 16);
    }
  }
}

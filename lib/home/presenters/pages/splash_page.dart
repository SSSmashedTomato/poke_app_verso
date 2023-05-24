import 'package:flutter/material.dart';

import 'pokedex_home_page.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "SplashPage";
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PokedexHomePage();
  }
}

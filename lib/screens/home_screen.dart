import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in theaters',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Principal Cards
            CardSwiper(),
            //Slider Movies
            MovieSlider(),
            MovieSlider(),
            MovieSlider(),
            MovieSlider(),
            MovieSlider(),
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}

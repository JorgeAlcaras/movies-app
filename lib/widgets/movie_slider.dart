import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      //color: Colors.blue,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Popular Movies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => _MoviePoster(),
          ),
        ),
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/no-image.jpg'),
                    image: NetworkImage('https://via.placeholder.com/130x190'),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover,
                  ))),
          Text(
            'This is a movie name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

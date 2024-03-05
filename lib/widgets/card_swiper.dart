import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.6,
      //color: Colors.red,
      child: Swiper(
          itemCount: movies.length,
          itemWidth: size.width * 0.7,
          itemHeight: size.height * 0.5,
          layout: SwiperLayout.STACK,
          //curve: Curves.bounceOut,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            print(movie.fullPoster);
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(movie.fullPoster),
                ),
              ),
            );
          }),
    );
  }
}

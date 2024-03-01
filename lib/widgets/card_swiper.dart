import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      //color: Colors.red,
      child: Swiper(
          itemCount: 10,
          itemWidth: size.width * 0.7,
          itemHeight: size.height * 0.5,
          layout: SwiperLayout.STACK,
          //curve: Curves.bounceOut,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                ),
              ),
            );
          }),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../urls/urls.dart';
import '../actions/loadCrousel.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchImageList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final images = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 4.5,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: images.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              baseUrl + imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text('No images found'));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        setState(() {
          _scale = 1.0;
        });
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _scale = details.scale;
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(() {
          _scale = 1.0;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(41, 64, 195, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        width: double.infinity,
        child: ClipRect(
          child: Transform.scale(
            scale: _scale,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.white),
              ),
              child: Image.network(
                widget.image,
                colorBlendMode: BlendMode.softLight,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

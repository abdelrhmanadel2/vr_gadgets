import 'package:flutter/material.dart';

class GadgetCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  const GadgetCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          // borderRadius: ,

          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      // elevation: 4,
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                height: 100,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Step Beyond Reality',
                  style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${price.toInt()}',
                  style: textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
            ),

            // Spacer(),
          ],
        ),
        const Positioned(right: 0, child: FavButton()),
        Positioned(
          bottom: -10,
          right: -5,
          child: ElevatedButton(
            onPressed: () {
              // Add to cart action
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFF125945)),
              // backgroundColor: Color(0xFF1A5E3D),
              // padding: EdgeInsets.all(5),
              padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
              ))),

              fixedSize: WidgetStatePropertyAll(Size(40, 40)),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
  });

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            fav = !fav;
          });
        },
        icon: Icon(
          fav ? Icons.favorite : Icons.favorite_border_rounded,
          color: fav ? Colors.red.shade500 : Colors.green.shade800,
        ));
  }
}

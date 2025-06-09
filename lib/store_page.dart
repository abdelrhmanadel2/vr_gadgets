import 'package:flutter/material.dart';
import 'package:vr_gadgets/collection_screen.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = (size.width - 50) / 2;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        // automaticallyImplyLeading: true,
        title: Text(
          "DEINPA",
          style: textTheme.titleLarge?.copyWith(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color(0xFF052623),
              Color(0xFF125945),
              Color(0xFF147350),
              // Color(0xFF0DA16F),
              Color(0xFF0FA66E)
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SectionHeader(
                text: "Collection",
                onPressed: () {},
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          text: "Premuim Gadget innovation",
                          iconSize: 18,
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "with sleek design and \nfuturistic interface",
                          style: textTheme.bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const LearnMoreButton(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Enjoy the innovation",
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            )),
                        Text(
                          "Date 52 November 2024",
                          style: textTheme.labelSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/no-backgroud/background (1).png",
                        height: 150,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryChip(text: "Glasses", onSelected: (c) {}),
                    CategoryChip(text: "Gadget", onSelected: (c) {}),
                    CategoryChip(text: "Reality Goggles", onSelected: (c) {}),
                    CategoryChip(text: "Goggles", onSelected: (c) {}),
                  ],
                ),
              ),
              // const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                        // mainAxisExtent: 165,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return GadgetCard(
                          title: index == 0
                              ? 'Apple Vision Pro'
                              : (index == 1
                                  ? 'HTC’s Project Proton AR'
                                  : (index == 2
                                      ? 'VR SHINECON VR'
                                      : 'Augmented Reality')),
                          price: index == 0
                              ? 180
                              : (index == 1 ? 200 : (index == 2 ? 190 : 210)),
                          imageUrl: "assets/glasses/g (${index + 1}).png");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key, required this.text, this.onSelected});
  final String text;
  final void Function(bool)? onSelected;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilterChip(
          elevation: selected ? 0 : 5,
          padding: EdgeInsets.symmetric(horizontal: 20),
          label: Text(
            widget.text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color.fromARGB(221, 35, 32, 32),
                fontWeight: FontWeight.bold),
          ),
          onSelected: (c) {
            widget.onSelected?.call(c);
            setState(() {
              selected = !selected;
            });
          }),
    );
  }
}

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFF147350),
                    // Color.fromARGB(255, 40, 149, 109),
                    Color.fromARGB(255, 42, 190, 136),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp)),
          child: const Text(
            "Learn More",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.text,
      this.style,
      required this.onPressed,
      this.iconSize});
  final String text;
  final double? iconSize;
  final TextStyle? style;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: style ??
              textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              size: iconSize,
              Icons.arrow_forward,
              color: Colors.white,
            ))
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:slider_button/slider_button.dart';
import 'package:vr_gadgets/login_with_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/background_animation.mp4",
      // videoPlayerOptions: VideoPlayerOptions(
      //   allowBackgroundPlayback: true,
      // )
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: ,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: VideoPlayer(
                        _controller,
                      ),
                    ),
                  ),
                )
              : SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                      "assets/backgroud  (4).jpg",
                    ),
                  ),
                ),

          AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            title: const Text("DEIBPA"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                // borderRadius: BorderRadius.ci
                // rcular(20),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Premium Gadgets \n Enjoy the innovative",
                          style: textTheme.headlineMedium
                              ?.copyWith(color: Colors.white)),
                      Text(
                        "with sleek design and futuristic interface",
                        style: textTheme.labelSmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            )),
                        child: SliderButton(
                            alignLabel: Alignment(0, 0),
                            backgroundColor: Colors.transparent,
                            buttonColor: Colors.green.shade800,
                            action: () async {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const LoginWithImageScreen()),
                              );
                              return false;
                            },
                            buttonSize: 30,
                            height: 45,
                            label: const Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              size: 20,
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                            // Theme(
                            //   data: ThemeData(
                            //       elevatedButtonTheme: ElevatedButtonThemeData(
                            //           style: ButtonStyle(
                            //               backgroundColor: WidgetStatePropertyAll(
                            //                   Colors.green.shade700)))),
                            //   child: ElevatedButton(
                            //       onPressed: () {},
                            //       child: const Text(
                            //         "Get Started",
                            //         style: TextStyle(color: Colors.white),
                            //       )),
                            // ),
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Column(
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.559,
          //     ),
          //     // Spacer(),
          //     BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          //       child: Container(
          //         padding: const EdgeInsets.only(top: 30),
          //         height: MediaQuery.of(context).size.height * 0.35,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: Colors.grey.withOpacity(0.1),
          //         ),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text("Premium Gadgets \n Enjoy the innovative",
          //                 style: textTheme.headlineMedium
          //                     ?.copyWith(color: Colors.white)),
          //             Text(
          //               "with sleek design and futuristic interface",
          //               style:
          //                   textTheme.labelSmall?.copyWith(color: Colors.white),
          //             ),
          //             const SizedBox(
          //               height: 50,
          //             ),
          //             Align(
          //               alignment: Alignment.bottomCenter,
          //               child: SliderButton(
          //                 action: () async {
          //                   return true;
          //                 },
          //                 buttonSize: 30,
          //                 label: const Text(
          //                   ">>>>",
          //                   style: TextStyle(color: Colors.white),
          //                 ),
          //                 icon: ElevatedButton(
          //                     onPressed: () {},
          //                     child: const Text("Get Started")),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

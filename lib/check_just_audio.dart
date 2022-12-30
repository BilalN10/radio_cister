import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radio_app/page_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckAudio extends StatefulWidget {
  const CheckAudio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CheckAudio> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  launchFaceBookURLBrowser() async {
    const url = 'https://www.facebook.com/cisterfm';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchInstaURLBrowser() async {
    const url = 'https://instagram.com/cisterfm?igshid=YmMyMTA2M2Y=';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchYoutubeURLBrowser() async {
    const url = 'https://youtube.com/@radiocister';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchwebURLBrowser() async {
    const url = 'Https://www.cister.fm';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsappURLBrowser() async {
    var whatsapp = 351911995355.toString(); //+92xx enter like this
    String text = '';
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await launch((whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
  // launchWhatsappURLBrowser() async {
  //   if (Platform.isIOS) {
  //     print("asdf");
  //     return "whatsapp://wa.me/351911995355/?text=${Uri.encodeFull('')}";
  //   } else {
  //     return "whatsapp://send?phone=351911995355&text=${Uri.encodeFull('')}";
  //   }
  //   // const url = 'whatsapp://send?phone=351911995355&text=';
  //   // if (await canLaunchUrl(Uri.parse(url))) {
  //   //   await launchUrl(Uri.parse(url));
  //   // } else {
  //   //   throw 'Could not launch $url';
  //   // }
  // }

  bool isShowVolumeBar = false;
  double _value = 0.5;
  bool isVolumeoff = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffd8d8d8),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            height: Adaptive.h(100),
            width: Adaptive.w(100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/mic.png',
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //here is the header
                Container(
                  alignment: Alignment.center,
                  // height: size.height * 0.23,
                  width: Adaptive.w(70),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Adaptive.h(3)),
                    child: Column(
                      children: [
                        Text(
                          'ONLINE PLAYER',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 162, 162, 168),
                              fontSize: Adaptive.px(18),
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        SizedBox(
                            height: Adaptive.h(12),
                            width: size.width * 0.5,
                            child: Image.asset('images/app_logo.png'))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(4),
                ),
                Text(
                  'CHEGAMOS A MAIS DE',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: Adaptive.h(2.5),
                      ),
                ),
                // SizedBox(
                //   height: size.height * 0.005,
                // ),
                Text(
                  'UM MILHÃO',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: Adaptive.h(4.7),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0071bc)),
                ),
                // SizedBox(
                //   height: size.height * 0.005,
                // ),
                Text(
                  'DE PESSOAS EM',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: Adaptive.h(3.5),
                      ),
                ),

                // SizedBox(
                //   height: size.height * 0.005,
                // ),
                Text(
                  '95.5 FM',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: Adaptive.h(7.2),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0071bc)),
                ),
                const Spacer(),
                // SizedBox(
                //   height: Adaptive.h(15),
                // ),
                // Expanded(
                //     child: Padding(
                //   padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                //   child: Slider(
                //       value: _value.toDouble(),
                //       min: 0.0,
                //       max: 1.0,
                //       divisions: 10,
                //       activeColor: const Color(0xff29abe2),
                //       inactiveColor: Colors.white,
                //       label: 'Set volume value',
                //       onChanged: (double newValue) {
                //         setState(() {
                //           _pageManager.volumeOn(newValue);
                //           if (newValue == 0.0) {
                //             isVolumeoff = true;
                //           } else {
                //             isVolumeoff = false;
                //           }

                //           _value = newValue;
                //         });
                //       },
                //       semanticFormatterCallback: (double newValue) {
                //         return '${newValue.round()} dollars';
                //       }),
                // )),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // buttonTile(FontAwesomeIcons.pause, 0,
                      //     _pageManager.pause, 60, 60),

                      MaterialButton(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: _pageManager.pause,
                        child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              FontAwesomeIcons.pause,
                              color: Color(0xff29abe2),
                            )),
                      ),
                      MaterialButton(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: _pageManager.play,
                        child: const Padding(
                            padding: EdgeInsets.all(30),
                            child: Icon(
                              FontAwesomeIcons.play,
                              color: Color(0xff29abe2),
                            )),
                      ),
                      // playButtonTile(
                      //   FontAwesomeIcons.play,
                      //   0,
                      //   _pageManager.play,
                      // ),

                      MaterialButton(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () {
                          setState(() {
                            isShowVolumeBar = !isShowVolumeBar;
                          });
                          if (isVolumeoff) {
                            setState(() {
                              _value = 0.5;
                              _pageManager.volumeOn(_value);
                              isVolumeoff = false;
                            });
                          } else {
                            setState(() {
                              _value = 0.0;
                              _pageManager.volumeOn(_value);
                              //_pageManager.volumeOFf();
                              isVolumeoff = true;
                            });
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              _value == 0.0 || isVolumeoff
                                  ? FontAwesomeIcons.volumeXmark
                                  : FontAwesomeIcons.volumeHigh,
                              color: const Color(0xff29abe2),
                            )),
                      ),
                      // buttonTile(
                      //     isVolumeoff
                      //         ? FontAwesomeIcons.volumeXmark
                      //         : FontAwesomeIcons.volumeHigh,
                      //     0, () {
                      //   if (isVolumeoff) {
                      //     setState(() {
                      //       _pageManager.volumeOn();
                      //       isVolumeoff = false;
                      //     });
                      //   } else {
                      //     setState(() {
                      //       _pageManager.volumeOFf();
                      //       isVolumeoff = true;
                      //     });
                      //   }
                      // }, 60, 60)
                    ],
                  ),
                ),

                SizedBox(
                  height: Adaptive.h(3),
                ),
                Container(
                  height: Adaptive.h(10), //size.height * 0.1,
                  width: Adaptive.w(80), //size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
                        child: Slider(
                            value: _value.toDouble(),
                            min: 0.0,
                            max: 1.0,
                            divisions: 10,
                            activeColor: const Color(0xff29abe2),
                            inactiveColor: Colors.grey,
                            label: 'volume',
                            onChanged: (double newValue) {
                              setState(() {
                                _pageManager.volumeOn(newValue);
                                if (newValue == 0.0) {
                                  isVolumeoff = true;
                                } else {
                                  isVolumeoff = false;
                                }

                                _value = newValue;
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            }),
                      )),
                    ],
                  ),
                ),

                SizedBox(
                  height: Adaptive.h(2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Container(
                    height: Adaptive.h(10), // size.height * 0.1,
                    width: Adaptive.w(100), // size.width * 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchFaceBookURLBrowser();
                            },
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: const Color(0xff0071bc),
                              size: Adaptive.px(40),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              launchInstaURLBrowser();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xff0071bc),
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                                size: Adaptive.px(25),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchYoutubeURLBrowser();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xff0071bc),
                              child: Icon(
                                FontAwesomeIcons.youtube,
                                color: Colors.white,
                                size: Adaptive.px(25),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchwebURLBrowser();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xff0071bc),
                              child: Icon(
                                FontAwesomeIcons.dribbble,
                                color: Colors.white,
                                size: Adaptive.px(25),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchWhatsappURLBrowser();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xff67d449),
                              child: Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                                size: Adaptive.px(25),
                              ),
                            ),
                          ),
                          // CircleAvatar(
                          //   radius: 25,
                          //   backgroundColor: Color(0xff0071bc),
                          //   child:,
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(2),
                ),
                // SizedBox(
                //   height: Adaptive.h(5),
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: ValueListenableBuilder<ProgressBarState>(
                //     valueListenable: _pageManager.progressNotifier,
                //     builder: (_, value, __) {
                //       return ProgressBar(
                //         progress: value.current,
                //         buffered: value.buffered,
                //         total: Duration(seconds: 0),
                //         onSeek: _pageManager.seek,
                //       );
                //     },
                //   ),
                // ),
                // ValueListenableBuilder<ButtonState>(
                //   valueListenable: _pageManager.buttonNotifier,
                //   builder: (_, value, __) {
                //     switch (value) {
                //       case ButtonState.loading:
                //         return Container(
                //           margin: const EdgeInsets.all(8.0),
                //           width: 32.0,
                //           height: 32.0,
                //           child: const CircularProgressIndicator(),
                //         );
                //       case ButtonState.paused:
                //         return playButtonTile(
                //           FontAwesomeIcons.play,
                //           0,
                //           _pageManager.play,
                //         );
                //       // IconButton(
                //       //   icon: const Icon(Icons.play_arrow),
                //       //   iconSize: 32.0,
                //       //   onPressed: _pageManager.play,
                //       // );
                //       case ButtonState.playing:
                //         return IconButton(
                //           icon: const Icon(Icons.pause),
                //           iconSize: 32.0,
                //           onPressed: _pageManager.pause,
                //         );
                //     }
                //   },
                // ),
              ],
            ),
          ),
        )
        //  Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Center(
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: size.height * 0.2,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(20),
        //           child: Image.asset('images/app_logo.png'),
        //         ),
        //         SizedBox(
        //           height: size.height * 0.2,
        //         ),

        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.9,
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10),
        //               boxShadow: const [
        //                 BoxShadow(blurRadius: 10, color: Colors.black12)
        //               ]),
        //           child: Row(
        //             children: [
        //               ValueListenableBuilder<ButtonState>(
        //                 valueListenable: _pageManager.buttonNotifier,
        //                 builder: (_, value, __) {
        //                   switch (value) {
        //                     case ButtonState.loading:
        //                       return Container(
        //                         margin: const EdgeInsets.all(8.0),
        //                         width: 32.0,
        //                         height: 32.0,
        //                         child: const CircularProgressIndicator(),
        //                       );
        //                     case ButtonState.paused:
        //                       return IconButton(
        //                         icon: const Icon(Icons.play_arrow),
        //                         iconSize: 32.0,
        //                         onPressed: _pageManager.play,
        //                       );
        //                     case ButtonState.playing:
        //                       return IconButton(
        //                         icon: const Icon(Icons.pause),
        //                         iconSize: 32.0,
        //                         onPressed: _pageManager.pause,
        //                       );
        //                   }
        //                 },
        //               ),
        //               Stack(
        //                 children: [
        //                   Container(
        //                     height: size.height * 0.04,
        //                     width: size.width * 0.60,
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         Container(
        //                           height: size.height * 0.01,
        //                           width: size.width * 0.60,
        //                           decoration: BoxDecoration(
        //                               color: Colors.blue.shade300,
        //                               borderRadius: BorderRadius.circular(10)),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Positioned(
        //                     right: 0,
        //                     top: 6,
        //                     child: Container(
        //                       height: 20,
        //                       width: 20,
        //                       decoration: const BoxDecoration(
        //                           color: Colors.blue, shape: BoxShape.circle),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //               IconButton(
        //                   onPressed: () {
        //                     if (isVolumeoff) {
        //                       setState(() {
        //                         _pageManager.volumeOn();
        //                         isVolumeoff = false;
        //                       });
        //                     } else {
        //                       setState(() {
        //                         _pageManager.volumeOFf();
        //                         isVolumeoff = true;
        //                       });
        //                     }
        //                   },
        //                   icon: isVolumeoff
        //                       ? const Icon(
        //                           FontAwesomeIcons.volumeXmark,
        //                           size: 20,
        //                         )
        //                       : const Icon(
        //                           FontAwesomeIcons.volumeHigh,
        //                           size: 20,
        //                         ))
        //             ],
        //           ),
        //         ),
        //
        //       ],
        //     ),
        //   ),
        // ),

        );
  }

  Widget buttonTile(
      IconData iconData, int index, Function() onPressed, double h, double w) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff29abe2))),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            color: const Color(0xff29abe2),
          )),
    );
  }

  Widget playButtonTile(
    IconData iconData,
    int index,
    Function() onPressed,
  ) {
    return Container(
        alignment: Alignment.center,
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xff29abe2))),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: 35,
            color: const Color(0xff29abe2),
          ),
        ));
  }
}

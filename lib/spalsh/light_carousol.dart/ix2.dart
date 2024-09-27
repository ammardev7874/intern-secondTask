import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ix2 extends StatefulWidget {
  const Ix2({super.key});

  @override
  State<Ix2> createState() => _Ix2State();
}

class Ix2State {}

class _Ix2State extends State<Ix2> {
  @override
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(children: [
          SizedBox(
            height: height * 0.15,
          ),
          Container(
            child: Column(
              children: [
                const Image(
                    image: AssetImage(
                  "assets/images/Frame (1).png",
                )),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.25,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: const Color(0xff66707A),
                          width: width * 0.0003), // Top border only
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          width * 0.08), // Adjust the radius as needed
                      topRight: Radius.circular(
                          width * 0.08), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.006,
                    ),
                    Container(
                      width: width * 0.1,
                      height: height * 0.003,
                      decoration: BoxDecoration(
                          color: const Color(0xffD1D8DD),
                          borderRadius: BorderRadius.circular(width * 0.1)),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Center(
                      child: SizedBox(
                        width: width * 0.7,
                        height: height * 0.1,
                        child: Text(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          "Let's Connect with Everyone in the World",
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff171725)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.85,
                      child: Text(
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
                            fontSize: height * 0.016, color: const Color(0xff66707A)),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

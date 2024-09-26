import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamp_store/provider/animated_route_provider.dart';
import 'package:lamp_store/screens/cart_screen.dart';
import 'package:lamp_store/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/animation_builder.dart';
import '../provider/items_provider.dart';
import '../widgets/rate_widget.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  final Size startSize;
  final Offset startPosition;

  const DetailsScreen(
      {super.key,
      required this.startSize,
      required this.startPosition,
      required this.index});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = MediaQuery.of(context).size.width * 0.5;
    final endPosition = Offset(
      (screenWidth - imageWidth) / 2,
      11.h,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomAnimatedContainer(
        curve: Curves.easeIn,
        startSize: startSize,
        startPosition: startPosition,
        endSize: Size(imageWidth, MediaQuery.of(context).size.height * 0.38),
        endPosition: endPosition,
        builder: (context, size, position, animationCompleted, onReturn) {
          return Consumer<LampItemProvider>(
              builder: (context, lampProvider, _) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: 55.h,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ZoomIn(
                              animate: animationCompleted,
                              child: GestureDetector(
                                onTap: onReturn,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xfff2f2f2),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_back, color: Colors.black),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    FadeInUp(
                      animate: animationCompleted,
                      child: Container(
                        height: 45.h,
                        decoration: const BoxDecoration(
                            color: Color(0xff4d4672),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: double.infinity, height: 3.h),
                                FadeIn(
                                    delay: const Duration(milliseconds: 700),
                                    animate: animationCompleted,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          title:
                                              lampProvider.lampItems[index].name,
                                          color: Colors.white,
                                          fontSize: 5.2.w,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if(lampProvider.lampItems[index].count>1){
                                                  lampProvider.updateCount(lampProvider.lampItems[index], lampProvider.lampItems[index].count-1);

                                                }
                                              },
                                              child: Container(
                                                height: 8.w,
                                                width: 8.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.orange),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 5.w,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            AnimatedFlipCounter(
                                              value: lampProvider.lampItems[index].count,
                                              duration: const Duration(milliseconds: 700),
                                              textStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 4.7.w,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                lampProvider.updateCount(lampProvider.lampItems[index], lampProvider.lampItems[index].count+1);
                                              },
                                              child: Container(
                                                height: 8.w,
                                                width: 8.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.orange),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 5.w,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                FadeIn(
                                    delay: const Duration(milliseconds: 1000),
                                    animate: animationCompleted,
                                    child: const RateWidget()),
                                SizedBox(
                                  height: 2.h,
                                ),
                                FadeIn(
                                    delay: const Duration(milliseconds: 1300),
                                    animate: animationCompleted,
                                    child: Row(
                                      children: [
                                        SlideInUp(
                                          from: 70,
                                          delay:
                                              const Duration(milliseconds: 1300),
                                          animate: animationCompleted,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.h,
                                                width: 6.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.5),
                                                  child: Image.asset(
                                                      'assets/images/stock.png',
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              CustomTextWidget(
                                                title: "${lampProvider.lampItems[index].voltage} Pcs",
                                                fontSize: 3.5.w,
                                                color:
                                                    Colors.white.withOpacity(0.6),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SlideInUp(
                                          from: 90,
                                          delay:
                                              const Duration(milliseconds: 1500),
                                          animate: animationCompleted,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.h,
                                                width: 6.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: Image.asset(
                                                      'assets/images/size.png',
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              CustomTextWidget(
                                                title:
                                                    "${lampProvider.lampItems[index].sizes.length} sizes",
                                                fontSize: 3.5.w,
                                                color:
                                                    Colors.white.withOpacity(0.6),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SlideInUp(
                                          from: 110,
                                          delay:
                                              const Duration(milliseconds: 1700),
                                          animate: animationCompleted,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.h,
                                                width: 6.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: Image.asset(
                                                      'assets/images/color.png',
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              CustomTextWidget(
                                                title:
                                                    "${lampProvider.lampItems[index].availableColors} colors",
                                                fontSize: 3.5.w,
                                                color:
                                                    Colors.white.withOpacity(0.6),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(height: 1.h),
                                FadeIn(
                                    animate: animationCompleted,
                                    delay: const Duration(milliseconds: 2000),
                                    child: CustomTextWidget(
                                      title: lampProvider
                                          .lampItems[index].description,
                                      color: Colors.white,
                                      maxLines: 5,
                                    )),
                                SizedBox(height: 3.h),
                                FadeIn(
                                  animate: animationCompleted,
                                  delay: const Duration(milliseconds: 2300),
                                  child: Row(
                                    children: [
                                      AnimatedFlipCounter(
                                        prefix: '\$',
                                        value: lampProvider.lampItems[index].price * lampProvider.lampItems[index].count,
                                        duration: const Duration(milliseconds: 700),
                                        textStyle: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 7.w,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                          child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          shadowColor: Colors.transparent,
                                          backgroundColor: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          minimumSize: Size(double.infinity, 6.h),
                                        ),
                                        onPressed: () {
                                          Navigator.push(context, createRoute( CartScreen(
                                              index: index,
                                            startSize: Size(imageWidth, MediaQuery.of(context).size.height * 0.38),
                                            startPosition: endPosition,
                                          )));
                                        },
                                        child: CustomTextWidget(
                                          title: 'Check Out',
                                          fontSize: 5.w,
                                          color: Colors.white,
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: position.dx,
                  top: position.dy,
                  child: Image.asset(
                    lampProvider.lampItems[index].imageUrl,
                    width: size.width,
                    height: size.height,
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}

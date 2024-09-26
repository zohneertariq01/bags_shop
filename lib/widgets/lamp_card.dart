import 'package:flutter/material.dart';
import 'package:lamp_store/provider/items_provider.dart';
import 'package:lamp_store/widgets/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/animated_route_provider.dart';
import '../repos/products_repo.dart';
import '../screens/details_screen.dart';

class LampItemCard extends StatelessWidget {
 final LampItemProvider lampItemProvider;
  final int index;
  final LampItem lamp;
  final double cardHeight;
  final GlobalKey globalKey;

  const LampItemCard({
    super.key,
    required this.lamp,
    required this.cardHeight, required this.globalKey, required this.index, required this.lampItemProvider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final offset = renderBox.localToGlobal(Offset.zero);
        Navigator.of(context).push(createRoute(
          DetailsScreen(
            index: index,
            startSize: size,
            startPosition: offset,
          ),
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  Container(
                    height: cardHeight * 0.77,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xfff2f2f2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(
                          key: globalKey,
                          lamp.imageUrl),
                    ),
                  ),
                  SizedBox(height: cardHeight * 0.04),
                ],
              ),
              GestureDetector(
                onTap: (){
                  lampItemProvider.likeItem(lamp);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Container(
                      height: 3.7.h,
                      width: 3.7.h,
                      decoration: BoxDecoration(
                          color:  Colors.orange.withOpacity(0.05),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: !lamp.isLiked?Colors.blueGrey: Colors.orange.withOpacity(0.5),
                          )),
                      child: Center(
                          child:
                          lamp.isLiked?
                          const Icon(Icons.favorite, color: Colors.orange, size: 18):
                          const Icon(Icons.favorite_outline_rounded, color: Colors.blueGrey, size: 18)
                      ),
                    )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, bottom: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextWidget(
                    title: lamp.name,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff4d4672)),
                const SizedBox(height: 4),
                CustomTextWidget(
                    title: '\$${lamp.price.toString()}',
                    color: const Color(0xfffa5a04)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

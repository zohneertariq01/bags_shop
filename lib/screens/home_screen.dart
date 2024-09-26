import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lamp_store/provider/items_provider.dart';
import 'package:lamp_store/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/custom_tab.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/lamp_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff2f2f2),
              ),
              child: const Icon(Icons.menu_rounded, color: Colors.black)),
        ),
        title: CustomTextWidget(title: 'Bag Boutique',fontSize: 6.4.w,fontWeight: FontWeight.w600),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff2f2f2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.black),
                )),
          ),
        ],
        bottom: TabBar(
          dividerHeight: 0,
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicator: const DotIndicator(color: Colors.orange),
          splashFactory: NoSplash.splashFactory,
          indicatorPadding: EdgeInsets.only(bottom: 2.h),
          tabs: [
            NoSplashTab(text: 'New', tabIndex: 0, controller: _tabController!),
            NoSplashTab(text: 'Popular', tabIndex: 1, controller: _tabController!),
            NoSplashTab(text: 'Trending', tabIndex: 2, controller: _tabController!),
            NoSplashTab(text: 'Best Selling', tabIndex: 3, controller: _tabController!),
          ],
        ),
      ),
      body: Consumer<LampItemProvider>(
        builder: (context,lampProvider,_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: lampProvider.lampItems.length,
              itemBuilder: (context, index) {
                GlobalKey key = GlobalKey();

                return LayoutBuilder(
                  builder: (context, constraints) {
                    double cardHeight = constraints.maxHeight;
                    return FadeInUp(
                      child: LampItemCard(
                        lampItemProvider: lampProvider,
                        index: index,
                        globalKey: key,
                        lamp: lampProvider.lampItems[index],
                        cardHeight: cardHeight,
                      ),
                    );
                  },
                );
              },
            )

          );
        }
      ),
    );
  }
}











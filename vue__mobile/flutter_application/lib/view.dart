// ignore_for_file: camel_case_types
import 'package:flutter_application/tabPages/about.dart';
import 'package:flutter_application/tabPages/facts.dart';
import 'package:flutter_application/tabPages/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

final _controller = PageController();

class _viewState extends State<view> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 243,
              child: PageView(
                controller: _controller,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/3d-electric-car-building_23-2148972401.jpg?w=1480&t=st=1677513147~exp=1677513747~hmac=6b3d8b9d4d3177da73b76bf952aee3e930eefa3be23ec353ccc4a09de5b4905c',
                      height: 250,
                      width: 360,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=1600',
                      height: 250,
                      width: 360,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://images.pexels.com/photos/1612351/pexels-photo-1612351.jpeg?auto=compress&cs=tinysrgb&w=1600',
                      height: 250,
                      width: 360,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.red,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'About',
                          ),
                          Tab(
                            text: 'Services',
                          ),
                          Tab(
                            text: 'Fact',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: TabBarView(
                controller: tabController,
                children: const [
                  about(),
                  services(),
                  facts(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

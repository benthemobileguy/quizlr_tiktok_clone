import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  final TabController tabController;
 const HeaderHomePage({
    Key? key, 
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      color: Colors.black,
      child: Row(
        children: [
          const SizedBox(width: 4),
          Icon(
            Icons.timer,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(width: 3),
          const Opacity(
            opacity: 0.6,
            child: Text(
              '10m',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
           Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.white,
                  ),
                  insets: EdgeInsets.symmetric(
                      horizontal: 2), // Desired insets for the indicator
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'For You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
            
            },
            icon: const Icon(
              Icons.search,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

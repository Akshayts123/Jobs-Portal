import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/screens/drawer.dart';
import 'package:job_portal/commons/search_filter.dart';
import 'package:job_portal/commons/widgets/custom_bottom_sheet.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/custom_image_network.dart';
import 'package:job_portal/screens/appliedScreen/applied_screen.dart';
import 'package:job_portal/screens/bookmarkScreen/bookmark_screen.dart';
import 'package:job_portal/screens/forumScreen/forum_screen.dart';
import 'package:job_portal/screens/homeScreen/home_screen.dart';
import 'package:job_portal/screens/inboxScreen/inbox_screen.dart';
import 'package:job_portal/screens/notificationScreen/notification_screen.dart';
import 'package:job_portal/screens/settingsScreen/qrCodeScanner/qr_scanner.dart';
import 'package:job_portal/screens/signUpScreen/sign_up_screen.dart';
import 'package:job_portal/utils/dialogue_loading.dart';
import 'package:job_portal/utils/location_service.dart';
import 'package:job_portal/utils/show_snackbar.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class MainScreen extends HookWidget {
  static const String routeName = "mainScreen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      ApplicationsAppliedScreen(),
      forumScreen(),
      InboxScreen(),
      BookmarkScreen(),
    ];
    final indexState = useState(0);
    final bottomState = useState(true);
    final controller = useScrollController();
    final location = useState('');

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Color.fromARGB(255, 253, 254, 255),
      drawer: appDrawer(context),

      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(
      //     indexState.value != 0 ? 70 : 150,
      //   ),
      //   child: Container(
      //     // height: indexState.value != 0 ? 100 : 180,
      //     // duration: const Duration(
      //     //   milliseconds: 800,
      //     // ),
      //     clipBehavior: Clip.hardEdge,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(0
      //             // indexState.value != 0 ? 0 : 30,
      //             ),
      //         bottomRight: Radius.circular(0
      //             // indexState.value != 0 ? 0 : 30,
      //             ),
      //       ),
      //     ),
      //     child: AppBar(
      //       automaticallyImplyLeading: false,
      //       title: Row(
      //         children: [
      //           Icon(
      //             Icons.location_on_outlined,
      //             color: whiteColor,
      //             size: 20,
      //           ),
      //           const SizedBox(
      //             width: 5,
      //           ),
      //           Text(
      //             'Kozhikode Railways',
      //             style: fontSize.titleMedium(
      //               context,
      //               color: lightblackColor,
      //             ),
      //           ),
      //         ],
      //       ),
      //       bottom: indexState.value != 0
      //           ? null
      //           : PreferredSize(
      //               preferredSize: Size.fromHeight(0),
      //               child: SingleChildScrollView(
      //                 child: Column(
      //                   // shrinkWrap: true,
      //                   children: [
      //                     // "0,0,20,20".padding(
      //                     //   Text(
      //                     //     "Find the job you've always dreamed of.",
      //                     //     style: fontSize.headline5(
      //                     //       context,
      //                     //       color: blackColor,
      //                     //     ),
      //                     //   ),
      //                     // ),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           margin: const EdgeInsets.symmetric(
      //                             vertical: 20,
      //                             horizontal: 15,
      //                           ),
      //                           height: 55,
      //                           width: width(context) * .72,
      //                           decoration: BoxDecoration(
      //                             color: whiteColor.withOpacity(.9),
      //                             borderRadius: BorderRadius.circular(
      //                               20,
      //                             ),
      //                           ),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Icon(
      //                                 Icons.search,
      //                                 color: greyColor,
      //                                 size: 20,
      //                               ),
      //                               Text(
      //                                 "Search for companies, job titles ...",
      //                                 style: fontSize.bodyLarge(
      //                                   context,
      //                                   color: greyColor,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                             margin: const EdgeInsets.symmetric(
      //                               vertical: 10,
      //                               horizontal: 5,
      //                             ),
      //                             height: 55,
      //                             width: 55,
      //                             decoration: BoxDecoration(
      //                               color: blackColor.withOpacity(.9),
      //                               borderRadius: BorderRadius.circular(
      //                                 20,
      //                               ),
      //                             ),
      //                             child: Icon(
      //                               Icons.filter_list_rounded,
      //                               color: whiteColor,
      //                             )),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Stack(
      //           children: [
      //             // Lottie.asset("assets/lottie/fluid-top.json",
      //             //     width: double.infinity, fit: BoxFit.cover),
      //             Container(
      //               width: double.infinity,
      //               decoration: const BoxDecoration(
      //                 gradient: appGradient,
      //               ),
      //               // child: Lottie.asset("assets/lottie/background.json",
      //               //     width: double.infinity, fit: BoxFit.cover),
      //             ),
      //             // Lottie.asset(
      //             //   "assets/lottie/fluid-top.json",
      //             //   width: double.infinity,
      //             //   height: double.infinity,
      //             //   fit: BoxFit.fill,
      //             // ),
      //           ],
      //         ),
      //       ),
      //       actions: [
      //         IconButton(
      //           onPressed: () {
      //             print('notification');
      //           },
      //           icon: Icon(
      //             Icons.notifications_active_outlined,
      //             color: lightblackColor,
      //             size: 30,
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 10,
      //         ),
      //         customNetworkImage(
      //             "https://i.pinimg.com/564x/13/86/bd/1386bda3e7bc16a351b8551646885825.jpg", 35),
      //         const SizedBox(
      //           width: 15,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          fixedColor: blackColor,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          currentIndex: indexState.value,
          onTap: (e) {
            indexState.value = e;
            // if (e == 0) {
            // bottom();
            if (controller.position.pixels != 0.0) {
              controller.animateTo(
                0.0,
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
              );
            }
            // }
          },
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              tooltip: "Home",
              icon: iconAssetImage("assets/icons/home-white.png"),
              activeIcon: iconAssetImage(
                "assets/icons/home.png",
                null,
                primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Applied",
              icon: iconAssetImage("assets/icons/applied-white.png"),
              activeIcon: iconAssetImage(
                "assets/icons/applied.png",
                null,
                primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Forum",
              icon: iconAssetImage(
                "assets/icons/forum.png",
                32,
              ),
              // activeIcon: iconAssetImage("assets/icons/cart.png"),
            ),
            BottomNavigationBarItem(
              label: "Inbox",
              icon: iconAssetImage("assets/icons/chat-white.png", 30),
              activeIcon: iconAssetImage(
                "assets/icons/chat.png",
                null,
                primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: iconAssetImage("assets/icons/bookmark-white.png"),
              activeIcon: iconAssetImage(
                "assets/icons/bookmark.png",
                null,
                primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: primaryLight,
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: blackColor,
              ),
            ),
            pinned: true,
            title: InkWell(
              onTap: () async {
                customDialogueLoading(context);
                final loc = await determinePosition();
                if (loc == null) {
                  showSnackBar(
                    context,
                    "Please provide location to help with better user experience.",
                  );
                  Navigator.pop(context);
                  return;
                }
                Navigator.pop(context);
                location.value = loc ?? '';
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: blackColor,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    location.value == '' ? 'No location' : location.value,
                    style: fontSize.titleMedium(
                      context,
                      color: blackColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: blackColor,
                  ),
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    QrcodeScannerScreen.routeName,
                  );
                },
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 25,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NotificationScreen.routeName);
                  print('notification');
                },
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: blackColor,
                        size: 25,
                      ),
                      Positioned(
                        top: -4,
                        left: -4,
                        child: Container(
                          padding: const EdgeInsets.all(
                            2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            color: Colors.red,
                          ),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              // customNetworkImage(
              //     "https://i.pinimg.com/564x/13/86/bd/1386bda3e7bc16a351b8551646885825.jpg", 35),
              // const SizedBox(
              //   width: 15,
              // ),
            ],
            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
              // expandedTitleScale: 1,
              // title: Text('IDEALS'),
              background: indexState.value != 0
                  ? null
                  : Container(
                      decoration: BoxDecoration(
                        gradient: appGradient,
                      ),
                      child: SearchAndfilter(),
                    ),
            ),
            expandedHeight: indexState.value != 0 ? null : 150,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                screens[indexState.value],
              ],
            ),
          ),
        ],
      ),

      //  SingleChildScrollView(
      //   controller: controller,
      //   child: screens[indexState.value],
      // ),
    );
  }
}

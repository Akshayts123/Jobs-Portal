import 'package:flutter/material.dart';
import 'package:job_portal/commons/widgets/custom_drawer_widget.dart';
import 'package:job_portal/commons/widgets/round_bg_widget.dart';
import 'package:job_portal/screens/settingsScreen/faqScreen/faq_screen.dart';
import 'package:job_portal/screens/settingsScreen/generalSettings/general_settings.dart';
import 'package:job_portal/screens/settingsScreen/helpCenterScreen/help_center_screen.dart';
import 'package:job_portal/screens/settingsScreen/personalInfo/personal_info.dart';
import 'package:job_portal/screens/settingsScreen/skillsScreen/skills_screen.dart';
import 'package:job_portal/screens/settingsScreen/workExperience/work_experience.dart';
import 'package:job_portal/screens/settingsScreen/uploadResumeScreen/upload_resume.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

Drawer appDrawer(BuildContext context) => Drawer(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            // expandedTitleScale: 1,
            // title: Text('IDEALS'),
            background: Container(
              decoration: BoxDecoration(
                gradient: appGradient,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Row(
              children: [
                "10,10,15,10".padding(
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadowGrey,
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/loggin.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aravind KB",
                      style: fontSize.titleSmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "+91 -9526144234",
                      style: fontSize.titleSmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customDrawerTile(
                  context,
                  title: "Personal Info",
                  icon: Icons.person,
                  subtitles: 'name | phone',
                  function: () {
                    Navigator.pushNamed(context, PersonalInfoScreen.routeName);
                    print('personal info');
                  },
                ),
                customDrawerTile(
                  context,
                  title: "Work Experience",
                  icon: Icons.work_history_rounded,
                  subtitles: 'experience | company | job roles',
                  function: () {
                    Navigator.pushNamed(context, WorkExperience.routeName);
                    print('Work Experience');
                  },
                ),
                customDrawerTile(
                  context,
                  title: "Skills",
                  icon: Icons.thumb_up_alt_rounded,
                  subtitles: 'what you are good at',
                  function: () {
                    Navigator.pushNamed(context, SkillsScreen.routeName);
                    print('settings');
                  },
                ),
                customDrawerTile(
                  context,
                  title: "Resume",
                  icon: Icons.file_copy_rounded,
                  subtitles: 'pdf | image - resume | cv',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UploadResumeScreen(),
                      ),
                    );
                    print('resume');
                  },
                ),
                customDrawerTile(
                  context,
                  title: "Settings",
                  icon: Icons.settings,
                  subtitles: 'general',
                  function: () {
                    Navigator.pushNamed(context, GeneralSettings.routeName);
                    print('settings');
                  },
                ),
                Divider(),
                lightCustomDrawerWidget(
                  context,
                  title: "Terms And Conditions",
                  function: () {
                    print('in app web view ');
                  },
                ),
                // Divider(),
                lightCustomDrawerWidget(
                  context,
                  title: "Privacy Policy",
                  function: () async {
                    await launchUrl(
                      Uri.parse("https://www.dribbble.com"),
                      mode: LaunchMode.inAppWebView,
                      webOnlyWindowName: "Privacy Policy",
                    );
                    print('in app web view ');
                  },
                ),
                // Divider(),
                lightCustomDrawerWidget(
                  context,
                  title: "About Us",
                  function: () {
                    print('in app web view ');
                  },
                ),
                lightCustomDrawerWidget(
                  context,
                  title: "FAQ",
                  function: () {
                    Navigator.pushNamed(context, FAQScreen.routeName);
                  },
                ),
                lightCustomDrawerWidget(
                  context,
                  title: "Help Center",
                  function: () {
                    Navigator.pushNamed(context, HelpCenterScreen.routeName);
                  },
                ),
                Divider(),
                customDrawerTile(
                  context,
                  title: "Logg Out",
                  icon: Icons.power_settings_new_rounded,
                  function: () {
                    print('log out');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

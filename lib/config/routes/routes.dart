import 'package:flutter/material.dart';
import 'package:job_portal/config/custom_page_route.dart';
import 'package:job_portal/screens/categoryViewScreen/category_screen.dart';
import 'package:job_portal/screens/forumScreen/forum_screen.dart';
import 'package:job_portal/screens/forumScreen/screens/form_view_post.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/screens/gettingStartedScreen/create_account_screen.dart';
import 'package:job_portal/screens/gettingStartedScreen/getting_started_screen.dart';
import 'package:job_portal/screens/gettingStartedScreen/select_interested_job.dart';
import 'package:job_portal/screens/gettingStartedScreen/select_qualification_screen.dart';
import 'package:job_portal/screens/guideScreen/guide_screen.dart';
import 'package:job_portal/screens/homeScreen/home_screen.dart';
import 'package:job_portal/screens/inboxScreen/sub_screens/chat_screen.dart';
import 'package:job_portal/screens/loginScreen/login_screen.dart';
import 'package:job_portal/screens/mainScreen/main_screen.dart';
import 'package:job_portal/screens/notificationScreen/notification_screen.dart';
import 'package:job_portal/screens/searchScreen/search_screen.dart';
import 'package:job_portal/screens/settingsScreen/faqScreen/faq_screen.dart';
import 'package:job_portal/screens/settingsScreen/generalSettings/general_settings.dart';
import 'package:job_portal/screens/settingsScreen/helpCenterScreen/help_center_screen.dart';
import 'package:job_portal/screens/settingsScreen/personalInfo/personal_info.dart';
import 'package:job_portal/screens/settingsScreen/qrCodeScanner/qr_scanner.dart';
import 'package:job_portal/screens/settingsScreen/skillsScreen/skills_screen.dart';
import 'package:job_portal/screens/settingsScreen/workExperience/work_experience.dart';
import 'package:job_portal/screens/signUpScreen/sign_up_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //guide screen -----
      case GuideScreen.routeName:
        {
          return _route(
            GuideScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //getting started screen screen -----
      case GettingStartedScreen.routeName:
        {
          return _route(
            GettingStartedScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //create account screen -----
      case CreateAccountScreen.routeName:
        {
          return _route(
            CreateAccountScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //select qualification screen -----
      case SelectQualificationScreen.routeName:
        {
          return _route(
            SelectQualificationScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //select job of interest screen -----
      case SelectJobOfInterestScreen.routeName:
        {
          return _route(
            SelectJobOfInterestScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //login screen -----
      case LoginScreen.routeName:
        {
          return _route(
            LoginScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      ////sign up screen -----
      case SignUpScreen.routeName:
        {
          return _route(
            SignUpScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }

      //main screen -----
      case MainScreen.routeName:
        {
          return _route(
            MainScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //search screen -----
      case SearchScreen.routeName:
        {
          return _route(
            SearchScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //home screen -----
      case HomeScreen.routeName:
        {
          return _route(
            HomeScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //get one job screen -----
      case GetOneJob.routeName:
        {
          return _route(
            GetOneJob(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //chat screen -----
      case ChatScreen.routeName:
        {
          return _route(
            ChatScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //notification screen -----
      case NotificationScreen.routeName:
        {
          return _route(
            NotificationScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //general settings screen -----
      case GeneralSettings.routeName:
        {
          return _route(
            GeneralSettings(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //personal info screen -----
      case PersonalInfoScreen.routeName:
        {
          return _route(
            PersonalInfoScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //work experience screen -----
      case WorkExperience.routeName:
        {
          return _route(
            WorkExperience(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //skills screen -----
      case SkillsScreen.routeName:
        {
          return _route(
            SkillsScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //category view screen -----
      case CategoryViewScreen.routeName:
        {
          return _route(
            CategoryViewScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //forum screen -----
      case forumScreen.routeName:
        {
          return _route(
            forumScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //forum view post screen -----
      case ForumViewPost.routeName:
        {
          return _route(
            ForumViewPost(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //qr code scanner screen -----
      case QrcodeScannerScreen.routeName:
        {
          return _route(
            QrcodeScannerScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //FAQ screen -----
      case FAQScreen.routeName:
        {
          return _route(
            FAQScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      //Help Center screen -----
      case HelpCenterScreen.routeName:
        {
          return _route(
            HelpCenterScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
      default:
        {
          return _route(
            GuideScreen(),
            AxisDirection.up,
            routeSettings,
          );
        }
    }
  }

  static _route(Widget widget, AxisDirection direction, RouteSettings settings) {
    return CustomPageRoute(child: widget, direction: direction, settings: settings);
  }
}

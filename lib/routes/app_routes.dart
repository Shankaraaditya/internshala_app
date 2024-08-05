import 'package:get/get.dart';
import 'package:internshala_app/presentation/controllers/home/home_binding.dart';
import 'package:internshala_app/presentation/views/filter/filter_view.dart';
import 'package:internshala_app/presentation/views/filter/widgets/location_filter.dart';
import 'package:internshala_app/presentation/views/filter/widgets/profile_filter.dart';
import 'package:internshala_app/presentation/views/home/home_page.dart';
import 'package:internshala_app/presentation/views/splash/splash_screen.dart';


class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String filter = '/filters';
  static const String profileFilter = '/profilefilter';
  static const String locationFilter = '/locationfilter';


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen(),binding: HomeBinding()),
    GetPage(name: filter, page: () => FilterView()),
    GetPage(name: profileFilter, page: () => const ProfileFilterView()),
    GetPage(name: locationFilter, page: () => const LocationFilterView()),
  ];
}

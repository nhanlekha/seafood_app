import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/domans/repo/impl/cate_repo_impl.dart';
import 'package:seafood_app/domans/repo/impl/order_repo_impl.dart';
import 'package:seafood_app/domans/repo/impl/product_repo_impl.dart';
import 'package:seafood_app/domans/repo/impl/slide_repo_impl.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:seafood_app/screens/onbroarding/onboarding_page_view.dart';
import 'package:seafood_app/screens/page/login_screens/login_screens.dart';
import 'package:seafood_app/screens/page/main_screens/main_screens.dart';

import 'domans/database_local/app_database.dart';
import 'domans/repo/impl/auth_repo_impl.dart';
import 'domans/repo/impl/cart_repo_impl.dart';
import 'domans/repo/impl/checkout_repo_impl.dart';
import 'domans/repo/slide_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("vi"), Locale("en")],
      path: "assets/translations",
      child: const SeafoodApp(),
    ),
  );
}

class SeafoodApp extends StatefulWidget {
  const SeafoodApp({super.key});

  @override
  State<SeafoodApp> createState() => _SeafoodAppState();
}

class _SeafoodAppState extends State<SeafoodApp> {
  late final SeafoodApi _seafoodApi;
  late final SlideRepo _slideRepo;
  late final CateRepo _cateRepo;
  late final ProductRepo _productRepo;
  late final AppDatabase _db;
  late final CartRepoImpl _cartRepo;
  late final CheckoutRepoImpl _checkoutRepo;
  late final OrderRepoImpl _orderRepo;
  late final AuthRepoImpl _authRepo;

  @override
  void initState() {
    super.initState();
    // Initializing
    _db = AppDatabase();
    _cartRepo = CartRepoImpl(_db);
    _seafoodApi = SeafoodApi();
    _slideRepo = SlideRepoImpl(seafoodApi: _seafoodApi);
    _cateRepo = CateRepoImpl(seafoodApi: _seafoodApi);
    _productRepo = ProductRepoImpl(seafoodApi: _seafoodApi);
    _checkoutRepo = CheckoutRepoImpl(seafoodApi: _seafoodApi);
    _orderRepo = OrderRepoImpl(seafoodApi: _seafoodApi);
    _authRepo = AuthRepoImpl(seafoodApi: _seafoodApi);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SlideRepo>(create: (context) => _slideRepo),
        RepositoryProvider<CateRepo>(create: (context) => _cateRepo),
        RepositoryProvider<ProductRepo>(create: (context) => _productRepo),
        RepositoryProvider<CartRepoImpl>(create: (context) => _cartRepo),
        RepositoryProvider<CheckoutRepoImpl>(
            create: (context) => _checkoutRepo),
        RepositoryProvider<OrderRepoImpl>(create: (context) => _orderRepo),
        RepositoryProvider<AuthRepoImpl>(create: (context) => _authRepo),
      ],
      child: const ApplicationRouter(),
    );
  }
}

class ApplicationRouter extends StatelessWidget {
  const ApplicationRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.returnRouter(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[100], // Status bar color
    ));
    return const Scaffold(
        body: SafeArea(
      child: OnboardingPageView(),
    ));
  }
}


class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: MainScreens())), // Màn hình chính của ứng dụng
    );
  }
}
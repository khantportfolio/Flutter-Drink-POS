// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/option_vo.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_for_option_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_topping_vo.dart';
import 'package:multipurpose_pos_application/persistence/hive/constants/hive_constants.dart';
import 'package:multipurpose_pos_application/view/inventory/screen/inventory_screen.dart';
import 'package:multipurpose_pos_application/view/main_login/screen/main_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  await Hive.initFlutter();
  Hive.registerAdapter(RequestSizeObjectVOAdapter());
  Hive.registerAdapter(RequestIngredientVOAdapter());
  Hive.registerAdapter(ProductVOAdapter());
  Hive.registerAdapter(OptionVOAdapter());
  Hive.registerAdapter(RawMaterialForOptionVOAdapter());
  Hive.registerAdapter(RequestToppingVOAdapter());
  await Hive.openBox<RequestSizeObjectVO>(BOX_NAME_SIZE_WITH_INGREDIENT_VO);
  await Hive.openBox<ProductVO>(BOX_NAME_PRODUCT_VO);
  MultiPosRepoModel multiPosRepoModel = MultiPosRepoModelImpl();
  multiPosRepoModel.clearSizeWithIngredients();
  int userId = await multiPosRepoModel.getInt(USER_ID);
  runApp(MyApp(
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  int? userId;
  MyApp({
    super.key,
    this.userId,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (userId != null && userId != 0)
          ? const InventoryScreen()
          : const MainLoginScreen(),
    );
  }
}

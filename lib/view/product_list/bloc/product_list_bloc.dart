import 'package:flutter/foundation.dart';
import 'package:multipurpose_pos_application/core/core_config/config_text.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model.dart';
import 'package:multipurpose_pos_application/data/repo_model/multi_pos_repo_model_impl.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/raw_material_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_ingredient_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_product_vo.dart';
import 'package:multipurpose_pos_application/data/vos/request_size_object_vo.dart';

class ProductListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<ProductVO>? productList = [];
  List<RequestIngredientVO>? requestIngredientList = [];
  List<RawMaterialVO>? rawMaterialList = [];
  List<String> rawMaterialNameList = [];
  bool visibleRegister = false;
  String? rawMaterialName;
  String? name;
  int? amount;
  int? rawMaterialId;

  ProductListBloc() {
    _showLoading();
    _multiPosRepoModel.getAllProducts().listen((event) {
      productList = event;
      _notifySafely();
      if (productList!.isEmpty) {
        _multiPosRepoModel.postProductListResponse().then((value) {
          productList = value.products;
          _notifySafely();
          _multiPosRepoModel.saveAllProducts(productList);
        });
      }
      _multiPosRepoModel.postRawMaterialResponse().then((response) {
        rawMaterialList = response.rawMaterials;
        rawMaterialList?.sort((a, b) => b.id!.compareTo(a.id!));
        rawMaterialNameList =
            rawMaterialList?.map((e) => e.name ?? "").toList() ?? [];
        _notifySafely();
        _hideLoading();
      });
    });
  }

  Future<int> onTapRegister(List<RequestIngredientVO> requestIngredientList) {
    return _multiPosRepoModel.postStoreOption(requestIngredientList);
  }

  Future onTapDelete(int? id) {
    isApiCalling = true;
    _notifySafely();
    var product = RequestProductVO(productId: id);
    return _multiPosRepoModel.postProductDeleteResponse(product).then((value) {
      _multiPosRepoModel.clearProducts();
      isApiCalling = false;
      _notifySafely();
    });
  }

  Future onTapAddIngredient(
      List<RequestSizeObjectVO?>? requestSizeObjList, int? productId) {
    _multiPosRepoModel.saveInt(PRODUCT_ID, productId ?? 0);
    requestSizeObjList?.forEach((element) {
      var timeString =
          DateTime.now().microsecondsSinceEpoch.toString().substring(4);
      element?.timeStamp = timeString;
    });
    return _multiPosRepoModel.saveAllSizeOfIngredients(requestSizeObjList);
  }

  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}

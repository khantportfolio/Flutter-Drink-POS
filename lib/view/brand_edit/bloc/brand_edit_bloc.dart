// import 'package:flutter/cupertino.dart';

// import 'package:multipurpose_pos_application/core/core_function/functions.dart';
// import '../../../data/repo_model/multi_pos_repo_model.dart';
// import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
// import '../../../data/vos/category_vo.dart';
// import '../../../data/vos/brand_vo.dart';
// import '../../../data/vos/request_brand_update_vo.dart';

// class BrandEditBloc extends ChangeNotifier {
//   /// Bloc state
//   bool isDisposed = false;

//   /// Dependencies
//   final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

//   /// Loading State
//   bool isLoading = false;

//   /// Screen States
//   int? brandId;
//   int? categoryId;
//   String? brandName;
//   String? countryOfRegion;

//   String? categoryName;
//   BrandVO? brandVO;

//   List<CategoryVO>? categoryList = [];
//   List<String>? categoryNameList = [];

//   FocusNode firstFocusNode = FocusNode();
//   FocusNode secondFocusNode = FocusNode();

//   Future _prePopulateBeforeEdit(BrandVO? brandVO) async {
//     this.brandVO = brandVO;
//     brandId = this.brandVO?.id;
//     categoryId = this.brandVO?.categoryId;
//     brandName = this.brandVO?.name;
//     countryOfRegion = this.brandVO?.countryOfOrigin;
//     for (var i = 0; i < categoryList!.length; i++) {
//       if (categoryList![i].id == categoryId) {
//         categoryName = categoryList![i].name;
//         Functions.toast(msg: "${categoryName}");
//         _notifySafely();
//         break;
//       }
//     }
//     _notifySafely();
//   }

//   BrandEditBloc(BrandVO? brandVO) {
//     _showLoading();
//     _multiPosRepoModel.postCategoryListResponse().then((response) {
//       categoryList = response.categories;
//     });
//     categoryName = "nam";
//     //categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
//     //categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];
//     this.brandVO = brandVO;
//     brandId = this.brandVO?.id;
//     categoryId = this.brandVO?.categoryId;
//     brandName = this.brandVO?.name;
//     countryOfRegion = this.brandVO?.countryOfOrigin;
//     for (var i = 0; i < categoryList!.length; i++) {
//       if (categoryList![i].id == categoryId) {
//         categoryName = categoryList![i].name;
//         Functions.toast(msg: "${categoryName}");
//         break;
//       }
//     }
//     _hideLoading();
//     _notifySafely();
//   }

//   Future categoryIdtoString(int id) async {
//     for (var i = 0; i < categoryList!.length; i++) {
//       if (categoryList![i].id == id) {
//         categoryName = categoryList![i].name;
//       }
//     }
//   }

//   void populateCategoryList(int? id) {
//     _multiPosRepoModel.postCategoryListResponse().then((response) {
//       categoryList = response.categories;
//       categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
//       categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];

//       for (var i = 0; i < categoryList!.length; i++) {
//         if (categoryList![i].id == id) {
//           categoryName = categoryList![i].name;
//           Functions.toast(msg: "${categoryName}");
//           _notifySafely();
//           break;
//         }
//       }
//       _notifySafely();
//     });
//   }

//   Future onTapEdit() {
//     _showLoading();
//     if (categoryId != null &&
//         brandName != null &&
//         brandName != "" &&
//         countryOfRegion != null &&
//         countryOfRegion != "") {
//       RequestBrandUpdateVO requestBrandUpdateVO = RequestBrandUpdateVO(
//           brandId: brandId,
//           name: brandName,
//           categoryId: categoryId,
//           countryOfOrigin: countryOfRegion);
//       return _multiPosRepoModel
//           .postBrandUpdateResponse(requestBrandUpdateVO)
//           .then((value) => _hideLoading());
//     } else {
//       _hideLoading();
//       return Future.error("Fail to edit");
//     }
//   }

//   void onFirstEditingComplete() {
//     firstFocusNode.unfocus();
//     secondFocusNode.requestFocus();
//     _notifySafely();
//   }

//   void onSecondEditingComplete() {
//     secondFocusNode.unfocus();
//     _notifySafely();
//   }

//   void onChooseCategoryName(String? name) {
//     for (var i = 0; i < categoryList!.length; i++) {
//       if (categoryList![i].name == name) {
//         categoryId = categoryList![i].id;
//         categoryName = categoryList![i].name;
//         _notifySafely();
//         break;
//       }
//     }
//     _notifySafely();
//   }

//   void onChangeBrandName(String? brandName) {
//     this.brandName = brandName;
//     _notifySafely();
//   }

//   void onChangeCountryOfRegion(String? countryOfRegion) {
//     this.countryOfRegion = countryOfRegion;
//     _notifySafely();
//   }

//   void _showLoading() {
//     isLoading = true;
//     _notifySafely();
//   }

//   void _hideLoading() {
//     isLoading = false;
//     _notifySafely();
//   }

//   void _notifySafely() {
//     if (!isDisposed) {
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     isDisposed = true;
//   }
// }

import 'package:flutter/cupertino.dart';

import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/category_vo.dart';
import '../../../data/vos/brand_vo.dart';
import '../../../data/vos/request_brand_update_vo.dart';

class BrandEditBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen States
  int? brandId;
  int? categoryId;
  String? brandName;
  String? countryOfRegion;

  String? categoryName;
  BrandVO? brandVO;

  List<CategoryVO>? categoryList = [];
  List<String>? categoryNameList = [];

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();

  Future _prePopulateBeforeEdit(BrandVO? brandVO) async {
    this.brandVO = brandVO;
    brandId = this.brandVO?.id;
    categoryId = this.brandVO?.categoryId;
    brandName = this.brandVO?.name;
    countryOfRegion = this.brandVO?.countryOfOrigin;
    _notifySafely();
  }

  BrandEditBloc(BrandVO? brandVO) {
    _showLoading();
    if (brandVO != null) {
      _prePopulateBeforeEdit(brandVO).then((value) {
        populateCategoryList(categoryId);
        //Functions.toast(msg: "${categoryName}");
        _hideLoading();
        _notifySafely();
      });
    }
  }

  Future categoryIdtoString(int id) async {
    for (var i = 0; i < categoryList!.length; i++) {
      if (categoryList![i].id == id) {
        categoryName = categoryList![i].name;
      }
    }
  }

  void populateCategoryList(int? id) {
    _multiPosRepoModel.postCategoryListResponse().then((response) {
      categoryList = response.categories;
      categoryList?.sort((a, b) => b.id!.compareTo(a.id!));
      categoryNameList = categoryList?.map((e) => e.name ?? "").toList() ?? [];

      for (var i = 0; i < categoryList!.length; i++) {
        if (categoryList![i].id == id) {
          categoryName = categoryList![i].name;
          Functions.toast(msg: "${categoryName}");
          _notifySafely();
          break;
        }
      }
      _notifySafely();
    });
  }

  Future onTapEdit() {
    _showLoading();
    if (categoryId != null &&
        brandName != null &&
        brandName != "" &&
        countryOfRegion != null &&
        countryOfRegion != "") {
      RequestBrandUpdateVO requestBrandUpdateVO = RequestBrandUpdateVO(
          brandId: brandId,
          name: brandName,
          categoryId: categoryId,
          countryOfOrigin: countryOfRegion);
      return _multiPosRepoModel
          .postBrandUpdateResponse(requestBrandUpdateVO)
          .then((value) => _hideLoading());
    } else {
      _hideLoading();
      return Future.error("Fail to edit");
    }
  }

  void onFirstEditingComplete() {
    firstFocusNode.unfocus();
    secondFocusNode.requestFocus();
    _notifySafely();
  }

  void onSecondEditingComplete() {
    secondFocusNode.unfocus();
    _notifySafely();
  }

  void onChooseCategoryName(String? name) {
    for (var i = 0; i < categoryList!.length; i++) {
      if (categoryList![i].name == name) {
        categoryId = categoryList![i].id;
        categoryName = categoryList![i].name;
        _notifySafely();
        break;
      }
    }
    _notifySafely();
  }

  void onChangeBrandName(String? brandName) {
    this.brandName = brandName;
    _notifySafely();
  }

  void onChangeCountryOfRegion(String? countryOfRegion) {
    this.countryOfRegion = countryOfRegion;
    _notifySafely();
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

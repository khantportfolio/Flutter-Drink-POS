import 'package:flutter/cupertino.dart';

import '../../../data/repo_model/multi_pos_repo_model.dart';
import '../../../data/repo_model/multi_pos_repo_model_impl.dart';
import '../../../data/vos/promotion_vo.dart';

class PromotionListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final MultiPosRepoModel _multiPosRepoModel = MultiPosRepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states
  List<PromotionVO>? promotionList = [];

  PromotionListBloc() {
    _showLoading();
    _multiPosRepoModel.postPromotionListResponse().then((response) {
      promotionList = response.promotions;
      promotionList?.sort((a, b) => b.id!.compareTo(a.id!));
      _notifySafely();
      _hideLoading();
    });
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

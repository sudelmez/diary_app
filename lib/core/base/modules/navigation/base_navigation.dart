abstract class BaseNavigationService {
  Future navigateToPage({required String path, Object? arguments});
  Future<void> navigateToPageClear({required String path, Object? arguments});
  Future<void> navigatePop<T extends Object?>({T res});
  Future<void> navigatePopUntil({required int viewCount});
}
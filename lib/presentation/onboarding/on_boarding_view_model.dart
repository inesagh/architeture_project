import 'package:architeture_project/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged() {
    // TODO: implement onPageChanged
  }

  @override
  void start() {
    // TODO: implement start
  }
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged();
}

abstract class OnBoardingViewModelOutputs {}

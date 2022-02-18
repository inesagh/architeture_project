import 'dart:async';

import 'package:architeture_project/domain/model.dart';
import 'package:architeture_project/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller
  final StreamController _controller = StreamController<SliderViewObject>();

  //INPUTS
  @override
  void dispose() {
    _controller.close();
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
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputSliderViewObject => _controller.sink;

  //OUTPUTS
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _controller.stream.map((sliderViewObject) => sliderViewObject);
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject; //for getting SliderViewObject
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}

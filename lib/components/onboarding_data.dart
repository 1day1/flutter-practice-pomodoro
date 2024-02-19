import 'onboarding_info.dart';

class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Start Button",
      desc: "Press start button and work start",
      image: "onboarding1.png",
    ),
    OnboardingInfo(
      title: "Pause Button",
      desc: "If you pause Job, press button",
      image: "onboarding2.png",
    ),
    OnboardingInfo(
      title: "Done Job",
      desc: "Done Job, let's another Job. Cheers!",
      image: "onboarding3.png",
    ),
  ];

  Map<String, String> getItem(index) {
    return {
      'title': items[index].title,
      'desc': items[index].desc,
      'image': items[index].image,
    };
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];

  SliderModel sliderModel = SliderModel(
    title: "Start Button",
    desc: "Press start button and work start",
    image: "onboarding1.png",
  );

  sliderModel.setTitle("Start Button");
  sliderModel.setDesc("Press start button and work start");
  sliderModel.setImage("assets/onboarding1.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(
    title: "Pause Button",
    desc: "If you pause Job, press button",
    image: "onboarding2.png",
  );

  sliderModel.setTitle("Pause Button");
  sliderModel.setDesc("If you pause Job, press button");
  sliderModel.setImage("assets/onboarding2.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(
    title: "Done Job",
    desc: "Done Job, let's another Job. Cheers!",
    image: "onboarding3.png",
  );

  sliderModel.setTitle("Done Job");
  sliderModel.setDesc("Done Job, let's another Job. Cheers!");
  sliderModel.setImage("assets/onboarding3.png");
  slides.add(sliderModel);

  return slides;
}

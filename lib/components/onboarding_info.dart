class OnboardingInfo {
  final String title = '';
  final String desc = '';
  final String image = '';

  OnboardingInfo(
      {required String title, required String desc, required String image});
}

class SliderModel {
  String image;
  String title;
  String desc;

  SliderModel({required this.image, required this.title, required this.desc});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  // void setDesc(String getDesc){
  //   desc = getDesc;
  // }

  String getImage() {
    return image;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

class SliderModel {
  SliderData? data;
  String? message;
  int? status;

  SliderModel.fromJason(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
    data = json["data"] == null ? null : SliderData.fromJson(json["data"]);
  }
}

class SliderData {
  List<SliderImage>? sliders;
  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderImage>[];
      json['sliders'].forEach((v) {
        sliders!.add(SliderImage.fromJson(v));
      });
    }
  }
}

class SliderImage {
  String? image;

  SliderImage({this.image});

  SliderImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}

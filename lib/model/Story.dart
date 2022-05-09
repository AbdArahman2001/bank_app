class Story {
  String video;

  Story({
    this.video,});

  Story.fromJson(Map<String, dynamic> json) {
    video = json['video'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['video'] = this.video;

    return data;
  }
}

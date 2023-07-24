class DoctorSide {
  // String? datetime;
  String? strtingtime;
  String? endingTime;
  // int? slotes;
  // String? times;

  DoctorSide(
    // this.datetime,
    this.strtingtime,
    this.endingTime,
    // this.slotes,
    // this.times,
  );

  factory DoctorSide.fromJson(Map<String, dynamic> json) {
    print(json['endingTime']);
    return DoctorSide(json['startingtime'],
        json[' endingTime'],);
        //  json['slotes'], json['times']
  }
  Map<String, dynamic> toJson() {
    return {
      // 'datetime': datetime,
      'startingtime': strtingtime,
      'endingTime': endingTime,
      // 'slotes': slotes,
      // 'times': slotes
    };
  }
}

class Doctor {
  int? id;
  String doctor;
  String phonenumber;
  String category;
  String experience;
  String place;
  String image;

  Doctor(
     this.id,
     this.doctor,
     this.phonenumber,
     this.category,
     this.experience,
     this.place,
     this.image,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
       json['id'],
       json['doctor'],
       json['phonenumber'],
       json['category'],
       json['experience'],
       json['place'],
       json['image'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor': doctor,
      'phonenumber':phonenumber,
      'category': category,
      'experience': experience,
      'place': place,
      'image': image,
    };
  }
}
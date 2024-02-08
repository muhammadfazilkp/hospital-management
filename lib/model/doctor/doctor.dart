class Doctor {
  int? id;
  String doctor;
  String phonenumber;
  String category;
  String experience;
  String place;
  String image;
  String pyment; 

  Doctor(
     this.id,
     this.doctor,
     this.phonenumber,
     this.category,
     this.experience,
     this.place,
     this.image,
     this.pyment,
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
       json['pyment']

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
      'pyment':pyment
    };
  }
}
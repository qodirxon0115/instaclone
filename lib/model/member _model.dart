

class Member {
  String uid = '';
  String fullName = '';
  String email = '';

  Member(this.fullName, this.email);

  Member.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        fullName = json['fullName'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
      };
}

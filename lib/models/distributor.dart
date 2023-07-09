class Distributor {
  int id = -1;
  String name;
  String email = "";
  String location;
  double distance;
  Distributor(this.name, this.location, this.email, this.distance);
  Distributor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        location = json['location'],
        distance = json['distance'] ?? 0.0;
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'location': location,
        'distance': distance,
      };
}

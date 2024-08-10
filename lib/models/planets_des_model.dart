class PlanetsDesModel {
  String name;
  String description;
  String position;
  String image;
  String velocity;
  String distance;
  String average_orbital_speed;
  String satellite;
  String surface_area;
  String rotation_period;
  String temperature;

  PlanetsDesModel({
    required this.name,
    required this.description,
    required this.position,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.average_orbital_speed,
    required this.satellite,
    required this.surface_area,
    required this.rotation_period,
    required this.temperature,
  });

  factory PlanetsDesModel.fromMap(Map data) {
    return PlanetsDesModel(
        name: data['name'].toString(),
        description: data['description'].toString(),
        position: ["position"].toString(),
        image: ["image"].toString(),
        velocity: ["velocity"].toString(),
        distance: ["distance"].toString(),
        average_orbital_speed: ["average_orbital_speed"].toString(),
        satellite: ["satellite"].toString(),
        surface_area: ["surface_area"].toString(),
        rotation_period: ["rotation_period"].toString(),
        temperature: ["temperature"].toString()
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'description': description,
      'position': position,
      'image': image,
      'velocity': velocity,
      'distance': distance,
      'average_orbital_speed': average_orbital_speed,
      'satellite': satellite,
      'surface_area': surface_area,
      'rotation_period': rotation_period,
      'temperature': temperature,
    };
  }
}

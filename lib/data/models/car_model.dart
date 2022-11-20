class CarModel {
  final String name;
  final List<CarCompany> carCompany;

  CarModel(
    this.name,
    this.carCompany,
  );
}

List<CarModel> carList = [
  CarModel("SUV", [
    CarCompany([
      Car("new Bugatti", ""),
      Car("new Toyota", ""),
      Car("new Jaquar", ""),
      Car("new BMW", ""),
    ], "Toyota", image: "lib/assets/images/toyota_logo.png"),
    CarCompany([], "Toyota", image: "lib/assets/images/bmw_logo.png"),
    CarCompany([], "Toyota", image: "lib/assets/images/ford_logo.png"),
    CarCompany([], "Toyota", image: "lib/assets/images/benz_logo.png"),
  ]),
  CarModel("Micro", [
    CarCompany([
      Car("new reign", ""),
      Car("new Toyota", ""),
      Car("new Jaquar", ""),
      Car("new BMW", ""),
    ], "Bugati", image: "lib/assets/images/bmw_logo.png"),
    CarCompany([], "Toyota"),
    CarCompany([], "Toyata"),
  ]),
  CarModel("Fast Cars", [
    CarCompany([
      Car("new Ford", ""),
      Car("new Toyota", ""),
      Car("new Jaquar", ""),
      Car("new BMW", ""),
    ], "Toyota", image: ""),
    CarCompany([], "Toyota", image: ''),
    CarCompany([], "Mercedes", image: ""),
  ])
];

class CarCompany {
  final String name;
  final List<Car> cars;
  final String image;

  CarCompany(this.cars, this.name, {this.image = ""});
}

class Car {
  final String name;
  final String image;

  Car(this.name, this.image);
}

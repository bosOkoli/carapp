import 'package:flutter/material.dart';

class CarModel {
  final String name;
  final List<CarCompany> carCompany;
  final Color color;

  CarModel(this.name, this.color, this.carCompany);
}

List<CarModel> carList = [
  CarModel("SUV", Colors.red, [
    CarCompany(
      [
        Car("new Bugatti", ""),
        Car("new Toyota", ""),
        Car("new Jaquar", ""),
        Car("new BMW", ""),
      ],
      "Toyota",
      image: "lib/assets/images/toyota_logo.png",
    ),
    CarCompany(
      [],
      "BMW",
      image: "lib/assets/images/bmw_logo.png",
    ),
    CarCompany(
      [],
      "Ford",
      image: "lib/assets/images/ford_logo.png",
    ),
    CarCompany(
      [],
      "Land Rover",
      image: "lib/assets/images/landrover.png",
    ),
  ]),
  CarModel("SLC", Colors.orange, [
    CarCompany(
      [
        Car("new reign", ""),
        Car("new Toyota", ""),
        Car("new Jaquar", ""),
        Car("new BMW", ""),
      ],
      "Benz",
      image: "lib/assets/images/benz_logo.png",
    ),
    CarCompany(
      [],
      "Ford",
      image: "lib/assets/images/toyota_logo.png",
    ),
    CarCompany(
      [],
      "Tesla",
      image: "lib/assets/images/tesla_logo.png",
    ),
    CarCompany(
      [],
      "BMW",
      image: "lib/assets/images/bmw_logo.png",
    ),
  ]),
  CarModel("FC", Colors.blue, [
    CarCompany(
      [
        Car("new Ford", ""),
        Car("new Toyota", ""),
        Car("new Jaquar", ""),
        Car("new BMW", ""),
      ],
      "Bugatti",
      image: "lib/assets/images/bugatti_logo.png",
    ),
    CarCompany(
      [],
      "Jaguar",
      image: "lib/assets/images/jaguar_logo.png",
    ),
    CarCompany(
      [],
      "Tesla",
      image: "lib/assets/images/tesla_logo.png",
    ),
    CarCompany(
      [],
      "Ferrari",
      image: "lib/assets/images/ferrari_logo.png",
    ),
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

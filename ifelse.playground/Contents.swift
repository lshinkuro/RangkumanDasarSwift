import UIKit

var greeting = "Hello, playground"

class Car {

  var name: String
  var create: Int

  init(name: String, create: Int) {
    self.name = name
    self.create = create
  }

  func description() -> Void {
    print("ini mobil mode \(name) keluaran tahun \(create)")
    return
  }

  var price: Int {
    switch name {
    case "Volvo":
      return 25000000
    case "Toyota":
      return 30000000
    case "Honda":
      return 5000000
    default:
      return 0
    }
  }

  func showUsia() -> Int {
    let usia = 2023 - create
    return usia
  }

  

}

var car = Car(name: "Toyota", create: 1975)

car.description()
print(car.price)
print(car.showUsia())


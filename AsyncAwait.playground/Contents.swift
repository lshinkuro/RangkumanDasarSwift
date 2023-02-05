import UIKit

var greeting = "Hello, Kali ini gwlagi belajar aync await di swift"
// karena biasanya kalo kita mau ngambil data setelah selesai kita mengopernya melalui @escaping itu
// membuat data jadi susah untuk di baca jadi saya ingin mebuat kedenya asynchronus tapi hasilnya tetep keliatan syncronus
// maka dari itu saya akan membuat fungsi async await


// membuat fungsi yang ayns atau harus menunggu hasilnya di tandai dengan async setelah ()
func fetchWeather() async -> [Double] {
  (1...1000).map{ _ in Double.random(in: -10...30)}
}

// kemudian saya akan menghitung rata rata suhunya dari fungsi fetchweather tadi
func calculateWeather(for records: [Double]) async -> Double {
  let total = records.reduce( 0 , +)
  let average = total / Double(records.count)
  return average
}

// setelah di dapat data rata2 nya saya mau upload datanya nh
func upload(result: Double) async -> String {
  "OK \(result)"
}

// nah sekarang bagaimana cara kita untuk mengakses fungsi asycn await tersebut
// ok begini caranya

func processWeather() async {
  // kita menunggu hasil dari fungsinya dengan await karena menunggu prosesnya kelar
  let records = await fetchWeather()
  let average = await calculateWeather(for: records)
  let response = await upload(result: average)
  print("Server response: \(response)")
}

// nah seperti itu
// tapi masih ada yang kurang nh bagaimana kalo salah satu prosesnya ad yang gagal tentunya kita harus menghandlenya terlebih
// dahulu yak dengan try catch supaya dia memunculkan throws messagenya nh heheh ok langsung saja
// The addition of async/await fits perfectly alongside try/catch,

// kita bikin enum errornya dulu
enum UserError: Error {
  case invalidCount, dataTooLong

  var description: String {
    switch self {
    case .invalidCount:
      return "invalid data boss"
    case .dataTooLong:
      return "namanya kepanjangan"
    }
  }
}

func fetchUser(count: Int) async throws -> [String] {
  if count > 3 {
    // Don't attempt to fetch too many users
    throw UserError.invalidCount
  }
  return Array(["Maya","Adel", "Shopie"].prefix(count))
}

// fungsi asnyc kedua
func save(user: [String]) async throws -> String {
  let name = user.joined(separator: ",")

  if name.count > 32 {
    throw UserError.dataTooLong
  } else {
    return "Save \(name)"
  }
}

// oke sekarang aku mau implementasi do catch ini supaya errornya bisa ke handle
func updateUser() async {
  do {
    let users = try await fetchUser(count: 3)
    let result = try await save(user: users)
    print("users is \(result)")
  } catch let error {
    guard let userValidation = error as? UserError else { return }
    print("errors : \(userValidation.description)")
  }
}

// catch let error -> langsung ngoper semua error yang di try di atas kesini nanti kita bisa switch case errornya apa popupnya apa

await updateUser()

// ok sampai disini paham yak async await dan do catch hehehe ... jadi kodenya tidak akan force close kalo pake do catch



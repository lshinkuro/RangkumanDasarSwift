import UIKit

// cara membuat variable di swift ada berbagai macam cara salah satunya adalah ini

var nama: Int =  0
// atau kita bisa membuatnya memakai nilai dasar seperti di golang


var addres = String()
var umur = Int()

addres = "Jakarta"

print(addres)
print(umur)

// jika di print akan menghasilka string kosong dan angka 0
// atau kita ingin membuat suatu array kosong dari integer atau string

var address = [String]()
var array = [Int]()

print(address)
print(array)

// atau pun bisa seperti ini juga tapi sifatnya optional

var data: Int?
var department: String?

// apabila optional maka harus di kasih nilai optionalnya

print(data ?? 3)
print(department ?? "department")

// tapi jika tidak kita bisa menjaganya dengan if let atau guard let itu bertujuan untuk memblock code agar tidak error

if let data1 = data {
  print(data1)
}

func printDepartment() {
  // guard harus di gunakan di dalam fungsi
  guard let department1 = department else { return }
  print(department1)
}

department = "kontol"
printDepartment()

// variable bisa pula di isi oleh struct ataupun class
// struct adalah gambaran suatu object

struct Person: Hashable {
  var id =  UUID().uuidString
  var nama: String
  var usia: Int

  init(nama: String, usia: Int) {
    self.nama = nama
    self.usia = usia
  }

  // ini adalah equatable untuk compare 2 object tapi selective berdasarkan perbandingan spesific propertinya
  static func == (lhs: Person , rhs: Person) -> Bool {
    return lhs.usia == rhs.usia
  }
}

// cara memakai struct

var person = Person(nama: "wahyu", usia: 25)
var person1 = Person(nama: "Ujang", usia: 29)
print(person.id)
print(person.nama)
print(person.usia)

print(person1.id)

if person == person1 {
  print("usia mereka sama")
} else {
  print("mereka tidak sama")
}

// oke kita akanmebuat array struct ya teman

var persons = [Person]()

func loadPerson() {
  let data = [
    Person(nama: "angga", usia: 13),
    Person(nama: "abdul", usia: 18),
    Person(nama: "rifki", usia: 13),
    Person(nama: "rangga", usia: 32),
    Person(nama: "kadir", usia: 21),
  ]

  // bisa dengan contents of atau pun dengan perulangan ya kawan
  persons.append(contentsOf: data)


  // pakai for juga bisa
  for item in data {
    persons.append(item)
  }

  // kemuadian kita menghapus data yang sama dengan Set dengan catatan struct harus implemen protocol hashable
  persons = Array(Set(persons))
}

loadPerson()
print(persons)

// bagaimana  cara kita mencari data yang sama ?? didalam suatu array itu akan di bahas di playgorund berikutnya
// penggunaan map, compactmap dan flatmap ya kawan kawan
// ok sekarang apa yang kurang dari variable ??
// mungkin kita bisa mempelajari apa itu get set, didset , willset ya seperti itu

// apa itu get and set ??
// yak get and set itu adalah sama seperti varible pada umumnya bedanya adalah kita mendapatkan datanya secara otomatis
// dari variable lain secara computed , jadi kalo variabel yang lain kita rubah nilainya maka variable yang ada get setnya otomastis ikut berubah

// contohnya kita akan membuat kelas Weight

class Weight {
  var kilograms: Float = 0.0

  // kita aka buat variable get set
  var pounds : Float {
    get {
      // ketika pounds nanti di panggil dia akan langsung otomatis mengcomputed datanya
      return kilograms * 2.205
    }
    // apabila kita ingin merubahnya maka kita bisa mengubah nilainya
    set {
      kilograms = newValue
    }
  }
}

// ok kita buat kelasnya

var berat = Weight()

print(berat.kilograms)
print(berat.pounds)
// ya sekarang kita rubah

berat.pounds = 23.0
print(berat.kilograms)
print(berat.pounds)

// berat dari 23 akan langsung di kali dengan angka 2.205 guys. ok sekarang paham ya teman teman

// kapan kita harus memakai getter and setter ini?
//The property depends on other properties (just like in the weight example before).
//You’re defining the property inside an extension.

// oke sekarng kita akan membahas tentang didSet dan willSet

// sepengatuhan saya adalah ketika kita mengubah nilai suatu variable maka baris kode yang ada di di dalam didset akan di eksekusi cara membuatnya sama dengan getter and setter

var machine = 20 {
  didSet {
    print("di exsekusi")
  }

  willSet {
    print("will set")
  }
}

print(machine)

// ketika kita rubah nilai nya maka kode di dalam didset akan di eksekusi
// kita bisa menggunakanya ketika memperbaharui data struct , maka tableview bisa kita reload tanpa harus menulis baris kode yang berulang ulang
machine = 30
machine = 40

// willset akan di exsekusi lebih dulu saya belum tau itu buat apaaa

// oke sekarang kita masih di varibale ya kawan kali ini saya mau membahas varibel closure
// sepengetahuan saya closure itu seperti sebuah fungsi ditandai dengan { dana di tutup dengan }
// dan nilainya bisa di passing ke varibale juga ok kita buktikan ya cuyy

var closure1: Int {
  print("ini closure")
  // bisa kita manipulasi di sini
  var x = 4 * 4
  return x
}

// closure1 = 10 ini akan error karena variable sifatnya hanya get only

print(closure1)

// closure yang menghasilkan return jadi varibel ini di panggilnya seperti fungsi

var  findSquare = { (num: Int) -> Int in
  let square = num * num
  return square
}

// kita bisa memanggilnya dengan fungsinya karena closure memang fungsi

findSquare(20)


// ok kita belajar dictionary guys
// data yang memiliki key and value
var numbers = ["first": 10, "second": 20, "third": 30]

let result = numbers.mapValues({$0 * 2})
let resultMap = numbers.map({$0.value * 2})
let resultFilter = numbers.filter({$0.key.hasPrefix("s")})
let sortAge = numbers.sorted(by: <)
print(result)
print(resultMap)
print(resultFilter)
print(sortAge)














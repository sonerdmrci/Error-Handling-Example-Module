import UIKit


enum RegisterError: Error{
    case nameIsTooShort
    case passwordIsTooweak

}

class ErrorHandlingController throws{

    override func viewDidLoad(){
        super.viewDidLoad()

        do{
            try register(name: "Al")

        }catch{
            print("Hata yakalandı")
            
        }

        //try! vs try?
        try! register(name: "Ali")  //Kesinlikle hata olmayacağı belrtildi önerilmez

        try? register(name: "Ali")   //Boş dönebilir şart sağlanmadığında nil doner
    }
    
    func register(name: String){

        if name.count < 3 {
            //Tooshort
            throws RegisterError.nameIsTooShort
        }
    }

    //MARK: -Defer
    //Fonk. işi bittiğinde çıkarken ne yapması gerektiği belirtilir

    func example(){
        defer(){
            print("Defer calisti")          //Ekranda fonk. çıktısının sonunda yazar. 
        }

        defer(){
            print("İkinci defer calisti")
        }

        defer(){
            print("Üçüncü defer calisti")
            
        }
        print("İnternetten resim çekildi")

        print("Detayları ekranda gösterildi")

        print("Tüm işlemler tamamlandı")
    }
    /*Output:
    İnternetten resim çekildi
    Detayları ekranda gösterdi
    Tüm işlemler tamamlandı
    Üçüncü defer çalışti
    İkinci defer çalışti
    Defer calisti
    */

}
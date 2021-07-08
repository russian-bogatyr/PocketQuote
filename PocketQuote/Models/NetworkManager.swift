//
//  NetworkManager.swift
//  PocketQuote
//
//  Created by ANTON KISELEV on 7/8/21.
//

import Foundation



class NetworkManager: ObservableObject{
    
    @Published var  quoteText : String = ""
    @Published var quoteAuthor : String = ""
    
    func fetchData() {
        if let url = URL(string: "https://api.fisenko.net/quotes?l=en"){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try decoder.decode(Quotes.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.quoteText = result.text
                                self.quoteAuthor = result.author
                            }
                            
                        }catch{
                            print(error.localizedDescription)
                        }
                        
                    }
                    
                }
            }.resume()
            
        }
        
        
        
    }
    
}
/*
 guard let url = URL(string: "https://api.fisenko.net/quotes?l=en") else{
 print ("Invalid URL")
 return
 }
 
 let request = URLRequest(url: url)
 
 URLSession.shared.dataTask(with: request) {data, response, error in
 if let data = data {
 let decoder = JSONDecoder()
 decoder.dateDecodingStrategy = .iso8601
 
 if let decodedResponse = try?
 decoder.decode([Quote].self, from: data){
 DispatchQueue.main.async {
 self.quoteData = decodedResponse
 print(self.quoteData)
 }
 return
 }
 }
 print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
 }.resume()*/

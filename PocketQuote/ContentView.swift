//
//  ContentView.swift
//  PocketQuote
//
//  Created by ANTON KISELEV on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var  networkManager = NetworkManager()

    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text(networkManager.quoteText)
                    .frame(width: UIScreen.main.bounds.size.width-50, height: UIScreen.main.bounds.size.height/2, alignment: .center)
                    .padding(.all)
                Text(networkManager.quoteAuthor)
                    .padding()
                
                Spacer()
                Button("Next Quote") {
                    networkManager.fetchData()
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                Spacer()
            }.onAppear{
                self.networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

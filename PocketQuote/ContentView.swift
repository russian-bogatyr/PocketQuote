//
//  ContentView.swift
//  PocketQuote
//
//  Created by ANTON KISELEV on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var  networkManager = NetworkManager()

    @State private var fadeInOut = false
    
    var body: some View {
        ZStack{
            Color(red: 0, green: 0, blue: 0)
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack{
                    
                    if fadeInOut{
                        Text(networkManager.quoteText)
                            .frame(width: UIScreen.main.bounds.size.width-50, height: UIScreen.main.bounds.size.height/2, alignment: .center)
                            .padding(.all)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
                            
                        Text(networkManager.quoteAuthor)
                            .padding()
                            .foregroundColor(.white)
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.5)))
                    }
                    
                    if !fadeInOut{
                        Text(networkManager.quoteText)
                            .frame(width: UIScreen.main.bounds.size.width-50, height: UIScreen.main.bounds.size.height/2, alignment: .center)
                            .padding(.all)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
                            
                        Text(networkManager.quoteAuthor)
                            .padding()
                            .foregroundColor(.white)
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.5)))
                    }
                    
                }
                Spacer()
                Button("Next Quote") {
                    self.fadeInOut.toggle()
                    networkManager.fetchData()
                }
                .foregroundColor(.black)
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
                Spacer()
            }.onAppear{
                self.networkManager.fetchData()
                self.fadeInOut.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("name") private var name: String = ""

    var body: some View {
        
        if name.isEmpty {
            InputView()
        }
        else {
            MainView()
        }
    }
    
    
}

struct InputView: View {
    
    @AppStorage("name") private var name: String = ""
    @State private var input = ""
    
    var body: some View {
        
        VStack {
            Text("Welcome to MyTNTT")
                .bold()
            
            TextField("Enter your name", text: $input)
                .multilineTextAlignment(.center)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1).frame(width: 293, height: 35))
                .padding()
            Button {
                name = input
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 90, height: 50)
                    Text("Enter")
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}


struct MainView: View {
    @AppStorage("name") private var name: String = ""
    @State private var path = NavigationPath()
    
    var body: some View {
        
        ZStack {
                
            NavigationView {
                
                VStack {
                    
                    Text("Welcome \(name)")
                        .font(.title)
                  
                    NavigationLink(destination: DTDPView()) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color(UIColor(red: 0.18, green: 0.53, blue: 0.18, alpha: 1.00)))
                                .frame(width: 220, height: 41)
                            Text("DTDP")
                                .foregroundColor(.white)
                        }
                            
                    }
                    
                    Button {
                        name = ""
                    } label: {
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color(UIColor(red: 0.18, green: 0.53, blue: 0.18, alpha: 1.00)))
                                .frame(width: 220, height: 41)
                            Text("Clear Name")
                                .foregroundColor(.white)
                        }
                    }
          
                    
                    /*
                    NavigationLink(destination: XHView()) {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color(UIColor(red: 0.18, green: 0.53, blue: 0.18, alpha: 1.00)))
                                .frame(width: 220, height: 41)
                            Text("Xuat Hanh")
                                .foregroundColor(.white)
                        }
                        
                    } */
                    
                }
                
            }
            
        }
            
        
        
        
        
    }
}

#Preview {
    ContentView()
}

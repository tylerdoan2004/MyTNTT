//
//  ContentView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        ZStack {
                
            NavigationView {
                
                VStack {
                    
                    Text("Welcome to MyTNTT")
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

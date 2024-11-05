//
//  DTDPView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct DTDPView: View {
    var body: some View {
        

        VStack{
            
            Text("This is the DTDP view")

            
            NavigationLink(destination: MorseView()) {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.53, blue: 0.18, alpha: 1.00)))
                        .frame(width: 220, height: 41)
                    Text("Morse")
                        .foregroundColor(.white)
                    
                }
                
            }
            
            NavigationLink(destination: SemaphoreView()) {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color(UIColor(red: 0.18, green: 0.53, blue: 0.18, alpha: 1.00)))
                        .frame(width: 220, height: 41)
                    Text("Semaphore")
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        
            
        
    }
}

struct DTDPView_Previews: PreviewProvider {
    static var previews: some View {
        DTDPView() 
    }
}

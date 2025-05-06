//
//  MorseKey.swift
//  MyTNTT
//
//  Created by Tyler Doan on 12/1/24.
//

import SwiftUI

struct MorseKey: View {
    var dismissAction: () -> Void = {}
    
    var body: some View {
        
        ZStack {
            
            
                
            Text("Morse Key")
                .padding(.bottom, 500)
            
            Button("Exit") {
                dismissAction()
            }
            .padding(.bottom, 500)
            .padding(.leading, 300)
            
            Text("Dictionary")
            
           
        }
        
        
    }
}

#Preview {
    MorseKey()
}

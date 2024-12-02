//
//  DTDPView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct DTDPView: View {
    
    var body: some View {
        
        TabView {
            
            MorseView()
                .tabItem {
                    Text("Morse")
                }
            
            SemaphoreView()
                .tabItem {
                    Text("Semaphore")
                    
                }
            
            PrayerView()
                .tabItem {
                    Text("Prayers")
                }
            
            SongView()
                .tabItem {
                    Text("Songs")
                }
            
        }
        
    }
}

struct DTDPView_Previews: PreviewProvider {
    static var previews: some View {
        DTDPView() 
    }
}

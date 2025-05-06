//
//  MorseView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct MorseView: View {
    
    @State private var showKey: Bool = false
    
    //For translator
    @State var input: String =  ""
    @State var answer: String = ""
    @State private var selectedTab = 0
    
    //For trainer
    @State var trainerInput: String = ""
    @State var score: Int = 0
    @State var randomLetter = ""
    @State var randomValue = ""
    @State var returnMessage = ""
    
    
    var body: some View {
        
        
        
        ZStack {
            
            
            
            
            TabView(selection: $selectedTab) {
                
                //Morse Translator
                VStack{
                                        
                    ZStack {
                        
                        VStack {
                            Text(answer)
                                .padding(20)
                                .bold()
                                .font(.system(size: 50))
                        } //Answer Text
                        .padding(.bottom, 350)
                        
                        VStack{
                        
                            Text(input)
                                .padding(20)
                                .bold()
                                .font(.system(size: 100))
                            
                        } //Result Text
                        .padding(.bottom, 200)
                        
                        VStack{
                            
                            HStack {
                                
                                Button {
                                    dash()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width:90, height:50)
                                        Text("-")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                Button {
                                    dot()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width:90, height:50)
                                        Text(".")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                            }
                            
                            HStack {
                                
                                Button {
                                    delete()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 90, height: 50)
                                        Text("Delete")
                                            .foregroundColor(.white)
                                            .bold()
                                        
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                Button {
                                    enter()
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
                            
                            Button {
                                clear()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blue)
                                        .frame(width:200, height: 50)
                                    Text("Clear Output")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                            
                        } //Buttons
                        .padding(.top, 300)
                    }
                    
                }
                
                
                //Morse Trainer
                
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            Text("Score: \(score)")
                                .padding(.bottom, 500)
                                .padding(.leading, 50)
                                .font(.system(size:20))
                            Spacer()
                            
                        }
                        
                        
                        Text("Translate: \(randomLetter)")
                            .padding(.bottom, 300)
                            .font(.system(size:40))
                        


                        Text(trainerInput)
                            .padding(20)
                            .bold()
                            .font(.system(size: 100))
                        
                        VStack {
                            
                            HStack {
                                
                                Button {
                                    trainerdash()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width:90, height:50)
                                        Text("-")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                Button {
                                    trainerdot()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width:90, height:50)
                                        Text(".")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                            }
                            
                            HStack {
                                
                                Button {
                                    trainerdelete()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 90, height: 50)
                                        Text("Delete")
                                            .foregroundColor(.white)
                                            .bold()
                                        
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                Button {
                                    trainerenter()
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
                        .padding(.top, 300)
                        
                        Text(returnMessage)
                            .padding(.top, 500)
                            .bold()
                            .font(.system(size: 40))
                        
                    }
                    
                    
                    
                }
                .onAppear {
                    generateRandomMorse()
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enable swiping
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Optional: Customize page index appearance
            .animation(.easeInOut, value: selectedTab)
            
            
            HStack {
                
                Text("This is the Morse View")
                    .padding(.leading, 50)
                
                Spacer()
                 
                Button("Key"){
                    showKey = true
                }
                .padding(.trailing, 50)
                .popover(isPresented: $showKey) {
                    MorseKey {
                        showKey = false
                    }
                }
                
            }
            .padding(.bottom, 600)
        }
        
    }
    
    
    
    func dash() {
        input += "-"
    }
    
    func trainerdash() {
        trainerInput += "-"
    }
    
    func dot() {
        input += "."
    }
    
    func trainerdot() {
        trainerInput += "."
    }
        
    func enter() {
        
        if let result = morseDictionary[input] {
            answer.append(result)
        }
        delete()
    }
    
    func trainerenter() {
                
        if trainerInput == randomValue {
            score += 1
            trainerInput = ""
            generateRandomMorse()
            generateReturnMessage(result: true)
        }
        else {
            score = 0
            trainerInput = ""
            generateRandomMorse()
            generateReturnMessage(result: false)
        }
        //Implement handling for checking if it is right or wrong
    }
    
    func delete() {
        input = ""
    }
    
    func trainerdelete() {
        trainerInput = ""
    }
    
    func clear() {
        answer = ""
    }
    
    func generateRandomMorse() {
        if let key = morseDictionary.keys.randomElement(), let letter = morseDictionary[key] {
                
                randomValue = key
                randomLetter = letter
                
            }
            
        }
    
    func generateReturnMessage(result: Bool) {
        
        if result == true {
            if let successresult = successList.randomElement() {
                returnMessage = successresult
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        returnMessage = ""
                    }
                }
            }
            
        }
        else if result == false {
            if let failresult = failList.randomElement() {
                returnMessage = failresult
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        returnMessage = ""
                    }
                }
            }
        }
        
        
                
        
        
    }
    
}

struct MorseView_Previews: PreviewProvider {
    static var previews: some View {
        MorseView()
    }
}

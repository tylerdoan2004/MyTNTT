//
//  MorseView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct MorseView: View {
    
    @State var input: String =  ""
    @State var answer: String = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("This is the Morse View")
                Spacer()
            } //Morse View
             
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
            
        }
        
    }
    
    
    
    func dash() {
        input += "-"
    }
    
    func dot() {
        input += "."
    }
        
    func enter() {
        
        if let result = morseDictionary[input] {
            answer.append(result)
        }
        delete()
    }
    
    func delete() {
        input = ""
    }
    
    func clear() {
        answer = ""
    }
    
}

struct MorseView_Previews: PreviewProvider {
    static var previews: some View {
        MorseView()
    }
}

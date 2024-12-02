//
//  SemaphoreView.swift
//  MyTNTT
//
//  Created by Tyler Doan on 10/25/24.
//

import SwiftUI

struct SemaphoreView: View {
    @State private var tappedSegmentIndex: Int? = nil
    @State private var twoTappedSegmentIndex: [Int] = []
    @State var input = ""
    @State var output = ""
    var numberSegments = 8
    

    var body: some View {
        
        
        ZStack {
            
            VStack {
                Text("This is the Semaphore view")
                Spacer()
            }
            .padding(.top, 50)
            

            VStack{
                //Text(input)
                ZStack{
                    
                    Text(output)
                        .bold()
                        .font(.system(size: 25))
                        .padding(.bottom, 600)
                    
                    ForEach(0..<numberSegments, id: \.self) {index in
                        
                        
                        Segment(startAngle: .degrees(-22.5 + Double((45*index))), endAngle: .degrees(22.5 + Double((45*index))), clockwise: true)
                            .fill(twoTappedSegmentIndex.contains(index) ? Color.green :Color.blue)
                            .stroke(.black, lineWidth: 1)
                            .scaleEffect(tappedSegmentIndex == index ? 0.9 : 1.0)
                            .animation(.easeInOut(duration: 0.2), value: tappedSegmentIndex)
                            .frame(width:300, height:300)
                            .onTapGesture {
                                tappedSegmentIndex = index
                                twoTappedSegmentIndex.append(index)
                                input += String(index+1)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    tappedSegmentIndex = nil
                                }
                                if twoTappedSegmentIndex.count > 1 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        twoTappedSegmentIndex.removeAll()
                                        process_input()
                                    }
                                }
                            }
                    }
                    .padding(.top, 150)

                    Button {
                        output = ""
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
                    .padding(.top, 600)
                }
                
            }
            
            
        }
    }
    
    func process_input() {
        if let result = semaphoreDictionary[input] {
            output.append(result)
        }
        input = ""
    }
}


struct Segment: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let angleAdjust = Angle.degrees(90)
        let modifiedStart = startAngle - angleAdjust
        let modifiedEnd = endAngle - angleAdjust
        var path = Path()
        path.move(to: CGPoint(x:rect.midX, y:rect.midY))
        path.addArc(center: CGPoint(x:rect.midX, y:rect.midY), radius: rect.width/2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        path.closeSubpath()
        return path
    }
        
    
}

struct SemaphoreView_Previews: PreviewProvider {
    static var previews: some View {
        SemaphoreView() 
    }
}


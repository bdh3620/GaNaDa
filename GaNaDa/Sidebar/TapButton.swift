//
//  TapButton.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/01.
//

import SwiftUI

struct TapButton: View {
    
    var image: String
    var title: String
    @Binding var selectedTitle: String
    var namespace: Namespace.ID
    
    var body: some View {
        Button(action: {
    
            withAnimation(.spring()) {
                selectedTitle = title
            }
        }) {
            HStack(spacing: 20){
                Image(systemName: image)
                    .frame(width: 10)
                    .font(.system(size: 22, weight: .regular))
                Text(title)
                    .fontWeight(.semibold)
            }
        }
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.leading, 20)
        .frame(maxWidth: 180, alignment: .leading)
        .background(
            ZStack {
                if selectedTitle == title {
                    Color(hue: 1.0, saturation: 0.0, brightness: 0.046)
                        //선택된 뷰에 배경
                        .opacity(selectedTitle == title ? 1 : 0)
                        //CustomCorners
                        .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 12))
                        //id별 궤적 생성 애니메이션
                        .matchedGeometryEffect(id: "TapEffect", in: namespace)
                }
            }
        )
    }
}

struct TapButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

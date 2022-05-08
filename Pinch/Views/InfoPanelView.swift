//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Shubham Kumar on 08/05/22.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    var body: some View {
        HStack {
            //MARK: HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            //MARK: INFO PANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .lineLimit(0)
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .lineLimit(0)
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .lineLimit(0)
            }
            .font(.footnote)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(9)
            .frame(maxWidth: 480)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }//:HStack
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

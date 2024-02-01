//
//  CustomPageView.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct CustomPageView: View {
    
    // MARK: - Properties
    var page: Page
    
    
    // MARK: - body
    var body: some View {
        VStack(alignment: .center) {
            imageVStack
            textVStack
            Spacer()
        }
    }
    
    
    // MARK: - Private Views:
    private var imageVStack: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(page.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            Spacer()
        }
    }
    
    private var textVStack: some View {
        VStack(spacing: 20) {
            titleText
            pageText
            Spacer()
        }
    }
    
    private var titleText: some View {
        Text(page.title)
            .font(Font(UIFont.ninoMtavruli?.withSize(30) ?? .systemFont(ofSize: 30)))
            .foregroundStyle(customGradient)
            .background(
                Color(uiColor: .backgroundGray)
                    .opacity(0.25)
                    .shadow(color: Color(uiColor: .backgroundGold), radius: 50)
                    .blur(radius: 20)
            )
    }
    
    private var pageText: some View {
        Text(page.text)
            .font(Font(UIFont.ninoMkhedruliBook?.withSize(20) ?? .systemFont(ofSize: 20)))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }
    
    private var customGradient: some ShapeStyle {
        LinearGradient(
            colors: [Color(uiColor: .backgroundGold), Color(uiColor: .backgroundDarkGold)],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}


// MARK: - Preview
struct CustomPageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPageView(page: Page.onboardingPages[0])
    }
}

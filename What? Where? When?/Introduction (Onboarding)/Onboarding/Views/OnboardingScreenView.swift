//
//  OnboardingScreen.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    // MARK: - Properties
    @AppStorage("onboarding_viewed") var onboardingViewed: Bool = false
    @State private var pageIndex = 0
    private let pages: [Page] = Page.onboardingPages
    private let dotAppearance = UIPageControl.appearance()
    
    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(uiColor: .backgroundGray)
                .ignoresSafeArea()
            
            pageContent
                
            if pageIndex == 4 { startButton }
            else { nextButton }
        }
    }
    
    
    // MARK: - Private Views
    private var pageContent: some View {
        VStack {
            HStack {
                Spacer()
                skipButton
            }
            
            onboardingPagesTabView
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
    
    private var skipButton: some View {
        Text("გამოტოვება")
            .font(Font(UIFont.ninoMtavruli?.withSize(14) ?? .systemFont(ofSize: 14)))
            .foregroundColor(Color(uiColor: .accentLightGray))
            .onTapGesture {
                withAnimation(.spring()) {
                    onboardingViewed = true
                }
            }
    }
    
    private var onboardingPagesTabView: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                CustomPageView(page: page)
                    .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .accentGold
            dotAppearance.pageIndicatorTintColor = .darkGray
        }
        .padding(.bottom, 100)
    }
    
    private var nextButton: some View {
        VStack {
            Spacer()
            CustomButton(text: "შემდეგი", backgroundColor: .white, textColor: .backgroundGray)
                .onTapGesture {
                    pageIndex += 1
                }
        }
        .padding(20)
    }
    
    private var startButton: some View {
        VStack {
            Spacer()
            CustomButton(text: "დაწყება", backgroundColor: .white, textColor: .backgroundGray)
                .onTapGesture {
                    withAnimation(.spring()) {
                        onboardingViewed = true
                    }
                }
        }
        .padding(20)
    }
}


// MARK: - Preview
struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}

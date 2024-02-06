//
//  LoginView.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @State var mailText: String = ""
    @State var passwordText: String = ""
    @State var showLogin: Bool = false
    @State var offsetY = UIScreen.main.bounds.height
    
    
    // MARK: - body
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                mainAnimatedView
            }
        }
    }
    
    
    // MARK: - Private Views
    private var backgroundColor: some View {
        Color(uiColor: .backgroundGray)
            .ignoresSafeArea()
    }
    
    private var mainDisplayView: some View {
        VStack {
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                Spacer()
            }
            
            if showLogin {
                loginStackView
                    .offset(y: offsetY)
            }
        }
    }
    
    private var mainAnimatedView: some View {
        mainDisplayView
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showLogin = true
                    self.offsetY = 0
                }
            }
        }
    }
    
    private var loginStackView: some View {
        VStack {
            Spacer()
            loginSheetView
            .padding(.top, 30)
            .padding(.horizontal, 16)
            .background(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .ignoresSafeArea(edges: .bottom)
            .frame(height: UIScreen.main.bounds.height / 2)
        }
    }
    
    private var welcomeLabelView: some View {
        HStack {
            VStack(spacing: 2) {
                Text("მოგესალმებით")
                    .font(Font(UIFont.ninoMtavruliBold?.withSize(26) ?? .systemFont(ofSize: 26)))
                Text("გთხოვთ, შეიყვანოთ მონაცემები")
                    .font(Font(UIFont.ninoMkhedruliBook?.withSize(16) ?? .systemFont(ofSize: 16)))
            }
            Spacer()
        }
    }
    
    private var forgetPasswordView: some View {
        HStack {
            Spacer()
            Text("დაგავიწყდა პაროლი?")
                .font(Font(UIFont.ninoMkhedruliBold?.withSize(16) ?? .systemFont(ofSize: 16)))
                .foregroundColor(Color(uiColor: .backgroundGold))
        }
    }
    
    private var rememberMeView: some View {
        HStack {
            Image(systemName: "square")
            Text("დამიმახსოვრე")
                .font(Font(UIFont.ninoMkhedruliBook?.withSize(20) ?? .systemFont(ofSize: 20)))
            Spacer()
        }
    }
    
    private var textFieldsView: some View {
        VStack(spacing: 12) {
            CustomTextViewRepresentable(placeholder: "მეილი", borderColor: .accentLightGray, icon: "envelope.fill", text: $mailText) { text in
                //
            }
            .frame(height: 60)
            
            CustomTextViewRepresentable(placeholder: "პაროლი", borderColor: .accentLightGray, icon: "lock.fill", isPassword: true, text: $passwordText) { text in
                //
            }
            .frame(height: 60)
            
            forgetPasswordView
            rememberMeView
        }
    }
    
    private var signInButtonView: some View {
        NavigationLink {
            tabBarControllerRepresentable()
                .navigationBarBackButtonHidden()
                .edgesIgnoringSafeArea(.all)
        } label: {
            CustomButtonRepresentable(title: "შესვლა", backgroundColor: .backgroundGray, textColor: .white) {
                //
            }
            .frame(width: 260, height: 44)
        }
    }
    
    private var registerButtonView: some View {
        HStack(spacing: 6) {
            Text("არ ხარ დარეგისტრირებული?")
                .font(Font(UIFont.ninoMkhedruliBook?.withSize(16) ?? .systemFont(ofSize: 16)))
            NavigationLink {
                SignUpViewControllerRepresentable()
                    .toolbarRole(.editor)
                    .edgesIgnoringSafeArea(.all)
            } label: {
                Text("რეგისტრაცია")
                    .font(Font(UIFont.ninoMkhedruliBold?.withSize(16) ?? .systemFont(ofSize: 16)))
                    .foregroundColor(Color(uiColor: .accentBlue))
            }
        }
    }
    
    private var loginSheetView: some View {
        VStack(alignment: .center, spacing: 20) {
            welcomeLabelView
            textFieldsView
            signInButtonView
            registerButtonView
            Spacer()
        }
    }
}


// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

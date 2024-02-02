//
//  LoginView.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct LoginView: View {

    // MARK: - Properties
    @State var mailTitle: String = "მეილი"
    @State var passwordTitle: String = "პაროლი"
    @State var mail: String = ""
    @State var password: String = ""
    @State var showLogin: Bool = false
    @State var offsetY = UIScreen.main.bounds.height

    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(uiColor: .backgroundGray)
                .ignoresSafeArea()
            
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.showLogin.toggle()
                        self.offsetY = 0
                    }
                }
            }
        }
    }
    
    
    // MARK: - Private Views
    private var loginStackView: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 20) {
                
                HStack {
                    VStack(spacing: 2) {
                        Text("მოგესალმებით")
                            .font(Font(UIFont.ninoMtavruliBold?.withSize(26) ?? .systemFont(ofSize: 26)))
                        
                        Text("გთხოვთ, შეიყვანოთ მონაცემები")
                            .font(Font(UIFont.ninoMkhedruliBook?.withSize(16) ?? .systemFont(ofSize: 16)))
                    }
                    
                    Spacer()
                }
                
                VStack(spacing: 12) {
                    CustomTextField(color: .accentLightGray, title: mailTitle, text: mail)
                    
                    CustomTextField(color: .accentLightGray, title: "პაროლი", text: password, optionalIconName: "eye.slash.fill")
                    
                    HStack {
                        Spacer()
                        Text("დაგავიწყდა პაროლი?")
                            .font(Font(UIFont.ninoMkhedruliBold?.withSize(16) ?? .systemFont(ofSize: 16)))
                            .foregroundColor(Color(uiColor: .backgroundGold))
                    }
                    
                    HStack {
                        Image(systemName: "square")
                        Text("დამიმახსოვრე")
                            .font(Font(UIFont.ninoMkhedruliBook?.withSize(20) ?? .systemFont(ofSize: 20)))
                        Spacer()
                    }
                }
                
                CustomButton(text: "შესვლა", backgroundColor: .backgroundGray, textColor: .white)
                
                HStack(spacing: 6) {
                    Text("არ ხარ დარეგისტრირებული?")
                        .font(Font(UIFont.ninoMkhedruliBook?.withSize(16) ?? .systemFont(ofSize: 16)))
                    Text("რეგისტრაცია")
                        .font(Font(UIFont.ninoMkhedruliBold?.withSize(16) ?? .systemFont(ofSize: 16)))
                        .foregroundColor(Color(uiColor: .accentBlue))
                }
                
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal, 16)
            .background(.white)
            .frame(height: UIScreen.main.bounds.height / 2)
        }
    }
}


// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

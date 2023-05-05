//
//  LoginView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var searchText = ""
    @State private var pwdText = ""
    @State private var checked = false
    @State private var loginButtonTapped = false
    @State private var signUpButtonTapped = false
    private let user = UserData.shared
    
    var body: some View {
        VStack {
            NavigationLink(destination: ContentView(), isActive: $loginButtonTapped) {
                EmptyView()
            }
            
            NavigationLink(destination: SignUpView(), isActive: $signUpButtonTapped) {
                EmptyView()
            }
            
            VStack {
                
                Image("small_logo")
                
                Spacer().frame(height: 96)
                
                Text("Login")
                    .font(.custom("Poppins-Bold", size: 26))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer().frame(height: 32)
            
            HStack {
                Image("college")
                    .resizable()
                    .frame(width: 56, height: 56)
                
                Spacer().frame(width: 14)
                
                Text("This application is only for the students of California State University- East Bay. Use your college email ID to login.")
                    .font(.custom("Poppins-Regular", size: 13))
                
                Spacer()
            }
            
            Spacer().frame(height: 40)
            
            VStack {
                Text("Email ID*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                
                Spacer().frame(height: 8)
                
                HStack {
                    TextField("", text: $searchText)
                        .placeholder(when: searchText.isEmpty) {
                            Text("Enter CSUEB email ID")
                                .foregroundColor(AppColors.blueTextColor)
                        }
                        .font(.custom("Poppins-Regular", size: 13))
                        .padding(.leading, 8)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.secondaryBackground)
                .cornerRadius(10.0)
                .shadow(radius: 4)
            }
            
            VStack {
                Spacer().frame(height: 16)
                
                Text("Password*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                
                Spacer().frame(height: 8)
                
                HStack {
                    
                    SecureField("", text: $pwdText)
                        .placeholder(when: pwdText.isEmpty) {
                            Text("Enter password")
                                .foregroundColor(AppColors.blueTextColor)
                        }
                        .font(.custom("Poppins-Regular", size: 13))
                        .padding(.leading, 8)
                    
                    Button(action: {
                        self.pwdText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(pwdText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.secondaryBackground)
                .cornerRadius(10.0)
                .shadow(radius: 4)
            }
            
            VStack {
                Spacer().frame(height: 24)
                HStack {
                    Image(systemName: checked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(checked ? AppColors.redColor : .white)
                        .onTapGesture {
                            self.checked.toggle()
                        }
                    
                    Spacer().frame(width: 8)
                    Text("Remember me")
                        .font(.custom("Poppins-Bold", size: 13))
                    Spacer()
                    
                    Text("Forgot password ?")
                        .foregroundColor(AppColors.redColor)
                        .font(.custom("Poppins-Bold", size: 13))
                }
            }
            
            VStack {
                Spacer()

                Button(action: {
                    self.signUpButtonTapped.toggle()
                }) {
                    Text("Sign Up")
                        .foregroundColor(AppColors.redColor)
                        .font(.custom("Poppins-Bold", size: 13))
                }
                
                Spacer().frame(height: 24)
                
                Button(action: {}, label: {
                    Text("Login")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    LinearGradient(
                        gradient: .init(colors: [Color(red: 195/255.0, green: 41/255.0, blue: 57/255.0),
                                                 Color(red: 160/255.0, green: 42/255.0, blue: 54/255.0)]),
                        startPoint: .init(x: -0.33, y: -0.33),
                        endPoint: .init(x: 0.66, y: 0.66)
                    ))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .buttonStyle(PlainButtonStyle())
                .onTapGesture {
                    loginButtonTapped.toggle()
                    user.email = searchText
                    UserData.shared.fetchLoginUserData()
                }
                
                Spacer().frame(height: 48)
            }
            
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .foregroundColor(.white)
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

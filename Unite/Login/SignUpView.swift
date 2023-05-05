//
//  SignUpView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var nextButtonTapped = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            NavigationLink(destination: VerificationCodeView(), isActive: $nextButtonTapped) {
                EmptyView()
            }
            
            VStack {
                Image("small_logo")
                
                Spacer().frame(height: 96)
                
                Text("Register")
                    .font(.custom("Poppins-Bold", size: 26))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 30)
                
                Text("Enter CSUEB email id to register on Unite application and discover the community.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer().frame(height: 40)
                
                Text("Email ID*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                
                Spacer().frame(height: 8)
                
                HStack {
                    TextField("", text: $email)
                        .placeholder(when: email.isEmpty) {
                            Text("Enter CSUEB email ID")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 13))
                        }
                        .font(.custom("Poppins-Medium", size: 13))
                        .padding(.leading, 8)
                    
                    Button(action: {
                        self.email = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(email == "" ? 0 : 1)
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
                    SecureField("", text: $password)
                        .placeholder(when: password.isEmpty) {
                            Text("Enter password")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 13))
                        }
                        .padding(.leading, 8)
                    
                    Button(action: {
                        self.password = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(password == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.secondaryBackground)
                .cornerRadius(10.0)
                .shadow(radius: 4)
                
                Text("Confirm Password*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                
                Spacer().frame(height: 8)
                
                HStack {
                    SecureField("", text: $confirmPassword)
                        .placeholder(when: confirmPassword.isEmpty) {
                            Text("Confirm password")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 13))
                        }
                        .padding(.leading, 8)
                    
                    Button(action: {
                        self.confirmPassword = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(confirmPassword == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.secondaryBackground)
                .cornerRadius(10.0)
                .shadow(radius: 4)
            }
            
            VStack {
                Spacer()

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Already have an account? Log In")
                        .foregroundColor(AppColors.redColor)
                        .font(.custom("Poppins-Bold", size: 13))
                }
                
                Spacer().frame(height: 24)
                
                Button(action: {}, label: {
                    Text("Next")
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
                    nextButtonTapped.toggle()
                    UserData.shared.email = email
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

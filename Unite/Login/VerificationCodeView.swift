//
//  VerificationCodeView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct VerificationCodeView: View {
    @State private var registerButtonTapped = false
    @State private var verificationCode = ""
    @FocusState private var isKeyboardShowing: Bool
    @State private var timeRemaining = 30
    @State private var timeRemainingText = "Expires in 00:30 sec"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            NavigationLink(destination: FirstProfileView(), isActive: $registerButtonTapped) {
                EmptyView()
            }
            
            VStack {
                Image("small_logo")
                
                Spacer().frame(height: 96)
                
                Text("Register")
                    .font(.custom("Poppins-Bold", size: 26))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 30)
                
                Text("A six digit verification code has been sent to your email id, please enter the code to register.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer().frame(height: 40)
                
                Text("Verification Code*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                
                HStack(spacing: 16) {
                    ForEach(0..<6, id:\.self) { index in
                        verificationCodeTextBox(index)
                    }
                }
                .background(content: {
                    TextField("", text: $verificationCode.limit(6))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .frame(width: 1, height: 1)
                        .opacity(0.001)
                        .blendMode(.screen)
                        .focused($isKeyboardShowing)
                })
                .contentShape(Rectangle())
                .onTapGesture {
                    isKeyboardShowing.toggle()
                }
            }
            
            Spacer().frame(height: 24)
            
            HStack {
                Text(timeRemainingText)
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(AppColors.blueTextColor)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                            if timeRemaining >= 10 {
                                timeRemainingText = "Expires in 00:\(timeRemaining) sec"
                            } else {
                                timeRemainingText = "Expires in 00:0\(timeRemaining) sec"
                            }
                            
                        }
                    }
                
                Spacer()
                
                Text("Resend Code")
                    .foregroundColor(AppColors.redColor)
                    .font(.custom("Poppins-Bold", size: 13))
            }
            
            VStack {
                Spacer()
                
                Button(action: {}, label: {
                    Text("Register")
                        .font(.system(size: 15, weight: .semibold))
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
                    registerButtonTapped.toggle()
                }
                .disableWithOpacity(verificationCode.count < 6)
                
                Spacer().frame(height: 48)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .foregroundColor(.white)
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func verificationCodeTextBox(_ index: Int) -> some View {
        ZStack {
            if verificationCode.count > index {
                let startIndex = verificationCode.startIndex
                let charIndex = verificationCode.index(startIndex, offsetBy: index)
                let charToString = String(verificationCode[charIndex])
                Text(charToString )
            } else {
                Text(" ")
            }
        }
        .frame(width: 50, height: 52)
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .foregroundColor(AppColors.interestsPrimaryColor)
        )
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
    }
}

extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

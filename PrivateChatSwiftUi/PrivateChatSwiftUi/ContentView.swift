//
//  ContentView.swift
//  PrivateChatSwiftUi
//
//  Created by Fairooz P on 16/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var phoneNumber = ""
    @State var otp = ""
    @State var phoneValid = false
    @State var otpValid = false
    @State var fieldValid = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                Text("Private Chat")
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
                Text("Enter Phone Number")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                TextField("Enter Phone Number", text: $phoneNumber)
                    .padding(.all, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black.opacity(0.5), style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .font(.system(size: 20))
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                Spacer().frame(height: 20)
                if phoneValid {
                    Text("Enter OTP")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                    SecureField("Enter OTP", text: $otp)
                        .padding(.all, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black.opacity(0.5), style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal, 20)
                        .font(.system(size: 20))
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    Spacer().frame(height: 20)
                }
                Button(action: {
                    if !phoneNumber.isEmpty {
                        phoneValid = true
                    }
                    if !otp.isEmpty {
                        otpValid = true
                    }
                    if otpValid && phoneValid {
                        fieldValid = true
                    }
                }, label: {
                    if phoneValid {
                        Text("Verify OTP")
                    } else {
                        Text("Get OTP")
                    }
                })
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

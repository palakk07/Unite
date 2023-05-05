//
//  FirstProfileView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct FirstProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var year = ""
    @State private var anticipatedGraduation = ""
    @State private var department = ""
    @State private var bio = ""
    @State private var major = ""
    @State private var semester = ""
    @State private var loginButtonTapped = false
    @State private var studentStatus: StudentStatus = .alumni
    private let viewModel = FirstProfileViewModel()
    
    @State private var isUnderGrad = false
    @State private var isGrad = false
    @State private var isAlumni = false
    
    @State private var progressValue = 10.0
    
    private var years = ["2023 Fall", "2023 Spring" , "2022 Fall", "2022 Spring" , "2021 Fall", "2021 Spring" , "2020 Fall", "2020 Spring" , "2019 Fall", "2019 Spring" , "2018 Fall", "2018 Spring" , "2017 Fall", "2017 Spring" , "2016 Fall", "2016 Spring" , "2015 Fall", "2015 Spring" , "2014 Fall", "2014 Spring" , "2013 Fall", "2013 Spring" , "2012 Fall", "2012 Spring"]
    private var departments = [
        Departments.educationAndAlliedStudies.rawValue,
        Departments.lettersArtsAndSocialSciences.rawValue,
        Departments.science.rawValue,
        Departments.businessAndEconomics.rawValue,
        Departments.onlineProgram.rawValue
    ]
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: SecondProfileView(), isActive: $loginButtonTapped) {
                EmptyView()
            }
            VStack {
                HStack {
                    Text("Profile Status")
                        .font(.custom("Poppins-Bold", size: 14))
                    
                    Spacer()
                    
                    Text("10%")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(red: 200/255.0, green: 206/255.0, blue: 227/255.0))
                }
                
                ProgressView("", value: progressValue, total: 100)
                    .accentColor(AppColors.progressBarAccent)
                
                Spacer().frame(height: 24)
                
                Text("Thanks for joining Unite, Help us create your profile to connect you with fellow CSUEB students.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(AppColors.blueTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    Spacer().frame(height: 16)
                    
                    Text("Upload Profile Picture")
                        .font(.custom("Poppins-Medium", size: 13))
                    
                    Spacer().frame(height: 8)
                    
                    Image("profile_user")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .overlay(alignment: .bottomTrailing) {
                            Image("profile_edit")
                                .padding(8)
                        }
                }
                
                VStack {
                    Spacer().frame(height: 32)
                    
                    Text("First Name*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        TextField("", text: $firstName)
                            .placeholder(when: firstName.isEmpty) {
                                Text("Enter First Name")
                                    .foregroundColor(AppColors.blueTextColor)
                            }
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 8)
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .frame(height: 50)
                    .background(AppColors.secondaryBackground)
                    .cornerRadius(10.0)
                    .shadow(radius: 4)
                    
                    Spacer().frame(height: 16)
                    
                    Text("Last Name*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        TextField("", text: $lastName)
                            .placeholder(when: lastName.isEmpty) {
                                Text("Enter Last Name")
                                    .foregroundColor(AppColors.blueTextColor)
                            }
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 8)
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .frame(height: 50)
                    .background(AppColors.secondaryBackground)
                    .cornerRadius(10.0)
                    .shadow(radius: 4)
                }
                
                VStack {
                    Spacer().frame(height: 16)
                    
                    Text("Student Status*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer().frame(height: 8)
                    
                    VStack {
                        HStack {
                            StudentStatusGridCell(status: .underGraduate)
                            
                                .background(isUnderGrad ? AppColors.redColor : AppColors.interestsPrimaryColor)
                                .frame(width: 100, height: 125)
                                .cornerRadius(16)
                                .onTapGesture {
                                    isUnderGrad.toggle()
                                    isGrad = false
                                    isAlumni = false
                                    studentStatus = .underGraduate
                                }
                            
                            Spacer()
                            
                            StudentStatusGridCell(status: .graduate)
                                .background(isGrad ? AppColors.redColor : AppColors.interestsPrimaryColor)
                                .frame(width: 100, height: 125)
                                .cornerRadius(16)
                                .onTapGesture {
                                    isGrad.toggle()
                                    isUnderGrad = false
                                    isAlumni = false
                                    studentStatus = .graduate
                                }
                            
                            Spacer()
                            
                            StudentStatusGridCell(status: .alumni)
                                .background(isAlumni ? AppColors.redColor : AppColors.interestsPrimaryColor)
                                .frame(width: 100, height: 125)
                                .cornerRadius(16)
                                .onTapGesture {
                                    isAlumni.toggle()
                                    isUnderGrad = false
                                    isGrad = false
                                    studentStatus = .alumni
                                }
                        }
                    }
                    
                }
                
                VStack {
                    Spacer().frame(height: 16)
                    
                    Text("Department*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    InformationList(title: "Select Department",
                                    searchPlaceholder: "Search for the department or select from the list",
                                    objects: departments,
                                    selectedItem: $department,
                                    placeholder: "Select Department")
                    
                    Spacer().frame(height: 16)
                    
                    Text("Major*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    InformationList(title: "Select Major",
                                    searchPlaceholder: "Search for the major or select from the list",
                                    objects: viewModel.getMajorsList(for: studentStatus, department: Departments(rawValue: department) ?? .science),
                                    selectedItem: $major,
                                    placeholder: "Select Major")
                    
                    Spacer().frame(height: 16)
                    
                }
                
                VStack {
                    Text("Starting Year*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    InformationList(title: "Select Year",
                                    searchPlaceholder: "Search for the year or select from the list",
                                    objects: years,
                                    selectedItem: $year,
                                    placeholder: "Select Year")
                    
                    Spacer().frame(height: 16)
                    
                    Text("Anticipated Graduation*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    InformationList(title: "Anticipated Graduation",
                                    searchPlaceholder: "Search for the year or select from the list",
                                    objects: years,
                                    selectedItem: $anticipatedGraduation,
                                    placeholder: "Select Term")
                }
                
                VStack {
                    
                    Spacer().frame(height: 16)
                    
                    Text("Bio*")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        TextField("", text: $bio)
                            .placeholder(when: bio.isEmpty) {
                                Text("Enter Bio")
                                    .foregroundColor(AppColors.blueTextColor)
                            }
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 8)
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .frame(height: 50)
                    .background(AppColors.secondaryBackground)
                    .cornerRadius(10.0)
                    .shadow(radius: 4)
                    
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    
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
                        loginButtonTapped.toggle()
                        UserData.shared.firstName = firstName
                        UserData.shared.lastName = lastName
                        UserData.shared.joiningYear = year
                        UserData.shared.department = department
                        UserData.shared.major = major
                    }
                    
                    Spacer().frame(height: 48)
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .foregroundColor(.white)
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        
        
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Create your Profile")
        .navigationBarColor(backgroundColor: .clear, titleColor: .white)
    }
}

struct FirstProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FirstProfileView()
    }
}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        //        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
    
}


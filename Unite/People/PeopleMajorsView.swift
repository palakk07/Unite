//
//  PeopleMajorsView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/4/23.
//

import SwiftUI

struct PeopleMajorsView: View {
    @Environment(\.presentationMode) var presentationMode
    private static let cellHeight: CGFloat = 50
    @State private var searchText = ""
    @State var segmentationSelection : PeopleFilterCategory = .byAcademic
    @State private var hobbiesIsActive = false
    @State private var majorsIsActive = false
    @State private var selectedMajors: Majors = .maInteractionDesignAndInteractiveArt
    let selectedDepartment: Departments
    private let viewModel = PeopleViewModel()

    var body: some View {
        VStack {
            NavigationLink(destination: PeopleDetailedView(selectedMajor: selectedMajors, viewModel: PeopleDetailedViewModel(major: selectedMajors)), isActive: $majorsIsActive) {
                EmptyView()
            }
            
            HStack {
                
                Image("back")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("People")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.trailing, 32)
                Spacer()
            }
            
            Spacer().frame(height: 37)
            
            HStack {
                Spacer().frame(width: 16)
                Text("Connect with people based on your academics, Interests :")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                Spacer().frame(width: 16)
            }
            
            HStack {
                Spacer().frame(width: 16)
                HStack {
                    Image("search")
                    
                    TextField("Search for Department", text: $searchText, onEditingChanged: { isEditing in
                        //
                    }, onCommit: {
                        print("onCommit")
                    })
                    .font(.custom("Poppins-Regular", size: 13))
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search for Major or select from list")
                            .font(.custom("Poppins-Regular", size: 13))
                    }
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .foregroundColor(.white)
                .background(AppColors.interestsSecondaryColor)
                .cornerRadius(10.0)
                .shadow(radius: 4)
                
                Spacer().frame(width: 16)
            }
            
            // Picker View
            Picker("", selection: $segmentationSelection) {
                ForEach(PeopleFilterCategory.allCases, id: \.self) { option in
                    Text(option.rawValue)
                        .font(.system(size: 15))
                }
            }
            .background(AppColors.interestsSecondaryColor)
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                VStack {
                    if (segmentationSelection == .byAcademic) {
                            ForEach(viewModel.getAcademicMajorsItems(for: searchText, department: selectedDepartment), id:\.self) { value in
                                HStack {
                                    Spacer().frame(width: 8)
                                    
                                    VStack(alignment: .leading) {
                                        Text(value.rawValue)
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .padding(.leading, 16)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .background(AppColors.interestsSecondaryColor)
                                            .cornerRadius(12)
                                    }
                                    
                                    Spacer().frame(width: 8)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedMajors = value
                                    majorsIsActive.toggle()
                                    print("Here right \(value.rawValue)")
                                }
                            }
                    } else {
                            ForEach(viewModel.getInterestItems(for: searchText), id:\.self) { value in
                                HStack {
                                    Spacer().frame(width: 8)
                                    
                                    VStack(alignment: .leading) {
                                        Text(value.rawValue)
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .padding(.leading, 16)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .background(AppColors.interestsSecondaryColor)
                                            .cornerRadius(12)
                                    }
                                    
                                    Spacer().frame(width: 8)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print(value.rawValue)
                                }
                            }
                    }
                    
                    Spacer()
                }
            }
        }
        .background(AppColors.blackColor)
        .frame(maxHeight: .infinity)
        
        .navigationBarBackButtonHidden(true)
    }
}

struct PeopleMajorsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleMajorsView(selectedDepartment: .lettersArtsAndSocialSciences)
    }
}

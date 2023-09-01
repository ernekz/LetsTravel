//
//  CreateView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct CreateView: View {
    
    @StateObject private var viewModel = CreateViewModel()
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToHome = false
    
    @EnvironmentObject var tabSelection: TabSelection
    

    var body: some View{
        ZStack {
            
            Color.white
            VStack(alignment: .leading){
                HeaderView()
                ZStack(alignment: .topLeading){
                        Form{
                            Section(header: Text("Create your own destination").font(.system(size: 24, weight: .semibold)).padding(.bottom, 20)) {
                                VStack(alignment: .leading,spacing: 2){
                                    Text(viewModel.country.errorMessage ?? "")
                                        .foregroundColor(.red)
                                        .font(.system(size: 12))
                                        .padding(.horizontal)
                                    TextField("Country", text: $viewModel.createInput.country)
                                        .frame(width: 300, height: 45)
                                        .padding(.horizontal)
                                        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                        .cornerRadius(26)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 26)
                                                .stroke(viewModel.country.isEmpty ? Color.red : Color.clear,
                                                        lineWidth: viewModel.country.isEmpty ? 1: 0)
                                        )
                                }
                                Picker("Continents", selection: $viewModel.selectedContinentId){
                                    if viewModel.continents.isEmpty {
                                        Text("Loading Con")
                                    } else {
                                        ForEach(viewModel.continents) { continent in
                                            Text(continent.name)
                                                .foregroundColor(.gray)
                                                .tag(continent.id)
                                        }
                                    }
                                }
                                .frame(width: 300, height: 45)
                                .padding(.horizontal)
                                .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                .cornerRadius(26)
                                
                                VStack(alignment: .leading,spacing: 2){
                                    Text(viewModel.city.errorMessage ?? "")
                                        .foregroundColor(.red)
                                        .font(.system(size: 12))
                                        .padding(.horizontal)
                                    TextField("City", text: $viewModel.createInput.city)
                                        .frame(width: 300, height: 45)
                                        .padding(.horizontal)
                                        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                        .cornerRadius(26)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 26)
                                                .stroke(viewModel.city.isEmpty ? Color.red : Color.clear,
                                                        lineWidth: viewModel.city.isEmpty ? 1: 0)
                                        )
                                }
                                VStack(alignment: .leading,spacing: 2){
                                    Text(viewModel.people.errorMessage ?? "")
                                        .foregroundColor(.red)
                                        .font(.system(size: 12))
                                        .padding(.horizontal)
                                    TextField("People number", text: $viewModel.createInput.people)
                                        .frame(width: 300, height: 45)
                                        .padding(.horizontal)
                                        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                        .cornerRadius(26)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 26)
                                                .stroke(viewModel.people.isEmpty ? Color.red : Color.clear,
                                                        lineWidth: viewModel.people.isEmpty ? 1: 0)
                                        )
                                }
                                VStack(alignment: .leading, spacing: 2){
                                    Text(viewModel.dates.errorMessage ?? "")
                                        .foregroundColor(.red)
                                        .font(.system(size: 12))
                                        .padding(.horizontal)
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("Leave date")
                                                .padding(.leading)
                                            DatePicker("", selection: $viewModel.lDate, displayedComponents: .date)
                                                .labelsHidden()
                                        }.frame(width: 130, height: 90)
                                            .padding(.horizontal)
                                            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                            .cornerRadius(26)
                                        
                                        VStack(alignment: .leading){
                                            Text("Return date")
                                                .padding(.leading)
                                            DatePicker("", selection: $viewModel.rDate, displayedComponents: .date)
                                                .labelsHidden()
                                        }.frame(width: 130, height: 90)
                                            .padding(.horizontal)
                                            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                            .cornerRadius(26)
                                    }
                                    
                                }
                                ZStack(alignment: .topLeading){
                                    VStack(alignment: .leading,spacing: 2){
                                        Text(viewModel.description.errorMessage ?? "")
                                            .foregroundColor(.red)
                                            .font(.system(size: 12))
                                            .padding(.horizontal)
                                        TextEditor(text: $viewModel.createInput.description)
                                            .frame(width: 300, height: 120)
                                            .padding(.horizontal)
                                            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 26)
                                                    .stroke(viewModel.description.isEmpty ? Color.red : Color.clear,
                                                            lineWidth: viewModel.description.isEmpty ? 1: 0)
                                            )
                                    }
                                    
                                    if(viewModel.createInput.description.isEmpty){
                                        Text("Description")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal)
                                            .padding(.top, 24)
                                    }
                                }
                                
                                
                                Button("Submit"){
                                    viewModel.submit{ success in
                                        if success {
                                            print("Papa papsiku")
                                            alertMessage = "Destination has been created"
                                            
                                            showAlert = true
                                            
                                        } else {
                                            print("ne papa papisku")
                                        }
                                        
                                    }
                                }.frame(width: 200, height: 45)
                                    .background(Color.cyan)
                                    .cornerRadius(25)
                                    .padding(.leading, 50)
                                    .alert(isPresented: $showAlert){
                                        Alert(
                                            title: Text(alertMessage),
                                            dismissButton: .default(Text("OKAy")) {
                                                tabSelection.selectedTab = 0
                                                
                                            }
                                            
                                            
                                        )
                                        
                                    }.id(UUID())
                                
                                
                            }
                            
                        }
                    }
                }.onAppear{
                    viewModel.fetchContinents()
                    viewModel.cleanTheForm()
                    resetFocus()
                }
            }
    }
}

struct CreateView_Previews: PreviewProvider{
    static var previews: some View{
        CreateView()
    }
}

func resetFocus() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

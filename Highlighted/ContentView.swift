//
//  ContentView.swift
//  Highlighted
//
//  Created by denys pashkov on 22/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //@Environment(\.managedObjectContext) private var viewContext
    
    //@FetchRequest(
    //sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //animation: .default)
    //private var items: FetchedResults<Item>
    
    var body: some View {
        ZStack{
            VStack{
                LibriTextView()
                Text("Qualcosa")
                Spacer()
            }
            
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    CustomBookInsert()
                }
                .padding(.all, 30)
            }
        }
        
        
    }
    
}

struct LibriTextView: View {
    var body: some View {
        
        Text("Libri")
            .font(.title2)
            .fontWeight(.heavy)
            .frame(width: 70, height: 70, alignment: .center)
            .background(ZStack{
                Color.yellow
                    .frame(width: 50, height: 11, alignment: .center)
                    .padding(.bottom, -95)
            })
        
    }
}

struct CustomBookInsert:View {
    @State var isSelected : Bool = false
    @State var isButtonsShown : Bool = false
    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                if isSelected {
                    Button {
                        withAnimation {
                            isButtonsShown.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation (.linear){
                                    isSelected.toggle()
                                }
                            }
                        }
                    } label: {
                        HStack{
                            Text("Scansiona ISBN")
                                .foregroundColor(.black)
                            
                            
                            Text("+")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20,alignment: .center)
                                .padding()
                                .background(ZStack{
                                    Color.yellow
                                        .cornerRadius(2000)
                                        .padding(.horizontal, -2)
                                        .padding(.bottom, -4)
                                    Color.black
                                        .cornerRadius(2000)
                                })
                            
                        }
                        
                    }.padding(.bottom, isButtonsShown ? 0 : -90)
                    
                }
            }
            
            HStack{
                Spacer()
                if isSelected {
                    HStack{
                        Text("Inserimento manuale")
                            .foregroundColor(.black)
                        
                        
                        Text("+")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 20, height: 20,alignment: .center)
                            .padding()
                            .background(ZStack{
                                Color.yellow
                                    .cornerRadius(2000)
                                    .padding(.horizontal, -2)
                                    .padding(.bottom, -4)
                                Color.black
                                    .cornerRadius(2000)
                            })
                        
                    }.padding(.bottom, isButtonsShown ? 0 : -90)
                    
                }
            }
            
            
            HStack{
                Spacer()
                Button {
                    withAnimation (.linear){
                        
                        if isButtonsShown {
                            isButtonsShown.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation (.linear){
                                    isSelected.toggle()
                                }
                            }
                        } else {
                            isSelected.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation (.linear){
                                    isButtonsShown.toggle()
                                }
                                
                            }
                        }
                        
                        
                    }
                } label: {
                    HStack{
                        if !isSelected {
                            Text("INSERISCI LIBRO")
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        
                        Text("+")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                    }
                    .frame(width: isSelected ? 20 : nil, height: 20,alignment: .center)
                    .padding()
                    .background(ZStack{
                        Color.yellow
                            .cornerRadius(2000)
                            .padding(.horizontal, -2)
                            .padding(.bottom, -4)
                        Color.black
                            .cornerRadius(2000)
                        
                    })
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }


//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

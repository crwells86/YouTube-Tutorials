import SwiftUI

struct ContentView: View {
    @State private var list = [
        "Seattle",
        "Tacoma",
        "Spokane",
        "Olympia",
        "Bellevue"
    ]
    
    @State private var search = ""
    
    var filteredList: [String] {
        if search.isEmpty {
            return list
        }
        
        return list.filter {
            $0.localizedStandardContains(search)
        }
    }
    
    var body: some View {
        VStack {
            SearchView(search: $search)
            
            List(filteredList, id: \.self) { text in
                Text(text)
            }
        }
        .background(.blue)
    }
}

#Preview {
    ContentView()
}


struct SearchView: View {
    @Binding var search: String
    
    var body: some View {
        Text("Hi, Steve")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.systemBackground))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
        HStack {
            Image(systemName: "magnifyingglass")
                .fontWeight(.bold)
                .foregroundStyle(Color(.systemBackground))
                .padding(8)
                .background(Circle().foregroundStyle(.blue))
                .padding(8)
            
            TextField("", text: $search, prompt: promptText)
        }
        .frame(maxWidth: .infinity, maxHeight: 55, alignment: .center)
        .background(Color(.systemBackground))
        .clipShape(Capsule())
        .padding()
    }
    
    var promptText: Text {
        Text("Where to?")
            .foregroundStyle(Color(.label))
    }
}

import Observation
import SwiftUI

struct Student: Codable, CustomStringConvertible {
    var name: String
    var age: Int
    var description: String { "Student(name: \(name), age: \(age))" }
}

@Observable
class ContentViewController {
    var diskStudent: Student?
    let fileURL: URL
    let key = "favoriteMovie"
    
    init() {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL = docs.appendingPathComponent("student.plist")
        print(fileURL)
    }
    
    func saveStudentToDisk(_ student: Student) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(student)
            try data.write(to: fileURL)
        } catch {
            print("[👻🎃] saving error: \(error)")
        }
    }
    
    func loadStudentFromDisk() {
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: fileURL)
            let student = try decoder.decode(Student.self, from: data)
            diskStudent = student
        } catch {
            print("[👻🎃] reading error: \(error)")
        }
    }
    
    func getFavoriteMovie() -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func setFavoriteMovie(_ movie: String) {
        UserDefaults.standard.set(movie, forKey: key)
    }
}

struct ContentView: View {
    
    @AppStorage("favoriteColor") var favoriteColor: String = ""
    @State private var favoriteMovie: String = ""
    @State private var studentName: String = ""
    @State private var studentAge: String = ""
    
    let controller = ContentViewController()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Codable Example: Student struct")) {
                    TextField("Name", text: $studentName)
                    TextField("Age", text: $studentAge)
                        .keyboardType(.numberPad)
                    
                    Button("Save to disk") {
                        if let age = Int(studentAge) {
                            let student = Student(name: studentName, age: age)
                            controller.saveStudentToDisk(student)
                        }
                    }
                    
                    Button("Load from disk") {
                        controller.loadStudentFromDisk()
                    }
                    
                    if let diskStudent = controller.diskStudent {
                        Text("Loaded from disk: \(diskStudent.description)")
                    }
                }
                Section(header: Text("AppStorage Example")) {
                    TextField("Favorite Color", text: $favoriteColor)
                    Text("App Storage Value: \(favoriteColor)")
                }
                Section(header: Text("UserDefaults Example")) {
                    TextField("Favorite Color", text: $favoriteMovie)
                        .onChange(of: favoriteMovie) { _, newValue in
                            controller.setFavoriteMovie(newValue)
                        }
                        .onAppear {
                            favoriteMovie = controller.getFavoriteMovie() ?? ""
                        }
                    Text("UserDefaults Value: \(favoriteMovie)")
                }
            }
            .navigationTitle("FileManager & UserDefaults")
        }
    }
}

#Preview {
    ContentView()
}

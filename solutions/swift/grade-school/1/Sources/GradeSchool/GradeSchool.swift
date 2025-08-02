class GradeSchool {
    private var studentRoster: [Int: [String]] = [:]
    private var allStudents: Set<String> = []
    
    func addStudent(_ name: String, grade: Int) -> Bool {
        if allStudents.contains(name) {
            return false
        }

        if let studentsInGrade = studentRoster[grade], studentsInGrade.contains(name) {
            return false
        }

        studentRoster[grade, default: []].append(name)
        studentRoster[grade]?.sort()
        allStudents.insert(name)
        return true
    }
    
    func roster() -> [String] {
        var allStudents: [String] = []
        for grade in studentRoster.keys.sorted() {
            if let students = studentRoster[grade] {
                allStudents.append(contentsOf: students)
            }
        }
        return allStudents
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        return studentRoster[grade] ?? []
    }
}

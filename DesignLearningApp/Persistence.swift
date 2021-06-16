//
//  Persistence.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 04/06/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let moc = result.container.viewContext
        //== INSERT DATA ==
        // Difficulty
        var diffEasy = Difficulties(context: moc)
        diffEasy.name = "Beginner"
        var diffMed = Difficulties(context: moc)
        diffMed.name = "Intermediate"
        var diffHard = Difficulties(context: moc)
        diffHard.name = "Expert"
        // Learning Path
        var path1 = LearningPaths(context: moc)
        path1.name = "Learn UI/UX design from scratch"
        path1.image = "Beginner"
        path1.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        path1.difficulty = diffEasy
        var path2 = LearningPaths(context: moc)
        path2.name = "Enhance UI/UX your design skills"
        path2.image = "intermediate"
        path2.desc = path1.desc
        path2.difficulty = diffMed
        var path3 = LearningPaths(context: moc)
        path3.name = "Further UI/UX design development"
        path3.image = "expert"
        path3.desc = path1.desc
        path3.difficulty = diffHard
        
        // Courses
        let course1 = Courses(context: moc)
        course1.thumbnail = "Asset_CP"
        course1.title = "Color Palette"
        course1.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        course1.score = 0
        course1.isDone = false
        
        let course2 = Courses(context: moc)
        course2.thumbnail = "Asset_Tyh"
        course2.title = "Typography"
        course2.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        course2.score = 0
        course2.isDone = false
        
        // Quiz
        var quiz1 = Quizzes(context: moc)
        quiz1.question = "Question 1..."
        quiz1.option1 = "Option 1..."
        quiz1.option2 = "Option 2..."
        quiz1.option3 = "Option 3..."
        quiz1.option4 = "Option 4..."
        quiz1.answer = 1 // Index dlm zero based
        
        var quiz2 = Quizzes(context: moc)
        quiz2.question = "Question 2..."
        quiz2.option1 = "Option 1..."
        quiz2.option2 = "Option 2..."
        quiz2.option3 = "Option 3..."
        quiz2.option4 = "Option 4..."
        quiz2.answer = 1 // Index dlm zero based
        
        course1.addToQuizzes(quiz1)
        course1.addToQuizzes(quiz2)

        
        //== END OF INSERT DATA ==
        do {
            try moc.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DesignLearningApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

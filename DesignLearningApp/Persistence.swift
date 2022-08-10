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
        
        // Course Content
        let courseContent1 = CourseContent(context: moc)
        courseContent1.ord = 1
        courseContent1.title = "San Fransisco (SF)"
        courseContent1.desc = "San Francisco is a sans serif type family that includes SF Pro, SF Pro Rounded, SF Mono, SF Compact, and SF Compact Rounded. SF Pro is the system font in iOS, macOS, and tvOS; SF Compact is the system font in watchOS. Designed to match the visual clarity of the platform UIs, the system fonts are legible and neutral."
        courseContent1.imageName = "sf_font"
        
        let courseContent2 = CourseContent(context: moc)
        courseContent2.ord = 2
        courseContent2.title = "New York (NY)"
        courseContent2.desc = "New York is a serif typeface that provides a unique tone designed to complement the SF fonts. NY works as well in a graphic display context (at large sizes) as it does in a reading context (at text sizes)."
        courseContent2.imageName = "ny_font"
        
        let courseContent3 = CourseContent(context: moc)
        courseContent3.ord = 3
        courseContent3.title = nil
        courseContent3.desc = "Beginning in iOS 14, the system provides the San Francisco and New York fonts in the variable font format. This format combines different font styles together in one file, and supports interpolation between styles to create intermediate ones. With interpolation, typefaces can adapt to all sizes while appearing specifically designed for each size."
        courseContent3.imageName = nil
        
        let courseContent4 = CourseContent(context: moc)
        courseContent4.ord = 4
        courseContent4.title = nil
        courseContent4.desc = "Interpolation also enables optical sizing, which refers to the creation of different typographic designs to fit different sizes. In iOS 14 and later, the system fonts support dynamic optical sizes, merging a font's discrete optical sizes — such as Text and Display for SF Pro and SF Compact, and Small, Medium, Large, and Extra Large for New York — into a single, continuous design. This design allows each glyph or letterform to be interpolated to produce a structure that’s precisely adapted to the point size."
        courseContent4.imageName = nil
        

        let courseContent2_1 = CourseContent(context: moc)
        courseContent2_1.ord = 1
        courseContent2_1.title = "What Does Color Palette Mean?"
        courseContent2_1.desc = "A color palette, in the digital world, refers to the full range of colors that can be displayed on a device screen or other interface, or in some cases, a collection of colors and tools for use in paint and illustration programs. The color palette reveals a lot about the electronic design of the device or technology, and its visual capabilities for human users."
        courseContent2_1.imageName = nil
        
        let courseContent2_2 = CourseContent(context: moc)
        courseContent2_2.ord = 2
        courseContent2_2.title = nil
        courseContent2_2.desc = "A color palette is also known simply as a palette."
        courseContent2_2.imageName = nil
        
        let courseContent2_3 = CourseContent(context: moc)
        courseContent2_3.ord = 3
        courseContent2_3.title = "Techopedia Explains Color Palette"
        courseContent2_3.desc = "The digital color palette emerged from the earliest computers, which only had monochrome displays. Early examples include the Teletext format with a three-bit RGB eight-color palette and the Apple II personal computer with a 16-color palette. Devices like early Atari, Commodore and Apple computers and consoles used their own evolving color palettes built on new color technology."
        courseContent2_3.imageName = nil

        let courseContent2_4 = CourseContent(context: moc)
        courseContent2_4.ord = 4
        courseContent2_4.title = nil
        courseContent2_4.desc = "Eventually, advances in display technology introduced a 256-color VGA display that remained a standard until the creation of modern flat-screen plasma screen monitors."
        courseContent2_4.imageName = nil

        let courseContent2_5 = CourseContent(context: moc)
        courseContent2_5.ord = 5
        courseContent2_5.title = nil
        courseContent2_5.desc = "Early color palettes used hexadecimal values to represent and select the array of colors possible in the display systems. Modern color palettes are more likely to show users a color wheel or sophisticated color selection tool to choose from a wide variety of hues and shades of color. It is worth noting that the advancement in digital color palettes and video display color choices coincided with and allowed for the rapid evolution of the modern digital camera, which has now been embedded into smartphones and mobile devices."
        courseContent2_5.imageName = nil
        
        // Courses
        let course1 = Courses(context: moc)
        course1.thumbnail = "Asset_CP"
        course1.title = "Color Palette"
        course1.desc = "A well-thought-out color palette can elevate a design from “good” to “great” while a mediocre palette can detract from a user’s experience and even interfere with their ability to use a site or app."
        course1.score = 0
        course1.isDone = false
        
        let course2 = Courses(context: moc)
        course2.thumbnail = "Asset_Tyh"
        course2.title = "Typography"
        course2.desc = "Typography is more than just choosing the right words or fonts for your web or mobile UI, the text hierarchy, font scales, white space, color contrasts and other visuals in your typography also help deliver specific messages about your brand."
        course2.score = 0
        course2.isDone = false
        
        path1.addToCourses(course1)
        path1.addToCourses(course2)
        path2.addToCourses(course1)
        path2.addToCourses(course2)
        path3.addToCourses(course1)
        path3.addToCourses(course2)
        
        course1.addToCourseContents(courseContent2_1)
        course1.addToCourseContents(courseContent2_2)
        course1.addToCourseContents(courseContent2_3)
        course1.addToCourseContents(courseContent2_4)
        course1.addToCourseContents(courseContent2_5)
        
        course2.addToCourseContents(courseContent1)
        course2.addToCourseContents(courseContent2)
        course2.addToCourseContents(courseContent3)
        course2.addToCourseContents(courseContent4)
        
        
        // Quiz
        var quiz1 = Quizzes(context: moc)
        quiz1.question = "Which is the best typography combination?"
        quiz1.option1 = "Asset_CP"
        quiz1.option2 = "Asset_Tyh"
        quiz1.option3 = "Asset_Tyh"
        quiz1.option4 = "Asset_Tyh"
        quiz1.answer = 0 // Index in zero based
        
        var quiz2 = Quizzes(context: moc)
        quiz2.question = "Which typefaces can be used for application design?"
        quiz2.option1 = "Asset_Tyh"
        quiz2.option2 = "Asset_CP"
        quiz2.option3 = "Asset_Tyh"
        quiz2.option4 = "Asset_Tyh"
        quiz2.answer = 1 // Index in zero based
        
        course1.addToQuizzes(quiz1)
        course1.addToQuizzes(quiz2)
        course2.addToQuizzes(quiz1)
        course2.addToQuizzes(quiz2)

        
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

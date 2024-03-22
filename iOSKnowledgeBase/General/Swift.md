#  Swift Common Questions

*It is open-source and provides inbuilt error handling.
*Memory management is automatic in Swift. Swift expands on its ObjectiveC predecessor with a mechanism called
*Automatic Reference Counting (ARC). The ARC identifies which class instances are not in use and removes them from developers' workspaces. This *frees up time for developers to focus on the application's performance rather than lowering CPU or memory usage.
*Swift provides the feature of Generics that is both effective and easy to use.
*First-class functions and a lightweight closure syntax are present in Swift which makes it easy to store functions in variables and data *structures for the ease of coding.
*Extensions in Swift make developing generic code even easier.
*Iteration over a range of collections in a short and simple manner is possible in Swift.
*Swift supports multiple return values and tuples from functions.
*Methods, extensions, and protocols are supported by structures in Swift.
*Payloads of an enum case are allowed in Swift. Also, pattern matching is supported in Swift.
*Exception handling is possible in Swift.

**Some advantages of using ios Swift are as follows:**
It is very fast in terms of execution and both type-safe and memory-safe: Swift is an extremely fast language as far as execution speed is concerned. Also, it is very easy to learn and code in Swift is easy. Type safety refers to the language's ability to prevent type mistakes. Memory safety refers to the absence of flaws caused by uninitialized pointers, which could cause a program to crash. Developers can discover any code flaws with a shorter feedback loop (where outputs are sent back as inputs, which determines the cause and effect of that loop), which reduces debugging time and eliminates the danger of low-quality code.
Swift is interoperable with Objective C: In Swift, Projects can be written in either Objective C or C++ because they are interoperable. This is particularly beneficial for large projects that are being upgraded when new Swift features are added and subsequently incorporated into the Objective C core.
Applications made using ios Swift are easy to maintain: Swift makes it simple to maintain an application once it has been built. Swift merges the Objective C header (.m) and implementation files (.h) into a single programme (.swift) file, as opposed to Objective C, which is managed in two separate files. It is worth noting that Swift has dependencies. On macOS, Swift is already installed and ready to use; however, on Linux, you must first install essential dependencies, such as Python and then use it.
Applications developed using Swift provide a better experience to its users: Swift developed applications take less time to install and consume less on device memory, giving users a better application experience.
Swift has efficient memory management: Swift expands on its ObjectiveC predecessor with a mechanism called Automatic Reference Counting (ARC). The ARC identifies which class instances aren't in use and removes them from developers' workspaces. This frees up time for developers to focus on the application's performance rather than lowering CPU or memory usage.
Swift provides Application Binary Interface (ABI) stability: Swift's Application Binary Interface (ABI) is the binary version of the Swift Application Programming Interface (API). While ABI stability is an important accomplishment for any programming language, "the ultimate advantage to the Swift ecosystem was to enable binary compatibility for applications and libraries," according to Swift. In practice, the ABI enables code compiled with multiple versions of Swift, as well as Objective-C, to communicate with one another.
The usage of optionals in Swift: Optionals are a programming technique that allows developers to avoid application crashes because of Null Pointers while maintaining clean code across the application. Consider it a wrapper type that protects the value inside. An optional might be filled with data or left blank. Optionals must be unwrapped to be sure, and if done correctly, will not cause crashes.

**Some disadvantages of using ios Swift are as follows:**
Swift is a new language: Swift is a newcomer compared to Objective C, which has been around since the 1980s. Swift came into being in 2014. It may experience growth pains as a result of this. Swift has a restricted set of tools and libraries, despite recent improvements with ABI Stability and backward compatibility. Also, there is not a very big community of ios Swift developers to help the budding ios Swift developers with their problems.
Binary compatibility does not work every time: Despite the fact that Swift 5.1 has ABI Stability, code generated using multiple versions of Swift can cause issues. Code might have been built as a static library and put into a project as a dependency when developers mostly used Objective C. It was impossible to develop static libraries in Swift prior to the release of Swift's ABI. While this is now possible, including those dependencies in a project poses challenges.
It is not a Reflective Language: Reflection is a technique that can be used to watch and change the execution of a program while it is running. A reflection oriented software component can track the execution of a code enclosure and adjust its behaviour to meet the enclosure's goals. This is usually performed by assigning programme code dynamically at runtime. Swift is not a reflective programming language in the same way that Java or Kotlin are. Instead, it provides an alternative: the Mirror feature. Swift can "self describe" an object with this, but it can't alter it from within. If Swift had a reflection, it would automatically inject dependencies, however, this is thought to be impossible to achieve.

**How is memory management done in iOS Swift?**
Automatic Reference Counting is used by Swift (ARC) in order to do memory management. This is the same thing in Swift as it is in Objective C in terms of notion. When you assign or unassign instances of classes (reference types) to constants, properties, and variables, ARC keeps track of strong references to those instances and increases or decreases their reference count correspondingly. It frees up memory consumed by objects with a reference count of zero. Because value types are copied when assigned, ARC does not raise or decrease its reference count. If you don't declare differently, all references will be strong references by default.

**Highlight the key difference between Upcast and Downcast in ios Swift.**
The key difference between Upcast and Downcast in ios Swift is that upcasting from a derived to a base class can be verified at compile-time and will never fail to compile and Downcasts, on the other hand, can fail to compile since the precise class is not always known. It is possible that the UIView you have is a UITableView or a UIButton.

**What is the difference between the "==" operator and the "===" operator in ios Swift?**
The fundamental difference between the "==" operator and the "===" operator in ios Swift is that the equal to "==" operator compares value types to see if the values are the same while the equivalent to "===" operator compares reference types to see if the references point to the same instance (both point to the same memory address) or not.

**Explain the various steps (or execution states) involved in the development of an ios Swift application.**
The various steps (or execution states) involved in the development of an ios Swift application are as follows:
* Not Running: This is a simple condition in which our program has not been launched or no code has been executed. The program has been terminated by the system.
* Inactive: This is merely a stage in the process of becoming active. Our program is in an inactive state, which means it is running in the background but unable to receive events.
* Active: This is the main execution state, in which our software is running and receiving events.
* Background: This is the condition in which our application is running in the background while still being able to run code.
* Suspended: This state indicates that our application has not been terminated but is present in the background and that the system has suspended it for the time being. Now, the application cannot execute any code.

**In iOS Swift, what types of objects are considered basic data types?**
For various purposes, Swift uses a common set of basic data types such as Boolean values, integers, and strings:
Int: The integer value is stored in the int variable. Example - 5
Double and Float: When working with decimal numbers in Swift, double and float are taken into account. Example - 5.78
Bool: The bool type is used to store the value of a Boolean. True and false conditions are used in Swift. Example - true
String: In Swift, the user defines the content that is enclosed by double quotes in String literals. Example - "Muskan"
Arrays: Arrays are collections of objects of the same type from a list. Example - [2,4,11,90,78]
Dictionaries: A dictionary is an unsorted collection of elements of a specific type linked by a single key. Example - [{name:"Nidhi"}]

**In Swift, what does the init() method do?**
The process of preparing an instance of an enumeration, structure, or class for use is known as initialization. Initializers are also used when a new instance of a type is created. An initializer is a no parameter instance method. The init keyword can be written using the initializer. Their primary role is to ensure that new instances of a type are correctly initialized before they’re used for the first time.

**State the control transfer statements present in ios Swift.**
The control transfer statements present in ios Swift are as follows:
Continue: The continue statement skips the current iteration of a loop and directs the program's control flow to the next iteration.
Break: When the break statement is found, a loop is immediately terminated.
Return: In Swift, the return statement is used in functions and methods to return values that meet our needs. In the Swift programming language, we can return values from functions/methods based on our requirements by utilising the return keyword.
Fallthrough: The fallthrough keyword merely directs code execution to the statements contained in the following case (or default case) block.

**What are some common features in Swift structures and Swift classes?**
Some common features in Swift structures and Swift classes are as follows:
Swift Structs and Swift classes can both define attributes for storing values and functions.
With init, both structures and classes in Swift can create initializers to set up their initial state ()
They can be extended using extensions.
They can follow protocols, such as those used in Protocol Oriented Programming.
They can collaborate with generics to create types that are adaptable and reusable.

**What are some features that Swift classes can support but Swift structs cannot?**
Given below are some features which Swift classes can support but Swift structs cannot:
To develop our own custom view controller subclasses, we can inherit from another class, such as UIViewController. This cannot be achieved using Swift structs.
Before a class is destroyed, it can be deinitialized by calling the deinit() function. This cannot be done for Swift structs.
Structures are value types, while classes are reference types.
Value Types: When you copy a value type (for example, when it is assigned, initialised, or passed into a function), each instance preserves its own copy of the data. If you update one instance, it does not affect the other.
Reference Types: When you copy a reference type, the data is shared among all instances. The reference is copied, but the data it refers to is not. When one is altered, the other is altered as well.

**Name the JSON framework which is supported by iOS.**
iOS supports the SBJson framework. The SBJson framework adds more control and flexibility to the JSON handling process. It is a well designed and extremely adaptable framework that allows APIs (Application Programming Interfaces) to function in a variety of ways. SBJSON is one of the many open-source JSON parsers or generators created with Objective-C. These allow you to use JSON easily when coding Objective-C apps.

**What is the use of the "mutating" keyword in ios Swift?**
Ios Swift structs are immutable since they are of the value type. Other variables, for example, cannot modify the values of structure at any point in time. Only the "mutating" keyword is necessary to change the values of self variables within the function of the structure.

**What do you understand about protocols in ios Swift?**
The protocol is a concept that is similar to a Java interface and is a highly common component of the Swift programming language. A protocol is a set of attributes, methods, and other requirements that are appropriate for a specific activity. The protocol, in its most basic form, is an interface that describes some methods and characteristics. Instead of implementation, the protocol is described as a skeleton of properties or methods. Enumerations, functions, and classes can be used to implement properties and methods. After the structure, enumeration, or class type names, protocols are declared. It is possible to declare both a single and several protocols. Commas are used to separate multiple protocols.

**What do you understand about PLIST in ios? List some examples of types of PLIST.**
The abbreviation PLIST in ios stands for Property List. PLIST is a value and key dictionary that can be saved in our file system using the .plist file extension. The property list is used to store a smaller quantity of data in a portable and lightweight manner. In most cases, they are written in XML.
The following are examples of several sorts of property lists:
* Binary Property List
* XML Property List

**ASCII Legacy Property ListQuestion: What do you understand about training closure syntax in ios Swift?**
Many iOS Swift functions accept multiple parameters, the last of which is a closure. Trailing closure syntax is a small amount of syntactic sugar that makes reading and writing common code easier.

**Explain Protocol Vs Class in ios Swift.**
A protocol, in its most basic form, explains what an unknown sort of object can accomplish. It has two or three different sorts of properties, as well as procedures. Protocol never includes anything inside the methods, nor does it provide actual storage for the properties. You can build extensions to your protocols that give default implementations of the methods in a more advanced form. However, you are still unable to provide storage for properties.
Classes are tangible objects. They are not needed to embrace protocols, which means they do not have to implement the required attributes and methods. Classes can be used to generate objects, whereas protocols are simply typed declarations. Consider protocols to be abstract definitions, whereas classes and structs are actual objects that can be created. An example of a class is given below:

**How should one consider the usage of strong, weak and unowned references?**
Ask yourself, "Am I dealing with reference types?" to see if you need to worry about strong, weak, or unowned. If you are working with Structs or Enums, ARC is not in charge of memory management, so you do not have to worry about defining weak or unowned constants or variables.
In hierarchical relationships, strong references are acceptable when the parent refers to the child, but not when the child refers to the parent. Strong references are, in fact, the most appropriate type of reference the majority of the time.
If two instances are optionally linked, make sure one of them has a weak reference to the other.
When two instances are linked to the point where one cannot exist without the other, the instance with the obligatory dependency must keep an unowned reference to the other instance.

**When is the usage of a set more preferable than an array in ios Swift?**
If all of the following conditions are met, you should use a set rather than an array:
You only want to add each item once. Duplicates are never permitted in sets.
The order of the items in the collection is irrelevant to you.
You are storing Hashable types, either your own or those provided by Swift, such as strings and integers. Hash values are used in sets to look for things quickly.

**Show the use of "self" in a method using an example.**
In Swift, the self property of an instance is a special property that holds the instance itself. In most cases, self appears in a class, structure, or enumeration's initializer or method. The most common use of self is in initializers when you are likely to want parameter names that match your type's property names.

**How can we use the "inout" parameter in ios Swift? Explain with an example.**
By default, function parameters are constants. Changing the value of a function parameter from within the function's body causes a compile-time error. Modifying the local variable also modifies the passed in arguments, which is known as the "inout" parameter. The passed-in arguments will have the same value if it is not present. Trying to remember the reference type while using inout and the value type when not using it. The swap function, which modifies the parameters handed in, is an excellent example. Consider reducing the copying overhead as well. If you have a function that takes a memory-intensive large value type as an argument (say, a huge structure type) and returns the same type, and the function return is only used to replace the caller argument, the inout parameter is the associated function parameter to use. As we can see in the example given below, a call to the function "demoFunction" copies arguments to function property 'aBigStruct'(copy 1) and the function property is mutated after which, the function returns a copy of the mutated property to the caller (copy 2). However, in the function "demoFunctionWithLessCopyOverhead", call by reference is being done and zero value copy overhead is there because of the usage of inout optimization.

**Explain the difference between Self and self in ios Swift.**
There is a distinction between Self (capital S) and self (small S) when writing protocols and protocol extensions. When used with a capital S, Self refers to the protocol compliant type, such as String or Int. When used with a lowercase S, self refers to the value contained within that type, such as "hi" or 999, for instance.

**State your understanding of delegates in ios Swift.**
Delegate, in ios Swift, is a design pattern that allows data or communication to be passed across structs or classes. Delegate allows one object to deliver a message to another when a certain event occurs, and it is used to handle table and collection view events. Delegates have a one on one interaction and communicate with one another.

**How can the double question mark symbol "??" be used in ios Swift programming?**
The nil-coalescing operator "??" is a shorthand for the ternary conditional operator, which we used to test for nil. A double question mark can also be used to set a variable's default value.
"default string" stringVar??
This does precisely what you would expect: if stringVar is not nil, it is returned; otherwise, the "default string" is returned.

**What is the meaning of a GUARD statement? What are the advantages of using Swift's GUARD statement?**
When one or more conditions are not met, a GUARD statement is used to transfer program control out of the scope. This remark aids in avoiding the doomsday pyramid.

**What do you understand about generics in ios Swift?**
Generics are a way to avoid code duplication. It is usual to repeat a method that takes one type of parameter to accommodate a parameter of a different type. Generics can be used in both functions and data types in Swift, such as classes, structures, and enumerations.
You can consolidate the two functions into one and maintain type safety at the same time by using generics. Given above is the way to do it in general.
Because you are testing equality here, you can use any type that implements the Equatable protocol as a parameter. This code achieves the desired outcome while preventing the use of non-typed parameters.

**What do you understand about optionals in ios Swift? What is the problem which they solve?**
An optional, in ios Swift, allows any type of variable to reflect a lack of value. The absence of value in Objective C is only available in reference types that use the nil special value. This is not possible with value types like int or float.

**What are a few scenarios in which we can't avoid using implicitly unwrapped optionals and why so?**
The following are the most prevalent reasons for using implicitly unwrapped optionals:
When you can't initialise a property that is not nil (absence of value) by definition at the moment of instantiation. An Interface Builder outlet, for example, is always initialised after its owner. In this case, you have ensured that the outlet is non-nil before using it, provided it's properly configured in Interface Builder.
To tackle the problem of a strong reference cycle, which occurs when two instances refer to each other and one of them requires a non-nil reference to the other. In this situation, one side of the reference is marked as unowned, while the other employs an implicitly unwrapped optional.

**In Swift, how would you describe a circular reference? What are your options for resolving it?**
When two instances have a strong connection to one other, a circular reference occurs, resulting in a memory leak because neither of the two instances will ever be deallocated. The reason for this is that you can't deallocate an instance if it has a strong reference to it, yet each instance maintains the other alive due to the strong reference. This might lead to a deadlock which is extremely bad for the application.
Breaking the strong circular reference by replacing one of the strong references with a weak or unowned reference would fix the problem of a circular reference.

**State your understanding of core data.**
Apple's Core Data framework is one of the most powerful frameworks for macOS and iOS programmes. In our applications, core data is used to manage the model layer object. Within iOS applications, we may use Core Data as a framework to filter, alter, save, and track data. Core Data is not a relational database in the traditional sense. Without learning SQL, we can easily connect the objects in our app to the table records in the database using core data. The M in the MVC structure stands for core data.
Some features of Core data are listed below:
* Integration with the iOS and macOS toolchains is seamless.
* Data organisation, filtering, and grouping in memory and in the user interface (User Interface).
* Object storage is supported automatically.
* Property values are validated automatically.
* The first object graph management framework.
* The object graph's life cycle is managed using the Core Data framework.

**What are the several methods for unwrapping an optional in Swift?**
The several methods for unwrapping an optional in Swift are as follows:
* Forced unwrapping: It consists in adding a ! after an Optional value, to automatically unwrap it, without having to check whether it is nil or not. Example - let v:String = b!
* Optional chaining: The technique of querying and calling properties, methods, and subscripts on an optional that is currently nil is known as optional chaining. The property, method, or subscript call succeeds if the optional includes a value; if the optional is nil, the property, method, or subscript call returns nil. Multiple inquiries can be chained together, and if any link in the chain is nil, the entire chain will fail gracefully.
* Nil coalescing operator: If there is a value inside an optional, the nil coalescing operator unwraps it and returns it. If no value is provided – for example, if the optional is nil – a default value is used instead. The result will not be optional in either case: it will be either the value from within the optional or the default value used as a backup.
* Optional pattern: An optional pattern matches items wrapped in an Optional<Wrapped> enumeration's some(Wrapped) case. Optional patterns appear in the same places as enumeration case patterns and consist of an identifier pattern followed by a question mark.
* Guard statement: When certain requirements are not met, the guard statement in Swift is used to shift program control out of scope. With one key exception, the guard statement is comparable to the if statement. When a given condition is met, the if statement is executed. The guard statement, on the other hand, is executed when a given condition is not met.
* Optional binding: Optional binding is used to determine whether or not an optional has a value. If it does have a value, unwrap it and save it in a temporary variable or constant.
* Implicitly unwrapped variable declaration: Because a variable may start life as nil, but will always have a value before you need to use it, implicitly unwrapped optionals exist. It's helpful not to have to write if let all the time because you know they'll have value by the time you need them.

**What is a Swift module?**
A single unit of code distribution in ios Swift is referred to as a module. The Swift "import" keyword can be used to import a framework or application that has been created and shipped as a single unit. In Swift, each Xcode build target is treated as an independent module. An example of using the "import" keyword is given below:
*import UIKit*

**What do you understand about Grand Central Dispatch (GDC)?**
GCD (Grand Central Dispatch) is a low-level API for controlling several operations at the same time. This notion is employed to aid in the enhancement of application performance. This procedure is used to handle numerous jobs at once. The most relevant API for multitasking with Async and Sync programming in iOS is Grand Central Dispatch (GCD).
Dispatch Queue: The task is managed in FIFO (First In First Out) order by the Dispatch Queue. Dispatch queues are thread-safe because they can be accessed by several threads at the same time.
Concurrent: This process has started numerous tasks at the same time but does not know when they will finish. It can be completed in whatever sequence you want. They perform one or more things concurrently at the same time. The work is finished in the order in which it was queued, not in the order in which it was completed.
Serial: A single task will be executed at a time. It is possible to use it to synchronize access to a certain resource.
Sync: After the work is completed, a synchronous function returns control to the caller.
Asynchronous: An asynchronous function returns instantly after ordering a job to begin but does not wait for it to finish.

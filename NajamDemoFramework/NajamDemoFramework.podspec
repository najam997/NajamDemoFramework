Pod::Spec.new do |spec|

spec.name         = "NajamDemoFramework"
spec.version      = "1.0.0"
spec.summary      = "Create a Cocoapods framework.Integrate one third-party dependency (AFNetworking)"
spec.description  = "The framework should receive a Github username from the user's application.Execute the Github v3 API endpoint to
get the repositories of the username mentioned in the first step. Prepare and return the result properly to the user's application. Write a unit test for the following, Framework's APIs (one API in our case),The method that handles Github API call.Publish your framework on CocoaPods publicly."
spec.homepage     = "https://github.com/najam997/NajamDemoFramework.git"
spec.license      = "MIT"
spec.author       = { "najam997" => "syednajam997@gmail.com" }
spec.platform     = :ios, "10.0"
spec.source       = { :git => "https://github.com/najam997/NajamDemoFramework.git", :tag => "1.0.0" }
spec.source_files  = "NajamDemoFramework/*"

end

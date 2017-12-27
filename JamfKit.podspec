Pod::Spec.new do |s|
  s.name         = "JamfKit"
  s.version      = "0.1.0"
  s.summary      = "A JSS communication framework written in Swift"
  s.description  = <<-DESC
    A Swift SDK to interact with a Jamf server's JSS API. 
  DESC
  
  s.homepage     = "https://Ethenyl@github.com/Ethenyl/JamfKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Damien Rivet" => "damien.rivet@gmail.com" }
  
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://Ethenyl@github.com/Ethenyl/JamfKit.git", :tag => s.version.to_s }
  s.source_files  = "Sources/*.swift"

  s.frameworks  = "Foundation"
end

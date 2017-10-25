Pod::Spec.new do |s|
  s.name         = "JAMFKit"
  s.version      = "0.1"
  s.summary      = "Swifty JSS communication SDK"
  s.description  = <<-DESC
    A Swift API to interact with a JSS server's API. 
  DESC
  
  s.homepage     = "https://Ethenyl@github.com/Ethenyl/JAMFKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Damien Rivet" => "damien.rivet@gmail.com" }
  
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://Ethenyl@github.com/Ethenyl/JAMFKit.git", :tag => s.version.to_s }
  s.source_files  = "Sources/*.swift"

  s.frameworks  = "Foundation"
end

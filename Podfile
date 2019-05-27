# Uncomment the next line to define a global platform for your project

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def shared_pods
    pod 'Alamofire'
    pod 'SDWebImage'
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'TokopediaSearchFilter' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  # Pods for TokopediaSearchFilter
  shared_pods
end

target 'TokopediaSearchFilterTests' do
    inherit! :search_paths
    
    shared_pods
    testing_pods
end

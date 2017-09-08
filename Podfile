# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
    pod 'RxTest'
    pod 'Swinject'
end

target 'Capture' do
# Comment this line if you're not using Swift and don't want to use dynamic frameworks
   use_frameworks!

  # Pods for ProlificLibrary
  pod 'SwiftGen'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RealmSwift'
  pod "RxRealm"
  pod 'SwiftLint'

   target 'CaptureTests' do
    inherit!  :search_paths
    testing_pods
  end
end

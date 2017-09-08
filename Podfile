# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
    pod 'RxTest'

end

target 'Capture' do
# Comment this line if you're not using Swift and don't want to use dynamic frameworks
   use_frameworks!

  # Pods for ProlificLibrary

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

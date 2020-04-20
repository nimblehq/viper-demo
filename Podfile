platform :ios, '12.4'

target 'DemoViper' do

  use_frameworks!
  pod 'SnapKit'

  def testing_pods
    pod 'Sourcery'
    pod 'Nimble'
    pod 'Quick'
  end

  target 'DemoViperTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'DemoViperUITests' do
    inherit! :search_paths
    testing_pods
  end

end

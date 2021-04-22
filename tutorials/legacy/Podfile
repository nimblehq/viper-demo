platform :ios, '12.4'

target 'DemoViper' do

  use_frameworks!
  pod 'SnapKit'

  def testing_pods
    pod 'Sourcery'
    pod 'Quick'
    pod 'Nimble'
  end

  def ui_testing_pods
    pod 'KIF', :configurations => ['Debug']
  end

  target 'UnitTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'UITests' do
    inherit! :search_paths
    testing_pods
  end

  target 'UITestsKIF' do
    inherit! :search_paths
    testing_pods
    ui_testing_pods
  end

end

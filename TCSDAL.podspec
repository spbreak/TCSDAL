Pod::Spec.new do |s|
  s.name             = "TCSDAL"
  s.version          = "0.1.0"
  s.summary          = "TCSDAL数据层."
  s.description      = <<-DESC
                        TCSDAL数据层:2015-11-14
                       DESC
  s.homepage         = "https://github.com/spbreak/TCSDAL"
  s.license          = 'MIT'
  s.author           = { "spbreak" => "527108411@qq.com" }
  s.source           = { :git => "https://github.com/spbreak/TCSDAL.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TCSDAL' => ['Pod/Assets/*.png']
  }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'FMDB','~>2.5'
end

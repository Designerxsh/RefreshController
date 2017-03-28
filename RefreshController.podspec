Pod::Spec.new do |s|
  s.name         = "RefreshController"
  s.version      = "0.3.3"
  s.summary      = "A simple refresh and load more Refresh controller by swift"
  s.description  = <<-DESC
  A simple refresh and load more Refresh controller by swift
  which translate by JYRefreshController.
  - fix bugs for mutil refresh trigger bug.
  - fix bugs for mutil entery when stop loading.
  - fix bugs when tableview heiht height then contentsize and trigger both refresh and loadmore bug.
  - set UIScrollView as option to break retain circle.
  - Support Swift3
                   DESC
  s.homepage     = "https://github.com/looseyi/RefreshController"
  s.license      = "MIT"
  s.author       = { "looseyi" => "13615033587@126.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/looseyi/RefreshController.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.{swift}"
  s.exclude_files = "Classes/Exclude"
end

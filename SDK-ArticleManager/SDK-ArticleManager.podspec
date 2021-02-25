Pod::Spec.new do |s|
  s.name                  = 'SDK-ArticleManager'
  s.version               = '0.1.1'
  s.summary               = 'Pod ArticleManager with CoreData'
  s.description           = "Creating, removing, search by word - ArticleManager with CoreData"
  s.homepage              = 'https://github.com/khaniche/SDK-ArticleManager'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'khaniche' => 'kyrylo.hanichev@codeit.pro' }
  s.source                = { :git => 'https://github.com/khaniche/SDK-ArticleManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version         = '5.0'
  s.source_files          = 'SDK-ArticleManager/Sources/**/*.{swift, xcdatamodeld}'
  s.frameworks            = 'UIKit', 'CoreData'
end

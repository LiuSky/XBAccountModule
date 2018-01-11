Pod::Spec.new do |s|

  s.name             = 'XBAccountModule'
  s.version          = '0.0.5'
  s.summary          = '用户模块'

  s.description      = <<-DESC
    用户模块.
                       DESC

  s.homepage         = 'https://github.com/LiuSky/XBAccountModule'
  s.license          = 'MIT'
  s.author           = { 'xiaobin liu'=> '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/LiuSky/XBAccountModule.git', :tag => s.version.to_s }

  s.requires_arc = true

  s.ios.deployment_target = '9.0'

  s.source_files = ['XBAccountModule/Classes/*.swift', "XBAccountModule/Classes/V/*.swift"] 
  s.resources = ['XBAccountModule/*.xcassets']
  s.frameworks = 'Foundation'
  s.dependency 'XBPublickModule', '~> 0.0.1'
end


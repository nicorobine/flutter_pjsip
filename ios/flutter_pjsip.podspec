#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_pjsip'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.resources = ['Classes/PJSIPClass/Assets/*.png','Classes/PJSIPClass/Assets/*.wav']
  s.dependency 'pjsip','~> 2.9.1'
  s.dependency 'Masonry', '~> 0.6.3'
  s.ios.deployment_target = '9.0'

  header_search_paths     = [
                                '"$(PODS_ROOT)/Headers/Public/pjsip/pjlib/include"',
                                '"$(PODS_ROOT)/Headers/Public/pjsip/pjlib-util/include"',
                                '"$(PODS_ROOT)/Headers/Public/pjsip/pjmedia/include"',
                                '"$(PODS_ROOT)/Headers/Public/pjsip/pjnath/include"',
                                '"$(PODS_ROOT)/Headers/Public/pjsip/pjsip/include"'
                              ]

  s.xcconfig                = {
                                'HEADER_SEARCH_PATHS'          => header_search_paths.join(' '),
                                'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'
                              }
end


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
  s.source_files = 'Classes/**/*.{h,m}'
  s.header_mappings_dir = 'Classes/'
  #s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.resources = ['Classes/PJSIPClass/Assets/*.png','Classes/PJSIPClass/Assets/*.wav']
  # s.dependency 'pjsip','~>2.9.0.2'
  s.dependency 'Masonry', '~>1.1.0'
  s.ios.deployment_target = '9.0'
  s.libraries           = 'stdc++'
  s.static_framework = true

  s.header_mappings_dir = 'Classes/'

  s.public_header_files = 'Classes/**/*.h'
                                
  s.ios.preserve_paths      = 'Classes/PJLibs/**/*.a'

  s.ios.vendored_libraries  = 'Classes/PJLibs/**/*ios.a'

  s.ios.frameworks          = 'UIKit', 'VideoToolbox', 'AudioToolbox', 'AVFoundation', 'OpenGLES', 'QuartzCore', 'CoreMedia', 'CoreVideo', 'Network', 'Security'
  
  header_search_paths     = [
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJLibs/pjlib/headers"',
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJLibs/pjlib-util/headers"',
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJLibs/pjmedia/headers"',
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJLibs/pjnath/headers"',
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJLibs/pjsip/headers"',
                                  '"$(PODS_ROOT)/Headers/Public/flutter_pjsip/PJSIPClass/**"'
                            ]

  s.xcconfig                = {
                                'HEADER_SEARCH_PATHS'          => header_search_paths.join(' '),
                                'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'
                              }
end


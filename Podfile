# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'
target 'PureFantasy' do
  # Comment the next line if you don't want to use dynamic frameworks
use_frameworks!
# pod "Texture"# 异步UI库
# pod 'Ads-CN'#穿山甲
pod 'Moya'# 网络底层
pod 'Moya/Combine', '~> 15.0'# 网络底层结合SwiftUICombine
pod 'KakaJSON'# JSON处理
pod 'SwiftyJSON'# JSON处理
pod 'lottie-ios'# JSON动画
pod 'Kingfisher'# Web图片
pod 'Introspect' # 链接UIKIT
pod 'SwifterSwift' # 语法糖
# pod 'AMapSearch'# 高德地图POI搜索
# pod 'UMCommon'#友盟
# pod 'UMDevice'#友盟
# pod 'UMCCommonLog'#友盟
# pod 'Tagly'#标签云
# pod 'LeanCloud'
end
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end

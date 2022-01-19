
Pod::Spec.new do |s|
  s.name             = 'HHBlockKit'
  s.version          = '0.1.4'
  s.summary          = '基于UIKit封装的基础控件库，使用链式编程思想+block对常用的控件进行封装.'

  s.description      = "基于UIKit封装的基础控件库，使用链式编程思想+block对常用的控件进行封装,包含UIView,UILabel,UIButton,UITextFiled,UITextView,UITableView的封装"

  s.homepage         = 'https://gitee.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hh1016' => '17735102867@163.com' }
  s.source           = { :git => 'https://gitee.com/hh1016/hhblockkit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'HHBlockKit/Classes/**/*'
 
end

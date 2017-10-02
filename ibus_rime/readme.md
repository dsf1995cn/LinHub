### [官方配置网盘](http://flypy.ys168.com/)
### ibus-rime双拼配置

将双拼方案保存在`~/.config/ibus/rime/`目录下，并在default.custom.yaml中添加：

```
# default.custom.yaml  
# save it to:   
#   ~/.config/ibus/rime  (linux)  
#   ~/Library/Rime       (macos)  
#   %APPDATA%\Rime       (windows)  

patch:  
  schema_list:  
    - schema: luna_pinyin          # 朙月拼音  
    - schema: luna_pinyin_simp     # 朙月拼音 简化字模式  
    - schema: luna_pinyin_tw       # 朙月拼音 臺灣正體模式  
    - schema: terra_pinyin         # 地球拼音 dì qiú pīn yīn  
    - schema: bopomofo             # 注音  
    - schema: jyutping             # 粵拼  
    - schema: cangjie5             # 倉頡五代  
    - schema: cangjie5_express     # 倉頡 快打模式  
    - schema: quick5               # 速成  
    - schema: wubi86               # 五笔 86  
    - schema: wubi_pinyin          # 五笔拼音混合輸入  
  	- schema: double_pinyin        # 自然碼雙拼  
    - schema: double_pinyin_mspy   # 微軟雙拼  
    - schema: double_pinyin_abc    # 智能 ABC 雙拼  
    - schema: double_pinyin_flypy  # 小鶴雙拼  `
```

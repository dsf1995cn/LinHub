#用于开启Powershell的命令行代理 by dsf 2019.1
#使用方法：ssr -o开启|-s关闭
function show_help {
    Write-Output 'options:'
    Write-Output '  -o|start open http proxy'
    Write-Output '  -s|stop shutdown http proxy'
}
function set_proxy_variable {
    # http代理地址
    Set-Item Env:http_proxy "http://127.0.0.1:1080"  
    #https代理地址
    Set-Item Env:https_proxy "http://127.0.0.1:1080" 
    Write-Output 'Start：Powershell的Http代理已启动'
}
function unset_proxy_variable {
    Remove-Item Env:http_proxy
    Remove-Item Env:https_proxy
    Write-Output 'Stop：Powershell的Http代理已关闭'
}

if($args.Count -eq 0)
{
    show_help
}
$value = $args
switch ($value) {
    -o { set_proxy_variable }
    -s { unset_proxy_variable }
    start { set_proxy_variable }
    stop { unset_proxy_variable }
    Default {
        show_help
    }
}
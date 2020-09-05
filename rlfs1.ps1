$server =$args[0]
if (!$args[1]){
    $user = "test"
    }
else{
    $user = $args[1]
    }
if (!$args[2]){
    $pass = "Password1"
    }
else{
    $pass = $args[2]
    }
Write-Host $server, $user,$pass
pause
#cmdkey /generic:TERMSRV/$server /user:$user /pass:$pass
#mstsc /v:$server

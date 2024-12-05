$r = (Select-String -Path .\input.txt -Pattern "XMAS|SAMX" -AllMatches).matches.count
$str = Get-Content .\input.txt



foreach ($i in 0..$($array.Length - 1)){
  foreach ($j in 0..$($array[$i].Length - 1)){
  $copy[$j][$i)] = $array[$i][$j]
  }
  }

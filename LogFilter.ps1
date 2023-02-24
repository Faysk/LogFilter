# Testa a conexão com o servidor Server-Name e armazena o resultado na variável $testConnectionServer
$testConnectionServer = Test-Connection Server-Name -Quiet

# Define o caminho do diretório de log em $logPath
$logPath = "\\Server-Name\log\*"

# Entra em um loop que continuará enquanto o servidor Server-Name estiver disponível
while ($testConnectionServer) {
    # Conta o número de arquivos de log para cada nível (INFO, ERROR, WARNING) usando Select-String
    $infoCount = (Get-ChildItem -Path $logPath -Filter *.log | Select-String ": INFO").Count
    $errorCount = (Get-ChildItem -Path $logPath -Filter *.log | Select-String ": ERROR").Count
    $warningCount = (Get-ChildItem -Path $logPath -Filter *.log | Select-String ": WARNING").Count

    # Conta o número total de linhas em todos os arquivos de log usando Get-Content, Measure-Object e a propriedade Sum
    $totalCount = (Get-ChildItem -Path $logPath -Filter *.log | Get-Content | Measure-Object -Line).Sum

    # Cria uma string contendo as informações de contagem de logs, incluindo a contagem total de linhas
    $totalCount = (Get-ChildItem -Path $logPath -Filter *.log | ForEach-Object {Get-Content $_.FullName | Measure-Object -Line}).Lines | Measure-Object -Sum | Select-Object -ExpandProperty Sum

    # Exibe as informações de contagem de logs, incluindo a contagem total de linhas
    Write-Output $logInfo
    Write-Output ""

    # Exibe as últimas 20 linhas dos arquivos de log
    Write-Output "20 últimas linhas de log: "
    Get-Content -Path $logPath -Filter *.log | Select-Object -Last 20

    # Aguarda 60 segundos antes de limpar o console e começar o loop novamente
    Start-Sleep -Seconds 60
    Clear-Host
}

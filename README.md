# LogFilter
Script PowerShell para filtrar log

Este script PowerShell testa a conexão com um servidor específico e, se a conexão estiver disponível, ele entrará em um loop que exibe informações de contagem de logs e as últimas 20 linhas dos arquivos de log a cada 60 segundos.

O script começa testando a conexão com o servidor especificado e armazenando o resultado em uma variável chamada $testConnectionServer. Em seguida, ele define o caminho do diretório de log em uma variável chamada $logPath.

O loop while começa com uma condição que verifica se a conexão com o servidor está disponível. Se estiver, o loop continuará a ser executado. Dentro do loop, o script conta o número de arquivos de log para cada nível (INFO, ERROR, WARNING) usando o comando Select-String. Em seguida, ele conta o número total de linhas em todos os arquivos de log usando Get-Content, Measure-Object e a propriedade Sum.

Em seguida, o script cria uma string que contém as informações de contagem de logs, incluindo a contagem total de linhas, e exibe as informações usando o comando Write-Output. O script também exibe as últimas 20 linhas dos arquivos de log usando o comando Get-Content.

Depois de exibir as informações de contagem de logs e as últimas 20 linhas dos arquivos de log, o script aguarda 60 segundos antes de limpar o console e começar o loop novamente.

No geral, este script é útil para monitorar logs em tempo real em um servidor específico e garantir que tudo esteja funcionando conforme o esperado.

# Demande le nom de l'ordinateur à l'utilisateur
$computerName = Read-Host "Entrez le nom de l'ordinateur"

# Recherche l'ordinateur dans Active Directory
$computer = Get-ADComputer -Identity $computerName

# Vérifie si l'ordinateur a été trouvé
if ($computer) {
    # Affiche l'OU de l'ordinateur
    $ou = $computer.DistinguishedName -replace '^CN=.*?,', ''
    Write-Output "L'ordinateur $computerName se trouve dans l'OU : $ou"
} else {
    Write-Output "L'ordinateur $computerName n'a pas été trouvé dans Active Directory."
}
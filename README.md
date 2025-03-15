# odf-validator-dockerfile

## Instructions d'utilisation

1. **Construire l'image Docker** :
```bash
docker build -t odf-validator -f Dockerfile .
```

2. **Valider un document ODF** :
```bash
docker run --rm -v ./docs:/documents odf-validator template-anniversaire.odt
```

3. **Utiliser des options spécifiques** :
```bash
docker run --rm -v ./docs:/documents odf-validator -v -w document.odt
```

4. **Valider tous les documents d'un dossier** :
```bash
docker run --rm -v ./docs:/documents odf-validator -r .
```

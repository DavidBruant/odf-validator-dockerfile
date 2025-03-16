# Fabriquer le fichier .odt minimal

```sh
cd temp
zip -0 -X ../minimal.zip mimetype
zip -r ../minimal.zip META-INF/ content.xml styles.xml meta.xml
cd ..
mv minimal.zip minimal.odt
```
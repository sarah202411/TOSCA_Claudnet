## Installation et utilisation

1 Installer Cloudnet

Avant de lancer les scripts, installe Cloudnet depuis son dépôt officiel :

```bash
# Cloner le dépôt officiel Cloudnet
git clone https://github.com/Orange-OpenSource/Cloudnet-TOSCA-toolbox.git
cd bin/  
./build.sh
```
2️ Cloner mon projet

```bash
cd Cloudnet-TOSCA-toolbo/examples/my_service
git clone https://github.com/sarah202411/TOSCA_Claudnet.git
export CLOUDNET_BINDIR=../../bin
. ${CLOUDNET_BINDIR}/cloudnet_rc.sh
```

3 Valider tous les fichiers YAML

```bash
for f in *.yaml; do
    echo ">>> Validation $f"
    translate "$f"
done
```


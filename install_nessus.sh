#!/usr/bin/env bash
set -e

# URL do pacote Nessus para Debian 10 (amd64)
DEB_PKG_URL="https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.9.4-debian10_amd64.deb"
DEB_FILENAME="nessus.deb"

echo "=== [1/6] Atualizando sistema e instalando dependências ==="
sudo apt update
sudo apt install -y wget curl apt-transport-https libgmp10

echo "=== [2/6] Baixando o pacote Nessus ==="
cd /tmp
wget -O "${DEB_FILENAME}" "${DEB_PKG_URL}"

echo "=== [3/6] Instalando o pacote .deb ==="
sudo dpkg -i "${DEB_FILENAME}" || true

echo "=== [4/6] Corrigindo dependências quebradas ==="
sudo apt --fix-broken install -y

echo "=== [5/6] Iniciando e habilitando serviço Nessus ==="
sudo systemctl daemon-reload
sudo systemctl start nessusd
sudo systemctl enable nessusd

echo "=== [6/6] Liberando porta 8834 no firewall (se UFW estiver ativo) ==="
if command -v ufw >/dev/null 2>&1; then
  sudo ufw allow 8834/tcp
  echo "✔ Porta 8834 liberada no UFW"
fi

echo ""
echo "✅ Instalação concluída com sucesso!"
echo "Acesse via navegador: https://<IP_DO_SERVIDOR>:8834/"
echo "Crie a conta admin e insira seu código de ativação (Community ou Professional)."
echo "⚠ A primeira inicialização pode demorar alguns minutos enquanto baixa os plugins."
